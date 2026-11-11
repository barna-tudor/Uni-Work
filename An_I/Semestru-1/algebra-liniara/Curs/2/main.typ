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

*Exemplu:*\
+ $V = RR^3, U = "Span""{"underparen((1,1,1), u_1),underparen((-1,1,0), u_2)"}", W="Span"{underparen((0,2,1), w_1)\}$\
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

  l.i.?
  $alpha_1 u_1 +alpha_2 u_2 + alpha_3 w_1 = overline(0)$\
  $display(
    cases(
      &alpha_1-&alpha_2 + 0&alpha_3 &=0,
      &alpha_1+&alpha_2 + 2&alpha_3&=0,
      &alpha_1 + 0&alpha_2 + &alpha_3&=0,
    )
  )$\ \
  $Delta=mat(1, -1, 0; 1, 1, 2; 1, 0, 1, align: #right, delim: "|") = 0 =>$ sistemul nu are soluția banală.\
  $=> u_1,u_2,w_1->$ liniar *dependenți*
  $=> dim(U+W) eq.not 3$
  #remark[Arătăm că $w_1$ este combinație liniară a $u_1,u_2$]
  $
        w_1 & =beta_1 &     u_1 & +beta_2 &      u_2 \
    (0,2,1) & =beta_1 & (1,1,1) & +beta_2 & (-1,1,0)
  $
  $display(
    mat(
      &beta_1-beta_2&=0;
      &beta_1+beta_2&=2;
      &beta_1&=1;
      delim: #("{", "|")
    )=> beta_1=beta_2=1
  )$\
  $=> w_1 = u_1+u_2=> W_1 in "Span"B_1=>w_1 in U (W subset U)=> B_1 "bază în" U+W$\
  $U inter W = W$\
  $dim(U inter W) = 1$\
  $dim(U+W)=2+1-1=2$

= Matrice de trecere
#definition[Fie $V$ s.v peste $K$\
  $B_1={v_1,v_2,dots,v_n}$ și\
  $B_2={u_1,u_2,dots,u_n}$ Baze\
  Considerăm
  $
    u_i=sum_(j=1)^n a_(i j) v_j; i=overline(1\,n)
  $
  Prin definiție, matricea $P=A^t="matricea de trecere (de pasaj) de la" B_1 "la" B_2$]

Fie $x in V; x = sum_(k=1)^n a_k v_k$\
#columns(2)[
  $ [x]_(B_1)=mat(a_1; a_2; dots.v; a_n) $
  #colbreak()
  $ [x]_(B_2)=mat(b_1; b_2; dots.v; b_n) $
]
are loc:
$ [x]_(B_1)=P dot.op [x]_(B_2) $\
$P=A^t=P_(B_2)^(B_1)$
#pagebreak()
*Exmemplu*\

Fie $V=Pi_2; K= RR$\
$B_1={underparen(x^2, p_1),underparen(x^2+x, p_2),underparen(x+1, p_3)}; B_2={underparen(x^2+2, q_1),underparen(x^2-x+1, q_2),underparen(x+2, q_3)}$\ \  $q_1=a_(1" "1)p_1 + a_(1" "2)p_2 + a_(1" "3)p_3=>$
$
  x^2+2=a_(1" "1)(x^2)+a_(1" "2)(x^2+x)+a_(1" "3)(x+1)\
  display(mat(a_(1" "1)+a_(1" "2)=1; a_(1" "2)+a_(1" "3)=0; a_(1" "3)=2; delim: #("{", "|"), align: #right)=>mat(a_(1" "3)=2; a_(1" "2)=-2; a_(1" "1)=3; delim: #none, align: #left))
$
Similar, se rezolvă cele 2 sisteme de ecuații date de
$
  q_2=a_(2" "2)p_1+a_(2" "2)p_2+a_(2" "2)p_3\
  q_3=a_(3" "2)p_1+a_(3" "2)p_2+a_(3" "2)p_3
$
$
  => A= mat(&3, -&2, &2; &3, -&2, &1; &1, -&1, &2;) => P=P_(B_1)^(B_2)=A^t=mat(&3, &3, &1; -&2, -&2, -&1; &2, &1, &2;)
$
= Izomorfism de Spații Vectoriale
\
Fie $V_1, V_2$ 2 spații vectoriale peste $K$

#definition()[\
  Spunem că $V_1, V_2$ sunt izomorfe dacă există o funcție *bijectivă* $f:V_1->V_2$ a.î.
  $
    f(alpha_1v_1+alpha_2v_2)=alpha_1f(v_1)+alpha_2f(v_2)\
    forall v_1 in V_1, v_2 in V_2; alpha_1,alpha_2 in K
  $
]
#remarks()[
  + dacă $V_1, V_2$ izomorfe $=> dim(V_1)=dim(V_2)$
    #proof[
      Fie $B_1$ bază în $V_1 => f(B_1)=B_2, B_2$ bază în $V_2$\
      (prin faptul că $f$ bijectivă)
    ]
  + Dacă $V$ spațiu vectorial peste $K$ cu $dim(V)=n$ atunci $V$ este izomorf cu spațiul vectorial $K^n$ (vectorii de $n$ elemente ale $K$)
]
#pagebreak()
*Exemplu*\
Fie $V_1=RR^4, V_2=M_2(RR), K = RR$\

$f:V_2->V_1, f mat(a, b; c, d) = (a,b,c,d)$
+ injectivă?\
  $
    f mat(a_1, b_1; c_1, d_1)=f mat(a_1, b_1; c_1, d_1) <=> cases(a_1=a_2, b_1=b_2, c_1=c_2, d_1=d_2)\
  $
  $=> checkmark$
+ surjectivă? $forall y in V_1, exists "cel puțin 1" A=mat(a, b; c, d): y=f(A)$
  $
    (y_1,y_2,y_3,y_4) = f mat(a, b; c, d) => cases(a=y_1, b=y_2, c=y_3, d=y_4)
  $
+ se verifică dacă
  $
    f(alpha_1A_1 + alpha_2A_2)=alpha_1f(A_1)+alpha_2f(A_2) " " checkmark
  $
  $=> V_1 "izomorf" V_2$
