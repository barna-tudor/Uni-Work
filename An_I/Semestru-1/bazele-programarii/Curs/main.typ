// TODO: Drawings, possibly using raw CetZ / a library using it (circuiteria)
// SVGS based on https://github.com/chris-pikul/electronic-symbols
#import "@preview/circuiteria:0.2.1": (
  circuit, element, gates, util as circutil, wire,
)
#import "@preview/cetz:0.5.3": *

#import "/template.typ": *
#show: conf

#title()[Bazele programării calculatoarelor]
= Curs 1
= Curs 2
= Curs 3
= Curs 4
= Curs 5 - Structuri logice digitale și combinaționale
== Transistorul - un comutator (întrerupător digital)
- identic cu un robinet sau întrerupător electric
- comută între izolator și conductor
- dacă e închis, comutatorul conduce curentul între $A$ și $B$
- depinde de tensiunea de poartă $G$ (de pe intrarea circuitului)

#figure(caption: "", numbering: none)[
  #image(
    bytes(
      ```svg
      <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150">
        <g fill="none" stroke="#000" stroke-miterlimit="10" stroke-width="5">
          <circle cx="37.5" cy="75" r="6.25"/>
          <path d="M0 74.94h31.25"/>
          <circle cx="112.5" cy="75" r="6.25"/>
          <path d="M150 75.06h-31.25m-75-3.31L102 36.5"/>
        </g>
        <text xml:space="preserve" x="1" y="66.5" stroke-width="0" font-family="Noto Sans JP" font-size="24">A</text>
        <text xml:space="preserve" x="132.541" y="66.791" stroke-width="0" font-family="Noto Sans JP" font-size="24">B</text>
        <text xml:space="preserve" x="90.25" y="23" stroke-width="0" font-family="Noto Sans JP" font-size="24">G</text>
      </svg>
      ```.text,
    ),
  )
]

== Transistor CMOS
(CMOS: "Complementar Metal Oxide Semiconductor")

- Circuit standard pentru aplicații digitale;
- două tipuri: N (negativ) și P (pozitiv)
- tranzistorii N și P operează în mod invers
#columns(2)[
  #figure(numbering: none, caption: "Transistor N")[#image(
    bytes(
      ```svg
      <?xml version="1.0" encoding="UTF-8"?>
      <svg width="150" height="150" viewBox="0 0 150 150" xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink">
          <g class="drawing-elements">
              <g fill="none" stroke="#000" stroke-miterlimit="10" stroke-width="5">
                  <path d="M0 75h50m12.5-31.25v62.5M99.66 0v56.25H62.5M99.66 150V93.75H62.5M50 50v50" />
              </g>
          </g>
      </svg>
      ```.text,
    ),
    height: 50pt,
  )]
  #colbreak()
  #figure(numbering: none, caption: "Transistor P")[#image(
    bytes(
      ```svg
      <?xml version="1.0" encoding="UTF-8"?>
      <svg width="150" height="150" viewBox="0 0 150 150" xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink">
          <g class="drawing-elements">
              <g fill="none" stroke="#000" stroke-miterlimit="10" stroke-width="5">

                  <path d="M0 75h31.25M62.5 43.75v62.5M99.66 0v56.25H62.5M99.66 150V93.75H62.5M50 50v50" />
                  <circle cx="37.5" cy="75" r="6.25" />
              </g>
          </g>
      </svg>
      ```.text,
    ),
    height: 50pt,
  )]
]

== Circuitul inversor / NOT
#grid(columns: (1fr, 2.5fr))[
  #image(bytes(
    ```svg
        <svg xmlns="http://www.w3.org/2000/svg" width="200pt" height="200pt" font-family="sans-serif"
        font-size="24">
        <g fill="none" stroke="#000" stroke-width="2">
            <path
                d="M141.394 25.5h26.74m-24.557 200h22.686M155 25.5v45h-15v30h15v50h-15v30h15v45m0-100h50m-72-56v32m0 48v32m-7.4-96H98v80h35m-35-40H53" />
            <circle cx="129.1" cy="85.5" r="3.5" />
            <path stroke-width="2.3" d="M140 144.7V188m0-124.7v43.3" />
            <g fill="#000">
                <text xml:space="preserve" x="144.094" y="15.595" font-size="5.333" />
                <text xml:space="preserve" x="150.643" y="246.082" font-family="Sans" font-size="16"
                    style="line-height:.6" />
            </g>
        </g>
        <circle cx="155" cy="225.5" r="2.5" />
        <circle cx="155" cy="125.5" r="2.5" />
        <circle cx="98" cy="125.5" r="2.5" />
        <circle cx="155" cy="25.5" r="2.5" />
        <text x="49.1" y="132.9" text-anchor="end">In</text>
        <text x="218.1" y="133.6">Out</text>
        <text xml:space="preserve" font-family="Sans" font-size="16"
            style="line-height:.6;shape-inside:url(#rect10);shape-padding:.0779727;white-space:pre"
            transform="translate(-11.228 2.183)"><tspan x="146.043" y="18.833">2.9V </tspan></text>
        <text xml:space="preserve" font-family="Sans" font-size="16"
            style="line-height:.6;shape-inside:url(#rect10-1);shape-padding:.0779727;white-space:pre"
            transform="translate(-2.741 223.136)"><tspan x="146.043" y="18.833">0V </tspan></text>
    </svg>
    ```.text,
  ))
][#align(horizon)[
  - Când intrarea este în 1 logic (In = high voltage), P-Deschis, N-închis, a.î. ieșirea în 0 logic (Out = low voltage)
  - Și invers.
]]

