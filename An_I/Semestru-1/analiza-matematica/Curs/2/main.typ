#import "/template.typ": *
#show: conf

#title[Curs 2: Serii de numere reale (numerice)]
\ \
Fie $(a_n)$ un șir de numere reale. Construim șirul $(S_n)$ unde $S_n=display(sum_(k=0)^n a_k)$

#definition()[
  Se numește *serie* de termeni generali $a_n$ perechea de șiruri $a_n,S_n, n in NN$ și se notează
  $
    sum_(n gt.eq 0) a_n "sau" sum_(n in NN) a_n " sau" sum_(n gt.eq 0)^infinity a_n
  $
]

#remarks[
  + $a_n$ se numește "termenul general" al seriei

  + $(S_n)$ se numește șirul sumelor parțiale atașat seriei $limits(sum)_(n gt.eq 0) a_n$

  + limita finită sau infinită a șirului $(S_n)$ se numește *suma seriei*:
    $
      sum_(n gt.eq 0) a_n = l = limits(lim)_(n->infinity)S_n
    $

  + Dacă $l = limits(lim)_(n->infinity) S_n in RR ("finită"),$ atunci seria este convergentă.\
    În caz contrar ($l = plus.minus infinity$ *sau nu există*), seria este divergentă
]
*Exemplu*\
+ $display(sum_(n gt.eq 0) (1/((n+1)(n+3))))$\
  $
    (S_n), S_n = sum_(k=0)^n a_k = sum_(k=0)^n 1/((k+1)(k+3))= 1/2 sum_(k=0)^n (1/(k+1)-1/(k+3))=\
    = 1/2 (1/1 + 1/2 - 1/(n+2) - 1/(n+3))
  $
  $=> display(limits(lim)_(n->infinity)S_n = 3/4 => sum a_n =3/4)$, convergent

+ $display(sum_(n gt.eq 0)ln((n+1)/n))$\

  $S_n=sum_(k=1)^n a_k&=ln(2/1)+ln(3/2)+dots\
  &= ln((n+1)/1) = ln(n+1)$\

  $limits(lim)_(n->infinity) S_n = infinity -->$ divergent.
#pagebreak()
+ $display(sum_(n gt.eq 0) (-1)^n -> S_n=sum_(k=0) (-1)^k)$\

  seria geometrică

  $a_n=q_n^n$
