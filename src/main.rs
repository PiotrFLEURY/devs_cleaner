use std::collections::HashMap;

use devs_cleaner::{CleanupProjects, Technology, listing};

fn main() {
    // Ask user for directory input
    println!("Please enter a directory path:");
    let mut input = String::new();
    std::io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");
    let dir_path = input.trim();
    let mut projects = listing::list_projects(dir_path);
    println!("Total projects found: {}", projects.len());

    let distinct_tech_count = projects.count_distinct_technologies();
    println!("Distinct technologies found: {}", distinct_tech_count);

    let technologies = projects.list_distinct_technologies();
    for tech in &technologies {
        println!("Technology: {:?}", tech);
    }

    let mut technology_map = HashMap::new();
    technology_map.insert(1, Technology::Flutter);
    technology_map.insert(2, Technology::JavaScript);
    technology_map.insert(3, Technology::Maven);
    technology_map.insert(4, Technology::Rust);
    technology_map.insert(5, Technology::Gradle);

    println!("Which cleanup would you like to perform? (e.g., 'flutter', 'node', 'maven')");
    println!(
        "{}",
        technology_map
            .iter()
            .map(|(k, v)| format!("{}: {:?}", k, v))
            .collect::<Vec<String>>()
            .join("\n")
    );
    println!("Please enter the number corresponding to your choice:");
    let mut choice_input = String::new();
    std::io::stdin()
        .read_line(&mut choice_input)
        .expect("Failed to read line");
    let choice: i8 = choice_input
        .trim()
        .parse()
        .expect("Please enter a valid number");

    let chosen_technology = technology_map.get(&choice);

    match chosen_technology {
        Some(tech) => {
            println!("You chose to clean up projects with technology: {:?}", tech);
            match projects.cleanup_technology(tech) {
                Ok(status) => println!("Cleanup completed with status: {:?}", status),
                Err(e) => eprintln!("Cleanup failed with error: {}", e),
            }
        }
        None => {
            println!("Invalid choice. Exiting.");
            return;
        }
    }
}
