#import "../src/lib.typ": *
// Typst does not support global variables, so for now we import
// everything we need into an import file and import it here and
// for all subfiles.

// Some Macros are also defined in the import file.
#import "imports.typ": *

#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))

// No idea what this does, but it seems fancy.
#show "Typst": fancy-typst
#show "LaTeX": fancy-latex

// Next line HAS to be HERE for ctheorems to work properly
#show: thmrules

// Document type for this template
#show: tuw-thesis.with(
  header-title: "A blank template",
  lang: "en",
)
#maketitle(
  title: "A blank template",
  thesis-type: [DocumentType],
  authors: (
    (
      name: "Author",
      email: [#link("mailto:lolcat@example.com")],
      supervisor: "supervisor Name",
    ),
  ),
)
#abstract[
  #include "abstract.typ"
]




#pagebreak()
#outline()


#pagebreak()
// #show: appendix
// #include "appendix.typ"
// #pagebreak()
#bibliography("refs.bib")
