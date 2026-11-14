#import "/template.typ": *
#show: conf

#set document(date: datetime(day: 20, month: 10, year: 2026))
#title[Curs 3: Continuare curs 2]
\ \

#theorem()[
  (Criteriul Raabe-Duhamel)\

  Fie $sum_(n gt.eq 0) a_n$ serie cu termeni pozitivi.

  + Dacă $(exists) lambda>1 "și" n_0 in NN: display(n(a_n / a_(n-1) - 1))>= lambda$ atunci $display(sum_(n gt.eq 0)) a_n$ convergent.

  + Dacă $(exists) n_0 in NN: display(n(a_n / a_(n-1) - 1))<= 1 " " forall n>= n_0$ atunci $display(sum_(n gt.eq 0)) a_n$ divergent.
]

Practic:
$
  sum_(n gt.eq 0) a_n "s.t.p, calculăm" lambda=lim_(n->infinity) n(a_n / a_(n-1) -1)
$
#[#set enum(numbering: "I)")
  + Dacă $lambda > 1$, convergent
  + Dacă $lambda < 1$, divergent
  + Dacă $lambda = 1$, *criteriul nu decide*
]

*Exemplu*\
Seria armonică: $display(sum_(n>=1) 1/n^alpha), alpha in RR$\

$display(lambda=limits(lim)_(n->infinity) n(a_n / a_(n-1) -1))$

#remark[
  $
    limits(lim)_(n->infinity) a_(n+1) / a_n = 1 -> "criteriul raportului nu decide"
  $
]
$
  lambda &= limits(lim)_(n->infinity) n[(n+1)^2 / n^2 -1]=limits(lim)_(n->infinity) n[(n+1/n)^2 - 1]
$
#remark[$A=e^(ln A), A>0$]
#pagebreak()
$
  lambda = limits(lim)_(n->infinity) n [e^ln((n+1)/n)^2 - 1]=\
  =limits(lim)_(n->infinity) cancel(n) undershell([e^(overshell((2ln(1+1/n)), ->0)-1)]/(2ln(1+1/n)), ->1) dot.op undershell((2ln(1+1/n))/(1/n), ->1) dot.op 1/cancel(n)
$
#[#set enum(numbering: "I)")
  + $lambda=alpha>1 ->$ convergent
  + $lambda=alpha<1 ->$ divergent
  + $lambda=alpha=1 => limits(sum)_(n>=1) 1/n ->$ divergent
]

= Diferențiale

Fie $f:I->RR, I subset RR "și" x_0 in I$
#definition()[\
  Spunem că $f$ este *diferențiabilă* în $x_0$ dacă există $A in RR$ și o funcție $alpha:I->RR$ continuă și nulă în $x_0$ a.î.
  $
    f(x)-f(x_0)=A*(x-x_0)+alpha(x)*(x-x_0), forall x in I
  $

  Dacă $f$ este diferențiabilă în $forall x in I$, atunci spunem că $f$ este diferențiabilă pe $I$
]
#callout("Propoziție", position: "first")[
  $f$ diferențiabilă în $x_0 <=> f$ derivabilă în $x_0$
]
#proof(position: "last")[
  - "$=>$" Considerăm că $f$ este diferențiabilă în $x_0$\

    $=> f(x)-f(x_0)=A*(x-x_0)+alpha(x)*(x-x_0), forall x in I$\

    $alpha$ continuă și nulă în $x_0 (alpha(x_0)=0)$\

    $(f(x)-f(x_0))/(x-x_0)=A+alpha(x) =>$\

    $limits(lim)_(x->x_0) (f(x)-f(x_0))/(x-x_0) = limits(lim)_(x->x_0)(A+alpha(x))=A+alpha(x)=A+0=A$

  - "$arrow.double.l$" Considerăm $f$ derivabilă în $x_0 =>$\

    $(exists) underparen(limits(lim)_(x->x_0)(f(x)-f(x_0))/(x-x_0), A) in RR$

    Fie $alpha:I->RR, alpha(x)=display(cases((f(x)-f(x_0))/(x-x_0)-f'(x_0)\, &x eq.not x_0, 0\, &x=x_0))$\

    $alpha$ continuă în $x_0=> f(x)-f(x_0)=f'(x_0)(x-x_0)+alpha(x)(x-x_0), x eq.not x_0$\
    $=> f$ diferențiabilă.
]

#remark()[
  Pentru $x$ suficient de apropriat de $x_0$ se poate considera aproximativ:
  $
    f(x)-f'(x_0) approx f'(x_0)(x-x_0)\
    f(x) approx f(x_0) + f'(x_0)(x-x_0)
  $
]

