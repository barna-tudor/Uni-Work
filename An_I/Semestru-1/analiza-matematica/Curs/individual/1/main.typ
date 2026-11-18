#import "/template.typ": *
#show: conf

#title[Curs 1: Șiruri de numere reale]

= Șiruri
#definition()[\
  O funcție $f:RR->RR, f(n) = a_n$\
  *Notație:* $(a_n) \/ (a_n)_(n in NN) \/ (a_n)_(n gt.eq.slant 0)$\
  $a_n =$ termenul de rang $n$\
  $(a_n): a_0, a_1, dots$
]
De exemplu, $a_n=n^2+1-sqrt(n)$

== Clase de șiruri

=== Șiruri monotone:

Un șir $(a_n)$ este crescător (strict) $<=>a_(n+1)gt.eq a_n ("sau" a_(n+1) gt a_n) forall n$\
Similar, descrescător (strict) $<=>a_(n+1)lt.eq a_n ("sau" a_(n+1) lt a_n) forall n$
==== Diferență finită de ordin I
$Delta a_n = a_(n+1) - a_n$\

Dacă $Delta a_n display(
  cases(
    > 0 &-> "crescător",
    <= 0 &-> "descrescător",
  )
)$

==== Diferență finită de ordin II
$Delta^2 a_n &= Delta (Delta a_n)= Delta(a_(n+1) - a_n)\
&= a_(n+2)-a_(n+1) - a_(n+1) + a_n\
&= a_(n+2)+a_n$  \


Dacă $Delta^2 a_n display(
  cases(
    >= 0 &-> "convex",
    <= 0 &-> "concav",
  )
)$\

*Exemple*\
+ $a_n=sqrt(n+2)-sqrt(n+1) = 1/(sqrt(n+2)+sqrt(n+1)) => a_n>a_(n+1)$\

  $a_n = display(cases(1 \, n=0, 2 \, n=1, 1/n \, n>1))=>$ nici > nici <
+ $a_n=2^n -> "convex"$
#pagebreak()
=== Șiruri mărginite
Un șir real este mărginit dacă există $alpha, beta in RR$ a. î. $alpha<= a_n <=beta forall n in NN$

Fie $A={a_n | n in NN} -> (a_n) "mărginit" <=> A "mărginit"$

*Exemple*\
+ $a_n = display(1/(n+1)) --> 0<a_n<=1$

+ $a_n=sum_(k=1)^n 1/n --> 1<a_n$\ prin Lagrange, $a_n>log(x)=>$ nemărginit superior

+ $a_n = display(3^n/n!)$
