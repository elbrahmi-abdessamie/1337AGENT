#!/bin/bash

# Extract the archive "archive.tar"
tar -xf archive.tar

# Find and remove empty files in the extracted directory
find . -type f -empty -delete

# Append ".log" extension to all remaining files
find . -type f -exec mv {} {}.log \;

# Create a new archive named "/tmp/archive.tar"
tar -cf /tmp/archive.tar ./*

# Notify the user
echo "New archive created at /tmp/archive.tar"
