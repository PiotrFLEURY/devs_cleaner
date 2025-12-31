# Devs cleaner

A toolbox to free disk space for developpers

## UI - (Build Buster)

![Ui screen](build_buster/docs/screen.png)

Build Buster is a UI utility focusing on developpers tools disk usage.

See, scan, clean, and voilà !

### Caches

Quickly find disk space usage of each common tools used.

* Docker (images, containers, volumes, networks)

* Maven local repository

* Gradle caches

* Pub cache

* Npm cache

### Projects

Scan any folder containing your dev projects to get a full report of each detected projets and its disk usage

## Server - (Devs cleaner)

The UI utility requires a helper backend to work.

This backend is a simple Rest API built with Rust charged to perform scans and cleanups.

## Getting started with code

**Requirements**

- Rust - see [rust-lang.org](https://rust-lang.org/fr/tools/install/) to install Rust on your machine

- Flutter - see [flutter.dev](https://docs.flutter.dev/get-started/quick) to install Flutter on your machine

1. [Run the Rust server](#run-the-rust-server)
2. [Start the Flutter app](#start-the-flutter-app)

### Run the Rust Server

1. Open the [devs_cleaner](devs_cleaner) project with your IDE (recommending VsCode)

2. Run the server using `cargo run` command

### Start the Flutter app

1. Open the [build_buster](build_buster) project with your IDE (recommending VsCode)

2. Run the UI using `flutter run` command