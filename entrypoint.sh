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
echo "Install git..."
apt update && apt install git -y

# Add git config
echo "Set Git configs..."
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global --add safe.directory /github/workspace

cd $GITHUB_WORKSPACE

# Get the latest changes first on default branch
echo "Pulling the default branch..."
git pull

# Delete the branch if exists
echo "Deleting the '$BRANCH_NAME' branch if exists..."
git branch -D $BRANCH_NAME
git push origin --delete $BRANCH_NAME

# Checkout branch name based on Variable provided in workflow
echo "Checking out to new branch..."
git checkout -b $BRANCH_NAME

# Create example.txt
touch "example.txt"

# Put some content in example.txt
echo "You are doing awesome !" > example.txt

# Stage files and changes
git add .

# Commit message
echo "Committing the changes..."
git commit -m "$COMMIT_MESSAGE"

# Push the code
echo "Pushing the code..."
git push origin $BRANCH_NAME
