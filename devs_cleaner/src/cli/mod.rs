pub mod args;
pub mod models;

use crate::cleanup;
use crate::cli::models::{CacheType, DynamicSize};
use crate::listing;

pub fn human_readable_size(size_in_bytes: u64) -> String {
    let units = ["B", "KB", "MB", "GB", "TB"];
    let mut size = size_in_bytes as f64;
    let mut unit_index = 0;

    while size >= 1024.0 && unit_index < units.len() - 1 {
        size /= 1024.0;
        unit_index += 1;
    }

    format!("{:.2} {}", size, units[unit_index])
}

pub fn is_cache_concerned(cache_name: CacheType, specified_cache: &Option<CacheType>) -> bool {
    match specified_cache {
        Some(_specified) => cache_name.matches(_specified),
        None => true, // If no specific cache is specified, all caches are concerned
    }
}

pub fn list_caches(specified_cache: Option<CacheType>) {
    println!("Listing caches...");

    println!("--------------------------------");

    if is_cache_concerned(CacheType::Docker, &specified_cache) {
        let docker_cache = listing::docker_cache();
        match docker_cache {
            Some(cache) => {
                println!("Docker cache:");
                for item in cache {
                    println!("  - Category: {}, size: {}", item.dtype, item.size);
                }
            }
            None => println!("No Docker cache found."),
        }

        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Maven, &specified_cache) {
        let maven_cache = listing::maven_cache();
        let maven_cache_size = DynamicSize::new(maven_cache.total_size_in_bytes);
        println!(
            "Maven cache size: {}",
            human_readable_size(maven_cache_size.size_in_bytes)
        );

        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Gradle, &specified_cache) {
        let gradle_cache = listing::gradle_cache();
        let gradle_cache_size = DynamicSize::new(gradle_cache.total_size_in_bytes);
        println!(
            "Gradle cache size: {}",
            human_readable_size(gradle_cache_size.size_in_bytes)
        );
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Pub, &specified_cache) {
        let pub_cache = listing::pub_cache();
        let pub_cache_size = DynamicSize::new(pub_cache.total_size_in_bytes);
        println!(
            "Pub cache size: {}",
            human_readable_size(pub_cache_size.size_in_bytes)
        );
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Npm, &specified_cache) {
        let npm_cache = listing::npm_cache();
        let npm_cache_size = DynamicSize::new(npm_cache.total_size_in_bytes);
        println!(
            "NPM cache size: {}",
            human_readable_size(npm_cache_size.size_in_bytes)
        );
        println!("--------------------------------");
    }
}

pub fn delete_caches(specified_cache: Option<CacheType>) -> Result<(), Box<dyn std::error::Error>> {
    println!("Deleting caches...");

    if is_cache_concerned(CacheType::Docker, &specified_cache) {
        println!("Deleting Docker cache...");
        cleanup::cleanup_docker_cache()?;
        println!("Docker cache deleted.");
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Maven, &specified_cache) {
        println!("Deleting Maven cache...");
        listing::delete_maven_cache();
        println!("Maven cache deleted.");
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Gradle, &specified_cache) {
        println!("Deleting Gradle cache...");
        listing::delete_gradle_cache();
        println!("Gradle cache deleted.");
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Pub, &specified_cache) {
        println!("Deleting Pub cache...");
        cleanup::cleanup_pub_cache()?;
        println!("Pub cache deleted.");
        println!("--------------------------------");
    }

    if is_cache_concerned(CacheType::Npm, &specified_cache) {
        println!("Deleting NPM cache...");
        listing::delete_npm_cache();
        println!("NPM cache deleted.");
        println!("--------------------------------");
    }

    Ok(())
}
