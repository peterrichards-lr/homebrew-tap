#!/bin/bash

# Ensure we're in the repository root
cd "$(dirname "$0")/.." || exit 1

TOOLS_LIST="The following tools are available in this tap:\n\n"

for file in Formula/*.rb; do
    filename=$(basename -- "$file")
    toolname="${filename%.*}"
    
    homepage=$(grep 'homepage "' "$file" | sed 's/.*homepage "\(.*\)".*/\1/')
    
    # Extract the repository owner/name from the homepage URL
    repo_path=$(echo "$homepage" | sed -E 's|https://github.com/||')
    
    # Fetch description from GitHub API
    if command -v gh >/dev/null 2>&1; then
        desc=$(gh api "repos/$repo_path" --jq '.description')
    else
        desc=$(curl -s "https://api.github.com/repos/$repo_path" | jq -r '.description')
    fi
    
    # Fallback to local description if API fails
    if [ -z "$desc" ] || [ "$desc" = "null" ]; then
        desc=$(grep 'desc "' "$file" | sed 's/.*desc "\(.*\)".*/\1/')
    fi
    
    TOOLS_LIST+="- **[$toolname]($homepage)**: $desc\n"
done

# Replace the text between the markers
awk -v text="$TOOLS_LIST" '
  BEGIN { p=1 }
  /^<!-- TOOLS_LIST_START -->/ { print; printf "%s", text; p=0 }
  /^<!-- TOOLS_LIST_END -->/ { p=1 }
  p { print }
' README.md > README.md.tmp && mv README.md.tmp README.md
