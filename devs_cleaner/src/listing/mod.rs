use std::{env::home_dir, path};

use walkdir::WalkDir;

use crate::models::{
    DevProject, DockerSystemDf, GradleCache, MavenCache, ProjectCollection, PubCache, Technology,
};

pub fn list_projects(path: &str) -> ProjectCollection {
    let home_directory = home_dir()
        .unwrap_or_else(|| path::PathBuf::from("."))
        .join(path);
    let path_str = home_directory.to_str().unwrap_or(".");
    let mut project_collection = ProjectCollection::new();
    for result in WalkDir::new(path_str) {
        match result {
            Ok(entry) => {
                let entry = entry;
                println!(
                    "Visiting: {} of size {}",
                    entry.path().display(),
                    entry.metadata().map(|m| m.len()).unwrap_or(0)
                );
                if let Some(dev_project) = to_project(&entry) {
                    project_collection.push(dev_project);
                }
            }
            Err(e) => {
                eprintln!("Error reading entry: {}", e);
            }
        }
    }
    project_collection
}

fn to_project(dir_entry: &walkdir::DirEntry) -> Option<DevProject> {
    let path = dir_entry.path().to_str()?.to_string();
    if let Some(technology) = identify_technology(&path) {
        let size_in_bytes = project_size_in_bytes(&path);
        let has_build_artifact = has_built_artifacts(&technology, &path);
        Some(DevProject::new(
            path,
            technology,
            size_in_bytes,
            has_build_artifact,
        ))
    } else {
        None
    }
}

fn identify_technology(_path: &str) -> Option<Technology> {
    // Searching for specific files to identify technology
    let files = std::fs::read_dir(_path).ok()?;
    for file in files {
        if let Ok(file) = file {
            let file_name = file.file_name().to_str()?.to_string();

            if let Some(tech) = technology_descriptor(&file_name) {
                return Some(tech);
            }
        }
    }
    None
}

fn technology_descriptor(file_name: &str) -> Option<Technology> {
    match file_name {
        "pubspec.yaml" => Some(Technology::Flutter),
        "Cargo.toml" => Some(Technology::Rust),
        "package.json" => Some(Technology::JavaScript),
        "pom.xml" => Some(Technology::Maven),
        "build.gradle" => Some(Technology::Gradle),
        _ => None,
    }
}

pub fn has_built_artifacts(technology: &Technology, path: &str) -> bool {
    match technology {
        Technology::Flutter => {
            let build_path = path::Path::new(path).join("build");
            build_path.exists()
        }
        Technology::JavaScript => {
            let node_modules_path = path::Path::new(path).join("node_modules");
            node_modules_path.exists()
        }
        Technology::Rust => {
            let target_path = path::Path::new(path).join("target");
            target_path.exists()
        }
        Technology::Maven => {
            let target_path = path::Path::new(path).join("target");
            target_path.exists()
        }
        Technology::Gradle => {
            let build_path = path::Path::new(path).join("build");
            build_path.exists()
        }
    }
}

pub fn docker_cache() -> Option<Vec<DockerSystemDf>> {
    let output = std::process::Command::new("docker")
        .arg("system")
        .arg("df")
        .arg("--format")
        .arg("json")
        .output();

    match output {
        Ok(output) => {
            if output.status.success() {
                let json = String::from_utf8_lossy(&output.stdout);
                let lines: Vec<&str> = json.lines().collect();
                let mut caches = Vec::new();
                for line in lines {
                    if let Some(cache) = parse_docker_system_df_line(line) {
                        caches.push(cache);
                    }
                }
                Some(caches)
            } else {
                None
            }
        }
        Err(e) => {
            eprint!("Error executing docker command: {}", e);
            None
        }
    }
}

fn project_size_in_bytes(path: &str) -> u64 {
    let mut total_size: u64 = 0;

    for result in WalkDir::new(path) {
        match result {
            Ok(entry) => {
                let entry = entry;
                if let Ok(metadata) = entry.metadata() {
                    if metadata.is_file() {
                        total_size += metadata.len();
                    }
                }
            }
            Err(e) => {
                eprintln!("Error reading entry: {}", e);
            }
        }
    }

    total_size
}

fn parse_docker_system_df_line(line: &str) -> Option<DockerSystemDf> {
    serde_json::from_str(line).ok()
}

pub fn maven_cache() -> MavenCache {
    let maven_cache_path = home_dir()
        .map(|home| home.join(".m2").join("repository"))
        .filter(|path| path.exists())
        .map(|path| path.to_string_lossy().to_string())
        .unwrap_or_else(|| "Maven cache not found".to_string());

    println!("Calculating Maven cache size at {}", maven_cache_path);

    let mut total_size_in_bytes: u64 = 0;

    for result in WalkDir::new(&maven_cache_path) {
        match result {
            Ok(entry) => {
                let entry = entry;
                println!(
                    "Visiting: {} of size {}",
                    entry.path().display(),
                    entry.metadata().map(|m| m.len()).unwrap_or(0)
                );
                if let Ok(metadata) = entry.metadata() {
                    if metadata.is_file() {
                        total_size_in_bytes += metadata.len();
                    }
                }
            }
            Err(e) => {
                eprintln!("Error reading entry: {}", e);
            }
        }
    }

    MavenCache {
        path: maven_cache_path,
        total_size_in_bytes,
    }
}

