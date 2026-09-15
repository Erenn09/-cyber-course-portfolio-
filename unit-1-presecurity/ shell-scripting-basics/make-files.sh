#!/bin/bash
# make-files.sh — Ask for a directory name, create it if needed,
#                 and populate it with 5 empty files.

read -p "Enter a directory name: " dirname

if [ -z "$dirname" ]; then
    echo "Error: no name was given."
    exit 1
fi

if [ -d "$dirname" ]; then
    echo "Directory already exists: $dirname"
else
    mkdir "$dirname"
    echo "Created directory: $dirname"
fi

for i in {1..5}; do
    echo "This is file $i" > "$dirname/file${i}.txt"
done

echo "Created 5 files in $dirname"
