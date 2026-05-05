# IE School of Science and Technology Capstone Typst Template

A document template for SST using Typst.

## What is Typst?

[Typst](https://typst.app/) is a modern markup-based typesetting system designed as an alternative to LaTeX. It offers faster compilation, simpler syntax, and built-in scripting.

## Installation

Install Typst via your package manager:

```bash
# macOS
brew install typst

# Arch Linux
pacman -S typst

# Or download from https://github.com/typst/typst/releases
```

## Usage

Compile the document:

```bash
typst compile main.typ
```

Watch for changes and recompile automatically:

```bash
typst watch main.typ
```

## Structure

- `main.typ` - Main document file
- `sections/` - Document sections (title page, abstract, methodology, etc.)
- `graphics/` - Images and figures
- `references.bib` - Bibliography
