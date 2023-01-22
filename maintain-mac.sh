#!/bin/bash

# Free Space before cleanup
diskutil info / | grep "Free Space"

# Homebrew
# Update, upgrade, and clean up unused files
brew update && brew upgrade && brew cleanup

# CD into all folders in the current working directory, and clean all merged branches for each
for d in */; do cd $d; echo WORKING ON $d; git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d; cd ..; done

# Removes all node_modules folders
find . -name "node_modules" -type d | xargs rm -rf

# Cleans npm cache
npm cache clean --force 

# Clean docker volumes
docker volume prune

# Rust binaries
# cargo install cargo-clean-recursive
cargo clean-recursive

# Golang cache
go clean --cache

# Free Space before cleanup
diskutil info / | grep "Free Space"




