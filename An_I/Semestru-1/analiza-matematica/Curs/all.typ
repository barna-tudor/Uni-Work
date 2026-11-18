#import "/template.typ": *
#show: base

#title[Curs Analiză matematică]
\
#divider()
#outline(
  depth: 2,
)
#divider()
#for n in range(1, 7) {
  pagebreak(weak: true)
  [
    #set heading(offset: 1)
    #show title: it => heading(level: 1, offset: 0, it.body)  // child titles become level 1
    #include "individual/" + str(n) + "/main.typ"
  ]
}
