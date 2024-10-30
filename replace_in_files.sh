#!/bin/bash

#######################################
### Created by Hossein Haeri (2024) ###
#######################################


# Check if at least 2 arguments (something and somethingElse) are passed
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 [-r] [directory] something somethingElse"
    exit 1
fi

# Initialize variables
recursive=0
directory="."
something=""
somethingElse=""
total_replacements=0
script_name=$(basename "$0")  # Get the name of the script

# Check for the optional -r flag
if [ "$1" == "-r" ]; then
    recursive=1
    shift 1  # Shift the arguments to remove the -r flag
fi

# Handle the case where the directory is provided or not
if [ "$#" -eq 3 ]; then
    directory=$1
    something=$2
    somethingElse=$3
else
    something=$1
    somethingElse=$2
fi

# Find and replace "something" with "somethingElse" in all files in the directory, excluding the script itself
if [ "$recursive" -eq 1 ]; then
    files=$(find "$directory" -type f ! -name "$script_name")
else
    files=$(find "$directory" -maxdepth 1 -type f ! -name "$script_name")
fi

# Loop through the files and make replacements
for file in $files; do
    count=$(grep -o "$something" "$file" | wc -l)
    if [ "$count" -gt 0 ]; then
        sed -i "s/$something/$somethingElse/g" "$file"
        echo "$count item(s) replaced in $file"
        total_replacements=$((total_replacements + count))
    fi
done

# If no replacements were made, print "No item found"
if [ "$total_replacements" -eq 0 ]; then
    echo "No item found"
else
    echo "Total replacements made: $total_replacements"
    if [ "$recursive" -eq 1 ]; then
        echo "Including all subdirectories."
    fi
fi

