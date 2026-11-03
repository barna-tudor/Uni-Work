#import "../../../../template.typ": *
#show: conf
#show heading.where(level: 2): set heading(
  numbering: (..nums) => numbering("I)", nums.pos().last()),
)

#title[Analiza Matematica - An 1, sem 1]

= Curs 1
#pagebreak()
= Curs 2
#pagebreak()
= Curs 5
#pagebreak()
= Curs 4
#title[Spații metrice; Șiruri în spații metrice;\ Teorema punctului fix (Banach)]
== Spații metrice.
Fie $X eq.not emptyset$
#callout(title: "Definiție")[
  Se numește metrică (distanță) pe X o aplicație $d:X times X arrow RR$ care verifică\
  + $d(x,y) >= 0,forall x,y in X, "cu egalitatea" x=y$
  + $d(x,y) = d(y,x),forall x,y in X$
  + $d(x,y) <= d(x,z)+d(z,y),forall x,y,z in RR$\
  $(X,d)$ se numește *Spațiu metric*
]
#callout(title: "Observație", tint: orange)[
  $forall X eq.not emptyset$, se poate defini o metrică discretă prin:
  $
    d:X times X arrow RR, d(x,y)=cases(1"," x eq.not y, 0"," x eq y)
  $
]
=== Exemple:
+ $X = RR, d:RR times RR arrow RR; d(x,y)=abs(x-y)$
+ $X = CC, d:CC times CC arrow RR, d(z_1,z_2)=abs(z_1-z_2)$
+ $X=RR^n, d:RR^n times RR^n arrow RR, d(x,y)=sqrt(sum_(k=1)^(n)(x_k-y_k)^2)$\ $x=(x_1,x_2,dots,x_n), y=(y_1,y_2,dots,y_n)$
+ $A eq.not emptyset, M(A)={f | f:arrow RR}, f "mărginită"$\
  $d:M(A) times M(A) arrow RR$\
  $d(f,y)=limits(sup)_(x in A)|f(x)-g(x)|)$
#callout(title: "Definiție")[
  Fie $X$ un spațiu vectorial peste $RR$. O aplicație $D:norm(dot.op):RR arrow RR$ se numește "normă" dacă:\
  + $norm(x)>=0, forall x in RR, "cu" x=overline(0)$
  + $norm(lambda x) = abs(lambda) dot.op norm(x), forall x, lambda in RR$
  + $norm(x+y)<= norm(x)+norm(y)$\
  $(X,norm(dot.op))$ se numește spațiu vectorial "normat"
]
#pagebreak()
== Șiruri în spațiu metric
Fie $(X,d)$ un spațiu metric.
#callout(title: "Definiție")[
  Spunem că un șir $(x_n)_(n>=0)$ din $X$ este _convergent la $a$_ dacă
  $ forall epsilon>0, exists n_epsilon: forall n>n_epsilon, d(x_n,a)<epsilon $
  $limits(lim)_(n arrow infinity)x_n=a$
]
#callout(tint: orange)[
  $ limits(lim)_(n arrow infinity)x_n=a <=> limits(lim)_(n arrow infinity)d(x_n,a)=0 $
]
#callout(tint: orange)[\
  Limita $a$ a unui șir este *unică*.\ (Demonstrat prin reducere a absurd)
]
#callout(title: "Definiție")[
  Un șir $(x_n)_(n>=0)$ din spațiul metric $(X,d)$ se numește "șir fundamental" / "Cauchy" dacă
  $ forall n>0, exists n_epsilon: forall n>n_epsilon, p in NN\ d(x_(n+p),x_n) < epsilon $
]
#callout(title: "Teoremă", tint: purple)[\
  Orice șir convergent dintr-un spațiu metric este fundamental.\
  *(Reciproca nu este adevărată)*
]
Demonstrație:
// TODO:

#pagebreak()
= Curs 5
#pagebreak()
= Curs 6
#pagebreak()
= Curs 7
#pagebreak()
= Curs 8
#pagebreak()
= Curs 9
#pagebreak()
= Curs 10
#pagebreak()
= Curs 11
#pagebreak()
= Curs 12
#pagebreak()
= Curs 13
#pagebreak()
