#!/bin/bash
# Navigate to your dotfiles directory
cd ~/dotfiles || exit

# Add all changes
git add .

# Commit with a timestamp (only if there are changes)
if ! git diff-index --quiet HEAD; then
    git commit -m "Automated update: $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin main
fi
