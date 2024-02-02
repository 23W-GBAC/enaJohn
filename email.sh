#!/bin/bash

# Set the subject and body of the email
SUBJECT="New Blog Post Published!"
BODY="A new post has been published on my blog. Check it out at: [https://github.com/23W-GBAC/enaJohn/tree/main]"

# Loop through the list of subscribers and send email to each one
while IFS= read -r email; do
	    # Send the email using the 'mail' command
	        echo "$BODY" | mail -s "$SUBJECT" "$email"
	done < "subscribers.txt"