#definition()[
  Funcția liniară $h->f'(x_0)dot.op h, h=x-x_0$ definită pentru $(forall)h in RR$ se numește *diferențiala* funcției $f$ în punctul $x_0$ și se notează\
  $"df"(x_0)=f'(x_0) dot.op h = f'(x_0)*(x-x_0)$\

  Se observă că pentru $f(x)=x$ se obține $"d"x=h$
]

*Exemplu:*
$f:RR -> RR, f(x)=x^2+2x-1, x_0=5$\
$f'(x) = 2x+2, f'(5)=12$\
$"df"(x)=12(x-5)$

#remark()[
  Dacă $f$ este diferențiabilă pe $I$ atunci $"df"(x)=f'(x)"d"x, x in I$
]

#remark()[
  Regulile demonstrate pentru derivate se păstrează și pentru diferențiale:

  + $"d"(f+g)(x)="d"f(x)+"d"g(x)$

  + $"d"(f dot.op g)(x)="d"f(x)dot.op g(x) + f(x) dot.op "d"g(x)$

  + $display("d"(f/g)(x)= ("d"f(x) dot.op g(x) - f(x) dot.op "d"g(x))/(g^2(x))\, g(x) eq.not 0)$

  + $"d"(alpha f(x)) = alpha "d"f(x), alpha in RR$

  + $"d"(f compose g)(x)= f'(g(x)) dot.op "d"g(x)$
]

= Formula lui Taylor
\
#definition[
  Fie $f:I -> RR$ derivabilă de $n+1$ ori pe $I$ și $x_0 in I$. Definim polinomul:
  $
    ("Tn"f)(x) = f(x_0) + (x-x_0)/(1!) f'(x_0) + (x-x_0)^2/(2!) f''(x_0) + dots + (x-x_0)^n/(n!)f^((n))(x_0)
  $

  Polinomul Tn$f$ se numește polinomul lui Taylor de gradul n atașat pe funcției $f$ în punctul $x_0$.

  *Notație:* $("Rn"f)(x)=f(x) - ("Tn"f)(x), x in I$
]
#definition()[
  Egalitatea $f(x)=("Tn"f)(x) + ("Rn"f)(x)$ se numește formula lui Taylor de ordinul $n$, iar $("Rn"f)(x)$ se numește restul de ordin $n$ al formulei lui Taylor.
]
#theorem()[
  În condițiile de mai sus există\
  $
    c in (x_0,x) "sau" in (x,x_0):\
    f(x)=f(x_0)+ (x-x_0)/(1!) dot.op f'(x_0) + dots + (x-x_0)^n/(n!)f^((n))(x_0) + (x-x_0)/((n+1)!) f^((n+1))(c)
  $
]

*Aplicație*\
+ $f in undershell(e^2(I), " funcții care admit derivate"), x_0 in I$\
  $
    f(x)=f(x_0)+(x-x_0)/(1!)f'(x_0) + (x-x_0)^2/(2!)f''(c), c in (x_0,x)
  $
  Dacă $display(f''(x)>=0 => (x-x_0)/(2!)f''(c)>=0 => f(x)>=f(x_0)+(x-x_0)f'(x_0)\, forall x in I)$
