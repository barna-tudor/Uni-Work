#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#set text(
  lang: "ro",
  size: 12pt,
)
#set page(
  paper: "a4",
  margin: 8.5mm,
  header: none,
  numbering: "1 / 1",
)
#set heading(
  numbering: "1.1",
)

#show title: set align(center)
#title[Reprezentarea in sisteme de calcul]
#align(center)[
  _
  Informație vs. Data \
  Entropie informațională - tipuri de informație \
  Sisteme de numerațe - Conversii \
  _
]
#divider()
= Informația
_
- Noțiune primară, de bază
- atribut al materiei
_

#let colors = (maroon, olive, eastern)
#diagram(
  edge-stroke: 1pt,
  node-stroke: 1pt,
  node-corner-radius: 5pt,
  node((0, 0), [Date de intrare \ (input)]),
  edge((0, 0), (2, 0), "-|>"),
  node((2, 0), align(center)[Sistem de calcul \ \ Memorie, Procesor]),
  edge((2, 0), (4, 0), "-|>"),
  node((4, 0), [Date de ieșire \ (output)], shape: fletcher.shapes.hexagon),
)

Sistem de calcul: orice formă inteligentă de sistem

#set columns(2)

#colbreak()
