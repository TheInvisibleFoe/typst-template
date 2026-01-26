#import "/src/library.typ": exercise
#import exercise: project, task, subtask
#import "imports.typ":*
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))
#set math.equation(numbering: "(1)")
#show ref: it => {
  let eq = math.equation
  let el = it.element
  // Skip all other references.
  if el == none or el.func() != eq { return it }
  // Override equation references.
  link(el.location(), numbering(
    el.numbering,
    ..counter(eq).at(el.location())
  ))
}

#let task = task.with(numbering-format: (..n) => numbering("1", ..n))
#let subtask = subtask.with(markers: ("a)", "1)"))
#set text(lang: "en")

#show: project.with(
  // no: 3,
  type: "Assigment_name",
  suffix-title: [no \ Roll No],

  task-type: [Problem],
  extra-task-type: [Sub-problem],

  show-hints: false,
  show-solutions: false,

  university: [Course Code],
  institute: [*CourseName*],
  seminar: [Name, Roll],

  date: datetime.today(),
)



#task[Question 1][][
  #subtask[Subpart 1]
  #subtask[
     Subpart 2
  ]
]

#task[Question 2][Hint or something][
  Answer 2
]
