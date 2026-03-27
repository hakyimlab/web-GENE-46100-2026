# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a [Quarto](https://quarto.org/) website for **GENE 46100: Deep Learning in Genomics**, a course taught at UChicago by Haky Im. The site is rendered to the `docs/` directory and deployed via GitHub Pages.

## Key Commands

### Build / Render

```bash
# Render the entire site
quarto render

# Preview the site locally with live reload
quarto preview

# Render a single file
quarto render post/unit00/homework-01.qmd

# Render slides specifically (excluded from default render, must be done explicitly)
quarto render post/unit00/slides-unit00.qmd --to revealjs
```

> **Note:** The default render in `_quarto.yml` only includes `post/unit00/**/*.qmd`. Units 01–03 are **not rendered by default** — to include them, add their glob patterns to the `render:` list in `_quarto.yml`. Files matching `**/slides*.qmd` are also excluded; render slides individually with `--to revealjs`.

### Environment Setup

The course uses a conda environment named `gene46100` (Python 3.12). Packages are installed via `%pip` inside notebooks, not via conda.

```bash
conda create -n gene46100 python=3.12
conda activate gene46100
conda install nb_conda_kernels jupyter_server ipykernel
pip install nbclient nbformat
```

For `.qmd` files with Python code blocks, add this to the YAML frontmatter:

```yaml
jupyter:
  kernelspec:
    name: "conda-env-gene46100-py"
    language: "python"
    display_name: "gene46100"
```

## Architecture

### Site Structure

- `_quarto.yml` — site config: output to `docs/`, theme cosmo, katex math
- `index.qmd` — homepage listing (shows non-draft posts only, sorted by date)
- `index-all.qmd` — lists all posts including drafts/tests
- `post/_metadata.yml` — shared defaults for all posts: `freeze: auto`, code-fold off, code-tools on
- `docs/` — rendered HTML output (committed to git, served via GitHub Pages)
- `post/` — source content organized by unit

### Content Organization

Course content lives in `post/` and is organized by unit:

| Directory | Topic |
|-----------|-------|
| `post/unit00/` | Intro to DL, DNA basics, TF binding prediction |
| `post/unit01/` | Language models, GPT (nanoGPT), attention |
| `post/unit02/` | Sequence-to-function models (Enformer, Borzoi) |
| `post/unit03/` | Single-cell RNA (scGPT, scanpy, Seurat) |

Each unit folder typically contains:
- `index.qmd` — unit overview/setup page (often `draft: true`)
- Homework `.qmd` files
- Tutorial notebooks (`.ipynb` or `.qmd`)
- A `slides-*.qmd` for RevealJS slide decks

### Draft System

Posts with `draft: true` in their YAML frontmatter are hidden from the main `index.qmd` listing but appear in `index-all.qmd`. Use `draft: true` for in-progress content.

### Freeze System

`post/_metadata.yml` sets `freeze: auto` — Quarto caches executed notebook outputs in `.quarto/_freeze/` so code doesn't re-run on every render unless the source changes. To force re-execution, delete the relevant `.quarto/_freeze/` cache entry or set `freeze: false` in the document.

### Slides

RevealJS slide decks use `format: revealjs` with `chalkboard: true`. They are intentionally excluded from the bulk render (`!**/slides*.qmd` in `_quarto.yml`) and must be rendered individually.
