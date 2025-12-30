#!/bin/bash

echo "Starting server..."
cd server
./bin/devs_cleaner &
SERVER_PID=$!

echo "Server started with PID $SERVER_PID"

echo "Starting client..."

./bin/build_buster &

CLIENT_PID=$!
echo "Client started with PID $CLIENT_PID"