== Poarta SAU negat (NOR)
#table(
  align: center + horizon,
  columns: 3,
  rows: 5,
  table.header[A][B][Out],
  [0], [0], [1],
  [0], [1], [0],
  [1], [0], [0],
  [1], [1], [0],
)
//TODO: Schema

== Poarta SAU (OR) este NOR urmat de inversor

== Notații
$A + B = C -> "C = A OR B"$\
$A dot.op B = C -> "C = A AND B"$\
$A xor B = C -> "C = A XOR B"$

== Reprezentarea funcțiilor logice

== Decodificator
- Dacă are n intrări $=>2^n$ ieșiri
- ieșirea este 1 $<=>$ valoarea binară a intrării codficată pe n-biți este 1
- în orice moment, exact o ieșire este 1 și restul 0

== Multiplexor (MUX)
- în general, un MUX are
  - $2^n$ intrări de date
  - n intrări (linii) de selecție
  - 1 ieșire
- se comportă ca un selector de canale
*Exemplu*\
4-to-1 MUX:
#grid(
  columns: 2,
  gutter: 1em,
)[
  #circuit({
    element.multiplexer(
      x: 0,
      y: 0,
      w: 2,
      h: 4,
      id: "multiplexer1",
      entries: 4,
      fill: circutil.colors.purple,
    )
    wire.stub("multiplexer1-port-out", "east", name: "out")
    wire.stub("multiplexer1.north", "north", name: "S[1:0]")

    for i in range(4) {
      wire.stub("multiplexer1-port-in" + str(i), "west", name: "ABCD".at(i))
    }
  })
][#align(
  horizon,
)[Out ia una din valorile A, B, C, D, dacă val. lui S sunt (00, 01, 10, 00):\
  Out =\ $A dot.op overline(S_0) dot.op overline(S_1) + B dot.op overline(S_0) dot.op S_1 + C dot.op S_0 dot.op overline(S_1) + D dot.op S_0 dot.op S_1$
]]
#grid(
  columns: 2,
  gutter: 1em,
)[
  #circuit({
    element.multiplexer(
      x: 0,
      y: 0,
      w: 1,
      h: 2,
      id: "multiplexer2",
      entries: 2,
      fill: circutil.colors.orange,
    )
    wire.stub("multiplexer2-port-out", "east", name: "out")
    wire.stub("multiplexer2.north", "north", name: "S")

    for i in range(2) {
      wire.stub("multiplexer2-port-in" + str(i), "west", name: "AB".at(i))
    }
  })
][#align(horizon)[
  Out = $A dot.op overline(S) + B dot.op S$
]]
== Sumator
#grid(columns: 2)[
  #labeled-list([*Semi-sumator*])[2 intrări][2 ieșiri: sumă și\ transport]
  $
    C = A dot.op B
  $
  $
    S = A xor B = overline(A)B + A overline(B)
  $
][
  #figure(
    caption: "Tabel de adevăr a semisumatorului",
    numbering: none,
  )[
    #table(
      align: center + horizon,
      columns: 4,
      rows: 5,
      stroke: none,
      table.header("A", "B", "C", "S"),
      table.vline(x: 2, stroke: 1.6pt),
      table.hline(y: 1, stroke: 1pt),
      [0], [0], [0], [0],
      [0], [1], [0], [1],
      [1], [0], [0], [1],
      [1], [1], [1], [0],
    )
  ]

]
#grid(columns: 2)[
  *Sumator complet*
  - realizează suma pe coloana $i$
  - 3 intrări: $a_i, b_i, c_i$
  - 2 ieșiri: $S_i, C_(i+1)$
  - $C_i$ = transportul de la bitul de pe poziția $i-1$
  - $C_(i+1)$ = transportul de la bitul de pe poziția $i$
  $
    S_i=A_i xor B_i xor C_i
  $
  $
    C_(i+1)=A_i dot.op B_i + C_i dot.op (A_i + B_i)
  $
][
  #figure(
    numbering: none,
    caption: "Tabel de adevăr al sumatorului complet",
  )[
    #table(
      align: center + horizon,
      columns: 5,
      rows: 9,
      stroke: none,
      table.header([A], [B], [C#sub[i]], [C#sub[i+1]], [S#sub[i]]),
      table.vline(x: 3, stroke: 1.6pt),
      table.hline(y: 1, stroke: 1pt),
      [0], [0], [0], [0], [0],
      [0], [0], [1], [0], [1],
      [0], [1], [0], [0], [1],
      [0], [1], [1], [1], [0],
      [1], [0], [0], [0], [1],
      [1], [0], [1], [1], [0],
      [1], [1], [0], [1], [0],
      [1], [1], [1], [1], [1],
    )
  ]
]
