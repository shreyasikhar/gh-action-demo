#!/bin/bash

echo "##### Listing Github repository content #####"
ls $GITHUB_WORKSPACE

echo "##### cat fact.txt from GitHub repository #####"
cat $GITHUB_WORKSPACE/fact.txt

echo "##### Example of environment variables #####"
echo "Hey I am $user_name and my WordPress.org user profile is https://profiles.wordpress.org/shreyasikhar26/"
