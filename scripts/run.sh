#!/bin/bash

echo "Starting server..."
cd server
./devs_cleaner/target/release/devs_cleaner &
SERVER_PID=$!

echo "Server started with PID $SERVER_PID"

echo "Starting client..."

open -n build_buster/build/macos/Build/Products/Release/build_buster.app &
CLIENT_PID=$!
echo "Client started with PID $CLIENT_PID"