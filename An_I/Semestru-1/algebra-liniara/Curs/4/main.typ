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
