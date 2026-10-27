// =============================================================================
//  Typst feature showcase: one self-contained file
//  Written against the Typst 0.15.x docs (typst.app/docs, 0.15.1).
//  Compile:  typst compile typst-showcase.typ
//  Needs:    Typst >= 0.15. Bundled fonts only, no external files, no packages.
//
//  "LaTeX difficulty" scale (a subjective rating for an experienced LaTeX user
//  who wants the same result):
//    1 = trivial / built in             2 = easy, maybe one common package
//    3 = doable, a few packages         4 = fiddly, heavy packages or low-level TeX
//    5 = painful, needs another toolchain or deep TeX/Lua hacking
// =============================================================================


// -- Shared building blocks -------------------------------------------------
#let accent = rgb("#a684ff")

// Shows a snippet next to its live result. The snippet is run through `eval`,
// so the displayed source and the rendered output cannot drift apart (DRY).
// Note: eval'd code only sees the standard library, not the variables above.
#let demo(src) = block(breakable: false, grid(
  columns: (1fr, 1fr),
  column-gutter: 8pt,
  block(width: 100%, fill: luma(246), inset: 8pt, radius: 3pt, src),
  block(
    width: 100%,
    stroke: 0.5pt + luma(190),
    inset: 8pt,
    radius: 3pt,
    eval(src.text, mode: "markup"),
  ),
))


// -- Document metadata, page, global styling --------------------------------
// LaTeX difficulty: 2/5
//   geometry (margins) + fancyhdr (header/footer) + hyperref (PDF title/keywords).
//   "Page X of Y" additionally needs lastpage. A running chapter title in the
//   header needs \markboth/\leftmark gymnastics. Here it is a `query` (see the Context section).
#set document(
  title: "Typst 0.15 Feature Showcase",
  keywords: ("typst", "showcase", "latex comparison"),
)
#set page(
  paper: "a4",
  margin: (x: 2.2cm, top: 2.6cm, bottom: 2.4cm),
  numbering: "1 / 1", // a pattern with two numbers shows "page / total pages"
  header: context {
    if counter(page).get().first() > 1 {
      let chapters = query(heading.where(level: 1).before(here()))
      set text(size: 9pt, fill: luma(110))
      grid(
        columns: (1fr, auto),
        [Typst 0.15 showcase], if chapters.len() > 0 { chapters.last().body },
      )
    }
  },
)
#set text(lang: "en", size: 10.5pt)
#set par(justify: true, leading: 0.62em, spacing: 1.1em)
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

// Show-set rules: restyle one element without rewriting it (see the Set and show rules section).
#show heading.where(level: 1): set text(size: 15pt, fill: accent)
#show heading: set block(above: 1.5em, below: 0.9em)
#show figure.caption: set text(size: 9pt)
#show figure.where(kind: table): set figure.caption(position: top)
#show link: set text(fill: accent)

// `title` is a real element (not just big text) and is picked up by tooling.
#title[Typst 0.15 Feature Showcase]
#align(center)[
  One file that exercises most of Typst, annotated with how hard each feature is
  in LaTeX. \
  (Compiled on #datetime.today().display("[year]-[month]-[day]"))
]

#outline(depth: 2)

// `divider` is new in 0.15: a semantic thematic break that templates can restyle.
// LaTeX difficulty: 3/5. \hrulefill or \rule is easy, but a *semantic* break that
// one `\renewcommand` restyles everywhere means defining your own macro first.
#divider()


