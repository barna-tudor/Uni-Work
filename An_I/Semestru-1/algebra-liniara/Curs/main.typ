
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
  *Notație* $hom(V, W):{T | T:V->W}$
]
#remark(position: "last")[
  $hom(V, W)$ este s.v peste $K$ cu operațiile:\
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
  + $U$ subspațiu $=>T(U)$ subspațiu.\
    $T(U)={T(v) | v in U}$\
    Fie $T(v_1), T(v_2) in T(U); alpha_1,alpha_2 in K$\
    $alpha_1T(v_1)+alpha_2T(v_2)=T(alpha_1v_1)+T(alpha_2v_2) = T(underparen(alpha_1v_1+alpha_2v_2, v))$
    $T(v) in U; v_1,v_2 in U, U$ subspațiu $=>underparen(alpha_1v_1+alpha_2v_2, v)in U$
  + Considerăm $alpha_1 T(v_1)+alpha_1 T(v_2)+dots+alpha_n T(v_n) =$\
    $=T(alpha_1v_1 + dots +alpha_n v_n)=overline(0)_w =>$
    + $alpha_1v_1 + dots +alpha_n v_n=overline(0)_v => exists alpha_k eq.not overline(0)_v, k in {1,2,dots,n}$\
    + $alpha_1v_1 + dots +alpha_n v_n eq.not overline(0)_v => exists alpha_i eq.not 0$
]
#theorem(position: "first")[
  Fie $V_n, W$ două spații vectoriale peste $K$\ $B={v_1,v_2,dots,v_n} subset V_n "bază în" V_n$\
  $w_1,w_2,dots,w_n in W$ vectori arbitrari.
  + $exists$ un operator unic $T:V_n -> W$ a.î. $T(v_i)=w_i, i=overline(1\,n)$
  + Dacă ${w_1,dots,w_n}$ este l.i., atunci operatorul $T$ care verifică $T(v_i)=w_i, i=overline(1\,n)$ este injectiv.
]
#remark(position: "middle")[
  $T$ injectiv: $v_1 eq.not v_2 => T(v_1) eq.not T(v_2)$
]
#remark(position: "last")[
  + Elementele mulțimii $hom(V, V)$ se numesc "endomorfisme"\
  + Puterile naturale ale unui endomorfism se definesc prin:
    $
      T^0 = I, I= "operatorul identic" => I(v)=v\
      T^2 = T compose T\
      T^n = T(T^(n-1))= T^(n-1)(T)=underbrace(T compose T\, dots\,compose T, "de" n "ori")
    $
]
#pagebreak()
== Nucleu și Imagine
\
#h(2em)Fie $T:V->W$ un operator.
#definition()[\
  Mulțimea $ker(T)={v | v in V; T(v) = overline(0)_w}$ se numește "nucleul lui T"\
  Mulțimea $im(T)=T(v) subset.eq W$ se numește imaginea lui $V$ prin $T$\
  $im(T)={w | overline(w) in W, exists "cel puțin un" v in V: T(v)=w}$
]
#theorem()[
  Fie $T in hom(V, W)$
  + $ker(T) subset V$ este subspațiu vectorial.
  + $im(T)subset W$ este subspațiu vectorial.
]
