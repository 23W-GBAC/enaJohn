#!/bin/bash

# Define the filename of the Markdown file to be checked and formatted
filename="MyThirdBlogPost.md"

# Check if the specified file exists
if [ ! -e "$filename" ]; then
	    echo "File '$filename' does not exist. Aborting."
	        exit 1
fi

# Define the command to check the file for spelling errors using aspell

spell_check_command="aspell --lang=en_GB --mode=markdown --list < $filename"

# Run the spell checker and capture the output
spell_errors=$(eval $spell_check_command)

# Check if there are any spelling errors
if [ -z "$spell_errors" ]; then
	    echo "No spelling errors found in '$filename'."
    else
	        echo "Spelling errors found in '$filename':"
		    echo "$spell_errors"
fi

# Define a sed command to automate text formatting (e.g., converting to title case)
sed_command="sed -i 's/\b\(.\)/\u\1/g' $filename"

# Apply text formatting using sed
eval $sed_command

echo "Text formatting applied to '$filename'."
