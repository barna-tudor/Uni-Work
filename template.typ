// template workaround to make all-in-one possible while keeping each seminar note individually compile-able

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
#let callout(title: "Observație", tint: accent, body) = block(
  width: 100%,
  fill: tint.lighten(88%),
  stroke: (left: 3pt + tint, right: 1pt + tint),
  inset: 10pt,
  radius: (right: 5pt),
  [*#title.* #body],
)

#let conf(doc) = {
  set text(
    lang: "ro",
    size: 14pt,
    font: "New Computer Modern",
  )
  set page(
    paper: "a4",
    margin: 8.5mm,
    header: none,
    numbering: "1 / 1",
  )
  show title: set align(center)
  doc
}
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes
