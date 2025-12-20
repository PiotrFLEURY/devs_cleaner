use devs_cleaner::cleanup;

fn main() {
    println!("Would you like to cleanup your caches ? (yes/no)");
    let mut cache_input = String::new();
    std::io::stdin()
        .read_line(&mut cache_input)
        .expect("Failed to read line");
    let cache_choice = cache_input.trim().to_lowercase();

    if cache_choice == "yes" {
        match cleanup::cleanup_cache() {
            Ok(status) => println!("Cache cleanup completed with status: {:?}", status),
            Err(e) => eprintln!("Cache cleanup failed with error: {}", e),
        }
    }
}
