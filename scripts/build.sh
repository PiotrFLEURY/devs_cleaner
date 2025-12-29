#!/bin/bash

# Build script for devs_cleaner
cd devs_cleaner
echo "Building devs_cleaner..."

cargo build --release

cd ..

echo "Build completed successfully."

cd build_buster
echo "Building build_buster..."

flutter build macos --release
cd ..
echo "Build completed successfully."