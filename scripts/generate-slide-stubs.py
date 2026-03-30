#!/usr/bin/env python3
"""Generate stub .qmd pages for each slides-*.qmd so they appear in the site listing."""

import glob
import os
import re
import sys


def extract_field(frontmatter: str, key: str) -> str:
    """Extract a simple scalar value from YAML frontmatter."""
    pattern = rf'^{key}:\s*["\']?(.+?)["\']?\s*$'
    m = re.search(pattern, frontmatter, re.MULTILINE)
    return m.group(1) if m else ""


def process_slide(slide_path: str) -> None:
    dir_name = os.path.dirname(slide_path)
    base = os.path.splitext(os.path.basename(slide_path))[0]
    stub_path = os.path.join(dir_name, f"page-{base}.qmd")

    text = open(slide_path).read()
    m = re.match(r"^---\n(.*?)\n---", text, re.DOTALL)
    if not m:
        print(f"  ⚠ No frontmatter in {slide_path}, skipping", file=sys.stderr)
        return

    fm = m.group(1)
    title = extract_field(fm, "title")
    subtitle = extract_field(fm, "subtitle")
    author = extract_field(fm, "author")
    date = extract_field(fm, "date")
    desc = subtitle if subtitle else "Slides"

    # Prefix title with lecture number extracted from filename (e.g. slides-01-foo → "01 · ")
    num_match = re.search(r"slides-(\d+)-", base)
    if num_match:
        title = f"{num_match.group(1)} · {title}"

    content = f"""---
title: "{title}"
date: '{date}'
author: "{author}"
description: "{desc}"
categories: [slides]
---

[Open slide deck]({base}.html){{.btn .btn-primary .btn-lg}}
"""
    with open(stub_path, "w") as f:
        f.write(content)
    print(f"  → {stub_path}")


def main():
    slides = sorted(glob.glob("post/**/slides-*.qmd", recursive=True))
    if not slides:
        print("  No slide decks found.")
        return
    for s in slides:
        process_slide(s)


if __name__ == "__main__":
    main()
