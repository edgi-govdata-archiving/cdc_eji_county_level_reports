#!/bin/bash

# Check if the base directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <base_directory>"
    exit 1
fi

# Base directory containing the state directories
BASE_DIR="$1"

# Iterate over each directory in the base directory
for dir in "$BASE_DIR"/*; do
    if [ -d "$dir" ]; then
        # Extract the directory name
        dir_name=$(basename "$dir")

        # Create the repository name
        repo_name="CDC_EIJ_DATA_$dir_name"

        # Navigate to the directory
        cd "$dir"

        # Remove the initial number and underscore, and convert underscores to spaces
        state_name=$(echo $dir_name | sed 's/^[0-9]*_//' | sed 's/_/ /g')

        # Check if the repository exists on GitHub
        if gh repo view edgi-govdata-archiving/$repo_name > /dev/null 2>&1; then
            # If the repository already exists, just add and push changes
            echo "Repository $repo_name already exists. Adding and pushing changes..."
            git add -A
            git commit -m "update"
            git push
        else
            echo "Creating repository $repo_name for $state_name..."
            # Initialize a new git repository
            git init

            # Create a README.md file
            echo "# CDC Environmental Justice Index for $state_name" > README.md
            echo "" >> README.md
            echo "This repository contains the CDC Environmental Justice Index reports for $state_name." >> README.md
            echo "" >> README.md

            # Add all files to the repository
            git add -A

            # Commit the files
            git commit -m "first commit"

            # Create the main branch
            git branch -M main

            # Create the repository on GitHub using gh CLI
            gh repo create edgi-govdata-archiving/$repo_name --public --source=. --remote=origin

            # Push the initial commit to the remote repository
            git push --set-upstream origin main
        fi
    fi
done
