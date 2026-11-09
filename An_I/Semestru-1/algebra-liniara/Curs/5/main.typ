#import "/template.typ": *
#show: conf

#title[Curs 5: Operatori liniari. Nucleu și Imagine.]
= Operatori liniari
#h(1em) Fie $V,W$ două spații vectoriale peste corpul $K$.
#definition(position: "first")[
  O funcție $T:V ->W$ se numește operator.\
  Dacă $T$ verifică
  - $T(alpha_1 v_1 +alpha_2 v_2)=alpha_1 T(v_1) + alpha_2 T(v_2), forall alpha_1, alpha_2 in K$ și
  - $v_1,v_2 in V$ atunci T se numește operator "liniar" sau homomorfism de spații vectoriale.\
  *Notație* $hom(V, W):{T | T:V->W}$
]
#remark(position: "last")[
  $hom(V, W)$ este s.v peste $K$ cu operațiile:\
  $ (T_1+T_2)(v) = T_1(v)+T_2(v) "(op. internă)" $
  $ (alpha T_1)(v) = alpha T_1(v) "(op. externă)" $
]
*Exemple:*
+ $T:RR^2 -> RR^3, K=RR$\
  $T(x)=T((x_1,x_2)) = (x_1 x_2, x_1^2 x_2 x_3, x_2+x_3)$\
  Este operator, dar nu este linear.

+ $T_1:M_2(RR)->RR, T_1(X)=det(X)$ - nu este linear.\
  $T_1:M_2(RR)->RR, T_1(X)=tr(X)$ - liniar.

+ $T_1:RR^3->RR^2, T_1(x)=T_1((x_1,x_2,x_3))=(x_1+x_2, 2x_2-3x_3)$ - liniar\
+ $T_2:Pi_3->Pi_2, K=RR, T_2(p(x))=3p'(x) -5p''(x)+p(x)$ - liniar
#block(breakable: false)[
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
]
#block(breakable: false)[
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
]
= Nucleu și Imagine
#h(1em)Fie $T:V->W$ un operator.
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
#block(breakable: false)[
  *Exemplu*\
  $T:RR^3->RR^3, T(x)=T(x_1,x_2,x_3)=$\
  $=(x_1+x_2+x_3,-x_1+2x_2+x_3,x_1+4x_2+3x_3$\
  $ker(T):$\ $T(x)=overline(0) =>$
  $cases(
    x_1&+x_2&+x_3&=0,
    -x_1&+2x_2&+x_3&=0,
    x_1&+4x_4&+3x_3&=0
  )=>$
  $
    x=(1/2x_2,x_2,-3/2x_2) = 1/2x_2underparen((1,2,-3), v_1) => ker(T)="Span"{v_1}.
  $
  #remark[
    $dim(ker(T))=1$
  ]
  $im(T):$\
  $T(v)=w=T(x)=(w_1,w_2,w_3)=>cases(
    x_1&+x_2&+x_3&=w_1,
    -x_1&+2x_2&+x_3&=w_2,
    x_1&+4x_4&+3x_3&=w_3
  )$\
  $Delta_s = mat(
    delim: "|", align: #right,
    1, 1, 1;
    -1, 2, 1;
    1, 4, 3,
  ) = 0;$
  $d_p=mat(
    delim: "|", align: #right,
    1, 1;
    -1, 2;
  ) = 3 eq.not 0 => "rang"A=2$\
  $Delta_c=mat(
    delim: "|", align: #right,
    1, 1, w_1;
    -1, 2, w_2;
    1, 4, w_3,
  )=-6w_1-3w_2+3_w_3$\
  Sistemul trebuie să fie compatibil $=> Delta_c = 0 => w_3=w_2+2w_1$\
  $w=(w_1,w_2,w_2+2w_1)=w_1 underparen((1,0,2), v_2) + w_1 underparen((0,1,1), v_3)$\
  $im(T)="Span"{v_2,v_3}$\
  $v_2,v_3 "l.i" => {v_2,v_3} "bază în" W=RR^3 => dim(T)=2$
]
#block(breakable: false)[
  #theorem(position: "first")[
    #set enum(numbering: "I")
    Dacă $T:V->W$ este operator liniar atunci următoarele afirmații sunt echivalente:
    + $T$ este operator injectiv
    + $ker(T)={overline(0)_w}$
  ]
  #proof(position: "last")[
    + I$=>$II\
      Fie $x,y in V, x eq.not y, T(x) eq.not T(y)$\
      $T"("underparen(x-y, eq.not overline(0)_v)")"eq.not overline(0)_w$\
      $T(overline(0)_w)=overline(0)_w$
    + II$=>$I\
      $ker(T)={overline(0)_v}$\
      $T(overline(0)_v)=overline(0)_w$\
      $ker(T):T(v)=0$\
      $T(x)=T(y)=> T(x-y)=overline(0)_w => x-y = overline(0)_v => x=y => T$ injectiv
  ]
]
#remark[
  + $T:V->W$ surjectiv dacă $forall w in W, exists "cel puțin un" v in V:w=T(v) (W=im(T))$
  + $T$ bijectiv dacă e injectiv și surjectiv; inversul lui $T$ este\
    $T^(-1):W->V$, operator liniar
  + Dacă $T_1:V->W, T_2:W->U$ sunt op. lin. bijectivi, atunci:
    + $(T_2 compose T_1):V->U$ op. lin. bijectiv
    + $(T_2 compose T_1)^(-1) = T_1^(-1) compose T_2^(-1)$
]
#block(breakable: false)[
  #theorem(position: "first")[
    Dacă $T:V_n->W (dim(V_n)=n)$ -- $V_n$ spațiu vectorial n-dimensional atunci $dim(ker(T))+dim(im(T))=dim(V_n)=n$
  ]
  #proof(position: "last")[\
    $dim(ker(T))=p => forall B exists B_1:B_1={e_1,e_2,dots,e_p} "bază în" ker(T)=>$\
    $B subset V_n=>V_1$ se poate prelungi la o bază\
    $B={e_1,dots,e_p,e_(p+1),dots,e_n} subset V_n$\
    Fie $y in im(T)=> exists x in V_n: T(x)=y$\
    $x=sum_(k=1)^n alpha_k e_k => y= T(sum_(k=1)^n alpha_k e_k)=sum_(k=1)^n alpha_k T(e_k)=$\
    $=underbracket(alpha_1 T(e_1)+dots+alpha_p T(e_p), =overline(0)_w) + alpha_(p+1)T(e_(p+1))+dots+alpha_n T(e_n)$\
    $=>im(T)="Span"{T(e_(p+1)),dots,T(e_n)}$\
    Vectorii $T(e_(p+1)),dots,T(e_n)$ l.i\
    $B_1T(e_(p+1))+dots+B_(n-p)T(e_n)=overline(0)_w$\
    $T(B_1e_(p+1))+dots+T(B_(n-p) e_n)=overline(0)_w$\
    ...
  ]
]