pub fn gradle_cache() -> GradleCache {
    let gradle_cache_path = home_dir()
        .map(|home| home.join(".gradle").join("caches"))
        .filter(|path| path.exists())
        .map(|path| path.to_string_lossy().to_string())
        .unwrap_or_else(|| "Gradle cache not found".to_string());

    println!("Calculating Gradle cache size at {}", gradle_cache_path);

    let mut total_size_in_bytes: u64 = 0;

    for result in WalkDir::new(&gradle_cache_path) {
        match result {
            Ok(entry) => {
                let entry = entry;
                println!(
                    "Visiting: {} of size {}",
                    entry.path().display(),
                    entry.metadata().map(|m| m.len()).unwrap_or(0)
                );
                if let Ok(metadata) = entry.metadata() {
                    if metadata.is_file() {
                        total_size_in_bytes += metadata.len();
                    }
                }
            }
            Err(e) => {
                eprintln!("Error reading entry: {}", e);
            }
        }
    }

    GradleCache {
        path: gradle_cache_path,
        total_size_in_bytes,
    }
}

pub fn pub_cache() -> PubCache {
    let pub_cache_path = home_dir()
        .map(|home| home.join(".pub-cache"))
        .filter(|path| path.exists())
        .map(|path| path.to_string_lossy().to_string())
        .unwrap_or_else(|| "Pub cache not found".to_string());

    println!("Calculating Pub cache size at {}", pub_cache_path);

    let mut total_size_in_bytes: u64 = 0;

    for result in WalkDir::new(&pub_cache_path) {
        match result {
            Ok(entry) => {
                let entry = entry;
                println!(
                    "Visiting: {} of size {}",
                    entry.path().display(),
                    entry.metadata().map(|m| m.len()).unwrap_or(0)
                );
                if let Ok(metadata) = entry.metadata() {
                    if metadata.is_file() {
                        total_size_in_bytes += metadata.len();
                    }
                }
            }
            Err(e) => {
                eprintln!("Error reading entry: {}", e);
            }
        }
    }

    PubCache {
        path: pub_cache_path,
        total_size_in_bytes,
    }
}

pub fn delete_project_build_artifacts(path: &str) -> bool {
    if let Some(technology) = identify_technology(path) {
        let build_artifact_path = match technology {
            Technology::Flutter => path::Path::new(path).join("build"),
            Technology::JavaScript => path::Path::new(path).join("node_modules"),
            Technology::Rust => path::Path::new(path).join("target"),
            Technology::Maven => path::Path::new(path).join("target"),
            Technology::Gradle => path::Path::new(path).join("build"),
        };

        if build_artifact_path.exists() {
            match std::fs::remove_dir_all(&build_artifact_path) {
                Ok(_) => {
                    println!(
                        "Successfully deleted build artifacts at {}",
                        build_artifact_path.display()
                    );
                    return true;
                }
                Err(e) => {
                    eprintln!(
                        "Failed to delete build artifacts at {}: {}",
                        build_artifact_path.display(),
                        e
                    );
                    return false;
                }
            }
        } else {
            println!(
                "No build artifacts found at {}",
                build_artifact_path.display()
            );
            return false;
        }
    } else {
        println!("Technology could not be identified for path: {}", path);
        return false;
    }
}

pub fn delete_maven_cache() -> bool {
    let maven_cache_path = home_dir()
        .map(|home| home.join(".m2").join("repository"))
        .filter(|path| path.exists());

    if let Some(path) = maven_cache_path {
        match std::fs::remove_dir_all(&path) {
            Ok(_) => {
                println!("Successfully deleted Maven cache at {}", path.display());
                true
            }
            Err(e) => {
                eprintln!("Failed to delete Maven cache at {}: {}", path.display(), e);
                false
            }
        }
    } else {
        println!("Maven cache not found.");
        false
    }
}

pub fn delete_gradle_cache() -> bool {
    let gradle_cache_path = home_dir()
        .map(|home| home.join(".gradle").join("caches"))
        .filter(|path| path.exists());

    if let Some(path) = gradle_cache_path {
        match std::fs::remove_dir_all(&path) {
            Ok(_) => {
                println!("Successfully deleted Gradle cache at {}", path.display());
                true
            }
            Err(e) => {
                eprintln!("Failed to delete Gradle cache at {}: {}", path.display(), e);
                false
            }
        }
    } else {
        println!("Gradle cache not found.");
        false
    }
}

pub fn delete_pub_cache() -> bool {
    let pub_cache_path = home_dir()
        .map(|home| home.join(".pub-cache"))
        .filter(|path| path.exists());

    if let Some(path) = pub_cache_path {
        match std::fs::remove_dir_all(&path) {
            Ok(_) => {
                println!("Successfully deleted Pub cache at {}", path.display());
                true
            }
            Err(e) => {
                eprintln!("Failed to delete Pub cache at {}: {}", path.display(), e);
                false
            }
        }
    } else {
        println!("Pub cache not found.");
        false
    }
}

pub fn delete_docker_cache() -> bool {
    let output = std::process::Command::new("docker")
        .arg("system")
        .arg("prune")
        .arg("-f")
        .arg("-a")
        .output();

    match output {
        Ok(output) => {
            if output.status.success() {
                println!("Successfully deleted Docker cache.");
                true
            } else {
                eprintln!(
                    "Failed to delete Docker cache: {}",
                    String::from_utf8_lossy(&output.stderr)
                );
                false
            }
        }
        Err(e) => {
            eprintln!("Error executing docker command: {}", e);
            false
        }
    }
}
