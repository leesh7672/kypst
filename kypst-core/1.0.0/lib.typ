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
  size-heading: 24pt,
  size-body: 12pt,
  color-heading: "#808f00",
  color-body: "#101d00",
  color-accent: "#dddfd0",
  color-background: "#fdfff8",
  content,
) = {
  let _terms = (author: "작성", date: "날짜")
  let _terms-hanja = (author: "作成", date: "時日")
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
  )
  set text(
    font: font-body,
    fill: rgb(color-body),
    size: size-body,
    lang: lang,
  )
  show heading: set text(
    font: font-heading,
    fill: rgb(color-heading),
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
      font: font-heading,
      fill: rgb(color-heading),
      size: size-heading,
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
          (author: author, date: date.display("[Year]. [Month]. [Day]."))
            + metadata
        ) {
          (
            text(
              if hanja {
                _terms-hanja
              } else {
                _terms
              }.at(key),
              font: font-heading,
              fill: rgb(color-heading),
            ),
            text(
              value,
            ),
          )
        }
      ),
    ),
  )
  show document: set text(
    size: size-body,
  )
  content
}
