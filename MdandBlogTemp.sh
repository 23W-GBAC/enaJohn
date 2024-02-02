#!/bin/bash

# Check if an argument is provided (i.e., the new filename)
if [ $# -eq 0 ]; then
	  echo "Usage: $0 <filename>"
	    exit 1
fi

# Define the filename from the script's first argument
filename="$1"
title="Optimizing Administrative Workflows: ChatGPT as Your Virtual Assistant"

# Check if the file already exists, and if it does, exit
if [ -e "$filename" ]; then
	  echo "File '$filename' already exists. Aborting."
	    exit 1
fi

# Create the Markdown file and add the template
cat <<EOL > "$filename"
---
title: $title
date: $(date +"%Y-%m-%d")
author: Your Name
categories:
  - Technology
tags:
  - Blogging
  - Automation
---

# $title

## Introduction

Add your introduction here.

## Section 1

Write the content for section 1.

## Section 2

Write the content for section 2.

## Conclusion

Summarize the key points in the conclusion.

## References

- [Reference 1](https://example.com/reference1)
- [Reference 2](https://example.com/reference2)

# Add to the end of publish_post.sh script

SUBJECT="New Blog Post Published!"
BODY="A new post has been published on my blog. Check it out at: [Your Blog URL]"

while IFS= read -r email; do
	    echo -e "Subject:$SUBJECT\n\n$BODY" | sendmail "$email"
    done < "subscribers.txt"


EOL

# Notify the user that the file has been created
echo "Markdown file '$filename' has been created with a standardized template."

