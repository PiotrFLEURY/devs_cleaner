#[tokio::main]
async fn main() {
    println!("Starting Devs Cleaner application...");
    // Additional startup logic can be added here

    // Start the UI
    devs_cleaner::start_ui();

    devs_cleaner::start_server().await;
}
