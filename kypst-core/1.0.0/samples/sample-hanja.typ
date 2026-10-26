#import "@kypst/kypst-core:1.0.0": kypst-core

#show: kypst-core.with(hanja: true)

= 章

== 節

順次目錄은 다음과 같이 提示한다.

+ 項目
  + 小項目
  + 小項目

表는 다음과 같이 提示한다.

#table(
  columns: 3,

  table.header([*年*], [*生産量*], [*累計*]),

  [2020], [1,000], [1,000],

  [2021], [1,200], [2,200],

  [2022], [1,500], [3,700],
) 
