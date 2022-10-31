#!/bin/bash

echo "##### Listing Github repository content #####"
ls $GITHUB_WORKSPACE

echo "##### cat fact.txt from GitHub repository #####"
cat $GITHUB_WORKSPACE/fact.txt

echo "##### Example of environment variables #####"
echo "Hey I am $user_name and my WordPress.org user profile is https://profiles.wordpress.org/shreyasikhar26/"

echo "##### Secret Value #####"
echo $GH_secret

# Add file using script

# Install git
# Ubuntu container by default do not have git installed.
echo "Install git"
apt update && apt install git -y

# Add git config
echo "Set Git configs"
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global --add safe.directory /github/workspace

cd $GITHUB_WORKSPACE

# Checkout branch name based on Variable provided in workflow
git checkout -b $BRANCH_NAME

# Get the latest changes first
git pull origin $BRANCH_NAME

# Create example.txt
touch "example.txt"

# Put some content in example.txt
echo "You are doing awesome !" > example.txt

# Stage files and changes
git add .

# Commit message
git commit -m "$COMMIT_MESSAGE"

# Push the code
git push origin $BRANCH_NAME
