#!/bin/bash
# Render the full site + slides, copying slide outputs to docs/

set -e

# 0. Generate stub pages for each slide deck so they appear in the site listing
echo "=== Generating slide stub pages ==="
python3 scripts/generate-slide-stubs.py

# 1. Remove stale HTML artifacts from source directories
# (quarto render copies any .html it finds in post/ to docs/, so old renamed files pollute output)
echo "=== Cleaning stale HTML from post/ ==="
find post -name "*.html" \
  -not -path "*/alt_out/*" \
  -not -name "speaker-view.html" \
  -delete

# 2. Render the website (pages, notebooks — excludes slides via _quarto.yml)
echo "=== Rendering site ==="
quarto render

# 3. Copy CSS files not handled by quarto render
echo "=== Copying CSS assets ==="
for css in post/**/custom.css; do
  dest="docs/$(dirname "$css")"
  mkdir -p "$dest"
  cp "$css" "$dest/"
  echo "  → $dest/$(basename "$css")"
done

# 4. Render each slide deck and copy output to docs/
for slide in post/**/slides-*.qmd; do
  dir=$(dirname "$slide")
  base=$(basename "$slide" .qmd)
  dest="docs/$dir/$base.html"

  # Skip if rendered output is newer than source
  if [ -f "$dest" ] && [ "$dest" -nt "$slide" ]; then
    echo "=== Skipping (unchanged): $slide ==="
    continue
  fi

  echo "=== Rendering slide: $slide ==="

  # Clean old slide artifacts before rendering
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
