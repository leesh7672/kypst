#let kypst-core(
  title: "서식",
  title-hanja: "書式",
  author: "홍길동",
  date: datetime.today(),
  metadata: {},
  terms: auto,
  terms-hanja: auto,
  version: "1.0.0",
  hanja: false,
  lang: "kor",
  paper-size: "a4",
  margin: 2cm,
  font-heading: "Noto Sans KR",
  font-body: "Noto Serif KR",
  font-title: "Noto Sans KR",
  size-heading: 12pt,
  size-body: 12pt,
  size-title: 24pt,
  color-theme: "#8f8000",
  color-body: "#1d1000",
  color-background: "#fff8f0",
  content,
) = {
  let _terms = (author: "작성자", date: "작성일")
  let _terms-hanja = (author: "作成者", date: "作成日")
  let _terms = if terms != auto {
    _terms + terms
  } else {
    _terms
  }
  let _terms-hanja = if terms-hanja != auto {
    terms-hanja + _terms-hanja
  } else {
    _terms-hanja
  }
  set document(
    title: title,
    author: author,
    date: date,
  )
  set page(
    paper: paper-size,
    margin: 2cm,
    fill: rgb(color-background),
    header: align(
      right,
      text(
        context here().page(),
        fill: rgb(color-theme),
      ),
    ),
  )
  set text(
    font: font-body,
    fill: rgb(color-body),
    size: size-body,
    lang: lang,
  )
  set par(
    first-line-indent: 1em,
  )
  set heading(numbering: "1.1.1.1.")
  set enum(numbering: "1가ai.", indent: 0.25cm)
  set list(indent: 0.25cm)
  show heading: set text(
    font: font-heading,
    fill: rgb(color-theme),
    size: size-heading,
  )
  align(
    center,
    text(
      if hanja {
        title-hanja
      } else {
        title
      },
      font: font-title,
      fill: rgb(color-theme),
      size: size-title,
    ),
  )
  align(
    right,
    block(
      width: 50%,
      grid(
        columns: (2cm, 100% - 2cm),
        rows: 1.5em,
        align: left,
        ..for (key, value) in (
          (author: author)
            + metadata
            + (date: date.display("[Year]. [Month]. [Day]."))
        ) {
          (
            text(
              if hanja {
                _terms-hanja
              } else {
                _terms
              }.at(key),
              font: font-heading,
              fill: rgb(color-theme),
            ),
            text(
              value,
            ),
          )
        }
      ),
    ),
  )
  set table(
    fill: luma(75%, 50%),
    gutter: 2.5pt,
    stroke: none,
  )
  content
  align(
    center,
    text(
      [끝],
      font: font-heading,
      fill: rgb(color-theme),
    ),
  )
}
