# The `vienna-tech` Template
<div align="center">Version 0.1.0</div>

This is a template, modeled after the LaTeX template provided by the Vienna University of Technology for Engineering Students. It is intended to be used as a starting point for writing Bachelor's or Master's theses, but can be adapted for other purposes as well. It shall be noted that this template is not an official template provided by the Vienna University of Technology, but rather a personal effort to provide a similar template in a new typesetting system.

## Template adaptation checklist

- [x] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [x] Check and/or replace `LICENSE` by something that suits your needs
- [x] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [ ] Adapt Repository URLs in `CHANGELOG.md`
  - Consider only committing that file with your first release, or removing the "Initial Release" part in the beginning
- [ ] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [ ] check the values under `env:`, particularly `REGISTRY_REPO`
    - [ ] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`
    - [ ] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README

## Getting Started

These instructions will get you a copy of the project up and running on the typst web app. Perhaps a short code example on importing the package and a very simple teaser usage.

```typ
#import "@preview/vienna-tech:0.1.0": *

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
  bibliography: bibliography("bibliography.bib"), 
  appendix: [Hier wird der Anhang eingefügt.], 
    )
```