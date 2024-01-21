 #!/bin/bash

 # Define your GitHub username, repository name, and personal access token
 GITHUB_USERNAME="enajo"
 REPO_NAME="23W-GBAC/enaJohn"
 ACCESS_TOKEN="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"

 # Specify the image file you want to upload from your PC's download folder
 IMAGE_FILE="/mnt/c/Users/'Ena John Egbe'/Downloads/plan"

 # Encode the image file to base64
 IMAGE_BASE64=$(base64 -w0 "$IMAGE_FILE")

 # Create a new blob for the image content
 BLOB_RESPONSE=$(curl -X POST "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/git/blobs" \
	   -H "Authorization: token $ACCESS_TOKEN" \
	     -d '{
     "content": "'"${IMAGE_BASE64}"'",
         "encoding": "base64"
	   }')

	   # Extract the blob SHA from the response
	   BLOB_SHA=$(echo "$BLOB_RESPONSE" | jq -r '.sha')

	   # Create a new commit with the image file in the "images" directory
	   curl -X PUT "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/contents/images/$(basename "$IMAGE_FILE")" \
		     -H "Authorization: token $ACCESS_TOKEN" \
		       -d '{
	       "message": "Add image",
	           "content": "'"{
		         "sha": "'"${BLOB_SHA}"'",
			       "size": '${#IMAGE_BASE64}',
			             "encoding": "base64"
				         }"'"
					   }'

					   # Print the URL of the uploaded image in your GitHub repository
					   echo "Image uploaded to: https://github.com/$GITHUB_USERNAME/$REPO_NAME/blob/main/images/$(basename "$IMAGE_FILE")"

