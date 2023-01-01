---\startcomponent luatex-firstpage
---
---\startstandardmakeup
---
---    \start
---        \raggedleft
---        \definedfont[Bold*default at 48pt]
---        \setupinterlinespace
---        \blue \documentvariable{manual} \endgraf Reference \endgraf Manual \endgraf
---    \stop
---
---    \vfill
---
---    \definedfont[Bold*default at 12pt]
---
---    \starttabulate[|l|l|]
---        \NC copyright \EQ Lua\TeX\ development team \NC \NR
---        \NC more info \EQ www.luatex.org \NC \NR
---        \NC version   \EQ \currentdate \doifsomething{\documentvariable{snapshot}}{(snapshot \documentvariable{snapshot})} \NC \NR
---    \stoptabulate
---
---\stopstandardmakeup
---
---\setupbackgrounds
---  [leftpage]
---  [setups=pagenumber:left]
---
---\setupbackgrounds
---  [rightpage]
---  [setups=pagenumber:right]
---
---\stopcomponent
---