// -- Lightweight markup -----------------------------------------------------
= Lightweight markup <sec:markup>
// LaTeX difficulty: 1/5
//   Everything here exists in LaTeX (\textbf, \emph, \underline, itemize, ...).
//   Typst only needs fewer keystrokes. Every `#name` is a plain function call.
#demo(```typ
*Strong*, _emphasis_, `inline raw`, #underline[underline], #strike[strike],
#highlight[highlight], #smallcaps[Small Caps], x#super[2], H#sub[2]O.
Smart "quotes", an en-dash 1--2, an em-dash---like this, an ellipsis...
A non-breaking~space, a bare link https://typst.app and a
#link("https://typst.app/docs")[named link].
```)

#demo(```typ
She left without a word.
#divider()
Three days later, she returned.
```)


// -- Paragraphs, fonts, languages -------------------------------------------
= Paragraphs, fonts and languages
// LaTeX difficulty: 3/5
//   Paragraph tweaks are easy (\parindent, setspace, microtype). Arbitrary system
//   fonts need XeLaTeX/LuaLaTeX + fontspec, and per-language hyphenation and quotes
//   need babel/polyglossia + csquotes. Typst: one `text`/`par` call, always on.
//   New in 0.15: variable fonts (`text(variations: ...)`), no LaTeX equivalent
//   short of font-specific fontspec tricks.
#demo(```typ
#set par(first-line-indent: (amount: 1.5em, all: true))
#lorem(24)
```)

#demo(```typ
#set par(hanging-indent: 1.5em)
#lorem(20)
```)

#demo(```typ
#text(font: "New Computer Modern", size: 13pt)[Computer Modern, 13 pt.] \
#text(font: "DejaVu Sans Mono", size: 9pt)[Monospace, 9 pt.] \
#text(tracking: 2pt)[Tracked out] and #text(weight: "bold", style: "italic")[bold italic] \
#text(lang: "de")[Deutsche "Anführungszeichen" passen sich der Sprache an.] \
#text(fill: gradient.linear(red, blue))[Gradient-filled text]
```)


// -- Lists ------------------------------------------------------------------
= Lists
// LaTeX difficulty: 2/5
//   itemize/enumerate/description are easy; custom labels and start values need
//   enumitem. Typst lists are plain syntax (`-`, `+`, `/ Term:`) styled by `set`.
#demo(```typ
- Bullets nest by indentation
  - like this
+ Numbered lists use `+`
+ and renumber themselves

#set enum(numbering: "a)", start: 3)
+ Custom numbering and start value
+ from a single `set` rule

/ Term: A description-list entry.
/ Another: No extra environment needed.
```)


// -- Mathematics ------------------------------------------------------------
= Mathematics <sec:math>
// LaTeX difficulty: 1/5
//   LaTeX is the gold standard here. Typst needs less syntax (no backslashes,
//   `sum_(k=1)^n`, `mat(1, 2; 3, 4)`), and equation numbering plus references work
//   out of the box (`<label>` / `@label` instead of amsmath's \label / \eqref).
Euler's identity $e^(i pi) + 1 = 0$ sits inline. The Gaussian integral is
displayed and numbered:

$ integral_(-infinity)^infinity e^(-x^2) dif x = sqrt(pi) $ <eq:gauss>

Aligned multi-line equations use `&` and `\`; @eq:gauss above and @eq:binomial
below are referenced by label:

$
  (a + b)^2 & = a^2 + 2 a b + b^2 \
  (a - b)^2 & = a^2 - 2 a b + b^2
$ <eq:binomial>

Matrices, vectors and piecewise definitions:

$
  A = mat(1, 2; 3, 4), quad
  bold(x) = vec(x_1, x_2), quad
  A bold(x) = vec(x_1 + 2 x_2, 3 x_1 + 4 x_2)
$

$
  f(x) := cases(
    x^2 "if" x >= 0,
    -x "otherwise"
  )
$

Operators, limits, accents and annotations:

$
  lim_(n -> infinity) (1 + 1/n)^n = e, quad
  op("argmin", limits: #true)_(theta in RR) L(theta), quad
  sum_(k=0)^n binom(n, k) = 2^n
$

$
  hat(x), tilde(y), arrow(v), overline(A union B),
  underbrace(1 + 2 + 3, "six"), cancel(x)
$

// Math macros are ordinary functions (in LaTeX: \newcommand or \DeclareMathOperator).
#let expect(x) = $bb(E) (#x)$
$ expect(X^2) >= expect(X)^2 $


// -- Figures, tables, references --------------------------------------------
= Figures, tables and references <sec:figures>
// LaTeX difficulty: 2/5 for figures and labels (graphicx, \caption, \label/\ref,
//   cleveref for automatic "Figure 3" names). In Typst `@label` picks the right
//   supplement ("Figure", "Table", "Section", "Equation") by itself.
//   Footnotes: 1/5 in both systems.
// An SVG kept inline so this file stays self-contained.
// With a file on disk you would write: image("logo.svg", width: 3cm)
#let logo = ```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <rect width="100" height="100" rx="14" fill="#0a6c8f"/>
  <path d="M25 70 L50 22 L75 70 Z" fill="white"/>
  <circle cx="50" cy="58" r="8" fill="#0a6c8f"/>
