#!/bin/bash

# Get the last GitHub tag version
last_tag=$(git describe --tags --abbrev=0)

# Prompt the user for a new version
read -p "Current version: $last_tag. Enter the new version: " version

if [[ -z "$version" ]]; then
    echo "Version string cannot be empty. Exiting."
    exit 1
fi

gradle_file="build.gradle"

# Update the version in build.gradle
sed -i -E "s/(^    version +\"[^\"]+\")/    version \"$version\"/" "$gradle_file"

# Verify the change
if grep -q "^    version \"$version\"" "$gradle_file" "$gradle_file"; then
    echo "Version updated to $version in $gradle_file."
else
    echo "Failed to update version in $gradle_file. Exiting."
    exit 1
fi

# Commit and push
git add "$gradle_file"
git commit -m "Bump to $version"
git push

# Create a git tag
echo "Creating git tag $version..."
git tag "$version"
git push origin "$version"

echo "Done"
