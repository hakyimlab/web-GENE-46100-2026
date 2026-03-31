#!/bin/bash
# Convert qmd notebooks to Jupyter .ipynb and copy to Google Drive
# Usage: bash scripts/export-notebooks.sh [unit] [notebook-name] [--force]
#   unit:          unit00 (default), unit01, etc.
#   notebook-name: optional, e.g. notebook-02-cnn-intro (no .qmd). exports all if omitted.
#   --force:       overwrite existing .ipynb files in Google Drive
#                  WARNING: overwriting may change the Google Drive file ID,
#                  breaking existing Colab share links embedded in the .qmd files.

set -e

UNIT="${1:-unit00}"
NOTEBOOK_FILTER=""
FORCE=false
for arg in "$@"; do
  [ "$arg" = "--force" ] && FORCE=true
  [[ "$arg" == notebook-* ]] && NOTEBOOK_FILTER="$arg"
done

DEST="/Users/haekyungim/Library/CloudStorage/GoogleDrive-haky@uchicago.edu/My Drive/Work/Courses/AI-in-Genomics/gene46100-2026/Unit00-Introduction"

SRC_DIR="post/$UNIT"

if [ ! -d "$SRC_DIR" ]; then
  echo "Error: directory $SRC_DIR not found" >&2
  exit 1
fi

if [ ! -d "$DEST" ]; then
  echo "Error: destination not found: $DEST" >&2
  echo "Is Google Drive mounted?" >&2
  exit 1
fi

SKIPPED=0
EXPORTED=0

if [ -n "$NOTEBOOK_FILTER" ]; then
  echo "=== Converting $NOTEBOOK_FILTER in $SRC_DIR ==="
else
  echo "=== Converting all notebooks in $SRC_DIR ==="
fi
for qmd in "$SRC_DIR"/notebook-*.qmd; do
  base=$(basename "$qmd" .qmd)
  [ -n "$NOTEBOOK_FILTER" ] && [ "$base" != "$NOTEBOOK_FILTER" ] && continue
  ipynb="$SRC_DIR/$base.ipynb"
  dest_file="$DEST/$base.ipynb"

  if [ -f "$dest_file" ] && [ "$FORCE" = false ]; then
    echo "  SKIP (already exists): $base.ipynb"
    echo "        Re-run with --force to overwrite (may break Colab share links)."
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  echo "  Converting: $qmd"
  quarto convert "$qmd" --output "$ipynb" --quiet

  if [ -f "$dest_file" ]; then
    echo "  Overwriting (--force): $DEST/$base.ipynb"
  else
    echo "  Copying → $DEST/$base.ipynb"
  fi
  cp "$ipynb" "$DEST/"

  # Clean up local .ipynb (source of truth stays as .qmd)
  rm -f "$ipynb"
  EXPORTED=$((EXPORTED + 1))
done

echo ""
echo "=== Done: $EXPORTED exported, $SKIPPED skipped ==="
if [ "$SKIPPED" -gt 0 ]; then
  echo "    Tip: after first export, copy the Google Drive share link into the"
  echo "    corresponding .qmd file. Only re-export (--force) if the notebook"
  echo "    structure changed significantly and students need a fresh copy."
fi
