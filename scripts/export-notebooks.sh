#!/bin/bash
# Convert qmd notebooks to Jupyter .ipynb and copy to Google Drive
# Usage: bash scripts/export-notebooks.sh [unit]
#   unit: unit00 (default), unit01, etc.

set -e

UNIT="${1:-unit00}"
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

echo "=== Converting notebooks in $SRC_DIR ==="
for qmd in "$SRC_DIR"/notebook-*.qmd; do
  base=$(basename "$qmd" .qmd)
  ipynb="$SRC_DIR/$base.ipynb"

  echo "  Converting: $qmd"
  quarto convert "$qmd" --output "$ipynb" --quiet

  echo "  Copying → $DEST/$base.ipynb"
  cp "$ipynb" "$DEST/"

  # Clean up local .ipynb (source of truth stays as .qmd)
  rm -f "$ipynb"
done

echo "=== Done ==="
