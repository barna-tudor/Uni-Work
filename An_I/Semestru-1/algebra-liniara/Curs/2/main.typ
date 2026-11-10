#import "/template.typ": *
#show: conf

#title[Curs 2: Baze, Dimensiune]\
= Bază
#pagebreak()
#definition()[
  Spunem că un spațiu vectorial este *finit dimensionat* dacă are bază finită sau dacă $B = {overline(0)}$
  În caz contrar vom spune că $V$ este *infinit dimensional*.\
  $dim(V)="card"(B) = |B|$ dacă $B$ finită,
  $dim(V)=0$, dacă $B={overline(0)}$
]
*Exemple*\
+ $dim RR^n = n$
+ $dim Pi_n=n+1$
+ $dim M_2(RR)= 2^2$
+ Fie $scr(F)={f | f:RR->RR}, K=RR$\
  $U="Span"(B); B={e^x, e^(2x), dots}$\
  $scr(F)$ sp. vect. infinit dimensional

#theorem()[
  Fie $V$ s. vect. de dimensiune n (s.v. n-dimensional).\
  Orice mulțime de vectori liniar independentă din V este o parte a unei *baze*.(mai spunem că mulțimea poate fi #underline("prelungită la o bază"))
]

#theorem()[(Grossmann)\
  Dacă $V$ s. vect. peste $K$ și $U,W$ subspații ale lui $V$, atunci:
  $ dim(U+W)=dim(U)+dim(W)-dim(U inter W) $
]

*Exercițiu:*\
$V = RR^3, U = "Span""{"underparen((1,1,1), u_1),underparen((-1,1,0), u_2)"}", W="Span"{underparen((0,2,1), w_1)\}$\
$B_1 = {u_1,u_2}$ bază?\
l.i.? $alpha_1 u_1+alpha_2 u_2 = overline(0)$\
$display(
  cases(
    &alpha_1-alpha_2 &=0,
    &alpha_1+alpha_2 &=0,
    &alpha_1 &=0,
  )
)\ => alpha_1=alpha_2=0$\
$U = "Span"(B_1)=> B_1 "bază în" U$\
$dim U = |B_1| = 2$\ \
$B_2 = {w_1}$\
$alpha_1 w_1 = overline(0) => alpha_1 =0 => dim W = |B_2| = 1$
$U+W={v_1+v_2 | v_1 in U, v_2 in W}$\
$v_1 + v_2 = alpha_1 u_1 + alpha_2 u_2 + alpha_3 w_1$
