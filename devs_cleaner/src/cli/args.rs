use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(name = "devs_cleaner_cli")]
#[command(about = "CLI for cleaning up development environment, such as removing old build artifacts, clearing caches, etc.", long_about = None)]
pub struct Cli {
    #[command(subcommand)]
    pub command: Commands,
}

#[derive(Subcommand)]
pub enum Commands {
    /// Manage caches (docker, maven, gradle, pub, npm)
    Cache {
        #[command(subcommand)]
        options: CacheOptions,
    },
    /// Manage build artifacts in a project directory
    Build {
        #[command(subcommand)]
        options: BuildOptions,
    },
}

#[derive(Subcommand)]
pub enum CacheOptions {
    /// List caches
    Ls {
        /// Cache to list (docker, maven, gradle, pub, npm, all)
        target: Option<String>,
    },
    /// Delete caches (like `rm`)
    Rm {
        /// Cache to delete (docker, maven, gradle, pub, npm, all)
        target: Option<String>,
    },
}

#[derive(Subcommand)]
pub enum BuildOptions {
    /// List build artifacts (like `ls`)
    Ls {
        /// Path to list; if absent, the current directory is used
        path: Option<String>,
    },
    /// Delete build artifacts (like `rm`)
    Rm {
        /// Path to delete; if absent, the current directory is used
        path: Option<String>,
    },
}
