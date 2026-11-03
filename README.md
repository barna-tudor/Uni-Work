# Uni-Work

University coursework (ULBS), written in [Typst](https://typst.app/) and organized by year and semester.

## Repository layout

```
.
├── An_I/
│   └── Semestru-1/     # Year 1, semester 1 coursework
├── template.typ        # Shared document template
├── Typst-Demo.typ      # Example document using the template
└── .gitignore
```

Files are grouped as `An_<year>/Semestru-<n>/<course>/`. Documents import the shared template via a root-relative path (e.g. `#import "../../../template.typ": *`), which is why every compile command below passes `--root` pointing at the repository root.

## Requirements

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
cargo install typstyle               # any platform with Rust
# Windows / Linux: download a binary from
# https://github.com/typstyle-rs/typstyle/releases
```

Verify:

```sh
typst --version
typstyle --version
```

## Usage

Run all commands from the repository root.

Compile one file:

```sh
typst compile --root . path/to/file.typ
```

Format one file in place, or check formatting without modifying it:

```sh
typstyle --inplace path/to/file.typ # format
typstyle --check path/to/file.typ # check formatting
```

## Format and compile everything

Each snippet below recursively formats (for the purpose of contributing) and then compiles every `.typ` file under the current directory, using the current directory as the Typst root. A failure on one file is reported and does not stop the rest.

> Compiling every `.typ` file includes `template.typ`, which produces its own PDF. Skip it if you don't want that.

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

macOS uses zsh by default, and the function above works unchanged (BSD `find` supports `-print0`). Add it to `~/.zshrc`, then reload:

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
- Compiled PDFs are written next to their source files.