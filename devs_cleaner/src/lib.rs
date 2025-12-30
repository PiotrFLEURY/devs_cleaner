pub mod cleanup;
pub mod listing;
pub mod models;
pub mod server;

pub use std::collections::HashMap;

pub use crate::{cleanup::CleanupProjects, models::Technology};

pub async fn start_server() {
    println!("Starting Devs Cleaner server on http://0.0.0.0:3000");
    let router = server::create_router();

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000")
        .await
        .expect("Unable to bind port");
    axum::serve(listener, router)
        .await
        .expect("Expecting server started");
}

pub fn start_ui() {
    // Start process to launch Flutter UI
    let platform = if cfg!(target_os = "windows") {
        "windows"
    } else if cfg!(target_os = "macos") {
        "macos"
    } else {
        "linux"
    };
    let startup_command = match platform {
        "windows" => "start \"\" \".\\build_buster.exe\"",
        "macos" => "open -n ./build_buster.app &",
        "linux" => "./build_buster &",
        _ => "flutter run",
    };
    std::process::Command::new("sh")
        .arg("-c")
        .arg(startup_command)
        .spawn()
        .expect("Failed to start Flutter UI");
}
