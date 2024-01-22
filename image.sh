#!/bin/bash

# Check if a filename argument is provided
if [ $# -ne 1 ]; then
	    echo "Usage: $0 <filename>"
	        exit 1
fi

# Define the filename argument
FILENAME="$1"

# Define the paths
SRC="/mnt/c/Users/Ena John Egbe/Downloads/$FILENAME"
DEST="~/enaJohn/images/"

# Copy the file
cp $SRC ~/enaJohn/images/

# Navigate to your Git repository
cd ~/enaJohn

# Add the copied file to Git
git add .

# Commit the changes with a message
git commit -am "$FILENAME"

# Push the changes to your remote repository
git push origin main

# Print a success message
echo "File '$FILENAME' has been successfully copied and pushed to your Git repository."

