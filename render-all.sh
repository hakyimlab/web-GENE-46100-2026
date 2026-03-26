#!/bin/bash
# Render the full site + slides, copying slide outputs to docs/

set -e

# 1. Render the website (pages, notebooks — excludes slides via _quarto.yml)
echo "=== Rendering site ==="
quarto render

# 2. Render each slide deck and copy output to docs/
for slide in post/**/slides-*.qmd; do
  echo "=== Rendering slide: $slide ==="

  # Clean old slide artifacts before rendering
  dir=$(dirname "$slide")
  base=$(basename "$slide" .qmd)
  rm -f "$dir/$base.html"
  rm -rf "$dir/${base}_files"

  quarto render "$slide" --to revealjs

  # Derive destination path
  dest="docs/$dir"

  mkdir -p "$dest"

  # Copy HTML
  cp "$dir/$base.html" "$dest/"

  # Copy supporting _files directory if it exists
  if [ -d "$dir/${base}_files" ]; then
    cp -r "$dir/${base}_files" "$dest/"
  fi

  # Copy images/ directory if it exists (shared by slides and pages)
  if [ -d "$dir/images" ]; then
    cp -r "$dir/images" "$dest/"
  fi

  # Clean up generated artifacts from source directory
  rm -f "$dir/$base.html"
  rm -rf "$dir/${base}_files"

  echo "  → copied to $dest/"
done

echo "=== Done ==="
