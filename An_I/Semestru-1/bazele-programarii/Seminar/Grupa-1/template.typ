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

#let conf(doc) = {
  set text(
    lang: "ro",
    size: 12pt,
  )
  set page(
    paper: "a4",
    margin: 8.5mm,
    header: none,
    numbering: "1 / 1",
  )
  set heading(
    numbering: none,
  )
  show title: set align(center)
  doc
}
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes
