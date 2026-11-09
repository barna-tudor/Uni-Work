#let labeled-list(label, ..items) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.5em,
  label, list(..items),
)

#let labeled-numbered-list(label, ..items) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.5em,
  label, enum(..items),
)

#let accent = rgb("#a684ff")
#let callout-tints = (
  "Teoremă": blue.lighten(30%),
  "Demonstrație": aqua,
  "Observație": fuchsia,
  "Atenție": red,
  "Exemplu": green,
  "Definiție": purple.lighten(30%),
)
#let callout(
  tint: auto,
  position: "single", // "single" | "first" | "middle" | "last"
  ..args,
) = {
  assert(position in ("single", "first", "middle", "last"))
  assert(
    args.named().len() == 0,
    message: "callout: unexpected named arguments",
  )
  let pos = args.pos()
  assert(
    pos.len() in (1, 2),
    message: "callout: expected [body] or (title)[body]",
  )
  let (title, body) = if pos.len() == 2 { pos } else {
    ("Observație", pos.first())
  }

  let tint = if tint != auto {
    tint
  } else if type(title) == str {
    callout-tints.at(title, default: accent)
  } else {
    accent
  }

  let joined-above = position in ("middle", "last")
  let joined-below = position in ("first", "middle")
  let r = 5pt

  block(
    width: 100%,
    fill: tint.lighten(88%),
    stroke: (left: 3pt + tint, right: 1pt + tint),
    inset: 10pt,
    radius: (
      top-right: if joined-above { 0pt } else { r },
      bottom-right: if joined-below { 0pt } else { r },
    ),
    breakable: false,
    above: if joined-above { 0pt } else { auto },
    below: if joined-below { 0pt } else { auto },
    [*#title.* #body],
  )
}
#let theorem = callout.with("Teoremă")
#let proof = callout.with("Demonstrație")
#let remark = callout.with("Observație")
#let warning = callout.with("Atenție")
#let example = callout.with("Exemplu")
#let definition = callout.with("Definiție")

// cursed template workaround to make all-in-one possible while keeping each seminar note individually compile-able if desired
#let aio = sys.inputs.at("aio", default: "false") == "true"
#let base(doc) = {
  set text(
    lang: "ro",
    size: 14pt,
    font: "New Computer Modern",
  )
  set page(
    paper: "a4",
    header: none,
    numbering: "1 / 1",
  )
  show title: set align(center)
  doc
}
// children keep using `#show: conf`; it becomes a no-op in all-in-one mode
#let conf(doc) = if aio { doc } else { base(doc) }

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes
