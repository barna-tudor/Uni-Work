#import "template.typ": *
#show: conf
#title[Seminar 2]
== Formulele unui sistem ponderat
+ $upright(N) = overline(upright(X)_(n-1)upright(X)_(n-2)dots upright(X)_0)$
+ $upright(N)= sum_(i=0)^(n-1) x_i b^i$

=== Exemple
$0001011101110000_((2)) = 0upright(x)1770 = 1770_((16))$

$"0xA97B"=scripts(limits(1010)_"A" space limits(1001)_"9" space limits(0111)_"F" space limits(1011)_"B")_((2))$

== Reprezentarea numerelor cu semn

#labeled-numbered-list[3 fome:][Semn și magnitudine (Cod Direct - CD)][Complement față de 1 (Cod Invers - CI)][Complement față de 2 (Cod Complementar - C2)]

Indiferent de reprezentare, bitul de semn este 0 pentru numerele pozitive, 1 pentru cele negative.

Pentru evitarea ambiguității este important să se stabilească de la început numărul de biți pe care se face reprezentarea.

=== Semn și magnitudine

