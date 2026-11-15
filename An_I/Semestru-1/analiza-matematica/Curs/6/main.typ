#import "/template.typ": *
#show: conf

#set document(date: datetime(day: 10, month: 11, year: 2026))
#title[Curs 6: Funcții reale de mai multe variabile. Limită. Continuitate.]

= Funcții reale de mai multe variabile
\
Fie $I_1,I_2,dots,I_n$ intervale din $RR$.

#definition[
  Fie produsul cartezian
  $
    I = I_1 times I_2 times dots times I_n = {(x_1,x_2,dots,x_n) | x_i in I_i, i = overline(1\,n)}
  $
  Dacă $I_k, k = overline(1\, n)$ sunt intervale deschise (respectiv mărginite), atunci I se numește interval $n$-dimensional deschis (respectiv mărginit).
]

*Exemplu*

+ $I=underparen((-1,2], I_1) times underparen([-2,3), I_2)$

+ $I=(0; 2) times (0; 3) times (0; 4)$
//TODO: add graphs for 1 and 2

Fie $(RR^n,norm(dot.op)), norm(x)=display(sqrt(sum_(k=1)^n x_k^2))$

#definition[\
  Se numește sferă (bilă) deschisă cu centrul în $a in RR^n$ și rază $r>0$ mulțimea\
  $S(a,r) = {x in RR^n | norm(x-a) < r}$.\
  Se numește sferă (bilă) închisă cu centrul în $a in RR^n$ și rază $r>0$ mulțimea\
  $overline(S)(a,r) = {x in RR^n | norm(x-a) <= r}$.
]
#remark[
  Orice sferă cu centrul în $a$ conține un interval deschis $n$-dimensional care conține pe $a$ și, reciproc:\
  Orice interval deschis $n$-dimensional care conține pe $a$ conține o sferă deschisă cu centrul în $a$.
]

#definition()[
  Se numește vecinătate a unui punct $a in RR^n$ orice mulțime $V subset.eq RR^n$ pentru care există $r>0$ astfel încât $S(a,r) subset.eq V$.
]

#definition[
  O mulțime $G subset.eq RR^n$ se numește deschisă dacă este vecinătate pentru orice punct al său;
  $G$ este închisă dacă complementara sa în $RR^n$ este deschisă.
]
#definition[
  Un punct $a in RR^n$ este punct de acumulare pentru o mulțime $E subset.eq RR^n$ dacă orice vecinătate $V$ a lui $a$ conține puncte din $E$ diferite de $a$

  *Notații*:
  - $V_a$ -- familia tuturor vecinătăților ale punctului $a$
  - $E'$ -- mulțimea tuturor punctelor de acumulare ale lui $E$
]
#definition[
  O funcție $f:E->RR, E subset.eq RR^n,$ se numește funcție reală de $n$ variabile reale.
]

*Exemple:*
//TODO:
+
+
+

#block(breakable: false)[
  #remark(position: "first")[
    Graficul unei funcții $f:E->RR, E subset.eq RR^2$ este o suprafață în spațiu:
    $
      (S):cases(z=f(x,y), (x,y)in E)
    $
  ]
  #example(position: "last")[
    //TODO:
  ]
]

#pagebreak()
= Operații
Fie $f,g:E->RR, E subset.eq RR^n$
#[
  #set enum(numbering: "a)")
  + $(f+g)(x)=f(x)+g(x), forall x in E$
  + $(alpha f)(x)=alpha dot.op f(x), forall x in E$
  + $(f dot.op g)(x)=f(x) dot.op g(x), forall x in E$
]

#definition[
  O funcție $f:E->RR, E subset.eq RR^n$ este "mărginită" pe $E$ dacă:
  $
    (exists) M > 0 : |f(x)|<=M, forall x in E
  $
]
*Exemple*
+
+
#pagebreak()
= Limita unei funcții într-un punct

Fie $f:E->RR, E subset.eq RR^n$ și $x^o$ un punct de acumulare a lui $E$
#definition[
  Spunem că $f$ are limita $l in RR$ în punctul $x^o$ dacă:
  $
    forall U in V_l, exists v in V_x "a.î." f(x)in U, forall x in (U\\{x^o})inter E
  $

  *Notație:* $l=limits(lim)_(x->x^o) f(x)$
]

#theorem[
  În condițiile de mai sus sunt echivalente următoarele:
  + $display(limits(lim)_(x->x^o) f(x) = l)$

  + $display(forall epsilon > 0\, exists delta_epsilon > 0 "a.î." forall x in E "cu" norm(x-x^o)<delta_epsilon "să avem" |f(x)-l|<epsilon)$

  + Pentru orice șir $(x_n)$ de puncte din $E$ cu $x_n eq.not x^o, forall n$ care converge către $x^o$, avem $display(limits(lim)_(n->infinity) f(x_n) = l)$
]
*Exemple:*\

#remarks[
  - Limita unei funcții într-un punct e *unică*.
  - Cănd se deteremină limita unei funcții într-un punct, se consideră șiruri convergente către acest punct și se compară valoarea acestora prin $f$
]

#pagebreak()
= Funcții continue

Fie $f:E -> RR, E subset.eq RR^n, x^o in E$
#definition[
  Spunem că funcția $f$ este *continuă* în $x^o$ dacă:
  $
    forall V in V_(f(x^o)), exists U in V_(x^o) "a.î." forall x in V inter E, f(x) in V
  $

  Dacă $f$ continuă în orice punct din $E$, atunci spunem că $f$ continuă pe $E$
]

#theorem[
  Următoarele afirmații sunt echivalente:
  + $f$ este continuă în $x^o$

  + $forall epsilon > 0, exists delta_epsilon >0 "a.î." forall x in E "cu" norm(x-x^o)<delta_epsilon, |f(x)-f(x^o)|<epsilon$

  + $forall (x_n), x_n in E, forall n in NN "cu proprietatea că" limits(lim)_(n->infinity) x_n = x^o => limits(lim)_(n->infinity) f(x_n) = f(x^o)$
]

*Exemple*

