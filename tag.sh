#!/bin/bash

#USer input for branch name
echo "Enter branch name"
read BRANCH_NAME

#Get the tag name
GIT_COMMIT=`git rev-parse HEAD`
CURRENT_COMMIT_TAG=`git describe --contains $GIT_COMMIT`

if [ -z "$CURRENT_COMMIT_TAG" ]; then
	echo "Enter a tag name"
	read TAGNAME
	echo "updating tag to $TAGNAME"
	git tag $TAGNAME
	git push --tags
	echo "Tags created and pushed : $TAGNAME"
else
	echo "Tag already exist: $CURRENT_COMMIT_TAG"
fi
