use std::{io::Error, process::ExitStatus};

use crate::listing;
use crate::models::{DevProject, ProjectCollection, Technology};

pub trait CleanupProjects {
    fn cleanup_technology(&mut self, technology: &Technology) -> Result<ExitStatus, Error>;
}

impl CleanupProjects for ProjectCollection {
    fn cleanup_technology(&mut self, technology: &Technology) -> Result<ExitStatus, Error> {
        let mut found = false;
        for project in &mut self.projects {
            if &project.technology == technology {
                found = true;
                project.cleanup()?;
            }
        }
        if found {
            Ok(ExitStatus::default())
        } else {
            Err(Error::new(
                std::io::ErrorKind::NotFound,
                "No project found with the specified technology",
            ))
        }
    }
}

pub trait Cleanup {
    fn cleanup(&mut self) -> Result<ExitStatus, Error>;
    fn cleanup_flutter(&self, path: &str) -> Result<ExitStatus, Error>;
    fn cleanup_node(&self, path: &str) -> Result<ExitStatus, Error>;
    fn cleanup_maven(&self, path: &str) -> Result<ExitStatus, Error>;
    fn cleanup_gradle(&self, path: &str) -> Result<ExitStatus, Error>;
    fn cleanup_rust(&self, path: &str) -> Result<ExitStatus, Error>;
}

impl Cleanup for DevProject {
    fn cleanup(&mut self) -> Result<ExitStatus, Error> {
        match self.technology {
            Technology::Flutter => self.cleanup_flutter(&self.path),
            Technology::JavaScript => self.cleanup_node(&self.path),
            Technology::Maven => self.cleanup_maven(&self.path),
            Technology::Gradle => self.cleanup_gradle(&self.path),
            Technology::Rust => self.cleanup_rust(&self.path),
        }
    }

    fn cleanup_flutter(&self, path: &str) -> Result<ExitStatus, Error> {
        if !listing::has_built_artifacts(&self.technology, path) {
            println!("No Flutter build artifacts found at {}", path);
            return Ok(ExitStatus::default());
        }

        println!("Default Flutter cleanup for project at {}", path);
        std::process::Command::new("flutter")
            .arg("clean")
            .current_dir(path)
            .status()
    }

    fn cleanup_node(&self, path: &str) -> Result<ExitStatus, Error> {
        if !listing::has_built_artifacts(&self.technology, path) {
            println!("No Node.js build artifacts found at {}", path);
            return Ok(ExitStatus::default());
        }

        println!("Default Node.js cleanup for project at {}", path);
        std::process::Command::new("rm")
            .arg("-rf")
            .arg("node_modules")
            .current_dir(path)
            .status()
    }

    fn cleanup_maven(&self, path: &str) -> Result<ExitStatus, Error> {
        if !listing::has_built_artifacts(&self.technology, path) {
            println!("No Maven build artifacts found at {}", path);
            return Ok(ExitStatus::default());
        }

        println!("Default Maven cleanup for project at {}", path);
        std::process::Command::new("./mvnw")
            .arg("clean")
            .current_dir(path)
            .status()
    }

    fn cleanup_gradle(&self, path: &str) -> Result<ExitStatus, Error> {
        if !listing::has_built_artifacts(&self.technology, path) {
            println!("No Gradle build artifacts found at {}", path);
            return Ok(ExitStatus::default());
        }

        println!("Default Gradle cleanup for project at {}", path);
        std::process::Command::new("./gradlew")
            .arg("clean")
            .current_dir(path)
            .status()
    }

    fn cleanup_rust(&self, path: &str) -> Result<ExitStatus, Error> {
        if !listing::has_built_artifacts(&self.technology, path) {
            println!("No Rust build artifacts found at {}", path);
            return Ok(ExitStatus::default());
        }

        println!("Default Rust cleanup for project at {}", path);
        std::process::Command::new("cargo")
            .arg("clean")
            .current_dir(path)
            .status()
    }
}

pub fn cleanup_cache() -> Result<ExitStatus, Error> {
    cleanup_pub_cache()?;
    cleanup_docker_cache()?;

    Ok(ExitStatus::default())
}

pub fn cleanup_pub_cache() -> Result<ExitStatus, Error> {
    println!("Cleaning up Flutter pub cache");
    std::process::Command::new("flutter")
        .arg("pub")
        .arg("cache")
        .arg("clean")
        .status()
}

pub fn cleanup_docker_cache() -> Result<ExitStatus, Error> {
    println!("Cleaning up Docker cache");
    std::process::Command::new("docker")
        .arg("system")
        .arg("prune")
        .arg("-a")
        .status()
}
