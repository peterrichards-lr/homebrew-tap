#!/bin/bash

# Usage: ./scripts/update-formula.sh <formula-name> <repo-owner/repo-name>
FORMULA_NAME=$1
REPO=$2
FORMULA_FILE="Formula/${FORMULA_NAME}.rb"

echo "Checking for updates for ${FORMULA_NAME} (${REPO})..."

# Get the latest release tag from GitHub API
LATEST_VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name')

if [ -z "$LATEST_VERSION" ] || [ "$LATEST_VERSION" == "null" ]; then
    echo "Error: Could not find latest version for ${REPO}"
    exit 1
fi

# Get the current version from the formula file
CURRENT_URL=$(grep 'url "' "$FORMULA_FILE" | sed -E 's/.*url "(.*)".*/\1/')
CURRENT_VERSION=$(echo "$CURRENT_URL" | sed -E 's/.*\/tags\/(.*)\.tar\.gz/\1/')

echo "Current version: ${CURRENT_VERSION}"
echo "Latest version:  ${LATEST_VERSION}"

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "New version found! Updating ${FORMULA_NAME} to ${LATEST_VERSION}..."
    
    NEW_URL="https://github.com/${REPO}/archive/refs/tags/${LATEST_VERSION}.tar.gz"
    # Calculate SHA256 (portable way)
    if command -v sha256sum >/dev/null 2>&1; then
        NEW_SHA256=$(curl -L -s "$NEW_URL" | sha256sum | awk '{print $1}')
    else
        NEW_SHA256=$(curl -L -s "$NEW_URL" | shasum -a 256 | awk '{print $1}')
    fi
    
    if [ -z "$NEW_SHA256" ]; then
        echo "Error: Could not calculate SHA256 for ${NEW_URL}"
        exit 1
    fi
    
    # Update the formula file (portable sed)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i "" "s|url \".*\"|url \"$NEW_URL\"|" "$FORMULA_FILE"
        sed -i "" "s|sha256 \".*\"|sha256 \"$NEW_SHA256\"|" "$FORMULA_FILE"
    else
        sed -i "s|url \".*\"|url \"$NEW_URL\"|" "$FORMULA_FILE"
        sed -i "s|sha256 \".*\"|sha256 \"$NEW_SHA256\"|" "$FORMULA_FILE"
    fi
    
    echo "Successfully updated ${FORMULA_FILE} to ${LATEST_VERSION}"
else
    echo "${FORMULA_NAME} is already up to date."
fi
