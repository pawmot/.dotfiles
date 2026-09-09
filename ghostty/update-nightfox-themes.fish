#!/usr/bin/env fish
# Fetch/update ghostty theme files from EdenEast/nightfox.nvim (extra/*fox dirs).
# Run every couple months to pick up upstream changes.

set -l repo EdenEast/nightfox.nvim
set -l dest (dirname (status --current-filename))/themes

mkdir -p $dest

for dir in (gh api repos/$repo/contents/extra --jq '.[] | select(.type == "dir") | .name' | grep 'fox$')
    set -l url "https://raw.githubusercontent.com/$repo/main/extra/$dir/$dir.ghostty"
    echo "Fetching $dir.ghostty ..."
    curl -fsSL $url -o "$dest/$dir.ghostty"; or echo "  FAILED: $dir"
end

echo "Done. Themes in $dest"
