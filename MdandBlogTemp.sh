#!/bin/bash

# Define the filename and title for the new Markdown file
filename="MyThirdBlogPost.md"
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

EOL

# Notify the user that the file has been created
echo "Markdown file '$filename' has been created with a standardized template."

