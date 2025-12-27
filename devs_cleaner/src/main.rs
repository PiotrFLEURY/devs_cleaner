use devs_cleaner::server;

#[tokio::main]
async fn main() {
    println!("Starting Devs Cleaner server on http://0.0.0.0:3000");
    let router = server::create_router();

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000")
        .await
        .expect("Unable to bind port");
    axum::serve(listener, router)
        .await
        .expect("Expecting server started");
}
