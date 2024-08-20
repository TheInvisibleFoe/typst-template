#import "../src/lib.typ": *

// Useing the configuration
#show: tuw-thesis.with(
  title: [Hier wird der Titel der Arbeit eingefügt.],
  thesis-type: [Bachelorarbeit],
  lang: "de",
  authors: (
    (
      name: "Vorname Nachname", 
      email: "email@email.com",
      matrnr: "12345678",
      date: datetime.today().display("[day] [month repr:long] [year]"),
    ),
  ),
  abstract: [Hier wird die Kurzfassung der Arbeit eingefügt.],
  // bibliography: bibliography("bibliography.bib"), 
  appendix: [Hier wird der Anhang eingefügt.], 
    )
