#import "/template.typ": *
#show: conf;

#title[Componentele de bază ale modelului arhitectural Von Neumann]

Marea majoritate a calculatoarelor din ziua de azi se bazează pe modelul Von Neumann

- Memoria
  - reține atât instrucțiuni cât și date
  - MAR: "Memory Address Register"
  - MDR: "Memory Data Register"

- unitatea de procesare:
  - execută instrucțiunile din programe
  - ALU: "Arithmetic Logic Unit"
  - TEMP : "Temporary Register Bank"

- unitatea de control
  - parcurge secvențial și interpretează instrucțiunile controlând fluxul de execuție al programelor
  - PC: "Program Counter"
  - IR: "Instruction Register"

- unitatea de intrare date (INPUT)
  - permite introducerea datelor din exterior în memoria calculatorului

- unitatea de ieșire (OUTPUT)
  - produce rezultatul generat de program pentru utilizator

//TODO: insert sketches from notebook
#pagebreak()
= Memoria
2 caracteristici importante:
- capacitatea: să fie cât mai mare
- timpul de acces: să fie cât mai mic

Fiecare locație de memorie este caracterizată de adresă și conținut.
#warning[
  - Adresa identifică în mod unic o locație de memorie.
  - Conținutul reprezintă valoarea stocată la adresa respectivă
]

Numărul total de locații disponibile formează spațiul de adrese ("Address space").

Adresabilitatea reprezintă pe câți biți se scrie conținutul de la o adresă de memorie.

== Regiștrii MAR și MDR
- Pentru instrucțiunile care _citesc_ date din memorie (instrucțiuni de tip "*load*"), conținutul memoriei se încarcă în *MDR*.
- Pentru instrucțiunile de _scriere_ în memorie (de tip "*store*"), în MDR se scrie valoarea ce va fi stocată la activarea semnalului *WriteEnable*,
- La modelul Von Neumann atât instrucțiunile cât și datele sunt memorate ca și secvențe de biți în memoria calculatorului
