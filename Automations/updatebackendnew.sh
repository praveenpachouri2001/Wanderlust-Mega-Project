#!/bin/bash

# Retrieve the Minikube IP address
ipv4_address=$(minikube ip)

# Path to the .env file
file_to_find="../backend/.env.docker"

# Check the current FRONTEND_URL in the .env file
current_url=$(sed -n "4p" $file_to_find)

# Update the .env file if the IP address has changed
if [[ "$current_url" != "FRONTEND_URL=\"http://${ipv4_address}:31000\"" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|FRONTEND_URL.*|FRONTEND_URL=\"http://${ipv4_address}:31000\"|g" $file_to_find
    else
        echo "ERROR: File not found."
    fi
fi
