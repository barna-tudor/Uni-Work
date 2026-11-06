
#import "../../../../template.typ": *
#show: conf
#show heading.where(level: 2): set heading(
  numbering: (..nums) => numbering("I)", nums.pos().last()),
)

#title[Algebra Liniara - An 1, sem 1]

= Curs 1
#pagebreak()
= Curs 2
#pagebreak()
= Curs 5
#pagebreak()
= Curs 4
#pagebreak()
= Curs 5: Operatori liniari. Nucleu și Imagine.
== Operatori liniari

#h(1em) Fie $V,W$ două spații vectoriale peste corpul $K$.
#definition(position: "first")[
  O funcție $T:V ->W$ se numește operator.\ \
  Dacă $T$ verifică $T(alpha_1 v_1 +alpha_2 v_2)=alpha_1 T(v_1) + alpha_2 T(v_2), forall alpha_1, alpha_2 in K "și" v_1,v_2 in V$ atunci T se numește operator "liniar" sau homomorfism de spații vectoriale.\
  *Notație* $H o m(V,W):{T | T:V->W}$
]
#obs(position: "last")[
  $H o m(V,W)$ este s.v peste $K$ cu operațiile:\
  $ (T_1+T_2)(v) = T_1(v)+T_2(v) "(op. internă)" $
  $ (alpha T_1)(v) = alpha T_1(v) "(op. externă)" $
]
=== Exemple:
+ $T:RR^2 -> RR^3, K=RR$\
  $T(x)=T((x_1,x_2)) = (x_1 x_2, x_1^2 x_2 x_3, x_2+x_3)$\
  Este operator, dar nu este linear.

+ $T_1:M_2(RR)->RR, T_1(X)=det(X)$ - nu este linear.\
  $T_1:M_2(RR)->RR, T_1(X)=tr(X)$ - liniar.

+ $T_1:RR^3->RR^2, T_1(x)=T_1((x_1,x_2,x_3))=(x_1+x_2, 2x_2-3x_3)$ - liniar\
+ $T_2:Pi_3->Pi_2, K=RR, T_2(p(x))=3p'(x) -5p''(x)+p(x)$ - liniar

#theorem(position: "first")[
  Fie $T:V->W$ un op. liniar. Atunci:\
  + $T(overline(0)_v) = overline(0)_w$
  + Dacă $U subset V$ subspațiu, atunci $T(U) subset W$ este subspațiu.
  + Dacă $forall{v_1,v_2,dots,v_n} subset V$ liniar dependenți atunci \
    ${T(v_1), T(v_2), dots, T(v_n)} subset W$ liniar dependenți
]
#proof(position: "last")[
  + $T$ op. liniar $=> T(alpha_1 v_1+alpha_2 v_2) = alpha_1 T(v_1) + alpha_2 T(v_2)$\
    Dacă $alpha_1=alpha_2=1 in K => T(v_1+v_2) = T(v_1)+T(v_2)$\
    $v_1=v_2=overline(0)_v => T(overline(0)_v)=2T(overline(0)_v)=>T(overline(0)_v)=overline(0)_w$
]