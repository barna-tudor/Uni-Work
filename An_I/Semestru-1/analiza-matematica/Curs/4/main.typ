#import "/template.typ": *
#show: conf

#title[Curs 5: Spații metrice; Șiruri în spații metrice;\ Teorema punctului fix (Banach)]
= Spații metrice.

Fie $X eq.not emptyset$
#definition(position: "first")[
  Se numește metrică (distanță) pe X o aplicație $d:X times X arrow RR$ care verifică\
  + $d(x,y) >= 0,forall x,y in X, "cu egalitatea" x=y$
  + $d(x,y) = d(y,x),forall x,y in X$
  + $d(x,y) <= d(x,z)+d(z,y),forall x,y,z in RR$\
  $(X,d)$ se numește *Spațiu metric*
]
#remark(position: "last")[
  $forall X eq.not emptyset$, se poate defini o metrică discretă prin:
  $
    d:X times X arrow RR, d(x,y)=cases(1"," x eq.not y, 0"," x eq y)
  $
]
*Exemple:*
+ $X = RR, d:RR times RR arrow RR; d(x,y)=abs(x-y)$
+ $X = CC, d:CC times CC arrow RR, d(z_1,z_2)=abs(z_1-z_2)$
+ $X=RR^n, d:RR^n times RR^n arrow RR, d(x,y)=sqrt(sum_(k=1)^(n)(x_k-y_k)^2)$\ $x=(x_1,x_2,dots,x_n), y=(y_1,y_2,dots,y_n)$
+ $A eq.not emptyset, M(A)={f | f:arrow RR}, f "mărginită"$\
  $d:M(A) times M(A) arrow RR$\
  $d(f,y)=limits(sup)_(x in A)|f(x)-g(x)|)$
#definition[
  Fie $X$ un spațiu vectorial peste $RR$. O aplicație $D:norm(dot.op):RR arrow RR$ se numește "normă" dacă:\
  + $norm(x)>=0, forall x in RR, "cu" x=overline(0)$
  + $norm(lambda x) = abs(lambda) dot.op norm(x), forall x, lambda in RR$
  + $norm(x+y)<= norm(x)+norm(y)$
  $(X,norm(dot.op))$ se numește spațiu vectorial "normat"
]
#pagebreak()
= Șiruri în spațiu metric
Fie $(X,d)$ un spațiu metric.
#definition(position: "first")[
  Spunem că un șir $(x_n)_(n>=0)$ din $X$ este _convergent la $a$_ dacă
  $ forall epsilon>0, exists n_epsilon: forall n>n_epsilon, d(x_n,a)<epsilon $
  $limits(lim)_(n arrow infinity)x_n=a$
]
#remark(position: "middle")[
  $
    limits(lim)_(n arrow infinity)x_n=a <=> limits(lim)_(n arrow infinity)d(x_n,a)=0
  $
]
#remark(position: "last")[\
  Limita $a$ a unui șir este *unică*.\ (Demonstrat prin reducere a absurd)
]
#definition[
  Un șir $(x_n)_(n>=0)$ din spațiul metric $(X,d)$ se numește "șir fundamental" / "Cauchy" dacă
  $
    forall n>0, exists n_epsilon: forall n>n_epsilon, p in NN\ d(x_(n+p),x_n) < epsilon
  $
]
#block(breakable: false)[
  #theorem(position: "first")[\
    Orice șir convergent dintr-un spațiu metric este fundamental.\
    *(Reciproca nu este adevărată)*
  ]
  #proof(position: "last")[\
    $x_n "convergent" => exists limits(lim)_(n->infinity) x_n=a => forall epsilon>0, exists n_epsilon: forall n>n_epsilon, d(x_n,a)<epsilon$ \
    Considerăm $n>n_epsilon$ și $p in NN$\
    $=> d(x_(n+p),x_n)<d(x_(n+p),a)+d(x_n,a) < limits(2 epsilon)_(epsilon->0 => 2epsilon->0)$]
]
*Exemple:*
+ $X=RR^2, d(x,y)=sqrt((x_1-y_1)^2-(x_2-y_2)^2)$\
  $(X_n)_(n>=0); x_n=((n+1)/(n+2),e^(-n))$\
  $a = l = (1,0)$
  $d(x_n,a)=sqrt(((n+1)/(n+2)-1)^2-(e^(-n)-0)^2) = sqrt(1/(n+2)^2+1/(e^(2n)))$\
  $e^x>=x+1, forall x>=0 => e^(2n)>=2n+1$\
  $=> 1/(e^(2n))<=1/(2n+1)$\
  $=>d(x_n,a)<sqrt(1/(n+2)^2+1/(2n+1))<sqrt(2/(2n+1))<sqrt(1/n)<epsilon$\
  $=>n>1/epsilon^2$\
+ $X=(0,1], d(x,y)=abs(x-y)$\
  $(x_n), x_n=(n+1)/(n^2+1) in X, limits(lim)_(n->infinity) x_n = 0 in.not X$\ $=>$Nu este convergent (Adică, este divergent)\

#definition[
  Un spațiu metric în care orice șir fundamental este convergent se numește spațiu metric "complet"
]
#block(breakable: false)[
  #theorem(
    position: "first",
  )[\ Un șir $(x_n)$ din spațiul metric $(RR^p,d_e), d_(e)(x,y)=sqrt(sum_(k=1)^p (x_k-y_k)^2)$\
    are limita $a = (a_1,a_2,dots,a_p)$ dacă și numai dacă șirurile numerice corespondente ale coordonatelor sale sunt convergente și\
    $x_n_1->a_1, x_n_2->a_2, dots, x_n_p -> a_p | n-> infinity$
  ]
  #proof(position: "last")[\
    + "$=>$"\
      $limits(lim)_(n->infinity) x_n=a => forall epsilon>0, exists n_epsilon: forall n>n_epsilon, d(x_n,a)<epsilon$\
      $d(x_n,a)=sqrt(sum_(k=1)^p x_n^((k))) => sqrt((x_k-a_k)^2)<epsilon$\
      $abs(x_n^((k))-a_k)<epsilon, k in overline(1\,p)$
    + "$arrow.l.double$"\
      Considerăm $limits(lim)_(n->infinity) x_n^((k)) = a_k$\

      $d(x_n,a)=sqrt(limits(sum_(k=1)^p)_(p "termeni") limits((x_n^((k))-a_k)^2)_(->0)) => limits(d)_((n->infinity))->0$
  ]
]
*Exemplu*\
+ $(X_n), x_n =display(\( underparen(1/(n+1), display(x_n^((1)))) \, underparen(sqrt(n+1)-sqrt(n), display(x_n^((2)))) \, underparen(3, display(x_n^((3)))) \))$\

  $display(
    cases(
      reverse: #true,
      limits(lim)_(n->infinity) x_n^((1)) = 0,
      limits(lim)_(n->infinity) x_n^((2)) = 0,
      limits(lim)_(n->infinity) x_n^((3)) =3,
    )
  )
  => limits(lim)_(n->infinity) x_n = (0,0,3)$\

+ $(x_n), x_n =display(\(underparen(n, display(x_n^((1))))\,underparen((n+3)/(n+5), display(x_n^((2))))\)) in RR^2$\

  $display(
    cases(
      reverse: #true,
      limits(lim)_(n->infinity) x_n^((1)) = infinity,
      limits(lim)_(n->infinity) x_n^((2)) = 1,
    )
  )
  => exists.not limits(lim)_(n->infinity) x_n => "divergent"$

#pagebreak()
= Teorema punctului fix (Banach)