</svg>
```.text

#figure(
  image(bytes(logo), format: "svg", width: 3.2cm),
  caption: [An SVG embedded from bytes.],
) <fig:logo>

@fig:logo is an image figure; the table in @tbl:sales follows in the next
subsection, and @sec:math covered the maths.#footnote[Footnotes are
  numbered and placed automatically.]

== Tables
// LaTeX difficulty: 4/5
//   Rules need booktabs, merged cells need multirow/\multicolumn, zebra stripes need
//   xcolor+colortbl, flexible column widths need tabularx/array, and the data
//   would be typed by hand. Typst has one `table` with `table.cell(colspan:)`,
//   `table.hline`, `fill`/`stroke` as functions of (column, row), and header repeat.
#let sales = (
  ("North", 120, 135),
  ("South", 98, 110),
  ("East", 143, 150),
  ("West", 87, 92),
)
#let total = sales.map(((_, q1, q2)) => q1 + q2).sum()

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (left, right, right, right),
    inset: (x: 8pt, y: 5pt),
    stroke: (_, y) => if y == 0 { (top: 1pt, bottom: 0.5pt) },
    fill: (_, y) => if y > 0 and calc.even(y) { luma(245) },
    table.header[*Region*][*Q1*][*Q2*][*Total*],
    ..sales.map(((region, q1, q2)) => (region, str(q1), str(q2), str(q1 + q2))).flatten(),
    table.hline(stroke: 0.5pt),
    table.cell(colspan: 3, align: right)[*Grand total*],
    [*#total*],
    table.hline(stroke: 1pt),
  ),
  caption: [Quarterly sales (generated from an array).],
) <tbl:sales>

== Quotes
// LaTeX difficulty: 1/5 (quote environment, csquotes for attribution).
#quote(block: true, attribution: [Anonymous])[
  Make it work, then make it right, then make it fast.
]


// -- Layout -----------------------------------------------------------------
= Layout primitives
// LaTeX difficulty: 3/5
//   minipage, multicol, tabular, \hfill, \makebox, \dotfill and tikz overlays cover
//   this, but each lives in a different package with its own syntax. Typst has
//   `grid`, `stack`, `columns`, `box`, `block`, `place`, `align`, `pad`, `h`/`v`
//   and `repeat` with one consistent parameter vocabulary.
#grid(
  columns: (1fr, 2fr, 1fr),
  gutter: 6pt,
  rect(width: 100%, fill: accent.lighten(70%))[1fr],
  rect(width: 100%, fill: accent.lighten(50%))[2fr],
  rect(width: 100%, fill: accent.lighten(70%))[1fr],
)

#v(6pt)
#columns(2, gutter: 1.5em)[
  #lorem(40)
  #colbreak()
  #lorem(24)
]

#v(6pt)
#stack(
  dir: ltr,
  spacing: 6pt,
  ..range(5).map(i => square(size: 14pt + i * 4pt, fill: accent.lighten(i * 15%))),
)

#v(6pt)
// Dot leaders, as in a table of contents (LaTeX: \dotfill, difficulty 2/5).
Introduction #box(width: 1fr, repeat[.]) 3 \
Methods #box(width: 1fr, repeat[.]) 17

#v(6pt)
// Absolute positioning inside a container (LaTeX: textpos / tikz overlay, 4/5).
#block(width: 100%, height: 3cm, stroke: 0.5pt + gray, inset: 6pt)[
  Normal flow starts at the top left.
  #place(bottom + right)[Placed bottom right]
  #place(
    center + horizon,
    rotate(-12deg, text(size: 22pt, weight: "bold", fill: luma(205))[DRAFT]),
  )
]


// -- Transforms and graphics ------------------------------------------------
= Transforms and graphics
// LaTeX difficulty: 4/5
//   \rotatebox/\scalebox (graphicx) are easy, but vector graphics mean TikZ/PGF, a
//   language of its own. Gradients and tilings need pgf shadings/patterns, and
//   colour maps such as viridis need extra packages. Typst has all of this built in.
#box(rotate(-6deg, reflow: true)[Rotated])
#h(8pt)
#box(scale(x: 150%, reflow: true)[Scaled])
#h(8pt)
#box(skew(ax: -12deg)[Skewed])
#h(8pt)
#box(move(dy: -3pt)[Moved])

#v(6pt)
#grid(
  columns: 4,
  gutter: 14pt,
  align: horizon,
  circle(radius: 18pt, fill: gradient.radial(white, accent)),
  polygon.regular(
    size: 40pt,
    vertices: 5,
    fill: gradient.linear(..color.map.viridis, angle: 45deg),
  ),
  curve(
    fill: accent.lighten(80%),
    stroke: accent,
    curve.move((0pt, 40pt)),
    curve.line((80pt, 40pt)),
    curve.cubic(none, (70pt, 0pt), (40pt, 0pt)),
    curve.close(),
  ),
  rect(
    width: 60pt,
    height: 40pt,
    radius: 6pt,
    fill: tiling(size: (10pt, 10pt))[
      #place(line(start: (0%, 100%), end: (100%, 0%), stroke: accent))
    ],
  ),
)

#v(6pt)
// Colour handling: rotate hues, lighten, mix, gradients from built-in colour maps.
#range(8).map(i => box(width: 1cm, height: 6mm, fill: accent.rotate(i * 45deg))).join(h(2pt))
#v(2pt)
#rect(width: 100%, height: 8mm, fill: gradient.linear(..color.map.turbo))
#line(length: 100%, stroke: (paint: accent, thickness: 1.5pt, dash: "dashed"))


// -- Scripting --------------------------------------------------------------
= Scripting <sec:scripting>
// LaTeX difficulty: 5/5
//   Programming in LaTeX means TeX macros, expl3, or LuaLaTeX. Typst is a real
//   language: first-class functions, closures, arrays, dictionaries, destructuring,
//   string/regex methods, modules (`import`), and the result is ordinary content.

== Functions and collections
#let fib(n) = if n < 2 { n } else { fib(n - 1) + fib(n - 2) }
#let squares = range(1, 9).map(n => n * n)

- Squares: #squares.map(str).join(", ")
- Fibonacci: #range(12).map(fib).map(str).join(", ")
- Sum of squares: #squares.sum(); mean: #calc.round(squares.sum() / squares.len(), digits: 2)
- Roman numeral for 14: #numbering("I", 14); letter for 3: #numbering("a", 3)

// Named arguments with defaults; the last positional parameter receives the
// trailing content block, so `callout[...]` reads like an environment.
#let callout(title: "Note", tint: accent, body) = block(
  width: 100%,
  fill: tint.lighten(88%),
  stroke: (left: 3pt + tint, right: 1pt + tint),
  inset: 10pt,
  radius: (right: 5pt),
  [*#title.* #body],
)
#callout[A trailing content block becomes `body`.]
#callout(title: "Warning", tint: orange)[Same function, different arguments.]
#pagebreak()

== Dictionaries, loops, destructuring
#let planets = (mercury: 0.39, venus: 0.72, earth: 1.00, mars: 1.52) // AU
#table(
  columns: 2,
  table.header[*Planet*][*Distance from the Sun*],
  ..planets.pairs().map(((name, au)) => (upper(name.first()) + name.slice(1), [#au AU])).flatten(),
)

#{
  let (first, ..rest) = (10, 20, 30)
  [Destructuring: first = #first, rest = #rest.]
}

Strings and regex: #"2026-10-22".replace(regex("-"), "/"), and
#"typst".clusters().rev().join() is "typst" reversed.


// -- Set and show rules ----------------------------------------------------
= Set and show rules <sec:styling>
// LaTeX difficulty: 5/5
//   Restyling *every* occurrence of an element means \renewcommand, \let hacks,
//   titlesec, etoolbox patches or environment redefinitions. In Typst, `set` changes
//   defaults, `show` rewrites how an element or text pattern renders, and both are
//   scoped by the surrounding block, so they cannot leak.
#demo(```typ
#show "Typst": it => text(fill: red, weight: "bold", it)
#show regex("\\d+"): set text(fill: blue)
#show strong: set text(fill: purple)
Typst compiles in about 42 ms, and *strong* text is recoloured.
```)

// A template is a function applied with `show: fancy.with(..)`. It can set, show
// and wrap the whole body. Here it is scoped to one block.
#let fancy(tint: accent, body) = {
  show strong: set text(fill: tint)
  show emph: set text(fill: tint.darken(25%))
  body
}
#[
  #show: fancy.with(tint: maroon)
  A *template* is a function used as `show: fancy.with(..)`. It restyles _this
  block only_; the rest of the document is untouched.
]

// Code blocks with line numbers by showing the synthesized `raw.line` element.
// LaTeX difficulty: 4/5 (listings or minted + options; minted needs Python and
// --shell-escape).
#[
  #show raw.line: it => {
    box(width: 1.4em, align(right, text(fill: gray, size: 0.85em, str(it.number))))
    h(0.7em)
    it.body
  }
  ```python
  def greet(name):
      return f"Hello, {name}!"

  print(greet("Typst"))
  ```
]


// -- Introspection: context, counters, state, queries ----------------------
= Context, counters, state, queries <sec:introspection>
// LaTeX difficulty: 4/5 overall (details per item below).
//   LaTeX gets this from multi-pass .aux files and hand-written macros. Typst
//   re-runs layout until the values converge, and `context` marks code that reads
//   "where am I" information (and may therefore differ at each location).

== Counters
// LaTeX difficulty: 3/5 (\newcounter, \stepcounter, \arabic: fine for simple cases).
#let exercise = counter("exercise")
#let ex(body) = block(
  width: 100%,
  stroke: 0.5pt + luma(180),
  inset: 8pt,
  radius: 3pt,
  {
    exercise.step()
    [*Exercise #context exercise.display().* #body]
  },
)
#ex[Show that $sum_(k=1)^n k = n (n + 1) / 2$.]
#ex[State the analogous result for $sum_(k=1)^n k^2$.]

== State
// LaTeX difficulty: 5/5 (global macro mutation that survives \edef, grouping and
// multiple passes; packages like etoolbox/zref help, but it is easy to get wrong).
#let budget = state("budget", 100)
#budget.update(b => b - 30)
#budget.update(b => b - 25)
#context [Remaining budget: #budget.get() units.]

== Queries and measuring
// LaTeX difficulty: 5/5 for query (hand-rolled via .aux/\write), 4/5 for measuring
// (\settowidth, \settoheight, but not for arbitrary content in the middle of layout).
#context {
  let tops = query(heading.where(level: 1))
  [This document has #tops.len() top-level sections:
    #{ tops.map(h => h.body).join([, ]) }. You are on page #here().page() of
    #counter(page).final().first().]
}

#context [The word "Typst" is #measure[Typst].width wide at the current font size.]

#layout(size => [The width available at this point is
  #calc.round(size.width.pt(), digits: 1) pt.])


// -- Data loading ----------------------------------------------------------
= Data loading
// LaTeX difficulty: 4/5
//   CSV is workable with csvsimple, datatool or pgfplotstable. JSON/YAML/TOML/XML
//   basically need LuaLaTeX or an external preprocessing script. Typst has `csv`,
//   `json`, `yaml`, `toml`, `xml`, `cbor` and `read`, whose results are plain values.
// The data is embedded as bytes to keep this file self-contained. Normally:
//   csv("scores.csv"), json("config.json")
#let scores = csv(bytes(
  ```csv
  name,score
  Ada,95
  Alan,88
  Grace,92
  ```.text,
))
#let score-rows = scores.slice(1) // drop the header row
#let mean = score-rows.map(r => float(r.at(1))).sum() / score-rows.len()

#table(
  columns: (1fr, auto),
  table.header[*Name*][*Score*],
  ..score-rows.flatten(),
)
Mean score: #calc.round(mean, digits: 1).

#let config = json(bytes(
  ```json
  { "title": "Quarterly report", "tags": ["draft", "internal"], "pages": 12 }
  ```.text,
))
Loaded from JSON: "#config.title", #config.pages pages, tags: #config.tags.join(", ").


// -- Citations and bibliography --------------------------------------------
= Citations and bibliography
// LaTeX difficulty: 2/5
//   biblatex or natbib + a .bib file + a separate bibtex/biber run (latexmk hides
//   it). Typst reads .bib or Hayagriva YAML directly in one compile pass and ships
//   many CSL styles. 0.15 adds several bibliographies per document.
// The bibliography is embedded as YAML bytes to stay single-file. Normally:
//   #bibliography("refs.bib")
#let refs = bytes(
  ```yaml
  knuth84:
    type: Book
    title: The TeXbook
    author: Knuth, Donald E.
    date: 1984
    publisher: Addison-Wesley
  lamport94:
    type: Book
    title: "LaTeX: A Document Preparation System"
    author: Lamport, Leslie
    date: 1994
    publisher: Addison-Wesley
  ```.text,
)

Two classic typesetting books are @knuth84 and @lamport94. Prose-style citations
are possible too: #cite(<knuth84>, form: "prose") wrote about TeX itself.


// -- Export targets and ecosystem ------------------------------------------
= Export targets and ecosystem
// LaTeX difficulty, per item:
//   - Millisecond recompiles and live preview (`typst watch`): 4/5. latexmk -pvc
//     is the closest thing, at seconds per cycle on larger documents.
//   - PDF/A and PDF/UA (tagged, accessible PDFs) via `--pdf-standard`: 4/5.
//   - HTML export (experimental, behind a feature flag): 5/5 (LaTeXML, tex4ht).
//   - Bundle export (several output files from one project, experimental): 5/5.
//   - PNG/SVG export of pages: 2/5 (pdftoppm, dvisvgm).
//   - Packages: `#import "@preview/<name>:<version>": ..` downloads from Typst
//     Universe on first use: 3/5 (tlmgr/CTAN are fine until versions clash).
// Not used here, so that this file compiles offline with no extra packages.
Typst exports PDF (including archival and accessible PDF standards), PNG and
SVG, and, experimentally, HTML and multi-file bundles. Everything above was
produced from this single `.typ` file.

#bibliography(refs, style: "springer-basic")
