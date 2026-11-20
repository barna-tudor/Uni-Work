#set page(paper: "a4", flipped: true, margin: 8.5mm)
// --- Input data ---
// incline length (mm)
#let d = 305
// x (mm), 14 values
#let xs = (
  170,
  190,
  198,
  205,
  145,
  140,
  145,
  167,
  145,
  160,
  150,
  155,
  170,
  153,
)

// --- Calculations ---
#let n = xs.len()
#let PHIs = xs.map(x => calc.asin(x / d))
#let mus = PHIs.map(phi => calc.tan(phi))
#let mu_avg = mus.sum() / n
#let delta_i = mus.map(m => m - mu_avg)
#let delta_avg = delta_i.map(calc.abs).sum() / n
#let eps_i = mus.map(it => (delta_avg * 100) / it)
#let r(v, k: 4) = str(calc.round(v, digits: k))



// --- Table ---
#figure(
  table(
    columns: 8,
    inset: 10pt,
    align: center + horizon,
    table.header(
      [Nr. crt.],
      [$x$ (mm)],
      [$display(phi = arcsin(x/d) (degree))$],
      [$display(mu = tan(phi))$],
      [$display(overline(mu) = (sum_i mu_i)/N)$],
      [$display(Delta_i = mu - overline(mu))$],
      [$display(Delta = (sum_i |Delta_i|)/N)$],
      [$display(epsilon = Delta / mu)$ (%)],
    ),
    ..range(n)
      .map(i => {
        let spans = if i == 0 {
          (table.cell(rowspan: n)[#r(mu_avg)],)
        } else { () }
        let spans2 = if i == 0 {
          (table.cell(rowspan: n)[#r(delta_avg)],)
        } else { () }
        (
          [#(i + 1)],
          [#xs.at(i)],
          [#r(calc.asin(xs.at(i) / d).deg(), k: 2)],
          [#r(mus.at(i))],
          ..spans,
          [#r(delta_i.at(i))],
          ..spans2,
          [#r(eps_i.at(i), k: 2)],
        )
      })
      .flatten(),
  ),
  caption: [Determinarea coeficientului de frecare la alunecare, Cretă pe Lemn],
)

#let xs = (
  89,
  155,
  135,
  95,
  90,
  105,
  115,
  89,
  97,
  85,
  135,
  115,
  85,
  95,
)

// --- Calculations ---
#let n = xs.len()
#let PHIs = xs.map(x => calc.asin(x / d))
#let mus = PHIs.map(phi => calc.tan(phi))
#let mu_avg = mus.sum() / n
#let delta_i = mus.map(m => m - mu_avg)
#let delta_avg = delta_i.map(calc.abs).sum() / n
#let eps_i = mus.map(it => (delta_avg * 100) / it)
#let r(v, k: 4) = str(calc.round(v, digits: k))



// --- Table ---
#figure(
  table(
    columns: 8,
    inset: 10pt,
    align: center + horizon,
    table.header(
      [Nr. crt.],
      [$x$ (mm)],
      [$display(phi = arcsin(x/d) (degree))$],
      [$display(mu = tan(phi))$],
      [$display(overline(mu) = (sum_i mu_i)/N)$],
      [$display(Delta_i = mu - overline(mu))$],
      [$display(Delta = (sum_i |Delta_i|)/N)$],
      [$display(epsilon = Delta / mu)$ (%)],
    ),
    ..range(n)
      .map(i => {
        let spans = if i == 0 {
          (table.cell(rowspan: n)[#r(mu_avg)],)
        } else { () }
        let spans2 = if i == 0 {
          (table.cell(rowspan: n)[#r(delta_avg)],)
        } else { () }
        (
          [#(i + 1)],
          [#xs.at(i)],
          [#r(calc.asin(xs.at(i) / d).deg(), k: 2)],
          [#r(mus.at(i))],
          ..spans,
          [#r(delta_i.at(i))],
          ..spans2,
          [#r(eps_i.at(i), k: 2)],
        )
      })
      .flatten(),
  ),
  caption: [Determinarea coeficientului de frecare la alunecare, Metal pe Lemn],
)
