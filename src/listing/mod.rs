use std::{fs::DirEntry, path};

use crate::models::{DevProject, ProjectCollection, Technology};

pub fn list_projects(path: &str) -> ProjectCollection {
    // List files in the specified directory
    match std::fs::read_dir(path) {
        Ok(entries) => {
            let mut projects = ProjectCollection::new();
            for entry in entries {
                if let Ok(entry) = entry {
                    if let Some(project) = to_project(&entry) {
                        println!("Found project: {} ({:?})", project.path, project.technology);
                        projects.push(project);
                    }
                    if entry.path().is_dir() {
                        if let Some(sub_path) = entry.path().to_str() {
                            let sub_projects = list_projects(sub_path);
                            for project in sub_projects.projects {
                                projects.push(project);
                            }
                        }
                    }
                }
            }
            projects
        }
        Err(e) => panic!("Error reading directory: {}", e),
    }
}

fn to_project(dir_entry: &DirEntry) -> Option<DevProject> {
    let path = dir_entry.path().to_str()?.to_string();
    if let Some(technology) = identify_technology(&path) {
        Some(DevProject::new(path, technology))
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
