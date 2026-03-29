use clap::Parser;
use devs_cleaner::{
    cleanup::Cleanup,
    cli::{
        args::{BuildOptions, CacheOptions, Cli, Commands},
        delete_caches, human_readable_size, list_caches,
        models::CacheType,
    },
    listing::list_projects,
};

/// CLI for cleaning up development environment, such as removing old build artifacts, clearing caches, etc.
///
/// usage: dev-cleaner-cli <command> [options] [path]
/// Commands:
///   - cache
///   - build
///
/// Options:
///  - ls    List all caches and build artifacts
///  - rm  Delete all caches and build artifacts
///
/// Path:
///  - <None>    Use current directory
///  - <Path>    Specify the path to clean up
///
/// Examples:
/// - List all caches: dev-cleaner-cli cache ls
/// - List a specific cache: dev-cleaner-cli cache ls docker
/// - Delete a specific cache: dev-cleaner-cli cache rm docker
/// - List build artifacts in current directory: dev-cleaner-cli build ls [.]
/// - Delete build artifacts in current directory: dev-cleaner-cli build rm [.]
///
fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Read arguments from command line
    let cli = Cli::parse();

    match cli.command {
        Commands::Cache { options } => match options {
            CacheOptions::Ls { target } => {
                let specified_cache = CacheType::from(&target);
                list_caches(specified_cache);
            }
            CacheOptions::Rm { target } => {
                let specified_cache = CacheType::from(&target);
                delete_caches(specified_cache)?;
            }
        },
        Commands::Build { options } => match options {
            BuildOptions::Ls { path } => {
                let projects = if let Some(path) = path {
                    println!("Listing build artifacts for path: {:?}", path);
                    list_projects(&path)
                } else {
                    println!("Listing build artifacts for current directory");
                    list_projects(".")
                };

                let mut project_list = projects.projects;
                project_list.sort_by(|a, b| a.size_in_bytes.cmp(&b.size_in_bytes));

                let total_size: u64 = project_list.iter().map(|p| p.size_in_bytes).sum();

                for project in project_list {
                    println!(
                        "Path: {}, Technology: {:?}, Size: {}",
                        project.path,
                        project.technology,
                        human_readable_size(project.size_in_bytes)
                    );
                }

                println!("--------------------------------");
                println!(
                    "Total size of build artifacts: {}",
                    human_readable_size(total_size)
                );
                println!("--------------------------------");
            }
            BuildOptions::Rm { path } => {
                println!("Deleting build artifacts for targets: {:?}", path);

                let projects = if let Some(path) = path {
                    println!("Deleting build artifacts for path: {:?}", path);
                    list_projects(&path)
                } else {
                    println!("Deleting build artifacts for current directory");
                    list_projects(".")
                };

                projects.projects.into_iter().for_each(|mut project| {
                    println!(
                        "Cleaning up project at path: {}, technology: {:?}",
                        project.path, project.technology
                    );
                    if let Err(e) = project.cleanup() {
                        eprintln!("Failed to clean up project at {}: {}", project.path, e);
                    } else {
                        println!("Successfully cleaned up project at {}", project.path);
                    }
                });
            }
        },
    }

    Ok(())
}
