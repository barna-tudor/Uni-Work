#import "/template.typ": *
#show: conf

#title[Curs 4: Ortogonalitate, Varietate Liniară, Distanțe]
\
= Ortogonalitate
\
Fie $V$ un spațiu euclidean,\
$B={e_1,e_2,dots,e_n}$ o bază ortonormată\
$v in V, v=sum_(i=1)^n alpha_i e_i; alpha_i in K$

#theorem()[(Bessel) Are loc: $ sum_(i=1)^n |alpha_i| <= ||v||^2 $
]
#theorem()[ Procedeul de ortogonalizare Gram-Schmidt\
  Fie $V$ un s.v euclidian, $n$-dimensional și $B={v_1,v_2,dots,v_n}$ o bază.\
  atunci $exists$ o bază $B={f_1,f_2,dots,f_n}$ ortogonală.\
  Fie $f_1=v_1$\
  căutăm $f_2=v_2-alpha_1f_1; (f_2,f_1)=0(f_1 perp f_2)$\
  $ f_2=v_2-((v_2, f_1))/((f_1,f_1)) dot.op f_1 $
  $ f_3=v_3 - ((v_3,f_1))/((f_1,f_1))f_1 - ((v_3,f_2))/((f_2,f_2))f_2 $
  $ dots $
  $ f_k=v_k - sum_(i=1)^(k-1) ((v_k,f_i))/((f_i,f_i))f_i; k=overline(2\,n) $
]
#pagebreak()
= Varietate Liniară
\
Fie $V$ s.v peste $K$
#definition()[
  O mulțime de forma
  $
    L=v_0+V_L={v_0 + v | v in V_L};\
    v_0 in V "arbitrar", V_L "subspațiu al" V
  $
  Se numește *varietate liniară*
]
#remark()[
  $V_L$ se numește *subspațiu director* al varietății $L$
]
#definition()[Spunem că o varietate liniară $L=v_0+V_L$ are dimensiune $k$ dacă $dim(V_L)=k$]

*Exemple* \
+ $V=RR^2, v_0 =(1,2), V_L={(x,y) | x-y = 0}$\
  $x-y=0 -> y=x => (x,y)=(x,x)=x dot.op underparen((1,1), u) => V_L = "Span"(u), dim(V_L)=1$\
  $L = v_0 + V_L = {v_0 + v | v in V_L} = \{underparen((1,2) + a dot.op u, (u+1, u+2)) | a in RR\}$
+ $V= RR^3, L={(x,y,z) | x-y+2z=5}$\
  $x=y-2z+5 =>$
  $
    (x,y,z) = (y-2z+5,y,z) = (y,y,0)+(-2z,0,z)+(5,0,0)=\
    = y underparen((1,1,0), v_1) + z underparen((-2,0,1), v_2) + underparen((5,0,0), v_0)
  $
  $V &= { a v_1 + b v_2 + v_0 | a, b in RR} = v_0 + {a v_1 + b v_2 | a, b in RR}=\
  &=v_0 + underparen("Span"{v_1,v_2}, V_L)$\
  $=> dim(V_L)=2=>dim(L)=2$

#remark[
  Fie $L_1= v_1 + V_L_1, L_2= v_2 + V_L_2$. Atunci:
  + $L_1 perp L_2$ (ortogonale) dacă $V_L_1 "și" V_L_2$ subspații ortogonale\
    ($forall v in V_L_1 => v in V_(L_2)^(perp)$)
  + $L_1 parallel L_2$ (paralele) dacă $V_L_1 subset V_L_2$ SAU $V_L_2 subset V_L_1$
]

#remark()[\
  Varietățile de dim. 0 se numesc *puncte*,\
  Varietățile de dim. 1 se numesc *drepte*,\
  Varietățile de dim. 2 se numesc *plane*,\
  Varietățile de dim. 3+ se numesc *hiperplane*,\
]
#pagebreak()
= Distanțe
\
Fie $V$ un s.v peste $K$ și $U$ un subspațiu al $V$.
#definition()[\
  Dacă ${e_1,e_2,dots,e_n}$ liniar independentă și ${f_1,f_2,dots,f_n}$ este mulțimea ortogonală obținută prin Gram-Schmidt atunci:
  $
    G(e_1,e_2,dots,e_n)= G(f_1,f_2,dots,f_n)=
    norm(f_1)^2 dot.op norm(f_2)^2 dot.op dots dot.op norm(f_n)^2
  $
]
#callout("Propoziție")[
  Distanța de la un vector $v in V$ la un subspațiu $U subset V, dim U = k$ este dată de:
  $
    "dist"(v,U)=sqrt((G(e_1,e_2,dots,e_k, v))/(G(e_1,e_2,dots,e_k))) , {e_1,e_2,dots,e_k} "bază în" U
  $
]
#definition()[
  Distanța de la $v$ la $L=v_0 + V_L, v,v_0 in V, V_L$ subspațiu al $V, dim(V_L)=k$ este
  $
    d(v,L)=d(v,v_0+V_L)=d(v-v_0, V_L) =\
    = sqrt((G(e_1,e_2,dots,e_k, v-v_0))/(G(e_1,e_2,dots,e_k)))
  $
]
*Exemplu*\
Fie $V=RR^2, L={(x,y) | a x+b y+c=0}, v=(x_0,y_0)$\
$a x + b y + c = 0 => x = display((-c - b y)/a), a eq.not 0$\
$
  (x,y) = ((-c -b y)/a, y) = underparen((-c/a,0), display(v_0)) + underparen((-b/a,1), display(e_1))
$
$L = v_0 + V_L, V_L = "Span"{e_1}$\

$d(v,L) & = d(v,v_0+V_L)=d(v-v_0,V_L)= \
& = display(sqrt((G(e_1,v-v_0))/(G(e_1))))$

Considerăm $((x_1,y_1),(x_2,y_2)) = x_1x_2 + y_1y_2$

$G(e_1) &= display(mat(delim: "|", (e_1,e_1))) "(determinant)"\
&=(-b/a)^2 + 1^2 = (b^2+a^2)/a^2$

$v-v_0=(x_0,y_0)-(-c/a,0) = (x_0+c/a, y_0)$\

$G(e_1,v-v_0)= display(mat(delim: "|", (e_1,e_1), (e_1,v-v_0); (v-v_0,e_1), (v-v_0,v-v_0)))$

$
  (e_1,v-v_0) & =-b/a (x_0+c/a)+ y_0 \
              & =(-b x_0)/a - (b c)/a^2 + y_0
$
$
  (v-v_0,v-v_0) = (x_0+c/a)^2 + y_0^2
$
$
  G(e_1,v-v_0) &=(b^2a^2)/a^2 dot.op [(x_0+c/a)^2+y_0] - [(-b x_0)/a - (b c)/a^2 + y_0] = \
  &=dots \
  &= x_0^2+ 2 x_0/a ((b^2c+a^2c)/a^2 - (2 b c)/a^2 + b y_0 )+ (b^2+a^2)/a^2 y_0^2 + (2 b c)/ a^2 y_0 + c^2/a^2\
$
#divider()
$
  d(dots)=(abs(a x_0 + b y_0 + c))/(sqrt(a^2+b^2))
$
