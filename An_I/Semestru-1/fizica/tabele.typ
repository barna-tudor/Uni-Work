// Compile:  typst compile tables.typ      Live preview:  typst watch tables.typ
// Global setup

#set page(paper: "a4", flipped: true, margin: 8.5mm)
#set text(lang: "ro", size: 12pt)
#let banded(header-rows: 1) = (_, y) => {
  if y < header-rows { luma(230) } else if calc.odd(y - header-rows) {
    luma(240)
  }
}
#set table(
  inset: (x: 5pt, y: 5pt), // cell padding
  stroke: 0.5pt + luma(110), // grid lines
  fill: banded(), // default: shade the first row
)

#grid(
  columns: (1.7fr, 1fr, 1fr),
  // relative widths
  column-gutter: 8mm,

  stack(
    dir: ttb,
    spacing: 4mm,
    table(
      columns: (1fr, 0.7fr, 0.9fr, 1fr),
      align: center + horizon,
      table.header([*Denumire*], [*Simbol mărime*], [*Simbol dimensiune*], [*Unitate*]),
      [Lungime], [$l$], [$upright(L)$], [metru #box[– m]],
      [Timp], [$t$], [$upright(T)$], [secundă #box[– s]],
      [Masă], [$m$], [$upright(M)$], [kilogram #box[– kg]],
      [Intensitatea curentului electric], [$I$], [$upright(I)$], [amper #box[– A]],

      [Temperatura absolută], [$T$], [$upright(theta)$], [kelvin #box[– K]],
      [Cantitate de substanță], [$n$], [$upright(N)$], [mol #box[– mol]],
      [Intensitatea radiată a fluxului de lumină], [$I_v$], [$upright(J)$], [candelă #box[– cd]],
    ),
    table(
      columns: (2fr, 0.8fr, 1.8fr, 1.5fr),
      fill: banded(header-rows: 2),
      align: center + horizon,
      table.header(
        table.cell(colspan: 4, align: center)[*Constante utile*],
        [*Constantă*], [*Simbol*], [*Valoare*], [*U.M.*],
      ),
      [Pi], [$upright(pi)$], [$3.141592653"..."$], [$dash.em$],

      [Numărul lui Euler], [$e$], [$2.718281828"..."$], [$dash.em$],

      [Viteza luminii în vid], [$upright(c)$], [$~2.998 times 10^8$], [$"ms"^(-1)$],

      [Numărul lui Avogadro], [$upright(N_A)$], [$~6.022 times 10^(23)$], [$"mol"^(-1)$],

      [Accelerația gravitațională], [$upright(g)$], [$~9.81$], [$"ms"^(-2)$],
    ),
  ),
  {
    let rows = (
      ([yotta-], [Y-], 24),
      ([zetta-], [Z-], 21),
      ([exa-], [E-], 18),
      ([peta-], [P-], 15),
      ([tera-], [T-], 12),
      ([giga-], [G-], 9),
      ([mega-], [M-], 6),
      ([kilo-], [k-], 3),
      ([hecto-], [h-], 2),
      ([deca-], [da-], 1),
      ([deci-], [d-], -1),
      ([centi-], [c-], -2),
      ([mili-], [m-], -3),
      ([micro-], [$upright(mu)$-], -6),
      ([nano-], [n-], -9),
      ([pico-], [p-], -12),
      ([femto-], [f-], -15),
      ([atto-], [a-], -18),
      ([zepto-], [z-], -21),
      ([yocto-], [y-], -24),
    )
    table(
      columns: (1fr, 1fr, 1fr),
      align: (x, _) => (right, center, center).at(x) + horizon,
      fill: banded(header-rows: 2),
      table.header(
        table.cell(colspan: 2, align: center + horizon)[*Prefix*],
        // horizontal merge
        table.cell(rowspan: 2, align: center + horizon)[*Factor*],
        // vertical merge
        [*Nume*], [*Simbol*],
      ),
      ..rows.map(((name, sym, exp)) => (name, sym, $10^#exp$)).flatten(),
      table.hline(y: 12, stroke: 1.2pt + luma(60)),
    )
  },
  {
    let letters = (
      ([alfa], [α], [Α]),
      ([beta], [β], [Β]),
      ([gama], [γ], [Γ]),
      ([delta], [δ], [Δ]),
      ([epsilon], [ε], [Ε]),
      ([zeta], [ζ], [Ζ]),
      ([eta], [η], [Η]),
      ([teta], [θ], [Θ]),
      ([iota], [ι], [Ι]),
      ([capa], [κ], [Κ]),
      ([lambda], [λ], [Λ]),
      ([mi], [μ], [Μ]),
      ([ni], [ν], [Ν]),
      ([csi], [ξ], [Ξ]),
      ([omicron], [ο], [Ο]),
      ([pi], [π], [Π]),
      ([ro], [ρ], [Ρ]),
      ([sigma], [σ], [Σ]),
      ([tau], [τ], [Τ]),
      ([ipsilon], [υ], [Υ]),
      ([fi], [φ], [Φ]),
      ([hi], [χ], [Χ]),
      ([psi], [ψ], [Ψ]),
      ([omega], [ω], [Ω]),
    )
    table(
      columns: (auto,) * 3,
      align: center + horizon,
      table.header([*Nume*], [*Literă mică*], [*Literă mare*]),
      ..letters
        .map(((name, lower, upper)) => (
          name,
          text(1.2em, lower),
          text(1.2em, upper),
        ))
        .flatten(),
    )
  },
)
