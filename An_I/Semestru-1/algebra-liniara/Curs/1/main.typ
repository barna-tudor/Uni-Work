#import "/template.typ": *
#show: conf

#title[Curs 1: Spații și subspații vectoriale, dependență și independență liniară]

= Spații Vectoriale
\
Fie $V$ o mulțime nenulă și $K$ un corp, pentru care definim:
- o operație internă "$+$": $V times V -> V, (x,y)->x+y$
- o operație externă "$dot.op$": $alpha times V -> V, (alpha,x)-> alpha dot.op x$
#definition()[
  $V$ este "Spațiu Vectorial peste $K$" dacă:
  + $(V,+)$ grup abelian $->("asociativ","comutativ", "element neturu","e.s.")$
  + #set enum(numbering: "a)")
    + $alpha dot.op (x+y)= alpha dot.op x + alpha dot.op y$
    + $(underbracket(alpha + beta, "op. din" K))overbracket(dot.op x, "externă")=underbracket(alpha x + beta x, "o. internă")$
    + $(alpha times beta) dot.op x = alpha dot.op (beta dot.op x)= alpha dot.op beta dot.op x" "forall alpha,beta in K, x in V$
    + $underparen(1, "elem. unitate din" K\ "față de" dot.op "din" K) dot.op x = x" " forall x in V$
  Elementele lui V se numesc *vectori*, elementele corpului $K$ se numesc *scalari*, iar op. externă "$dot.op$" *înmulțire cu scalari*.\

  Notații: $V, (V,K,dot.op), (V,+,dot.op)$.\
  Dacă $K=RR "sau" CC$, $V$ se numește *spațiu vectorial real / complex*.
]<def:spațiu_vectorial>
*Exemple:*\
+ $V=M_((m,n))(RR)$ (sau $CC$), $K=RR$ (sau $CC$)
  A=$|a_(i j)|,i=overline(1\,m), j=overline(1\,n)$, la fel $B=|b_(i j)|...$
  $A+B=|a_(i j)+b_(i j)|$\
  $alpha a_(i j)$
+ $V=Pi_n, K=RR$ (sau $CC$)\
  ($Pi_n$ = mulțimea tuturor polinoamelor de grad cel mult $n$)\
  $f=a_n x^n + a_(n-1) x^(n-1)+ dots + a_1 x + a_0$; $g= ...$\
+ $B=RR^n=underbrace(RR times RR times ... times RR, n "ori") = "{"underparen((x_1,x_2,dots,x_n), n"-uplu sau vector") | x_k in RR, k=overline(1\,n)"}"$

#remarks()[\
  $x=(x_1,x_2,dots,x_n), y=(y_1,y_2,dots,y_n)$;\
  + $x=y <=>x_k=y_k, k=overline(1\,n)$
  + op. internă $x+y = (x_1+y_1,x_2+y_x,dots,x_n+y_n)$\
    op. externă $alpha dot.op x=(alpha x_1, alpha x_2, dots, alpha x_n)$\
  $V=RR^n, K=RR ->$ Spațiu vectorial.
]
#theorem()[
  Dacă $V=$ spațiu vectorial peste $K$, atunci:
  + $alpha v=overline(0)<=>alpha=0 "sau" v=overline(0)$
  + $(-alpha)v=alpha(-v)= -alpha v, forall alpha in K; v in V$
  + $alpha (v_1-v_2)=alpha [v_1 + (-v_2)]= alpha v_1 - alpha v_2, forall alpha in K; v_1, v_2 in V$
]
= Subspații Vectoriale
\
Fie $V$ s.v. peste $K$
#definition()[\
  O submulțime $U subset V, U eq.not emptyset$ se numește *subspațiu vectorial* a lui $V$ dacă:
  + $forall u_1,u_2 in U-> u_1+u_2 in U$ *ȘI*\
  + $forall alpha in K, u in U -> alpha u in U$
  *SAU*
  - $forall alpha,beta in K, u_1,u_2 in U => alpha u_1+beta u_2 in U$
]<def:subspațiu_vect>

#remark()[\
  Dacă $overline(0) in.not U => U$ *nu este* subspațiu.\
]
== Proprietăți
\
#[Fie $U_1, U_2$ subspații v. ale $V$
  #set enum(numbering: "I)")
  + $U_1+U_2={u_1+u_2 | u_1 in U_1, u_2 in U_2}$ este subspațiu a lui V și se numește *suma dintre $U_1 "și" U_2$*
  + $U_1 inter U_2 = {u | u in U_1 "și" u in U_2}$ este subspațiu a lui v
  + $U_1 union U_2 = {u | u in U_1 "sau" u in U_2}$ *NU* este subspațiu
    #proof[
      Fie $u_1 in U_1, u_1 in.not U_2; u_2 in U_2, u_2 in.not U_1 => u_1+u_2 in.not U_1; in.not U_2$
    ]
]
//TODO: Add exercise
#block(breakable: false)[
  #definition(position: "first")[\
    Fie $V_1,V_2$ subspații vect. ale $V$.\
    Spunem că subspațiul $V_3$ este *sumă directă* a subsapțiilor $V_1,V_2$ dacă:
    #set enum(numbering: "I)")
    + $V_1 inter V_2 = {overline(0)}$
    + $V_3 = V_1+V_2$
    Notație: $V_3 = V_1 plus.o V_2$
  ]<def:sumă_directă>
  #remarks(position: "last")[
    + Dacă $V=V_1 plus.o V_2 -> V_1 "și" V_2$ sunt *subspații complementare*
    + Dacă $V=V_1 plus.o V_2$ atunci\
      $forall v in V underparen(exists!, "există și sunt unici") v_1 in V_1, v_2 in V_2: v= v_1+v_2$ *descompunere unică*
  ]
]
= Dependență și Independență Liniară
\
Fie $V$ un spațiu vectorial și $S subset V, S eq.not emptyset$
#definition(position: "first")[\
  Orice vector $ v = sum_(k=1)^n alpha_k v_k, alpha_k in K, v_k in S $
  se numește *combinație liniară* de vectori.\
  Mulțimea tuturor combinațiilor liniare de elemente din S se numește *acoperirea liniară* a lui S si se notează:
  $upright(L)(S) "sau" "Span"(S)$
]<def:span>
#remark(position: "last")[\
  $"Span"(S)={sum_(k=1)^n alpha_k v_k | alpha_k in K, v_k in S}$\
  $S={v_1,v_2,dots,v_n}$\
  este un subspațiu a lui V și reprezintă cel mai mic subspațiu care conține S
]

#definition()[\
  Spunem că vectorii din $S={v+1,v_2,dots,v_n}$ sunt liniar independenți dacă din relația
  $
    alpha_1 v_1 + alpha_2 v_2 + dots + alpha_n v_n = overline(0)
  $
  se obține
  $
    alpha_1=alpha_2=dots=alpha_n=0 in K
  $
]
#definition()[\
  Spunem că vectorii din $S={v+1,v_2,dots,v_n}$ sunt liniar dependenți dacă din relația
  $
    alpha_1 v_1 + alpha_2 v_2 + dots + alpha_n v_n = overline(0)
  $
  se obtine cel puțin un scalaar $alpha_k, k=overline(1\,n), alpha_k eq.not 0$
]
