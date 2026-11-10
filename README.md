# Uni-Work

University coursework (ULBS), organized by year and semester. 

Most documents are written in [Typst](https://typst.app/); some courses also contain code / files for their respective coursework.

Course Notes also contain things sent on our year's groupchat(s)

## Published PDFs

Compiled PDFs are available at **<https://barna-tudor.github.io/Uni-Work/>**.

Only Typst documents are published, details under Conventions

`An_I/Semestru-1/Algebra/main.typ` becomes `An_I/Semestru-1/Algebra/Algebra.pdf`.

Until the repo becomes up to date with coursework, the site is rebuilt manually, so it can lag behind `main`. Will change to automatic on-push later.

## Repository layout

```
.
├── .github/workflows/
│   ├── format.yml      # typstyle check on pull requests
│   └── pdfs.yml        # manual build + publish of PDFs
├── An_I/
│   └── Semestru-1/     # Year 1, semester 1 coursework
│       └── <Materie>
├── template.typ        # Shared document template
├── Typst-Demo.typ      # Demo of Typst Features
└── .gitignore
```
A subject is structured, generally:
```
Materie
├── Curs/
│   ├── {1,...,14}
│   │   └── main.typ    # Individual lecture notes
│   └── all.typ         # all-in-one
├── Seminar/
│   ├── {1,...,14}
│   │   └── main.typ    # Individual seminar notes
│   └── all.typ         # all-in-one
└── Lab/
    └──{1,...,14}
```
### Conventions
- Most documents import the shared template (`#import "/template.typ": *`). This is why every compile command passes `--root` pointing at the repository root.
- Files named `main.typ` will be individually published. 
- Files `all.typ` include other files (`#include "path/to/file.typ`), and are compiled differently, see `.github/workflows/pdfs.yml`
- Run `typstyle` with default config before opening a pull request (see below).
    - Alternatively, if using [Tinymist](https://github.com/Myriad-Dreamin/tinymist), change the columns setting from 120 to 80

## Requirements
For Typst:
| Tool | Purpose | Install guide |
| --- | --- | --- |
| `typst` | Compiler | [Typst installation](https://github.com/typst/typst#installation) |
| `typstyle` | Formatter | [Typstyle installation](https://github.com/typstyle-rs/typstyle#installation-and-usage) |

Quick install (see the guides above for other methods):

```sh
# Typst
winget install --id Typst.Typst      # Windows
brew install typst                   # macOS
cargo install --locked typst-cli     # any platform with Rust

# Typstyle
brew install typstyle                # macOS
cargo install typstyle --locked      # any platform with Rust
# Windows / Linux: download a binary from
# https://github.com/typstyle-rs/typstyle/releases
```
## CI
| Workflow | Trigger | Description |
| --- | --- | --- |
| `format.yml` | Pull requests that touch `.typ` files | Runs `typstyle --check <file>`, fails on non-formatted files |
| `pdfs.yml` | Manual only (for now) | Compiles every `main.typ`, generates an index page, and deploys the result to GitHub Pages. |

## Format and compile everything locally

> OUTDATED!, will update later
