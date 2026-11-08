# Uni-Work

University coursework (ULBS), organized by year and semester. Most documents are written in [Typst](https://typst.app/); some courses also contain code / files for their respective coursework.
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
├── template.typ        # Shared document template
├── Typst-Demo.typ      # Demo of Typst Features
└── .gitignore
```

Files are grouped as `An_<year>/Semestru-<n>/<course>/{Curs/Lab/Seminar}`.

### Conventions

- Each publishable document has an entry point named `main.typ`. A document may consist of several files (chapters, helpers) as long as `main.typ` imports them.
- Documents import the shared template with a root-relative path (e.g. `#import "/template.typ": *`). This is why every compile command passes `--root` pointing at the repository root.
- Run `typstyle` before opening a pull request (see below).

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

Verify:

```sh
typst --version
typstyle --version
```

CI pins a specific typstyle version (`TYPSTYLE_VERSION` in `.github/workflows/format.yml`). **Use the same version locally**.

For Subjects with lab-work:
`TBD`

## CI
| Workflow | Trigger | Description |
| --- | --- | --- |
| `format.yml` | Pull requests that touch `.typ` files | Runs `typstyle --check <file>`, fails on non-formatted files |
| `pdfs.yml` | Manual only (for now) | Compiles every `main.typ`, generates an index page, and deploys the result to GitHub Pages. |

## Format and compile everything locally

Each snippet below formats and then compiles every `.typ` file under the current directory, using the current directory as the Typst root. A failure on one file is reported and does not stop the rest.

> This compiles every `.typ` file, including ones that are only imported by others (such as `template.typ`), so extra PDFs may appear. They are not published; CI only builds `main.typ` files.

### Bash / zsh (Linux)

Add to `~/.bashrc` or `~/.zshrc`:

```bash
typst-compile-all() {
  local root="$PWD" file
  while IFS= read -r -d '' file; do
    echo "Formatting $file"
    typstyle --inplace "$file" || echo "Format failed: $file" >&2
    echo "Compiling $file"
    typst compile --root "$root" "$file" || echo "Compile failed: $file" >&2
  done < <(find . -type f -name '*.typ' -print0)
}
```

### macOS

macOS uses zsh by default, the function above works unchanged. Add it to `~/.zshrc`, then reload:

```sh
source ~/.zshrc
```

### Windows (PowerShell)

Open your profile with `notepad $PROFILE` (create it first with `New-Item -Force $PROFILE` if it doesn't exist) and add:

```powershell
function typst-compile-all {
    $root = $PWD.Path
    Get-ChildItem -Path . -Recurse -File -Include *.typ | ForEach-Object {
        $file = $_.FullName

        Write-Host "Formatting $file"
        typstyle --inplace $file
        if ($LASTEXITCODE -ne 0) { [Console]::Error.WriteLine("Format failed: $file") }

        Write-Host "Compiling $file"
        typst compile --root $root $file
        if ($LASTEXITCODE -ne 0) { [Console]::Error.WriteLine("Compile failed: $file") }
    }
}
```

Reload with `. $PROFILE`.

### Fish

Save as `~/.config/fish/functions/typst-compile-all.fish`:

```fish
function typst-compile-all --description "Format and compile every .typ file under the current directory"
    set -l root $PWD

    find . -type f -name '*.typ' -print0 | while read -lz file
        echo "Formatting $file"
        typstyle --inplace "$file"; or echo "Format failed: $file" >&2
        echo "Compiling $file"
        typst compile --root "$root" "$file"; or echo "Compile failed: $file" >&2
    end
end
```

## Notes

- `--root` must contain every file being compiled and every file those files import. Running from the repository root satisfies both.
- Locally compiled PDFs are written next to their source files. E.g `/An-1/Semestru-1/Bazele/Seminar/seminar-1.typ` compiles to `An-1/Semestru-1/Bazele/Seminar/seminar-1.pdf`
