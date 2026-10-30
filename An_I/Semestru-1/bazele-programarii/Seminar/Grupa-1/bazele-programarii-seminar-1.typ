#import "template.typ": *
#show: conf
#title[Seminar 1: Reprezentarea in sisteme de calcul]
#align(center)[
  _
  Informație vs. Data \
  Entropie informațională - tipuri de informație \
  Sisteme de numerațe - Conversii \
  _
]
#divider()
== Informația
_
- Noțiune primară, de bază
- atribut al materiei
_

#let colors = (maroon, olive, eastern)
#align(center)[
  #diagram(
    edge-stroke: 1pt,
    node-stroke: 1pt,
    node-corner-radius: 5pt,
    node((0, 0), [Date de intrare \ (input)]),
    edge("-|>"),
    node((1, 0), align(center)[Sistem de calcul \ \ Memorie, Procesor]),
    edge("-|>"),
    node((2, 0), [Date de ieșire \ (output)], shape: fletcher.shapes.hexagon),
  )\
  Sistem de calcul: orice formă inteligentă de sistems
]

== Calculatorul
#columns(2)[
  #align(center)[
    #diagram(
      edge-stroke: 1pt,
      node-stroke: 1pt,
      node-corner-radius: 5pt,
      node-shape: shapes.rect,
      node((2, 0), [Procesor]),
      node((3, 1), [Unitate de\ Control]),
      node((1, 1), [Unitate\ Logica\ Aritmetica]),
      edge((2, 0), (3, 1)),
      edge((2, 0), (1, 1)),
    )]
  #colbreak()
  #align(center)[
    #diagram(
      edge-stroke: 1pt,
      node-stroke: 1pt,
      node-corner-radius: 5pt,
      node-shape: shapes.rect,
      node((2, 0), [Memorie]),
      node((1, 1), [Principală\ _permanentă\ dar înceată_]),
      node((3, 1), [Cache\ _rapidă \ dar temporară_]),
      edge((2, 0), (3, 1)),
      edge((2, 0), (1, 1)),
    )]
]
== Entropia informațională
- Măsură a gradului de nedeterminare
- $tilde$nr. maxim de stări ale unui sistem
*Pe n biți se pot reprezenta $2^n$ valori:\ *
#place(
  bottom,
  table(
    columns: 3,
    align: center + horizon,
    table.header[*Dec*][*Binary*][*Hex*],
    ..range(16)
      .map(n => {
        let bin = str(n, base: 2)
        (str(n), "0" * (4 - bin.len()) + bin, upper(str(n, base: 16)))
      })
      .flatten(),
  ),
)

