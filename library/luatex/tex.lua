---@meta
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex = {}

_N._10_3_2_internal_parameter_values_set_get = "page 190"

---
---The integer parameters accept and return Lua numbers. These are read-write:
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L284-350](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L284-350)
---@alias ReadWriteIntegerParameter
---| 'adjdemerits' # Penalty for adjacent visually incompatible lines. Default: `10000`.
---| 'binoppenalty' # Penalty for breaking after a binary operator not enclosed in a subformula. Default: `700`.
---| 'brokenpenalty' # Additional penalty for breaking a page after a hyphenated line. Default: `100`
---| 'catcodetable' # Catcode tables are a new feature that allows you to switch to a predefined catcode regime in a single statement.
---| 'clubpenalty' # Extra penalty for breaking a page after the first line of a paragraph. In Plain TeX this is `150`. This amount, and the following penalties, are added to the `\interlinepenalty`, and a penalty of the resulting size is inserted after the `\hbox` containing the first line of a paragraph instead of the `\interlinepenalty`.
---| 'day' # The day of the current job.
---| 'defaulthyphenchar' # Value of `\hyphenchar` when a font is loaded. Default: `‘\-`.
---| 'defaultskewchar' # Value of `\skewchar` when a font is loaded.
---| 'delimiterfactor' # `1000` times the fraction of a delimited formula that should be covered by a delimiter. Default: `901`.
---| 'displaywidowpenalty' # Extra penalty for breaking a page before the last line above a display formula. The default value in Plain TeX is `50`.
---| 'doublehyphendemerits' # Penalty for consecutive lines ending with a hyphen. Default: `10000`.
---| 'endlinechar' # The character code of the end-of-line character appended to input lines. IniTEX default: `13`.
---| 'errorcontextlines' # (TeX3 only) Number of additional context lines shown in error messages.
---| 'escapechar' # Number of the character that is to be used for the escape character when control sequences are being converted into character tokens. IniTEX default: `92` (`\`).
---| 'exhyphenpenalty' # Penalty for breaking a horizontal line at a discretionary item in the special case where the prebreak text is empty. Default: `50`.
---| 'fam' # The number of the current font family.
---| 'finalhyphendemerits' # Penalty added when the penultimate line of a paragraph ends with a hyphen. Default: `5000`.
---| 'floatingpenalty' # Penalty added when an insertion is split.
---| 'globaldefs' # Parameter for overriding \global prefixes. IniTEX default: `0`.
---| 'hangafter' # If positive, this denotes the number of lines before indenting starts; if negative, the absolute value of this is the number of indented lines starting with the first line of the paragraph. Default: `1`.
---| 'hbadness' # Amount of tolerance before TEX reports an underfull or overfull horizontal box.
---| 'holdinginserts' # (TeX3 only) If this is positive, insertions are not placed in their boxes at output time.
---| 'hyphenpenalty' # Penalty associated with break at a discretionary item in the general case. Default: `50`.
---| 'interlinepenalty' # Penalty for breaking a page between lines of a paragraph. Default: `0`
---| 'language' # Choose a set of hyphenation patterns and exceptions.
---| 'lastlinefit' # A readable and writable integer parameter that accepts and returns Lua numbers.
---| 'lefthyphenmin' # (TeX3 only) Minimal number of characters before a hyphenation. Default: `2`.
---| 'linepenalty' # Penalty value associated with each line break. Default: `10`.
---| 'localbrokenpenalty' # Local broken penalty (from `\localbrokenpenalty`).
---| 'localinterlinepenalty' # Local interline penalty (from `\localinterlinepenalty`).
---| 'looseness' # Number of lines by which this paragraph has to be made longer than it would be ideally.
---| 'mag' # `1000` times the magnification of the document.
---| 'maxdeadcycles' # The maximum number of times that the output routine is allowed to be called without a `\shipout` occurring. IniTEX default: `25`.
---| 'month' # The month of the current job.
---| 'newlinechar' # Number of the character that triggers a new line in `\write` statements.
---| 'outputpenalty' # Value of the penalty at the current page break, or `10000` if the break was not at a penalty.
---| 'pausing' # Specify that TEX should pause after each line that is read from a file.
---| 'postdisplaypenalty' # Penalty placed in the vertical list below a display. Default: `0`.
---| 'predisplaydirection' # An internal read/write integer, to indicate the direction of the last partial paragraph before a display; it is used to control the placement of elements such as equation numbers, and can be explictly set to affect this placement.
---| 'predisplaypenalty' # Penalty placed in the vertical list above a display. Default: `10000`.
---| 'pretolerance' # Tolerance value for a paragraph without hyphenation. Default: `100`.
---| 'relpenalty' # Penalty for breaking after a binary relation not enclosed in a subformula. Default: `500`.
---| 'righthyphenmin' # (TeX3 only) Minimum number of characters after a hyphenation. Default: `3`.
---| 'savinghyphcodes' # When a `\patterns` command is executed and \savinghyphcodes has a positive value, the current `\lccode` values are saved as hyphenation codes for the current language.
---| 'savingvdiscards' # When ε-TEX’s parameter `\savingvdiscards` has been assigned a positive value, these ‘discarded items’ are saved in two lists and can be recovered by the commands `\pagediscards` and `\splitdiscards` that act like ‘unvboxing’ hypothetical box registers containing a vbox with the discarded items.
---| 'showboxbreadth' # Number of successive elements on each level that are shown when boxes are displayed.
---| 'showboxdepth' # The number of levels of box dump that are shown when boxes are displayed.
---| 'time' # Number of minutes after midnight that the current job started.
---| 'tolerance' # Tolerance value for lines in a paragraph with hyphenation. Default: `200`.
---| 'tracingassigns' # When the program is compiled with the code for collecting statistics and `\tracingassigns` has a value of `1` or more, all assignments subject to TeX’s grouping mechanism are traced.
---| 'tracingcommands' # If this is `1` TEX displays primitive commands executed; if this is `2` or more the outcome of conditionals is also recorded.
---| 'tracinggroups' # When `\tracinggroups` has a value of `1` or more, the start and end of each save group is traced, together with the starting line and grouping level.
---| 'tracingifs' # When `\tracingifs` has a value of `1` or more, all conditionals (including `\unless`, `\or`, `\else`, and `\fi`) are traced, together with the starting line and nesting level.
---| 'tracinglostchars' # If this parameter is positive, TeX gives diagnostic messages whenever a character is accessed that is not present in a font. Plain default: `1`.
---| 'tracingmacros' # If this is `1`, the log file shows expansion of macros that are performed and the actual values of the arguments; if this is `2` or more token parameters such as `\output` and `\everypar` are also traced.
---| 'tracingnesting' # When `\tracingnesting` has a value of `1` or more, these anomalies are shown; when `\tracingnesting` has a value of `2` or more, the current context (traceback) is shown as well.
---| 'tracingonline' # If this parameter is positive, TeX will write trace information to the terminal in addition to the log file.
---| 'tracingoutput' # If this is positive, the log file shows a dump of boxes that are shipped to the dvi file.
---| 'tracingpages' # If this parameter is positive, TeX generates a trace of the page breaking algorithm.
---| 'tracingparagraphs' # If this parameter is positive, TeX generates a trace of the line breaking algorithm.
---| 'tracingrestores' # If this parameter is positive, TEX will report all values that are restored when a group ends.
---| 'tracingscantokens' # When `\tracingscantokens` has a value of `1` or more, the opening and closing of pseudo-files (generated by `\scantokens`) is recorded as for any other file, with ‘␣’ as filename.
---| 'tracingstats' # If this parameter is `1`, TeX reports at the end of the job the usage of various internal arrays; if it is `2`, the memory demands are given whenever a page is shipped out.
---| 'uchyph' # Positive to allow hyphenation of words starting with a capital letter. Default: `1`.
---| 'vbadness' # Amount of tolerance before TEX reports an underfull or overfull vertical box.
---| 'widowpenalty' # Additional penalty for breaking a page before the last line of a paragraph. Default: `150`.
---| 'year' # The year of the current job.

---
---The integer parameters accept and return Lua numbers. These are read-only:
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L358-366](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L358-366)
---@alias ReadOnlyIntegerParameter
---| 'deadcycles' # Counter that keeps track of how many times the output routine has been called without a `\shipout` taking place.
---| 'insertpenalties' # Total of penalties for split insertions. Inside the output routine, the number of held-over insertions.
---| 'parshape' # Command for general paragraph shapes.
---| 'interlinepenalties' # An extension to `\interlinepenalty` that allows different penalties to be added after each line. It takes a space separated list of numbers as value. If `n` is positive interlinepenalties `n i_1 ... i_n` specifies the penalty to be used after each of the lines in a paragraph, with the last value being repeated as often as needed if the paragraph has more then `n` lines.
---| 'clubpenalties' # An extension to `\clubpenalty` that allows different penalties to be added after each line. It takes a space separated list of numbers as value. If `n` is positive clubpenalties `n i_1 ... i_n` specifies the penalty to be used after each of the lines in a paragraph, with the last value being repeated as often as needed if the paragraph has more then `n` lines.
---| 'widowpenalties' # An extension to `\widowpenalty` that allows different penalties to be added after each line. It takes a space separated list of numbers as value. If `n` is positive widowpenalties `n i_1 ... i_n` specifies the penalty to be used after each of the lines in a paragraph, with the last value being repeated as often as needed if the paragraph has more then `n` lines. Lines are counted backwards from the last line in this case.
---| 'displaywidowpenalties' # An extension to `\widowpenalty` that allows different penalties to be added after each line. It takes a space separated list of numbers as value. If `n` is positive displaywidowpenalties `n i_1 ... i_n` specifies the penalty to be used after each of the lines in a paragraph, with the last value being repeated as often as needed if the paragraph has more then `n` lines. Lines counted backwards from each display math within a paragraph.
---| 'prevgraf' # The number of lines in the paragraph last added to the vertical list.
---| 'spacefactor' # `1000` times the ratio by which the stretch (shrink) component of the interword glue should be multiplied (divided).

---
---The dimension parameters accept Lua numbers (signifying scaled points) or
---strings (with included dimension). The result is always a number in scaled
---points. These are read-write:
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L378-407](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L378-407)
---@alias ReadWriteDimensionParameter
---| 'boxmaxdepth' # Maximum allowed depth of boxes. Default: `\maxdimen`.
---| 'delimitershortfall' # Size of the part of a delimited formula that is allowed to go uncovered by a delimiter. Default: `5pt`.
---| 'displayindent' # Distance by which the box, in which the display is centred, is indented owing to hanging indentation.
---| 'displaywidth' # Width of the box in which the display is centred.
---| 'emergencystretch' # (TeX3 only) Assumed extra stretchability in lines of a paragraph.
---| 'hangindent' # If positive, this indicates indentation from the left margin; if negative, this is the negative of the indentation from the right margin.
---| 'hfuzz' # Excess size that TeX tolerates before it considers a horizontal box overfull.
---| 'hoffset' # Distance by which the page is shifted right with respect to the reference point.
---| 'hsize' # Line width used for typesetting a paragraph. Default: `6.5in`.
---| 'lineskiplimit' # Distance to be maintained between the bottom and top of neighbouring boxes on a vertical list. Default: `0pt`.
---| 'mathsurround' # Kern amount placed before and after in-line formulas.
---| 'maxdepth' # Maximum depth of the page box. Default: `4pt`.
---| 'nulldelimiterspace' # Width taken for empty delimiters. Default: `1.2pt`.
---| 'overfullrule' # Width of the rule that is printed to indicate overfull horizontal boxes.
---| 'pagebottomoffset' # To set the bottom margin in non-TLT text.
---| 'pageheight' # The page height of the PDF output (the screen, the paper, etc.).
---| 'pageleftoffset' # To set the left margin in non-TLT text.
---| 'pagerightoffset' # To set the right margin in non-TLT text.
---| 'pagetopoffset' # To set the top margin in non-TLT text.
---| 'pagewidth' # The page width of the PDF output (the screen, the paper, etc.).
---| 'parindent' # Width of the indentation box added in front of a paragraph. Default: `20pt`.
---| 'predisplaysize' # Effective width of the line preceding the display.
---| 'scriptspace' # Extra space after subscripts and superscripts. Default: `0.5pt`.
---| 'splitmaxdepth' # Maximum depth of a box split off by a `\vsplit` operation. Default: `\maxdimen`.
---| 'vfuzz' # Excess size that TeX tolerates before it considers a vertical box overfull.
---| 'voffset' # Distance by which the page is shifted right/down with respect to the reference point.
---| 'vsize' # Height of the page box. Default: `8.9in`.
---| 'prevdepth' # Depth of the last box added to a vertical list as it is perceived by TeX.
---| 'prevgraf' # The number of lines in the paragraph last added to the vertical list.
---| 'spacefactor' # `1000` times the ratio by which the stretch (shrink) component of the interword glue should be multiplied (divided).

---
---The dimension parameters accept Lua numbers (signifying scaled points) or
---strings (with included dimension). The result is always a number in scaled
---points. These are read-only:
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L415-422](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L415-422)
---@alias ReadOnlyDimensionParameter
---| 'pagedepth' # Depth of the current page.
---| 'pagefilllstretch' # Accumulated third-order stretch of the current page.
---| 'pagefillstretch' # Accumulated second-order stretch of the current page.
---| 'pagefilstretch' # Accumulated first-order stretch of the current page.
---| 'pagegoal' # Goal height of the page box. This starts at `\vsize`, and is diminished by heights of insertion items.
---| 'pageshrink' # Accumulated shrink of the current page.
---| 'pagestretch' # Accumulated zeroth-order stretch of the current page.
---| 'pagetotal' # Accumulated natural height of the current page.

---
---The direction parameters are read-only and return a Lua string.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L465-469](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L465-469)
---@alias DirectionParameter
---| 'bodydir' # The direction for vboxes, including the main body of text. Default: `TLT`.
---| 'mathdir' # The direction for mathematics. Default: `TLT`.
---| 'pagedir' # The direction for pages (`\shipout`). Default: `TLT`.
---| 'pardir' # The direction for paragraphs. Default: `TLT`.
---| 'textdir' # The direction for text and hboxes. Default: `TLT`.

---
---The glue parameters accept and return a userdata object that
---represents a `glue_spec` node.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L479-493](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L479-493)
---@alias GlueParameter
---| 'abovedisplayshortskip' # Glue above a display if the line preceding the display was short. Default: `0pt plus 3pt`.
---| 'abovedisplayskip' # Glue above a display. Default: `12pt plus 3pt minus 9pt`.
---| 'baselineskip' # The ‘ideal’ baseline distance between neighbouring boxes on a vertical list. Default: `12pt`.
---| 'belowdisplayshortskip' # Glue above/below a display if the line preceding the display was short. Default: `0pt plus 3pt` and `7pt plus 3pt minus 4pt` respectively.
---| 'belowdisplayskip' # Glue below a display. Default: `12pt plus 3pt minus 9pt`.
---| 'leftskip' # Glue that is placed to the left of all lines of a paragraph.
---| 'lineskip' # Glue added if the distance between bottom and top of neighbouring boxes is less than `\lineskiplimit`. Default: `1pt`.
---| 'parfillskip' # Glue that is placed between the last element of the paragraph and the line end. Default: `0pt plus 1fil`.
---| 'parskip' # Amount of glue added to the surrounding vertical list when a paragraph starts. Default: `0pt plus 1pt`.
---| 'rightskip' # Glue that is placed to the right of all lines of a paragraph.
---| 'spaceskip' # Interword glue if non-zero.
---| 'splittopskip' # Minimum distance between the top of what remains after a `\vsplit` operation, and the first item in that box. Default: `10pt`.
---| 'tabskip' # Amount of glue in between columns (rows) of an `\halign` (`\valign`).
---| 'topskip' # Minimum distance between the top of the page box and the baseline of the first box on the page. Default: `10pt`.
---| 'xspaceskip' # Interword glue if non-zero and `\spacefactor` ≥ 2000.

---
---All muglue (math units) parameters are to be used read-only and return a Lua string.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L503-505](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L503-505)
---@alias MuglueParameter
---| 'medmuskip' # Medium amount of mu (math units) glue.
---| 'thickmuskip' # Large amount of mu (math units) glue.
---| 'thinmuskip' # Small amount of mu (math units) glue.

---
---The tokenlist parameters accept and return Lua strings. Lua strings are
---converted to and from token lists using `\the\toks` style expansion:
---all category codes are either space (10) or other (12). It follows that assigning
---to some of these, like `tex.output`, is actually useless, but it feels bad
---to make exceptions in view of a coming extension that will accept full-blown
---token strings.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L520-529](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L520-529)
---@alias TokenlistParameter
---| 'errhelp' # Tokens that will be displayed if the user asks further help after an `\errmessage`.
---| 'everycr' # Token list inserted after every `\cr` or non-redundant `\crcr`.
---| 'everydisplay' # Token list inserted at the start of a display.
---| 'everyeof' # The content of this token list is injected when a file ends.
---| 'everyhbox' # Token list inserted at the start of a horizontal box.
---| 'everyjob' # Token list that is inserted at the start of each new job.
---| 'everymath' # Token list inserted at the start of non-display math.
---| 'everypar' # Token list inserted in front of paragraph text.
---| 'everyvbox' # Token list inserted at the start of a vertical box.
---| 'output' # Token list with instructions for shipping out pages.

---
---@alias InternalParameter
---| ReadWriteIntegerParameter
---| ReadOnlyIntegerParameter
---| ReadWriteDimensionParameter
---| ReadOnlyDimensionParameter
---| DirectionParameter
---| GlueParameter
---| MuglueParameter
---| TokenlistParameter

---
---Set the given TeX parameter globally.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param global 'global' # It is possible to use `global` as the first argument to `tex.set`; this makes the assignment global instead of local.
---@param parameter InternalParameter # The name of the TeX parameter.
---@param ... any
function tex.set(global, parameter, ...) end

---
---Set the given TeX parameter.
---
---When you set a glue quantity you can either pass a `glue_spec` or upto five numbers.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param parameter InternalParameter # The name of the TeX parameter.
---@param ... any
function tex.set(parameter, ...) end

---
---Set the given glue parameter globally by specifying the `width`, `stretch`,
---`stretch_order`, `shrink` and `shrink_order` of the glue.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param global 'global' # It is possible to use `global` as the first argument to `tex.set`; this makes the assignment global instead of local.
---@param parameter GlueParameter # The name of the glue parameter.
---@param width integer # The horizontal or vertical displacement.
---@param stretch? integer # An extra (positive) displacement or stretch amount.
---@param stretch_order? integer # Factor applied to stretch amount.
---@param shrink? integer # An extra (negative) displacement or shrink amount.
---@param shrink_order? integer # Factor applied to shrink amount.
function tex.set(global, parameter, width, stretch, stretch_order, shrink, shrink_order) end

---
---Set the given glue parameter by specifying the `width`, `stretch`,
---`stretch_order`, `shrink` and `shrink_order` of the glue.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param parameter GlueParameter # The name of the glue parameter.
---@param width integer # The horizontal or vertical displacement.
---@param stretch? integer # An extra (positive) displacement or stretch amount.
---@param stretch_order? integer # Factor applied to stretch amount.
---@param shrink? integer # An extra (negative) displacement or shrink amount.
---@param shrink_order? integer # Factor applied to shrink amount.
function tex.set(parameter, width, stretch, stretch_order, shrink, shrink_order) end

---
---Set the given glue parameter globally using a `glue_spec` node.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param global 'global' # It is possible to use `global` as the first argument to `tex.set`; this makes the assignment global instead of local.
---@param parameter GlueParameter # The name of the glue parameter.
---@param glue_spec GlueSpecNode # A glue spec node.
function tex.set(global, parameter, glue_spec) end

---
---Set the given glue parameter using a `glue_spec` node.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1714-1813](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/80a00d7131ae569d4a49f374e988226fe20de0d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1714-1813)
---
---@param parameter GlueParameter # The name of the glue parameter.
---@param glue_spec GlueSpecNode # A glue spec node.
function tex.set(parameter, glue_spec) end

---
---Query the given TeX parameter.
---
---The exact return values differ depending on the actual parameter.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2120-L2200](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2120-L2200)
---@param parameter InternalParameter
---@param opts? boolean
---
---@return any ...
function tex.get(parameter, opts) end

---
---Query the given glue parameter.
---
---The exact return values differ depending on the actual parameter.
---
---Glue is kind of special:
---The return value
---is a `glue_spec` node but when you pass `false` as last argument to
---`tex.get` you get the width of the glue and when you pass `true` you
---get all five values. Otherwise you get a node which is a copy of the internal
---value so you are responsible for its freeing at the *Lua* end.
---
---If
---you pass `true` to `get` you get 5 values returned for a glue and
---when you pass `false` you only get the width returned.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2120-L2200](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2120-L2200)

---
---@param parameter GlueParameter
---
---@return GlueSpecNode
function tex.get(parameter) end

---
---Query the given glue parameter.
---
---The exact return values differ depending on the actual parameter.
---
---Glue is kind of special:
---The return value
---is a `glue_spec` node but when you pass `false` as last argument to
---`tex.get` you get the width of the glue and when you pass `true` you
---get all five values. Otherwise you get a node which is a copy of the internal
---value so you are responsible for its freeing at the *Lua* end.
---
---If
---you pass `true` to `get` you get 5 values returned for a glue and
---when you pass `false` you only get the width returned.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2120-L2200](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2120-L2200)
---@param parameter GlueParameter
---@param all true
---
---@return integer width  # The horizontal or vertical displacement.
---@return integer stretch  # An extra (positive) displacement or stretch amount.
---@return integer stretch_order  # Factor applied to stretch amount.
---@return integer shrink  # An extra (negative) displacement or shrink amount.
---@return integer shrink_order  # Factor applied to shrink amount.
function tex.get(parameter, all) end

---
---Query the given glue parameter.
---
---The exact return values differ depending on the actual parameter.
---
---Glue is kind of special:
---The return value
---is a `glue_spec` node but when you pass `false` as last argument to
---`tex.get` you get the width of the glue and when you pass `true` you
---get all five values. Otherwise you get a node which is a copy of the internal
---value so you are responsible for its freeing at the *Lua* end.
---
---If
---you pass `true` to `get` you get 5 values returned for a glue and
---when you pass `false` you only get the width returned.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2120-L2200](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2120-L2200)
---@param parameter GlueParameter
---@param all false
---
---@return integer width  # The horizontal or vertical displacement.
function tex.get(parameter, all) end

_N._10_3_2_1_integer_parameters_read_write = "page 190"

---
---`\adjdemerits`: Penalty for adjacent visually incompatible lines.
---Default: `10000`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.adjdemerits = 0

---
---`\binoppenalty`: Penalty for breaking after a binary operator not
---enclosed in a subformula. Default: `700`
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.binoppenalty = 0

---
---`\brokenpenalty`: Additional penalty for breaking a page after a
---hyphenated line. Default: `100`.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 💁🏻 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.brokenpenalty = 0

---
---Catcode tables are a new feature that allows you to switch to a
---predefined catcode regime in a single statement.
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.catcodetable = 0

---
---`\clubpenalty`: Extra penalty for breaking a page after the first
---line of a paragraph. In Plain TeX this is `150`. This amount, and the
---following penalties, are added to the `\interlinepenalty`, and a
---penalty of the resulting size is inserted after the `\hbox`
---containing the first line of a paragraph instead of the
---`\interlinepenalty`.
---
---__Reference:__
---
---* [TeX by Topic, page 227](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.clubpenalty = 0

---
---`\day`: The day of the current job.
---
---__Reference:__
---
---* [TeX by Topic, page 257](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.day = 0

---
---`\defaulthyphenchar`: Value of `\hyphenchar` when a font is loaded.
---Default: `‘\-`.
---
---__Reference:__
---
---* [TeX by Topic, page 52](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.defaulthyphenchar = 0

---
---`\defaultskewchar`: Value of `\skewchar` when a font is loaded.
---
---__Reference:__
---
---* [TeX by Topic, page 190](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.defaultskewchar = 0

---
---`\delimiterfactor`: `1000` times the fraction of a delimited formula
---that should be covered by a delimiter. Default: `901`.
---
---__Reference:__
---
---* [TeX by Topic, page 190](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.delimiterfactor = 0

---
---`\displaywidowpenalty`: Extra penalty for breaking a page before the
---last line above a display formula. The default value in Plain TeX
---is `50`.
---
---__Reference:__
---
---* [TeX by Topic, page 229](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.displaywidowpenalty = 0

---
---`\doublehyphendemerits`: Penalty for consecutive lines ending with a
---hyphen. Default: `10000`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.doublehyphendemerits = 0

---
---`\endlinechar`: The character code of the end-of-line character
---appended to input lines. IniTEX default: `13`.
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.endlinechar = 0

---
---`\errorcontextlines`: (TeX3 only) Number of additional context lines
---shown in error messages.
---
---__Reference:__
---
---* [TeX by Topic, page 272](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.errorcontextlines = 0

---
---`\escapechar`: Number of the character that is to be used for the
---escape character when control sequences are being converted into
---character tokens. IniTEX default: `92` (`\`).
---
---__Reference:__
---
---* [TeX by Topic, page 43](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.escapechar = 0

---
---`\exhyphenpenalty`: Penalty for breaking a horizontal line at a
---discretionary item in the special case where the prebreak text is
---empty. Default: `50`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.exhyphenpenalty = 0

---
---`\fam`: The number of the current font family.
---
---__Reference:__
---
---* [TeX by Topic, page 196](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.fam = 0

---
---`\finalhyphendemerits`: Penalty added when the penultimate line of a
---paragraph ends with a hyphen. Default: `5000`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.finalhyphendemerits = 0

---
---`\floatingpenalty`: Penalty added when an insertion is split.
---
---__Reference:__
---
---* [TeX by Topic, page 240](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.floatingpenalty = 0

---
---`\globaldefs`: Parameter for overriding \global prefixes.
---IniTEX default: `0`.
---
---`\globaldefs` is a TeX internal parameter. Normally set to `0`. If
---set equal to a positive number, all following definitions and
---assignments are treated as if preceded by `\global`. If set equal to
---a negative number, none of the following definitions or assignments
---are global, meaning that an explicit `\global` is ignored. This
---remains in effect until `\globaldefs` is explicitly set to `0`
---again, or the group containing the `\globaldefs` reassignment ends
---(assuming it was not made global as well).
---
---__Reference:__
---
---* [TeX by Topic, page 105](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---* [Wikibook/TeX](https://en.wikibooks.org/wiki/TeX/globaldefs)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.globaldefs = 0

---
---`\hangafter`: If positive, this denotes the number of lines before
---indenting starts; if negative, the absolute value of this is the
---number of indented lines starting with the first line of the
---paragraph. Default: `1`.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hangafter = 0

---
---`\hbadness`: Amount of tolerance before TEX reports an underfull or
---overfull horizontal box.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hbadness = 0

---
---`\holdinginserts` (TeX3 only) If this is positive, insertions are
---not placed in their boxes at output time.
---
---__Reference:__
---
---* [TeX by Topic, page 240](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.holdinginserts = 0

---
---`\hyphenpenalty`: Penalty associated with break at a discretionary
---item in the general case. Default: `50`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hyphenpenalty = 0

---
---`\interlinepenalty`: Penalty for breaking a page between lines of a
---paragraph. Default: `0`.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.interlinepenalty = 0

---
---`\language`: Choose a set of hyphenation patterns and exceptions.
---
---__Reference:__
---
---* [TeX by Topic, page 176](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.language = 0

---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastlinefit = 0

---
---`\lefthyphenmin` (TeX3 only) Minimal number of characters before a
---hyphenation. Default: `2`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lefthyphenmin = 0

---
---`\linepenalty`: Penalty value associated with each line break.
---Default: `10`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.linepenalty = 0

---
---Local broken penalty (from `\localbrokenpenalty`)
---
------@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.localbrokenpenalty = 0

---
---Local interline penalty (from `\localinterlinepenalty`)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.localinterlinepenalty = 0

---
---`\looseness`: Number of lines by which this paragraph has to be made
---longer than it would be ideally.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.looseness = 0

---
---`\mag`: `1000` times the magnification of the document.
---
---__Reference:__
---
---* [TeX by Topic, page 257](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.mag = 0

---
---`\maxdeadcycles`: The maximum number of times that the output
---routine is allowed to be called without a `\shipout` occurring.
---IniTEX default: `25`.
---
---__Reference:__
---
---* [TeX by Topic, page 288](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.maxdeadcycles = 0

---
---`\month`: The month of the current job.
---
---__Reference:__
---
---* [TeX by Topic, page 257](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.month = 0

---
---`\newlinechar`: Number of the character that triggers a new line
---in `\write` statements.
---
---__Reference:__
---
---* [TeX by Topic, page 246](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.newlinechar = 0

---
---`\outputpenalty`: Value of the penalty at the current page break,
---or `10000` if the break was not at a penalty.
---
---__Reference:__
---
---* [TeX by Topic, page 289](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.outputpenalty = 0

---
---`\pausing`: Specify that TEX should pause after each line that is
---read from a file.
---
---__Reference:__
---
---* [TeX by Topic, page 246](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pausing = 0

---
---`\postdisplaypenalty`: Penalty placed in the vertical list below a
---display. Default: `0`
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.postdisplaypenalty = 0

---
---`\predisplaydirection`: An internal read/write integer, to indicate
---the direction of the last partial paragraph before a display; it is
---used to control the placement of elements such as equation numbers,
---and can be explictly set to affect this placement.
---
---__Reference:__
---
---* [The e-TeX Short Reference Manual](https://ftp.fau.de/ctan/systems/doc/etex/etex_ref.html#predisplaydirection)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.predisplaydirection = 0

---
---`\predisplaypenalty`: Penalty placed in the vertical list above a
---display. Default: `10000`.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.predisplaypenalty = 0

---
---`\pretolerance`: Tolerance value for a paragraph without
---hyphenation. Default: `100`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pretolerance = 0

---
---`\relpenalty`: Penalty for breaking after a binary relation not
---enclosed in a subformula. Default: `500`
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.relpenalty = 0

---
---`\righthyphenmin`: (TeX3 only) Minimum number of characters after a
---hyphenation. Default: `3`.
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.righthyphenmin = 0

---
---When a `\patterns` command is executed and \savinghyphcodes has a
---positive value, the current `\lccode` values are saved as
---hyphenation codes for the current language.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 11
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.savinghyphcodes = 0

---
---When ε-TEX’s parameter `\savingvdiscards` has been assigned a
---positive value, these ‘discarded items’ are saved in two lists and
---can be recovered by the commands `\pagediscards` and `\splitdiscards`
---that act like ‘unvboxing’ hypothetical box registers containing a
---vbox with the discarded items.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 12
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.savingvdiscards = 0

---
---`\showboxbreadth`: Number of successive elements on each level that
---are shown when boxes are displayed.
---
---__Reference:__
---
---* [TeX by Topic, page 267](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.showboxbreadth = 0

---
---`\showboxdepth`: The number of levels of box dump that are shown when
---boxes are displayed.
---
---__Reference:__
---
---* [TeX by Topic, page 267](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.showboxdepth = 0

---
---`\time`: Number of minutes after midnight that the current job
---started.
---
---__Reference:__
---
---* [TeX by Topic, page 257](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.time = 0

---
---`\tolerance`: Tolerance value for lines in a paragraph with
---hyphenation. Default: `200`.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tolerance = 0

---
---When the program is compiled with the code for collecting statistics and `\tracingassigns` has a value of `1` or more, all assignments subject to TeX’s grouping mechanism are traced.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 4
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingassigns = 0

---
---`\tracingcommands`: If this is `1` TEX displays primitive commands
---executed; if this is `2` or more the outcome of conditionals is also
---recorded.
---
---__Reference:__
---
---* [TeX by Topic, page 267](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingcommands = 0

---
---When `\tracinggroups` has a value of `1` or more, the start and end
---of each save group is traced, together with the starting line and
---grouping level.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 4
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracinggroups = 0

---
---When `\tracingifs` has a value of `1` or more, all conditionals
---(including `\unless`, `\or`, `\else`, and `\fi`) are traced,
---together with the starting line and nesting level.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 4
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingifs = 0

---
---`\tracinglostchars`: If this parameter is positive, TeX gives
---diagnostic messages whenever a character is accessed that is not
---present in a font. Plain default: `1`.
---
---__Reference:__
---
---* [TeX by Topic, page 268](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracinglostchars = 0

---
---`\tracingmacros`: If this is `1`, the log file shows expansion of
---macros that are performed and the actual values of the arguments;
---if this is `2` or more token parameters such as `\output` and
---`\everypar` are also traced.
---
---__Reference:__
---
---* [TeX by Topic, page 293](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingmacros = 0

---
---When `\tracingnesting` has a value of `1` or more, these anomalies
---are shown; when `\tracingnesting` has a value of `2` or more, the
---current context (traceback) is shown as well.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 5
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingnesting = 0

---
---`\tracingonline`: If this parameter is positive, TeX will write
---trace information to the terminal in addition to the log file.
---
---__Reference:__
---
---* [TeX by Topic, page 267](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingonline = 0

---
---`\tracingoutput`: If this is positive, the log file shows a dump of
---boxes that are shipped to the dvi file.
---
---__Reference:__
---
---* [TeX by Topic, page 267](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingoutput = 0

---
---`\tracingpages`: If this parameter is positive, TeX generates a
---trace of the page breaking algorithm.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingpages = 0

---
---`\tracingparagraphs`: If this parameter is positive, TeX
---generates a trace of the line breaking algorithm.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingparagraphs = 0

---
---`\tracingrestores`: If this parameter is positive, TeX will report
---all values that are restored when a group ends.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingrestores = 0

---
---When `\tracingscantokens` has a value of `1` or more, the opening
---and closing of pseudo-files (generated by `\scantokens`) is recorded
---as for any other file, with ‘␣’ as filename.
---
---__Reference:__
---
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 5
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingscantokens = 0

---
---`\tracingstats`: If this parameter is `1`, TeX reports at the end
---of the job the usage of various internal arrays; if it is `2`, the
---memory demands are given whenever a page is shipped out.
---
---__Reference:__
---
---* [TeX by Topic, page 268](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tracingstats = 0

---
---`\uchyph`: Positive to allow hyphenation of words starting with a
---capital letter. Default: `1`.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.uchyph = 0

---
---`\vbadness`: Amount of tolerance before TeX reports an underfull or
---overfull vertical box.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.vbadness = 0

---
---`\widowpenalty`: Additional penalty for breaking a page before the
---last line of a paragraph. Default: `150`
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.widowpenalty = 0

---
---`\year`: The year of the current job.
---
---__Reference:__
---
---* [TeX by Topic, page 257](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable integer parameter that accepts and returns Lua numbers.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.year = 0

_N._10_3_2_1_integer_parameters_read_only = "page 191"

---
---`\deadcycles`: Counter that keeps track of how many times the output
---routine has been called without a `\shipout` taking place.
---
---__Reference:__
---
---* [TeX by Topic, page 234](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.deadcycles = 0

---
---`\insertpenalties`: Total of penalties for split insertions.
---Inside the output routine, the number of held-over insertions.
---
---__Reference:__
---
---* [TeX by Topic, page 240](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.insertpenalties = 0

---
---`\parshape`: Command for general paragraph shapes.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.parshape = 0

---
---An extension to `\interlinepenalty` that allows different penalties
---to be added after each line. It takes a space separated list of
---numbers as value. If `n` is positive interlinepenalties
---`n i_1 ... i_n` specifies the penalty to be used after each of the
---lines in a paragraph, with the last value being repeated as often as
---needed if the paragraph has more then `n` lines.
---
---__Reference:__
---
---* [Stackoverflow: What are penalties and which ones are defined?](https://tex.stackexchange.com/a/51264)
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 10
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.interlinepenalties = 0

---
---An extension to `\clubpenalty` that allows different penalties to be
---added after each line. It takes a space separated list of numbers as
---value. If `n` is positive clubpenalties `n i_1 ... i_n` specifies the
---penalty to be used after each of the lines in a paragraph, with the
---last value being repeated as often as needed if the paragraph has
---more then `n` lines.
---
---__Reference:__
---
---* [Stackoverflow: What are penalties and which ones are defined?](https://tex.stackexchange.com/a/51264)
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 10
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.clubpenalties = 0

---
---An extension to `\widowpenalty` that allows different penalties to be
---added after each line. It takes a space separated list of numbers as
---value. If `n` is positive widowpenalties `n i_1 ... i_n` specifies
---the penalty to be used after each of the lines in a paragraph, with
---the last value being repeated as often as needed if the paragraph
---has more then `n` lines. Lines are counted backwards from the last
---line in this case.
---
---__Reference:__
---
---* [Stackoverflow: What are penalties and which ones are defined?](https://tex.stackexchange.com/a/51264)
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 10
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.widowpenalties = 0

---
---An extension to `\widowpenalty` that allows different penalties to be
---added after each line. It takes a space separated list of numbers as
---value. If `n` is positive displaywidowpenalties `n i_1 ... i_n`
---specifies the penalty to be used after each of the lines in a
---paragraph, with the last value being repeated as often as needed if
---the paragraph has more then `n` lines. Lines counted backwards from
---each display math within a paragraph.
---
---__Reference:__
---
---* [Stackoverflow: What are penalties and which ones are defined?](https://tex.stackexchange.com/a/51264)
---* The ε-TEX manual Version 2, February 1998 (updated March 2024), page 10
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.displaywidowpenalties = 0

---
---`\prevgraf`: The number of lines in the paragraph last added to the
---vertical list.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.prevgraf = 0

---
---`\spacefactor`: `1000` times the ratio by which the stretch (shrink)
---component of the interword glue should be multiplied (divided).
---
---__Reference:__
---
---* [TeX by Topic, page 185](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A read-only integer parameter that returns a Lua number.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.spacefactor = 0

_N._10_3_2_2_dimension_parameters_read_write = "page 191"

---
---`\boxmaxdepth`: Maximum allowed depth of boxes. Default: `\maxdimen`.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.boxmaxdepth = 0

---
---`\delimitershortfall`: Size of the part of a delimited formula that
---is allowed to go uncovered by a delimiter. Default: `5pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 190](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.delimitershortfall = 0

---
---`\displayindent`: Distance by which the box, in which the display is
---centred, is indented owing to hanging indentation.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.displayindent = 0

---
---`\displaywidth`: Width of the box in which the display is centred.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.displaywidth = 0

---
---`\emergencystretch` (TeX3 only) Assumed extra stretchability in
---lines of a paragraph.
---
---__Reference:__
---
---* [TeX by Topic, page 175](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.emergencystretch = 0

---
---`\hangindent`: If positive, this indicates indentation from the
---left margin; if negative, this is the negative of the indentation
---from the right margin.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hangindent = 0

---
---`\hfuzz`: Excess size that TeX tolerates before it considers a
---horizontal box overfull.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hfuzz = 0

---
---`\hoffset`:  Distance by which the page is shifted right with respect
---to the reference point.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hoffset = 0

---
---`\hsize`: Line width used for typesetting a paragraph.
---Default: `6.5in`.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.hsize = 0

---
---`\lineskiplimit`: Distance to be maintained between the bottom and
---top of neighbouring boxes on a vertical list. Default: `0pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lineskiplimit = 0

---
---`\mathsurround`: Kern amount placed before and after in-line
---formulas.
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.mathsurround = 0

---
---`\maxdepth`: Maximum depth of the page box. Default: `4pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.maxdepth = 0

---
---`\nulldelimiterspace`: Width taken for empty delimiters.
---Default: `1.2pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 190](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.nulldelimiterspace = 0

---
---`\overfullrule`: Width of the rule that is printed to indicate
---overfull horizontal boxes.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.overfullrule = 0

---
---`\pagebottomoffset`: To set the bottom margin in non-TLT text.
---
---__Reference:__
---
---* https://mirrors.aliyun.com/CTAN/systems/doc/aleph/News
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagebottomoffset = 0

---
---`\pageheight`: The page height of the PDF output (the screen, the
---paper, etc.).
---
---__Reference:__
---
---* pdfTeX-Manual, page 25
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pageheight = 0

---
---`\pageleftoffset`: To set the left margin in non-TLT text.
---
---__Reference:__
---
---* https://mirrors.aliyun.com/CTAN/systems/doc/aleph/News
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pageleftoffset = 0

---
---`\pagerightoffset`: To set the right margin in non-TLT text.
---
---__Reference:__
---
---* https://mirrors.aliyun.com/CTAN/systems/doc/aleph/News
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagerightoffset = 0

---
---`\pagetopoffset`: To set the top margin in non-TLT text.
---
---__Reference:__
---
---* https://mirrors.aliyun.com/CTAN/systems/doc/aleph/News
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagetopoffset = 0

---
---`\pagewidth`: The page width of the PDF output (the screen,
---the paper, etc.).
---
---__Reference:__
---
---* pdfTeX-Manual, page 25
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagewidth = 0

---
---`\parindent`: Width of the indentation box added in front of a
---paragraph. Default: `20pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.parindent = 0

---
---`\predisplaysize`: Effective width of the line preceding the display.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.predisplaysize = 0

---
---`\scriptspace`: Extra space after subscripts and superscripts.
---Default: `0.5pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 200](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.scriptspace = 0

---
---`\splitmaxdepth`: Maximum depth of a box split off by a `\vsplit`
---operation. Default: `\maxdimen`.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.splitmaxdepth = 0

---
---`\vfuzz`: Excess size that TeX tolerates before it considers a
---vertical box overfull.
---
---__Reference:__
---
---* [TeX by Topic, page 57](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.vfuzz = 0

---
---`\voffset`: Distance by which the page is shifted right/down with
---respect to the reference point.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.voffset = 0

---
---`\vsize`: Height of the page box. Default: `8.9in`.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.vsize = 0

---
---`\prevdepth`: Depth of the last box added to a vertical list as
---it is perceived by TeX.
---
---__Reference:__
---
---* [TeX by Topic, page 157](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.prevdepth = 0

---
---`\prevgraf`: The number of lines in the paragraph last added to the
---vertical list.
---
---__Reference:__
---
---* [TeX by Topic, page 290](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.prevgraf = 0

---
---`\spacefactor`: `1000` times the ratio by which the stretch (shrink)
---component of the interword glue should be multiplied (divided).
---
---__Reference:__
---
---* [TeX by Topic, page 185](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---* [The TexBook: page 76. Also: 76, 271, 285, 363, 433.](https://ctan.org/tex-archive/systems/knuth/dist/tex/texbook.tex)
---
---@type integer # A readable and writable dimension parameter that accepts a Lua number (signifying scaled points) or a string (with included dimension). The result is always a number in scaled points.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.spacefactor = 0

_N._10_3_2_2_dimension_parameters_read_only = "page 191"

---
---`\pagedepth`: Depth of the current page.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagedepth = 0

---
---`\pagefilllstretch`: Accumulated third-order stretch of the current
---page.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagefilllstretch = 0

---
---`\pagefillstretch`: Accumulated second-order stretch of the current
---page.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagefillstretch = 0

---
---`\pagefilstretch`: Accumulated first-order stretch of the current
---page.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagefilstretch = 0

---
---`\pagegoal`: Goal height of the page box. This starts at `\vsize`,
---and is diminished by heights of insertion items.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagegoal = 0

---
---`\pageshrink`: Accumulated shrink of the current page.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
------
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pageshrink = 0

---
---`\pagestretch`: Accumulated zeroth-order stretch of the current page.
---
---__Reference:__
---
---* [TeX by Topic, page ](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagestretch = 0

---
---`\pagetotal`: Accumulated natural height of the current page.
---
---__Reference:__
---
---* [TeX by Topic, page ](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---A read only dimension parameter. The result is always a number in scaled points.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagetotal = 0

_N._10_3_2_3_direction_parameters = "page 192"

---
---The direction for vboxes, including the main body of text.
---Default: `TLT`.
---
---__Reference:__
---
---* [README of the Omega engine](https://mirrors.ctan.org/obsolete/systems/omega/README)
---
---@type DirectionSpecifier A read-only direction parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.bodydir = "TLT"

---
---The direction for mathematics. Default: `TLT`.
---
---__Reference:__
---
---* [README of the Omega engine](https://mirrors.ctan.org/obsolete/systems/omega/README)
---
---@type DirectionSpecifier A read-only direction parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.mathdir = "TLT"

---
---The direction for pages (`\shipout`). Default: `TLT`.
---
---__Reference:__
---
---* [README of the Omega engine](https://mirrors.ctan.org/obsolete/systems/omega/README)
---
---@type DirectionSpecifier A read-only direction parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pagedir = "TLT"

---
---The direction for paragraphs. Default: `TLT`.
---
---__Reference:__
---
---* [README of the Omega engine](https://mirrors.ctan.org/obsolete/systems/omega/README)
---
---@type DirectionSpecifier A read-only direction parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.pardir = "TLT"

---
---The direction for text and hboxes. Default: `TLT`.
---
---__Reference:__
---
---* [README of the Omega engine](https://mirrors.ctan.org/obsolete/systems/omega/README)
---
---@type DirectionSpecifier A read-only direction parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.textdir = "TLT"

_N._10_3_2_4_glue_parameters = "page 193"

---
---`\abovedisplayshortskip`: Glue above a display if the line preceding
---the display was short. Default: `0pt plus 3pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.abovedisplayshortskip = nil

---
---`\abovedisplayskip`: Glue above a display.
---Default: `12pt plus 3pt minus 9pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.abovedisplayskip = nil

---
---`\baselineskip`: The ‘ideal’ baseline distance between neighbouring
---boxes on a vertical list. Default: `12pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 157](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.baselineskip = nil

---
---`\belowdisplayshortskip`: Glue above/below a display if the line
---preceding the display was short. Default: `0pt plus 3pt` and
---`7pt plus 3pt minus 4pt` respectively.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.belowdisplayshortskip = nil

---
---`\belowdisplayskip`: Glue below a display.
---Default: `12pt plus 3pt minus 9pt`.
---
---__Reference:__
---
---* [TeX by Topic, page ](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.belowdisplayskip = nil

---
---`\leftskip`: Glue that is placed to the left of all lines of a
---paragraph.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.leftskip = nil

---
---`\lineskip`: Glue added if the distance between bottom and top of
---neighbouring boxes is less than `\lineskiplimit`. Default: `1pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 157](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lineskip = nil

---
---`\parfillskip`: Glue that is placed between the last element of the
---paragraph and the line end. Default: `0pt plus 1fil`.
---
---__Reference:__
---
---* [TeX by Topic, page 166](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.parfillskip = nil

---
---`\parskip`: Amount of glue added to the surrounding vertical list
---when a paragraph starts. Default: `0pt plus 1pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 161](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.parskip = nil

---
---`\rightskip`: Glue that is placed to the right of all lines of a
---paragraph.
---
---__Reference:__
---
---* [TeX by Topic, page 170](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.rightskip = nil

---
---`\spaceskip`: Interword glue if non-zero.
---
---__Reference:__
---
---* [TeX by Topic, page 185](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.spaceskip = nil

---
---`\splittopskip`: Minimum distance between the top of what remains
---after a `\vsplit` operation, and the first item in that box.
---Default: `10pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 226](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.splittopskip = nil

---
---`\tabskip`: Amount of glue in between columns (rows) of an
---`\halign` (`\valign`).
---
---__Reference:__
---
---* [TeX by Topic, page 215](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.tabskip = nil

---
---`\topskip`: Minimum distance between the top of the page box and the
---baseline of the first box on the page. Default: `10pt`.
---
---__Reference:__
---
---* [TeX by Topic, page 224](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.topskip = nil

---
---`\xspaceskip`: Interword glue if non-zero and `\spacefactor` ≥ 2000.
---
---__Reference:__
---
---* [TeX by Topic, page 185](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type GlueSpecNode # A readable and writeable glue parameter that accepts and returns a userdata object which in turn represents a `glue_spec` node.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.xspaceskip = nil

_N._10_3_2_5_muglue_parameters = "page 193"

---
---`\medmuskip`: Medium amount of mu (math units) glue.
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string # A read-only `muglue` parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.medmuskip = ""

---
---`\thickmuskip`: Large amount of mu (math units) glue.
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string # A read-only `muglue` parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.thickmuskip = ""

---
---`\thinmuskip`: Small amount of mu (math units) glue.
---
---__Reference:__
---
---* [TeX by Topic, page 201](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string # A read-only `muglue` parameter that returns a *Lua* string.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.thinmuskip = ""

_N._10_3_2_6_tokenlist_parameters = "page 193"

---
---`\errhelp`: Tokens that will be displayed if the user asks further
---help after an `\errmessage`.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 272](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.errhelp = ""

---
---`\everycr`: Token list inserted after every `\cr` or
---non-redundant `\crcr`.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 215](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
-----
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everycr = ""

---
---`\everydisplay`: Token list inserted at the start of a display.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 210](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
-----
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everydisplay = ""

---
---`\everyeof`: The content of this token list is injected when a
---file ends.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* LuaMetaTeX-Manual, page 115
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everyeof = ""

---
---`\everyhbox`: Token list inserted at the start of a horizontal box.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 284](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everyhbox = ""

---
---`\everyjob`: Token list that is inserted at the start of each new
---job.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 254](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everyjob = ""

---
---`\everymath`: Token list inserted at the start of non-display math.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 284](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everymath = ""

---
---`\everypar`: Token list inserted in front of paragraph text.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 284](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everypar = ""

---
---`\everyvbox`: Token list inserted at the start of a vertical box.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 284](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.everyvbox = ""

---
---`\output`: Token list with instructions for shipping out pages.
---
---A `tokenlist` parameters that accepts and returns a *Lua* string.
---
---The *Lua* string is
---converted to and from a token list using `\the` `\toks` style expansion:
---all category codes are either space (10) or other (12).
---
---__Reference:__
---
---* [TeX by Topic, page 289](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.output = ""

_N._10_3_3_convert_commands = "page 193"

---
---@type string # for example `2.2`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.eTeXVersion = ""

---
---@type string # for example `2.2`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.eTeXrevision = ""

---
---@type string # for example `luatex`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.formatname = ""

---
---@type string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.jobname = ""

---
---@type string # for example `This is LuaTeX, Version 1.15.1 (TeX Live 2023/dev)`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.luatexbanner = ""

---
---@type string # for example `1`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.luatexrevision = ""

_N._10_3_4_last_item_commands = "page 194"

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastpenalty = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastkern = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastskip = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastnodetype = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.inputlineno = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastxpos = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lastypos = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.randomseed = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.luatexversion = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.eTeXminorversion = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.eTeXversion = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.currentgrouplevel = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.currentgrouptype = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.currentiflevel = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.currentiftype = 0

---
---All “last item” commands are read-only and return a number.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.currentifbranch = 0

_N._10_3_5_accessing_registers_set_get_and_is = "page 194"

---
---The attribute registers accept and return Lua numbers.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3698](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3698)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.attribute = {}

---
---* Corresponding C source code: [ltexlib.c#L1087-L1102](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1087-L1102)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\attributedef`.
---@param value integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setattribute(global, register, value) end

---
---* Corresponding C source code: [ltexlib.c#L1087-L1102](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1087-L1102)
---
---@param register string|integer # A register number or a predefined csname string from `\attributedef`.
---@param value integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setattribute(register, value) end

---
---* Corresponding C source code: [ltexlib.c#L1104-L1114](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1104-L1114)
---
---@param register string|integer # A register number or a predefined csname string from `\attributedef`.
---
---@return integer value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getattribute(register) end

---
---* Corresponding C source code: [ltexlib.c#L1080-L1083](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1080-L1083)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\attributedef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.isattribute(register) end

---
---The count registers accept and return *Lua* numbers.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3704](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3704)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.count = {}

---
---* Corresponding C source code: [ltexlib.c#L1051-L1066](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1051-L1066)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\countdef`.
---@param value integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcount(global, register, value) end

---
---* Corresponding C source code: [ltexlib.c#L1051-L1066](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1051-L1066)
---
---@param register string|integer # A register number or a predefined csname string from `\countdef`.
---@param value integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcount(register, value) end

---
---* Corresponding C source code: [ltexlib.c#L1068-L1078](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1068-L1078)
---
---@param register string|integer # A register number or a predefined csname string from `\countdef`.
---
---@return integer value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getcount(register) end

---
---* Corresponding C source code: [ltexlib.c#L1046-L1049](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1046-L1049)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\countdef`.
---
---@return false|integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.iscount(register) end

---
---The dimension registers accept *Lua* numbers (in scaled points) or
---strings (with an included absolute dimension; `em` and `ex`
---and `px` are forbidden). The result is always a number in scaled
---points.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3703](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3703)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.dimen = {}

---
---* Corresponding C source code: [ltexlib.c#L818-L834](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L818-L834)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\dimendef`.
---@param value integer|string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setdimen(global, register, value) end

---
---* Corresponding C source code: [ltexlib.c#L836-L846](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L836-L846)
---
---@param register string|integer # A register number or a predefined csname string from `\dimendef`.
---
---@return integer value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getdimen(register) end

---
---* Corresponding C source code: [ltexlib.c#L813-L816](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L813-L816)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\dimendef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.isdimen(register) end

---
---The glue registers are just skip registers but instead of userdata
---are verbose.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3700](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3700)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.glue = {}

---
---* Corresponding C source code: [ltexlib.c#L884-L903](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L884-L903)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---@param width? number
---@param stretch? number
---@param shrink? number
---@param stretch_order? integer
---@param shrink_order? integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setglue(global, register, width, stretch, shrink, stretch_order, shrink_order) end

---
---* Corresponding C source code: [ltexlib.c#L884-L903](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L884-L903)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---@param width? number
---@param stretch? number
---@param shrink? number
---@param stretch_order? integer
---@param shrink_order? integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setglue(register, width, stretch, shrink, stretch_order, shrink_order) end

---
---* Corresponding C source code: [ltexlib.c#L905-L949](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L905-L949)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---
---@return integer width
---@return integer stretch
---@return integer shrink
---@return integer stretch_order
---@return integer shrink_order
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getglue(register) end

---
---Alias of tex.isskip()
---
---* Corresponding C source code: [ltexlib.c#L848-L851](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L848-L851)
---
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.isglue(register) end

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3702](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3702)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.muglue = {}

---
---* Corresponding C source code: [ltexlib.c#L979-L998](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L979-L998)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---@param width? number
---@param stretch? number
---@param shrink? number
---@param stretch_order? integer
---@param shrink_order? integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmuglue(global, register, width, stretch, shrink, stretch_order, shrink_order) end

---
---* Corresponding C source code: [ltexlib.c#L979-L998](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L979-L998)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---@param width? number
---@param stretch? number
---@param shrink? number
---@param stretch_order? integer
---@param shrink_order? integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmuglue(register, width, stretch, shrink, stretch_order, shrink_order) end

---
---* Corresponding C source code: [ltexlib.c#L1000-L1044](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1000-L1044)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---
---@return integer width
---@return integer stretch
---@return integer shrink
---@return integer stretch_order
---@return integer shrink_order
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmuglue(register) end

---
---Alias of tex.ismuskip()
---
---* Corresponding C source code: [ltexlib.c#L951-L954](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L951-L954)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.ismuglue(register) end

---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3701](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3701)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.muskip = {}

---
---* Corresponding C source code: [ltexlib.c#L956-L965](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L956-L965)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---@param value Node
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmuskip(global, register, value) end

---
---* Corresponding C source code: [ltexlib.c#L956-L965](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L956-L965)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---@param value Node
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmuskip(register, value) end

---
---* Corresponding C source code: [ltexlib.c#L967-L977](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L967-L977)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---
---@return Node value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmuskip(register) end

---
---* Corresponding C source code: [ltexlib.c#L951-L954](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L951-L954)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\muskipdef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.ismuskip(register) end

---
---The skip registers accept and return `glue_spec` userdata node
---objects.
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3699](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3699)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.skip = {}

---
---* Corresponding C source code: [ltexlib.c#L853-L866](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L853-L866)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---@param skip GlueSpecNode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setskip(global, register, skip) end

---
---* Corresponding C source code: [ltexlib.c#L853-L866](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L853-L866)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---@param skip GlueSpecNode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setskip(register, skip) end

---
---* Corresponding C source code: [ltexlib.c#L868-L882](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L868-L882)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---
---@return GlueSpecNode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getskip(register) end

---
---* Corresponding C source code: [ltexlib.c#L848-L851](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L848-L851)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\skipdef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.isskip(register) end

---
---The token registers accept and return *Lua* strings. *Lua* strings are
---converted to and from token lists using `\the` `\toks` style
---expansion: all category codes are either space (10) or other (12).
---
---see `LuaTeX` manual: 10.3.5 Accessing registers: `set*`, `get*` and `is*`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3705](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3705)
---
---@type table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.toks = {}

---
---Set a toks register. Also accepts a predefined csname string.
---
---* Corresponding C source code: [ltexlib.c#L1125-L1158](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1125-L1158)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register string|integer # A register number or a predefined csname string from `\toksdef`.
---@param toks string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.settoks(global, register, toks) end

---
---Get a toks register. Also accepts a predefined csname string.
---
---* Corresponding C source code: [ltexlib.c#L1197-L1209](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1197-L1209)
---
---@param register string|integer # A register number or a predefined csname string from `\toksdef`.
---
---@return string toks
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.gettoks(register) end

---
---* Corresponding C source code: [ltexlib.c#L1120-L1123](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1120-L1123)
---* Corresponding C source code: [ltexlib.c#L350-L358](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L350-L358)
---
---@param register string|integer # A register number or a predefined csname string from `\toksdef`.
---
---@return false|integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.istoks(register) end

---
---For tokens registers we have an alternative where a catcode table is specified:
---
---```lua
---tex.scantoks(0,3,"$e=mc^2$")
---tex.scantoks("global",0,"$\\int\\limits^1_2$")
---```
---
---* Corresponding C source code: [ltexlib.c#L1160-L1195](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1160-L1195)
---
---@param global 'global'
---@param register integer
---@param catcodetable integer
---@param toks string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.scantoks(global, register, catcodetable, toks) end

---
---When no arguments are given the current maximum number of classes is returned.
---
---* Corresponding C source code: [ltexlib.c#L1211-L1242](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1211-L1242)
---
---@param position? 'top'|'bottom'|'first'|'splitbottom'|'splitfirst' # one of top, bottom, first, splitbottom or splitfirst
---@param class? integer marks class number.
---
---@return integer|string
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmark(position, class) end

_N._10_3_6_character_code_registers_get_set_code_s_ = "page 196"

---
---The *TeX*'s character code table `lccode` (lower case code) can be accessed and written to using
---a virtual subtable of the `tex` table.
---
---```lua
---for i = 0, 1024 do
--- -- Exclude C0 and C1 control codes
---  if i > 31 and not (i >= 127 and i <= 159) then
---    print(i, utf8.char(i), tex.lccode[i], utf8.char(tex.lccode[i]))
---  end
---end
---```
---
---Output:
---
---```
---...
---65	A	97	a
---66	B	98	b
---67	C	99	c
---...
---90	Z	122	z
---...
---97	a	97	a
---98	b	98	b
---99	c	99	c
---...
---122	z	122	z
---...
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3708](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3708)
---* Corresponding plain TeX control sequence: [\lccode](https://www.tug.org/utilities/plain/cseq.html#lccode-rp)
---
---@type table<integer, integer>
tex.lccode = {}

---
---Set the `lccode` (lower case code) and additionally
---the associated sibling for a character code at the same time.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1369-L1397](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1369-L1397)
---* Corresponding plain TeX control sequence: [\lccode](https://www.tug.org/utilities/plain/cseq.html#lccode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # A Unicode code point for which a lowercase variant of the character is to be set, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param lower_case integer # The Unicode code point for the lowercase variant of the character.
---@param upper_case? integer # The Unicode code point for the uppercase variant of the character.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setlccode(global, char_code, lower_case, upper_case) end

---
---Set the `lccode` (lower case code) and additionally
---the associated sibling for a character code at the same time.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1369-L1397](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1369-L1397)
---* Corresponding plain TeX control sequence: [\lccode](https://www.tug.org/utilities/plain/cseq.html#lccode-rp)
---
---@param char_code integer # A Unicode code point for which a lowercase variant of the character is to be set, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param lower_case integer # The Unicode code point for the lowercase variant of the character.
---@param upper_case? integer # The Unicode code point for the uppercase variant of the character.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setlccode(char_code, lower_case, upper_case) end

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1404-L1410](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1404-L1410)
---* Corresponding plain TeX control sequence: [\lccode](https://www.tug.org/utilities/plain/cseq.html#lccode-rp)
---
---@param char_code integer # A Unicode code point for which a lowercase variant of the character should be returned, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---
---@return integer lower_case # The Unicode code point for the lowercase variant of the character.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getlccode(char_code) end

---
---*TeX*'s character code table `uccode` (upper case code) can be accessed and written to using
---a virtual subtable of the `tex` table.
---
---```lua
---for i = 0, 1024 do
--- -- Exclude C0 and C1 control codes
---  if i > 31 and not (i >= 127 and i <= 159) then
---    print(i, utf8.char(i), tex.uccode[i], utf8.char(tex.uccode[i]))
---  end
---end
---```
---
---Output:
---
---```
---...
---65	A	65	A
---66	B	66	B
---67	C	67	C
---...
---90	Z	90	Z
---...
---97	a	65	A
---98	b	66	B
---99	c	67	C
---...
---122	z	90	Z
---...
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3709](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3709)
---* Corresponding plain TeX control sequence: [\uccode](https://www.tug.org/utilities/plain/cseq.html#uccode-rp)
---
---@type table<integer, integer>
tex.uccode = {}

---
---The function call interface for `uccode` (upper case code) additionally
---allows you to set the associated sibling at the same time.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1369-L1397](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1369-L1397)
---* Corresponding plain TeX control sequence: [\uccode](https://www.tug.org/utilities/plain/cseq.html#uccode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # A Unicode code point for which a uppercase variant of the character is to be set, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param upper_case integer # The Unicode code point for the uppercase variant of the character.
---@param lower_case? integer # The Unicode code point for the lowercase variant of the character.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setuccode(global, char_code, upper_case, lower_case) end

---
---The function call interface for `uccode` (upper case code) additionally
---allows you to set the associated sibling at the same time.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1369-L1397](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1369-L1397)
---* Corresponding plain TeX control sequence: [\uccode](https://www.tug.org/utilities/plain/cseq.html#uccode-rp)
---
---@param char_code integer # A Unicode code point for which a uppercase variant of the character is to be set, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param upper_case integer # The Unicode code point for the uppercase variant of the character.
---@param lower_case? integer # The Unicode code point for the lowercase variant of the character.
---
---@see tex.getuccode
---@see tex.setlccode
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setuccode(char_code, upper_case, lower_case) end

---
---Corresponding plain TeX control sequence: [\uccode](https://www.tug.org/utilities/plain/cseq.html#uccode-rp)
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1417-L1423](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1417-L1423)
---* Corresponding plain TeX control sequence: [\uccode](https://www.tug.org/utilities/plain/cseq.html#uccode-rp)
---
---@param char_code integer # A Unicode code point for which a uppercase variant of the character should be returned, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---
---@return integer upper_case # The Unicode code point for the uppercase variant of the character.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getuccode(char_code) end

---
---Each character in a font has a space factor code that is an integer
---between `0` and `32767`. The code is used to adjust the space factor
---in a horizontal list. The uppercase letters `A-Z` have space factor
---code `999`. Most other characters have code `1000` [Donald E. Knuth, The TeXbook, page 76]. However,
---Plain TeX makes `)', `'', and `]' have space factor code `0`.
---Also, the `\frenchspacing` and `\nonfrenchspacing` modes in Plain
---TeX work by changing the `\sfcode` for: `.`, `?`, `!`, `:`, `;`,
---and `,` [Donald E. Knuth, The TeXbook, 351].
---
---*TeX*'s character code table `sfcode` (space factor code) can be
---accessed and written to using a virtual subtable of the `tex` table.
---
---```lua
---for i = 0, 1024 do
---  -- Exclude C0 and C1 control codes
---  if i > 31 and not (i >= 127 and i <= 159) then
---    print(i, utf8.char(i), tex.sfcode[i])
---  end
---end
---```
---
---Output:
---
---```
---32	 	1000
---33	!	3000
---34	"	1000
---35	#	1000
---36	$	1000
---37	%	1000
---38	&	1000
---39	'	0
---40	(	1000
---41	)	0
---42	*	1000
---43	+	1000
---44	,	1250
---45	-	1000
---46	.	3000
---47	/	1000
---48	0	1000
---49	1	1000
---50	2	1000
---51	3	1000
---52	4	1000
---53	5	1000
---54	6	1000
---55	7	1000
---56	8	1000
---57	9	1000
---58	:	2000
---59	;	1500
---60	<	1000
---61	=	1000
---62	>	1000
---63	?	3000
---64	@	1000
---65	A	999
---...
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3707](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3707)
---* Corresponding plain TeX control sequence: [\sfcode](https://www.tug.org/utilities/plain/cseq.html#sfcode-rp)
---
---@type table<integer, integer>
tex.sfcode = {}

---
---Set the space factor code for a character globally.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1425-L1428](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1425-L1428)
---* Corresponding plain TeX control sequence: [\sfcode](https://www.tug.org/utilities/plain/cseq.html#sfcode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # A Unicode code point, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param space_factor integer # The code (between `0` and `32767`) to adjust the space factor in a horizontal list. The uppercase letters `A-Z` have space factor code `999`. Most other characters have code `1000`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setsfcode(global, char_code, space_factor) end

---
---Set the space factor code for a character.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1425-L1428](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1425-L1428)
---* Corresponding plain TeX control sequence: [\sfcode](https://www.tug.org/utilities/plain/cseq.html#sfcode-rp)
---
---@param char_code integer # A Unicode code point, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---@param space_factor integer # The code (between `0` and `32767`) to adjust the space factor in a horizontal list. The uppercase letters `A-Z` have space factor code `999`. Most other characters have code `1000`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setsfcode(char_code, space_factor) end

---
---Get the space factor code of a character.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1430-L1436](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1430-L1436)
---* Corresponding plain TeX control sequence: [\sfcode](https://www.tug.org/utilities/plain/cseq.html#sfcode-rp)
---
---@param char_code integer # A Unicode code point, for example `65` stands for an uppercase `A` and `97` for a lowercase `a`.
---
---@return integer space_factor # The code (between `0` and `32767`) to adjust the space factor in a horizontal list. The uppercase letters `A-Z` have space factor code `999`. Most other characters have code `1000`.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getsfcode(char_code) end

---
---A virtual subtable of the `tex` table called `catcode` (category code) can be used to access and write to TeX's character code table.
---
---The category codes are indexed by the character code.
---
---```lua
---for i=33,126 do
---  print(i, utf8.char(i), tex.catcode[i])
---end
---```
---
---## Output:
---
---```
---33	!	12
---34	"	12
---35	#	6
---36	$	3
---37	%	14
---38	&	4
---39	'	12
---40	(	12
---41	)	12
---42	*	12
---43	+	12
---44	,	12
---45	-	12
---46	.	12
---47	/	12
---48	0	12
---49	1	12
---50	2	12
---51	3	12
---52	4	12
---53	5	12
---54	6	12
---55	7	12
---56	8	12
---57	9	12
---58	:	12
---59	;	12
---60	<	12
---61	=	12
---62	>	12
---63	?	12
---64	@	12
---65	A	11
---66	B	11
---67	C	11
---68	D	11
---69	E	11
---70	F	11
---71	G	11
---72	H	11
---73	I	11
---74	J	11
---75	K	11
---76	L	11
---77	M	11
---78	N	11
---79	O	11
---80	P	11
---81	Q	11
---82	R	11
---83	S	11
---84	T	11
---85	U	11
---86	V	11
---87	W	11
---88	X	11
---89	Y	11
---90	Z	11
---91	[	12
---92	\	0
---93	]	12
---94	^	7
---95	_	8
---96	`	12
---97	a	11
---98	b	11
---99	c	11
---100	d	11
---101	e	11
---102	f	11
---103	g	11
---104	h	11
---105	i	11
---106	j	11
---107	k	11
---108	l	11
---109	m	11
---110	n	11
---111	o	11
---112	p	11
---113	q	11
---114	r	11
---115	s	11
---116	t	11
---117	u	11
---118	v	11
---119	w	11
---120	x	11
---121	y	11
---122	z	11
---123	{	1
---124	|	12
---125	}	2
---126	~	13
---```
---
---## Category codes:
---
---* `0`: Escape character, normally `\`
---* `1`: Begin grouping, normally `{`
---* `2`: End grouping, normally `}`
---* `3`: Math shift, normally `$`
---* `4`: Alignment tab, normally `&`
---* `5`: End of line, normally `<return>`
---* `6`: Parameter, normally `#`
---* `7`: Superscript, normally `^`
---* `8`: Subscript, normally `_`
---* `9`: Ignored character, normally `<null>`
---* `10`: Space, normally `<space>` and `<tab>`
---* `11`: Letter, normally only contains the letters `a,...,z` and `A,...,Z`. These characters can be used in command names
---* `12`: Other, normally everything else not listed in the other categories
---* `13`: Active character, for example `~`
---* `14`: Comment character, normally `%`
---* `15`: Invalid character, normally `<delete>`
---
---* Corresponding C source code: [ltexlib.c#L3710](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3710)
---
---@type table<integer, integer>
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.catcode = {}

---
---Specify a
---category table to use on assignment or on query (default in both cases is the
---current one).
---
---* Corresponding C source code: [ltexlib.c#L1438-L1464](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1438-L1464)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # The character code, for example ASCII or UNICODE character code.
---@param cat_code integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcatcode(global, char_code, cat_code) end

---
---Specify a
---category table to use on assignment or on query (default in both cases is the
---current one).
---
---## Category codes:
---
---* `0`: Escape character, normally `\`
---* `1`: Begin grouping, normally `{`
---* `2`: End grouping, normally `}`
---* `3`: Math shift, normally `$`
---* `4`: Alignment tab, normally `&`
---* `5`: End of line, normally `<return>`
---* `6`: Parameter, normally `#`
---* `7`: Superscript, normally `^`
---* `8`: Subscript, normally `_`
---* `9`: Ignored character, normally `<null>`
---* `10`: Space, normally `<space>` and `<tab>`
---* `11`: Letter, normally only contains the letters `a,...,z` and `A,...,Z`. These characters can be used in command names
---* `12`: Other, normally everything else not listed in the other categories
---* `13`: Active character, for example `~`
---* `14`: Comment character, normally `%`
---* `15`: Invalid character, normally `<delete>`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1438-L1464](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1438-L1464)
---
---@param char_code integer # The character code, for example ASCII or UNICODE character code.
---@param cat_code integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcatcode(char_code, cat_code) end

---
---Specify a
---category table to use on assignment or on query (default in both cases is the
---current one).
---
---## Category codes:
---
---* `0`: Escape character, normally `\`
---* `1`: Begin grouping, normally `{`
---* `2`: End grouping, normally `}`
---* `3`: Math shift, normally `$`
---* `4`: Alignment tab, normally `&`
---* `5`: End of line, normally `<return>`
---* `6`: Parameter, normally `#`
---* `7`: Superscript, normally `^`
---* `8`: Subscript, normally `_`
---* `9`: Ignored character, normally `<null>`
---* `10`: Space, normally `<space>` and `<tab>`
---* `11`: Letter, normally only contains the letters `a,...,z` and `A,...,Z`. These characters can be used in command names
---* `12`: Other, normally everything else not listed in the other categories
---* `13`: Active character, for example `~`
---* `14`: Comment character, normally `%`
---* `15`: Invalid character, normally `<delete>`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1438-L1464](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1438-L1464)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param cat_table integer
---@param char_code integer # The character code, for example ASCII or UNICODE character code.
---@param cat_code integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcatcode(global, cat_table, char_code, cat_code) end

---
---Specify a
---category table to use on assignment or on query (default in both cases is the
---current one).
---
---## Category codes:
---
---* `0`: Escape character, normally `\`
---* `1`: Begin grouping, normally `{`
---* `2`: End grouping, normally `}`
---* `3`: Math shift, normally `$`
---* `4`: Alignment tab, normally `&`
---* `5`: End of line, normally `<return>`
---* `6`: Parameter, normally `#`
---* `7`: Superscript, normally `^`
---* `8`: Subscript, normally `_`
---* `9`: Ignored character, normally `<null>`
---* `10`: Space, normally `<space>` and `<tab>`
---* `11`: Letter, normally only contains the letters `a,...,z` and `A,...,Z`. These characters can be used in command names
---* `12`: Other, normally everything else not listed in the other categories
---* `13`: Active character, for example `~`
---* `14`: Comment character, normally `%`
---* `15`: Invalid character, normally `<delete>`
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1438-L1464](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1438-L1464)
---
---@param cat_table integer
---@param char_code integer # The character code, for example ASCII or UNICODE character code.
---@param cat_code integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setcatcode(global, cat_table, char_code, cat_code) end

---
---The function call interface for `catcode` (category code) also allows you to specify a
---category table to use on assignment or on query (default in both cases is the
---current one):
---
---## Category codes:
---
---* `0`: Escape character, normally `\`
---* `1`: Begin grouping, normally `{`
---* `2`: End grouping, normally `}`
---* `3`: Math shift, normally `$`
---* `4`: Alignment tab, normally `&`
---* `5`: End of line, normally `<return>`
---* `6`: Parameter, normally `#`
---* `7`: Superscript, normally `^`
---* `8`: Subscript, normally `_`
---* `9`: Ignored character, normally `<null>`
---* `10`: Space, normally `<space>` and `<tab>`
---* `11`: Letter, normally only contains the letters `a,...,z` and `A,...,Z`. These characters can be used in command names
---* `12`: Other, normally everything else not listed in the other categories
---* `13`: Active character, for example `~`
---* `14`: Comment character, normally `%`
---* `15`: Invalid character, normally `<delete>`
---
---@param cat_table integer
---@param char_code integer # The character code, for example ASCII or UNICODE character code.
---
---@return integer cat_code # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getcatcode(cat_table, char_code) end

---
---The *TeX*'s character code table `mathcode` can be accessed and written to using
---a virtual subtable of the `tex` table.
---
---```lua
---for i = 1, 128 do
---  local mathcode = tex.mathcode[i]
---  print(i, utf8.char(i), mathcode[1], mathcode[2], mathcode[3])
---end
---```
---
---__Output:__
---
---```
---1		3	2	35
---2		0	1	11
---3		0	1	12
---4		2	2	94
---5		0	2	58
---6		3	2	50
---7		0	1	25
---8		0	1	21
---9		0	1	13
---10		0	1	14
---11		3	2	34
---12		2	2	6
---1		2	2	8
---14		0	2	49
---15		0	1	64
---16		3	2	26
---17		3	2	27
---18		2	2	92
---19		2	2	91
---20		0	2	56
---21		0	2	57
---22		2	2	10
---23		3	2	36
---24		3	2	32
---25		3	2	33
---26	�	8	0	0
---27			2	5
---28		3	2	20
---29		3	2	21
---30		3	2	17
---31		2	2	95
---32	 	8	0	0
---33	!	5	0	33
---34	"	0	0	34
---35	#	0	0	35
---36	$	0	0	36
---37	%	0	0	37
---38	&	0	0	38
---39	'	8	0	0
---40	(	4	0	40
---41	)	5	0	41
---42	*	2	2	3
---43	+	2	0	43
---44	,	6	1	59
---45	-	2	2	0
---46	.	0	1	58
---47	/	0	1	61
---48	0	7	0	48
---49	1	7	0	49
---50	2	7	0	50
---51	3	7	0	51
---52	4	7	0	52
---53	5	7	0	53
---54	6	7	0	54
---55	7	7	0	55
---56	8	7	0	56
---57	9	7	0	57
---58	:	3	0	58
---59	;	6	0	59
---60	<	3	1	60
---61	=	3	0	61
---62	>	3	1	62
---63	?	5	0	63
---64	@	0	0	64
---65	A	7	1	65
---66	B	7	1	66
---67	C	7	1	67
---68	D	7	1	68
---69	E	7	1	69
---70	F	7	1	70
---71	G	7	1	71
---72	H	7	1	72
---73	I	7	1	73
---74	J	7	1	74
---75	K	7	1	75
---76	L	7	1	76
---77	M	7	1	77
---78	N	7	1	78
---79	O	7	1	79
---80	P	7	1	80
---81	Q	7	1	81
---82	R	7	1	82
---83	S	7	1	83
---84	T	7	1	84
---85	U	7	1	85
---86	V	7	1	86
---87	W	7	1	87
---88	X	7	1	88
---89	Y	7	1	89
---90	Z	7	1	90
---91	[	4	0	91
---92	\	0	2	110
---93	]	5	0	93
---94	^	0	0	94
---95	_	8	0	0
---96	`	0	0	96
---97	a	7	1	97
---98	b	7	1	98
---99	c	7	1	99
---100	d	7	1	100
---101	e	7	1	101
---102	f	7	1	102
---103	g	7	1	103
---104	h	7	1	104
---105	i	7	1	105
---106	j	7	1	106
---107	k	7	1	107
---108	l	7	1	108
---109	m	7	1	109
---110	n	7	1	110
---111	o	7	1	111
---112	p	7	1	112
---113	q	7	1	113
---114	r	7	1	114
---115	s	7	1	115
---116	t	7	1	116
---117	u	7	1	117
---118	v	7	1	118
---119	w	7	1	119
---120	x	7	1	120
---121	y	7	1	121
---122	z	7	1	122
---123	{	4	2	102
---124	|	0	2	106
---125	}	5	2	103
---126	~	0	0	126
---127		1	2	115
---128		0	0	128
---```
---
---In math mode, the math atoms require more structure. Each symbol
---originates from a different font and receives different spacing
---based on its class (operator, binary infix, relation, etc.).
---Following the typical style of the 1970s, these properties are
---compactly packed into bit fields within a single integer called a
---mathcode. The mathcode is usually expressed in hexadecimal so
---that the fields can easily be pulled apart. The mathcode of `+` in
---plain TeX is set as:
---
---```tex
---\mathcode`\+="202B
---```
---
---This means it is class 2 (binary infix) and fam0 (the Roman font).
---The character hex is `2B`, which is the decimal `43`, the character
---code for `+` in the Roman font encoding.
---
---The `mathcode` section in the
---[plain.tex](https://mirrors.ctan.org/macros/plain/base/plain.tex)
---format file:
---
---```tex
---\mathcode`\^^?="1273 % \smallint
---% INITEX sets up \mathcode x=x, for x=0..255, except that
---% \mathcode x=x+"7100, for x = `A to `Z and `a to `z;
---% \mathcode x=x+"7000, for x = `0 to `9.
---% The following changes define internal codes as recommended
---% in Appendix C of The TeXbook:
---\mathcode`\^^@="2201 % \cdot
---\mathcode`\^^A="3223 % \downarrow
---\mathcode`\^^B="010B % \alpha
---\mathcode`\^^C="010C % \beta
---\mathcode`\^^D="225E % \land
---\mathcode`\^^E="023A % \lnot
---\mathcode`\^^F="3232 % \in
---\mathcode`\^^G="0119 % \pi
---\mathcode`\^^H="0115 % \lambda
---\mathcode`\^^I="010D % \gamma
---\mathcode`\^^J="010E % \delta
---\mathcode`\^^K="3222 % \uparrow
---\mathcode`\^^L="2206 % \pm
---\mathcode`\^^M="2208 % \oplus
---\mathcode`\^^N="0231 % \infty
---\mathcode`\^^O="0140 % \partial
---\mathcode`\^^P="321A % \subset
---\mathcode`\^^Q="321B % \supset
---\mathcode`\^^R="225C % \cap
---\mathcode`\^^S="225B % \cup
---\mathcode`\^^T="0238 % \forall
---\mathcode`\^^U="0239 % \exists
---\mathcode`\^^V="220A % \otimes
---\mathcode`\^^W="3224 % \leftrightarrow
---\mathcode`\^^X="3220 % \leftarrow
---\mathcode`\^^Y="3221 % \rightarrow
---\mathcode`\^^Z="8000 % \ne
---\mathcode`\^^[="2205 % \diamond
---\mathcode`\^^\="3214 % \le
---\mathcode`\^^]="3215 % \ge
---\mathcode`\^^^="3211 % \equiv
---\mathcode`\^^_="225F % \lor
---\mathcode`\ ="8000 % \space
---\mathcode`\!="5021
---\mathcode`\'="8000 % ^\prime
---\mathcode`\(="4028
---\mathcode`\)="5029
---\mathcode`\*="2203 % \ast
---\mathcode`\+="202B
---\mathcode`\,="613B
---\mathcode`\-="2200
---\mathcode`\.="013A
---\mathcode`\/="013D
---\mathcode`\:="303A
---\mathcode`\;="603B
---\mathcode`\<="313C
---\mathcode`\=="303D
---\mathcode`\>="313E
---\mathcode`\?="503F
---\mathcode`\[="405B
---\mathcode`\\="026E % \backslash
---\mathcode`\]="505D
---\mathcode`\_="8000 % \_
---\mathcode`\{="4266
---\mathcode`\|="026A
---\mathcode`\}="5267
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3711](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3711)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---* [tex.stackexchange.com](https://tex.stackexchange.com/a/109440)
---
---@type table<integer, MathCode>
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.mathcode = {}

---
---The table for `mathcode` is an array of 3 integers, like this:
---
---```lua
---{
---    -- class
---    -- family
---    -- character
---}
---```
---
---@alias MathCode integer[]

---
---__class__:
---
---| Class | Meaning          | Example |
---|-------|------------------|---------|
---| 0     | Ordinary         | `/`     |
---| 1     | Large operator   | `\sum`  |
---| 2     | Binary operation | `+`     |
---| 3     | Relation         | `=`     |
---| 4     | Opening          | `(`     |
---| 5     | Closing          | `)`     |
---| 6     | Punctuation      | `,`     |
---| 7     | Variable family  | `x`     |
---
---__family__:
---
---```tex
---% Family 0 (Roman)
---\font\tenrm=mdbchr7t at10pt
---\font\sevenrm=mdbchr7t at7pt
---\font\fiverm=mdbchr7t at5pt
---\textfont0=\tenrm
---\scriptfont0=\sevenrm
---27
---\scriptscriptfont0=\fiverm
---\def\rm{\fam=0 \tenrm}
---%
---% Family 1 (Math italic)
---\font\teni=mdbchri7m at10pt
---\font\seveni=mdbchri7m at7pt
---\font\fivei=mdbchri7m at5pt
---\textfont1=\teni
---\scriptfont1=\seveni
---\scriptscriptfont1=\fivei
---\def\mit{\fam=1}
---%
---% Family 2 (Math symbols)
---\font\tensy=md-chr7y at10pt
---\font\sevensy=md-chr7y at7pt
---\font\fivesy=md-chr7y at5pt
---\textfont2=\tensy
---\scriptfont2=\
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```sevensy
---\scriptscriptfont2=\fivesy
---\def\cal{\fam=2}
---%
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1524-1561](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1524-1561)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---* Donald E. Knuth: The TeXbook, Page 154
---* TUGboat, Volume 31 (2010), No. 1, Mathematical typefaces in TEX documents, Amit Raj Dhawan
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer  # The ASCII or UNICODE charcater code point.
---@param class integer # The class to which a math character belongs (`0`: Ordinary, `1`: Large operator, `2`: Binary operation, `3`: Relation, `4`: Opening, `5`: Closing, `6`: Punctuation, `7`: Variable family).
---@param family integer # TeX uses fonts from one or more of the sixteen font families to typeset mathematical characters. Each font family consists of three fonts — textfont, scriptfont, and scriptscriptfont. (`0`: Roman, `1`: Math italic, `2`: Math symbol, `3`: Math extension, `4`: Italic text, `5`: Slanted text, `6`: Bold text, `7`: Typewriter)
---@param character integer # The character position
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmathcode(global, char_code, class, family, character) end

---
---__class__:
---
---| Class | Meaning          | Example |
---|-------|------------------|---------|
---| 0     | Ordinary         | `/`     |
---| 1     | Large operator   | `\sum`  |
---| 2     | Binary operation | `+`     |
---| 3     | Relation         | `=`     |
---| 4     | Opening          | `(`     |
---| 5     | Closing          | `)`     |
---| 6     | Punctuation      | `,`     |
---| 7     | Variable family  | `x`     |
---
---__family__:
---
---```tex
---% Family 0 (Roman)
---\font\tenrm=mdbchr7t at10pt
---\font\sevenrm=mdbchr7t at7pt
---\font\fiverm=mdbchr7t at5pt
---\textfont0=\tenrm
---\scriptfont0=\sevenrm
---27
---\scriptscriptfont0=\fiverm
---\def\rm{\fam=0 \tenrm}
---%
---% Family 1 (Math italic)
---\font\teni=mdbchri7m at10pt
---\font\seveni=mdbchri7m at7pt
---\font\fivei=mdbchri7m at5pt
---\textfont1=\teni
---\scriptfont1=\seveni
---\scriptscriptfont1=\fivei
---\def\mit{\fam=1}
---%
---% Family 2 (Math symbols)
---\font\tensy=md-chr7y at10pt
---\font\sevensy=md-chr7y at7pt
---\font\fivesy=md-chr7y at5pt
---\textfont2=\tensy
---\scriptfont2=\
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```sevensy
---\scriptscriptfont2=\fivesy
---\def\cal{\fam=2}
---%
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1524-L1561](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1524-L1561)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---* Donald E. Knuth: The TeXbook, Page 154
---* TUGboat, Volume 31 (2010), No. 1, Mathematical typefaces in TEX documents, Amit Raj Dhawan
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # The ASCII or UNICODE charcater code point.
---@param class integer # The class to which a math character belongs (`0`: Ordinary, `1`: Large operator, `2`: Binary operation, `3`: Relation, `4`: Opening, `5`: Closing, `6`: Punctuation, `7`: Variable family).
---@param family integer # TeX uses fonts from one or more of the sixteen font families to typeset mathematical characters. Each font family consists of three fonts — textfont, scriptfont, and scriptscriptfont. (`0`: Roman, `1`: Math italic, `2`: Math symbol, `3`: Math extension, `4`: Italic text, `5`: Slanted text, `6`: Bold text, `7`: Typewriter)
---@param character integer # The character position
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmathcode(global, char_code, class, family, character) end

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1524-L1561](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1524-L1561)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer # The ASCII or UNICODE charcater code point.
---@param math_code MathCode # A table with three integers (class, family, character).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmathcode(global, char_code, math_code) end

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1524-L1561](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1524-L1561)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---
---@param char_code integer  # The ASCII or UNICODE charcater code point.
---@param math_code MathCode # A table with three integers (class, family, character).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmathcode(char_code, math_code) end

---
---Retrieve the math code of a character as a table with three integers (class, family, character).
---
---__Examples from The TeXBook, page 154__:
---
---`\mathcode‘<="313C`
---
---* ASCII `<`: 60 (decimal) 3C (hexadecimal)
---* class: 3
---* family: 1
---* character: 60
---
---```lua
---local mathcode = tex.getmathcode(60)
---print(mathcode[1], mathcode[2], mathcode[3]) -- 3 1 60
---```
---
---`\mathcode‘*="2203`
---
---* ASCII `*`: 42 (decimal) 2A (hexadecimal)
---* class: 2
---* family: 2
---* character: 3
---
---```lua
---local mathcode = tex.getmathcode(42)
---print(mathcode[1], mathcode[2], mathcode[3]) -- 2 2 3
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1563-L1577](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1563-L1577)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---
---@param char_code integer
---
---@return MathCode math_code # A table with three integers (class, family, character).
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmathcode(char_code) end

---
---Retrieve the math code of a character as three integers (class, family, character).
---
---__Examples from The TeXBook, page 154__:
---
---`\mathcode‘<="313C`
---
---* ASCII `<`: 60 (decimal) 3C (hexadecimal)
---* class: 3
---* family: 1
---* character: 60
---
---```lua
---print(tex.getmathcodes(60)) -- 3 1 60
---```
---
---`\mathcode‘*="2203`
---
---* ASCII `*`: 42 (decimal) 2A (hexadecimal)
---* class: 2
---* family: 2
---* character: 3
---
---```lua
---print(tex.getmathcodes(42)) -- 2 2 3
---```
---
---__class__:
---
---| Class | Meaning          | Example |
---|-------|------------------|---------|
---| 0     | Ordinary         | `/`     |
---| 1     | Large operator   | `\sum`  |
---| 2     | Binary operation | `+`     |
---| 3     | Relation         | `=`     |
---| 4     | Opening          | `(`     |
---| 5     | Closing          | `)`     |
---| 6     | Punctuation      | `,`     |
---| 7     | Variable family  | `x`     |
---
---__family__:
---
---```tex
---% Family 0 (Roman)
---\font\tenrm=mdbchr7t at10pt
---\font\sevenrm=mdbchr7t at7pt
---\font\fiverm=mdbchr7t at5pt
---\textfont0=\tenrm
---\scriptfont0=\sevenrm
---27
---\scriptscriptfont0=\fiverm
---\def\rm{\fam=0 \tenrm}
---%
---% Family 1 (Math italic)
---\font\teni=mdbchri7m at10pt
---\font\seveni=mdbchri7m at7pt
---\font\fivei=mdbchri7m at5pt
---\textfont1=\teni
---\scriptfont1=\seveni
---\scriptscriptfont1=\fivei
---\def\mit{\fam=1}
---%
---% Family 2 (Math symbols)
---\font\tensy=md-chr7y at10pt
---\font\sevensy=md-chr7y at7pt
---\font\fivesy=md-chr7y at5pt
---\textfont2=\tensy
---\scriptfont2=\
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```sevensy
---\scriptscriptfont2=\fivesy
---\def\cal{\fam=2}
---%
---% Family 3 (Math extension)
---\font\tenex=mdbchr7v at10pt
---\font\sevenex=mdbchr7v at7pt
---\font\fiveex=mdbchr7v at5pt
---\textfont3=\tenex
---\scriptfont3=\sevenex
---\scriptscriptfont3=\fiveex
---%
---% Family 4 (Italic text)
---\font\tenit=mdbchri7t at10pt
---\font\sevenit=mdbchri7t at7pt
---\font\fiveit=mdbchri7t at5pt
---\textfont\itfam=\tenit
---\scriptfont\itfam=\sevenit
---\scriptscriptfont\itfam=\fiveit
---\def\it{\fam=\itfam \tenit}
---%
---% Family 5 (Slanted text)
---\font\tensl=mdbchro7t at10pt
---\font\sevensl=mdbchro7t at7pt
---\font\fivesl=mdbchro7t at5pt
---\textfont\slfam=\tensl
---\scriptfont\slfam=\sevensl
---\scriptscriptfont\slfam=\fivesl
---\def\sl{\fam=\slfam \tensl}
---%
---% Family 6 (Bold text)
---\font\tenbf=mdbchb7t at10pt
---\font\sevenbf=mdbchb7t at7pt
---\font\fivebf=mdbchb7t at5pt
---\textfont\bffam=\tenbf
---\scriptfont\bffam=\sevenbf
---\scriptscriptfont\bffam=\fivebf
---\def\bf{\fam=\bffam \tenbf}
---%
---% Family 7 (Typewriter)
---\font\tentt=cmtt10---%
---\rm
---% Sets normal roman font
---\font\seventt=cmtt10 at7pt
---\font\fivett=cmtt10 at5pt
---\textfont\ttfam=\tentt
---\scriptfont\ttfam=\seventt
---\scriptscriptfont\ttfam=\fivett
---\def\tt{\fam=\ttfam \tentt}
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1579-L1589](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1579-L1589)
---* Corresponding plain TeX control sequence: [\mathcode](https://www.tug.org/utilities/plain/cseq.html#mathcode-rp)
---* Donald E. Knuth: The TeXbook, Page 154
---* TUGboat, Volume 31 (2010), No. 1, Mathematical typefaces in TEX documents, Amit Raj Dhawan
---
---@param char_code integer
---
---@return integer class # The class to which a math character belongs (`0`: Ordinary, `1`: Large operator, `2`: Binary operation, `3`: Relation, `4`: Opening, `5`: Closing, `6`: Punctuation, `7`: Variable family).
---@return integer family # TeX uses fonts from one or more of the sixteen font families to typeset mathematical characters. Each font family consists of three fonts — textfont, scriptfont, and scriptscriptfont. (`0`: Roman, `1`: Math italic, `2`: Math symbol, `3`: Math extension, `4`: Italic text, `5`: Slanted text, `6`: Bold text, `7`: Typewriter)
---@return integer character # The character position
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmathcodes(char_code) end

---
---The *TeX*'s character code tables `delcode` (delimiter code) can be accessed and written to using
---a virtual subtable of the `tex` table.
---

---
---```lua
---for i=1,128 do
---  local delcode = tex.delcode[i]
---  print(i, utf8.char(i), delcode[1], delcode[2], delcode[3], delcode[4])
---end
---```
---
---Output:
---
---```
---1		-1	0	0	0
---...
---40	(	0	40	3	0
---41	)	0	41	3	1
---...
---47	/	0	47	3	14
---...
---60	<	2	104	3	10
---61	=	-1	0	0	0
---62	>	2	105	3	11
---...
---91	[	0	91	3	2
---92	\	2	110	3	15
---93	]	0	93	3	3
---...
---124	|	2	106	3	12
---...
---```
---
---The `delcode` section in the
---[plain.tex](https://mirrors.ctan.org/macros/plain/base/plain.tex)
---format file:
---
---```tex
---% Finally, INITEX sets all \delcode values to -1, except \delcode`.=0
---\delcode`\(="028300
---\delcode`\)="029301
---\delcode`\[="05B302
---\delcode`\]="05D303
---\delcode`\<="26830A
---\delcode`\>="26930B
---\delcode`\/="02F30E
---\delcode`\|="26A30C
---\delcode`\\="26E30F
---% N.B. { and } should NOT get delcodes; otherwise parameter grouping fails!
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3712](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3712)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@type table<integer, DelCode>
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.delcode = {}

---
---The table for `delcode` (delimiter code) is an array with 4 numbers, like this:
---
---```lua
---{
---    -- small_family
---    -- small_character
---    -- large_family
---    -- large_character
---}
---```
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias DelCode integer[]

---
----__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1640-L1681](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1640-L1681)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer
---@param small_family integer
---@param small_character integer
---@param large_family integer
---@param large_character integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setdelcode(global, char_code, small_family, small_character, large_family, large_character) end

---
----__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1640-L1681](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1640-L1681)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param char_code integer
---@param small_family integer
---@param small_character integer
---@param large_family integer
---@param large_character integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setdelcode(char_code, small_family, small_character, large_family, large_character) end

---
---* Corresponding C source code: [ltexlib.c#L1640-L1681](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1640-L1681)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param char_code integer
---@param del_code DelCode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setdelcode(global, char_code, del_code) end

---
----__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1640-L1681](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1640-L1681)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param char_code integer
---@param del_code DelCode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setdelcode(char_code, del_code) end

---
---* Corresponding C source code: [ltexlib.c#L1701-L1712](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1701-L1712)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param char_code integer
---
---@return integer small_family
---@return integer small_character
---@return integer large_family
---@return integer large_character
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getdelcodes(char_code) end

---
----__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1683-L1699](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1683-L1699)
---* Corresponding plain TeX control sequence: [\delcode](https://www.tug.org/utilities/plain/cseq.html#delcode-rp)
---
---@param char_code integer
---
---@return DelCode
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getdelcode(char_code) end

_N._10_3_7_box_registers_get_set_box = "page 197"

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3706](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3706)
---* Corresponding plain TeX control sequence: [\box](https://www.tug.org/utilities/plain/cseq.html#box-rp)
---
---@type table<integer, Node>
tex.box = {}

---
---Set a box, coming for instance from `hbox`, `vbox` or `vtop`.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1352-L1362](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1352-L1362)
---* Corresponding plain TeX control sequence: [\setbox](https://www.tug.org/utilities/plain/cseq.html#setbox-rp)
---
---@param global 'global' # It is possible to define values globally by using the string `global` as the first function argument.
---@param register integer # A box register number (0 to 65535).
---@param head Node # A `hlist` or `vlist` node.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setbox(global, register, head) end

---
---Set a box, coming for instance from `hbox`, `vbox` or `vtop`.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1352-L1362](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1352-L1362)
---* Corresponding plain TeX control sequence: [\setbox](https://www.tug.org/utilities/plain/cseq.html#setbox-rp)
---
---@param register integer # A box register number (0 to 65535).
---@param head Node # A `hlist` or `vlist` node.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setbox(register, head) end

---
---Query an actual box, coming for instance from `hbox`, `vbox` or `vtop`.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1272-L1280](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1272-L1280)
---* Corresponding plain TeX control sequence: [\box](https://www.tug.org/utilities/plain/cseq.html#box-rp)
---
---@param register integer|string # A box register number (0 to 65535) or a cs name (for example `\newbox\MyBox`: `MyBox`)
---
---@return Node|nil head
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getbox(register) end

---
---Check if the given integer is a valid box register number.
---
---__Example:__
---
---```lua
---print(tex.isbox(65535)) -- true
---print(tex.isbox(65536)) -- false
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1310-L1315](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1310-L1315)
---
---@param register integer|string # A box register number (0 to 65535) or a cs name (for example `\newbox\MyBox`: `MyBox`)
---
---@return boolean
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.isbox(register) end

_N._10_3_8_reusing_boxes_use_save_boxresource_and_getboxresourcedimensions = "page 198"

---
---Register a box for reuse (this is modelled after so
---called xforms in *PDF*). You can (re)use the box with `useboxresource` or
---by creating a rule node with subtype 2.
---
---* Corresponding C source code: [ltexlib.c#L3217-L3278](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3217-L3278)
---
---@see tex.useboxresource
---
---@param n Node|integer # Instead of a box number one can also pass a `[h|v]list` node.
---@param attributes string
---@param resources string
---@param immediate boolean
---@param type integer # When set to non-zero the `/Type` entry is omitted. A value of 1 or 3 still writes a `/BBox`, while 2 or 3 will write a `/Matrix`.
---@param margin integer # The (virtual) margin that extends beyond the effective boundingbox as seen by *TeX*.
---
---@return integer index
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.saveboxresource(n, attributes, resources, immediate, type, margin) end

---
---* Corresponding Lua source code: [ltexlib.c#L3346-L3355](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3346-L3355)
---
---@param n integer
---
---@return Node
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getboxresourcebox(n) end

---
---Generate the reference (a rule type).
---
---The dimensions are optional and the final ones are returned as extra values.
---
---* Corresponding C source code: [ltexlib.c#L3280-L3325](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3280-L3325)
---
---@see tex.saveboxresource
---
---@param n integer
---@param width? integer
---@param height? integer
---@param depth? integer
---
---@return Node|nil margin
---@return integer|nil width
---@return integer|nil height
---@return integer|nil depth
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.useboxresource(n, width, height, depth) end

---
---Return the width, height, depth and margin of the resource.
---
---No dimensions returned means that the resource is
---unknown.
---
---* Corresponding C source code: [ltexlib.c#L3327-L3344](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3327-L3344)
---
---@param n Node
---
---@return integer|nil width
---@return integer|nil height
---@return integer|nil depth
---@return integer|nil margin
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getboxresourcedimensions(n) end

_N._10_3_9_triggerbuildpage = "page 198"

---
---Call the internal
---function that build a page, given that there is something to build.
---
---You should not expect to much from the `triggerbuildpage` helpers because
---often *TeX* doesn't do much if it thinks nothing has to be done, but it might be
---useful for some applications.
---
---* Corresponding C source code: [ltexlib.c#L3357-L3361](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3357-L3361)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.triggerbuildpage() end

_N._10_3_10_splitbox = "page 198"

---
---Split a box.
---
---The remainder is kept in the original box and a packaged vlist is returned. This
---operation is comparable to the `vsplit` operation. The mode can be `additional` or `exactly` and concerns the split off box.
---
---* Corresponding C source code: [ltexlib.c#L1282-L1308](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1282-L1308)
---
---@param n Node
---@param height integer
---@param mode 'additional' | 'exactly'
---
---@return Node|nil vlist
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.splitbox(n, height, mode) end

_N._10_3_11_accessing_math_parameters_get_set_math = "page 198"

---
---Set the internal math parameters.
---
---* Corresponding C source code: [ltexlib.c#L1986-L2015](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1986-L2015)
---
---@param math_param_name MathParamName
---@param math_style_name MathStyleName
---@param value integer
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmath(math_param_name, math_style_name, value) end

---
---Set the internal math parameters.
---
---* Corresponding C source code: [ltexlib.c#L1986-L2015](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1986-L2015)
---
---@param global 'global' # Indicate a global assignment.
---@param math_param_name MathParamName
---@param math_style_name MathStyleName
---@param value integer|Node # The value is either a number (representing a dimension or number) or a glue spec node representing a muskip for `ordordspacing` and similar spacing parameters.
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setmath(global, math_param_name, math_style_name, value) end

---
---Query the internal math parameters.
---
---* Corresponding C source code: [ltexlib.c#L2017-L2039](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2017-L2039)
---
---@param math_param_name MathParamName
---@param math_style_name MathStyleName
---
---@return integer|Node value # The value is either a number (representing a dimension or number) or a glue spec node representing a muskip for `ordordspacing` and similar spacing parameters.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmath(math_param_name, math_style_name) end

---
---The style name minus the trailing “style”.
---
---* Corresponding C source code: [texmath.c#L510-L516](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texmath.c#L510-L516)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MathStyleName
---|'display'
---|'crampeddisplay'
---|'text'
---|'crampedtext'
---|'script'
---|'crampedscript'
---|'scriptscript'
---|'crampedscriptscript'

---
---The parameter name minus the leading “Umath”.
---
---* Corresponding C source code: [texmath.c#L518-L558](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texmath.c#L518-L558)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MathParamName
---|'quad'
---|'axis'
---|'operatorsize'
---|'overbarkern'
---|'overbarrule'
---|'overbarvgap'
---|'underbarkern'
---|'underbarrule'
---|'underbarvgap'
---|'radicalkern'
---|'radicalrule'
---|'radicalvgap'
---|'radicaldegreebefore'
---|'radicaldegreeafter'
---|'radicaldegreeraise'
---|'stackvgap'
---|'stacknumup'
---|'stackdenomdown'
---|'fractionrule'
---|'fractionnumvgap'
---|'fractionnumup'
---|'fractiondenomvgap'
---|'fractiondenomdown'
---|'fractiondelsize'
---|'skewedfractionhgap'
---|'skewedfractionvgap'
---|'limitabovevgap'
---|'limitabovebgap'
---|'limitabovekern'
---|'limitbelowvgap'
---|'limitbelowbgap'
---|'limitbelowkern'
---|'nolimitsubfactor'
---|'nolimitsupfactor'
---|'underdelimitervgap'
---|'underdelimiterbgap'
---|'overdelimitervgap'
---|'overdelimiterbgap'
---|'subshiftdrop'
---|'supshiftdrop'
---|'subshiftdown'
---|'subsupshiftdown'
---|'subtopmax'
---|'supshiftup'
---|'supbottommin'
---|'supsubbottommax'
---|'subsupvgap'
---|'spaceafterscript'
---|'connectoroverlapmin'
---|'ordordspacing'
---|'ordopspacing'
---|'ordbinspacing'
---|'ordrelspacing'
---|'ordopenspacing'
---|'ordclosespacing'
---|'ordpunctspacing'
---|'ordinnerspacing'
---|'opordspacing'
---|'opopspacing'
---|'opbinspacing'
---|'oprelspacing'
---|'opopenspacing'
---|'opclosespacing'
---|'oppunctspacing'
---|'opinnerspacing'
---|'binordspacing'
---|'binopspacing'
---|'binbinspacing'
---|'binrelspacing'
---|'binopenspacing'
---|'binclosespacing'
---|'binpunctspacing'
---|'bininnerspacing'
---|'relordspacing'
---|'relopspacing'
---|'relbinspacing'
---|'relrelspacing'
---|'relopenspacing'
---|'relclosespacing'
---|'relpunctspacing'
---|'relinnerspacing'
---|'openordspacing'
---|'openopspacing'
---|'openbinspacing'
---|'openrelspacing'
---|'openopenspacing'
---|'openclosespacing'
---|'openpunctspacing'
---|'openinnerspacing'
---|'closeordspacing'
---|'closeopspacing'
---|'closebinspacing'
---|'closerelspacing'
---|'closeopenspacing'
---|'closeclosespacing'
---|'closepunctspacing'
---|'closeinnerspacing'
---|'punctordspacing'
---|'punctopspacing'
---|'punctbinspacing'
---|'punctrelspacing'
---|'punctopenspacing'
---|'punctclosespacing'
---|'punctpunctspacing'
---|'punctinnerspacing'
---|'innerordspacing'
---|'inneropspacing'
---|'innerbinspacing'
---|'innerrelspacing'
---|'inneropenspacing'
---|'innerclosespacing'
---|'innerpunctspacing'
---|'innerinnerspacing'

_N._10_3_12_special_list_heads_get_set_list = "page 200"

---
---The virtual table `tex.lists` contains the set of internal registers that
---keep track of building page lists.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3713](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3713)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists = {}

---
---circular list of pending insertions
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.page_ins_head = nil

---
---the recent contributions
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.contrib_head = nil

---
---the current page content
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.page_head = nil

---
---used for held-over items for next page
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.hold_head = nil

---
---head of the current `vadjust` list
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.adjust_head = nil

---
---head of the current `\vadjust pre` list
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.pre_adjust_head = nil

---
---head of the discarded items of a page break
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.page_discards_head = nil

---
---head of the discarded items in a vsplit
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.lists.split_discards_head = nil

---
---You have
---to be careful with what you set as *TeX* can have expectations with regards to
---how a list is constructed or in what state it is.
---
---* Corresponding C source code: [ltexlib.c#L2266-L2321](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2266-L2321)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setlist() end

---
---* Corresponding C source code: [ltexlib.c#L2202-L2264](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2202-L2264)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getlist() end

_N._10_3_13_semantic_nest_levels_getnest_and_ptr = "page 200"

---
---The virtual table `nest` contains the currently active semantic nesting
---state. It has two main parts: a zero-based array of userdata for the semantic
---nest itself, and the numerical value `ptr`, which gives the highest
---available index. Neither the array items in `nest[]` nor `ptr` can be
---assigned to (as this would confuse the typesetting engine beyond repair), but you
---can assign to the individual values inside the array items, e.g. `tex.nest[tex.nest.ptr].prevdepth`.
---
---`tex.nest[tex.nest.ptr]` is the current nest state, `nest[0]` the
---outermost (main vertical list) level.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3714](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3714)
---
---@type table<integer, Nest>
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.nest = {}

---
---highest
---available index.
---@type integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
tex.nest.ptr = 0

---
---The getter function is `getnest`. You
---can pass a number (which gives you a list), nothing or `top`, which returns
---the topmost list, or the string `ptr` which gives you the index of the
---topmost list.
---
---* Corresponding C source code: [ltexlib.c#L2422-L2455](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2422-L2455)
---
---@return Nest
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getnest() end

---
---* Corresponding C source code: [ltexlib.c#L2457-L2461](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2457-L2461)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.setnest() end

---
---* Corresponding C source code: [ltexlib.c#L2325-L2361](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2325-L2361)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Nest
---@field mode number # the meaning of these numbers depends on the engine and sometimes even the version; you can use `tex.getmodevalues()` to get the mapping: positive values signal vertical, horizontal and math mode, while negative values indicate inner and inline variants (all modes).
---@field modeline integer # source input line where this mode was entered in, negative inside the output routine (all modes).
---@field head Node # the head of the current list (all modes).
---@field tail Node # the tail of the current list (all modes).
---@field prevgraf integer # number of lines in the previous paragraph (vertical mode).
---@field prevdepth integer # depth of the previous paragraph (vertical mode).
---@field spacefactor integer # the current space factor (horizontal mode).
---@field dirs Node # used for temporary storage by the line break algorithm (horizontal mode).
---@field noad Node #  used for temporary storage of a pending fraction numerator, for `over` etc. (math mode).
---@field delimptr Node # used for temporary storage of the previous math delimiter, for `middle` (math mode).
---@field mathdir boolean # true when during math processing the `mathdir` is not the same as the surrounding `textdir` (math mode).
---@field mathstyle integer # mmode  the current `mathstyle`
---

---
---`tex.getmodevalues()` to get the mapping: positive values signal vertical, horizontal and math mode, while negative values indicate inner and inline variants (all modes).
---
---* Corresponding C source code: [ltexlib.c#L3549-L3565](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3549-L3565)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getmodevalues() end

_N._10_3_14_print = "page 201"

_N._10_3_14_1_print = "page 201"

---
---@alias PrintableInput string|number|integer

---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1222-L1224](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1222-L1224)
---* Corresponding C source code: [ltexlib.c#L161-164](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L161-164)
---
---@param input_line PrintableInput # Each string argument is treated by *TeX* as a separate input line.
---@param ... PrintableInput # The very last string of the very last `tex.print` command in a `directlua` will not have the `endlinechar` appended, all others do.
---
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.print(input_line, ...) end

---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1222-L1224](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1222-L1224)
---* Corresponding C source code: [ltexlib.c#L161-164](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L161-164)
---
---@param catcodetable_no integer The parameter can be used to print the strings using the catcode regime defined by `\catcodetable` `catcodetable_no`. If `catcodetable_no` is `-1`, the currently active catcode regime is used. If `catcodetable_no` is `-2`, the resulting catcodes are the result of `\the` `\toks`: all category codes are `12` (`other`) except for the space character, that has category code `10` (`space`). Otherwise, if `catcodetable_no` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.
---@param input_line PrintableInput # Each string argument is treated by *TeX* as a separate input line.
---@param ... PrintableInput # The very last string of the very last `tex.print` command in a `directlua` will not have the `endlinechar` appended, all others do.
---
---@see tex.print
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.print(catcodetable_no, input_line, ...) end

---
---If there is a
---table argument instead of a list of strings, this has to be a consecutive array
---of strings to print (the first non-string value will stop the printing process).
---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1222-L1224](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1222-L1224)
---* Corresponding C source code: [ltexlib.c#L161-164](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L161-164)
---
---@param input_lines PrintableInput[] # Each string (or number) element of the input table is treated by *TeX* as a separate input line.
---
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.print(input_lines) end

---
---see `LuaTeX` manual: 10.3.14.1 `print`
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1222-L1224](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1222-L1224)
---* Corresponding C source code: [ltexlib.c#L161-164](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L161-164)
---
---@param catcodetable_no integer The parameter can be used to print the strings using the catcode regime defined by `\catcodetable` `catcodetable_no`. If `catcodetable_no` is `-1`, the currently active catcode regime is used. If `catcodetable_no` is `-2`, the resulting catcodes are the result of `\the` `\toks`: all category codes are `12` (`other`) except for the space character, that has category code `10` (`space`). Otherwise, if `catcodetable_no` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.
---@param input_lines PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input line.
---
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.print(catcodetable_no, input_lines) end

---
---combines all of its arguments (or the elements of array argument) into a single input line for TeX. So any leading spaces will be treated as if they were typed, etc. (`s(ingle-input-line)print`).
---
---Each string argument is treated by *TeX* as a special kind of input line that
---makes it suitable for use as a partial line input mechanism:
---
---* *TeX* does not switch to the “new line” state, so that leading
---  spaces are not ignored.
---* No `endlinechar` is inserted.
---* Trailing spaces are not removed. Note that this does not prevent
---  *TeX* itself from eating spaces as result of interpreting the line.
---  For example, in
---
---```tex
---before\directlua{tex.sprint("\\relax")tex.sprint(" inbetween")}after
---```
---
---the space before `in between` will be gobbled as a result of the
---“normal” scanning of `\relax`.
---
---If there is a table argument instead of a list of strings, this has to be a
---consecutive array of strings to print (the first non-string value will stop the
---printing process).
---
---The optional argument sets the catcode regime, as with `tex.print`. This
---influences the string arguments (or numbers turned into strings).
---
---Although this needs to be used with care, you can also pass token or node
---userdata objects. These get injected into the stream. Tokens had best be valid
---tokens, while nodes need to be around when they get injected. Therefore it is
---important to realize the following:
---
---* When you inject a token, you need to pass a valid token userdata object. This
---  object will be collected by *Lua* when it no longer is referenced. When it gets
---  printed to *TeX* the token itself gets copied so there is no interference with the
---  *Lua* garbage collection. You manage the object yourself. Because tokens are
---  actually just numbers, there is no real extra overhead at the *TeX* end.
---* When you inject a node, you need to pass a valid node userdata object. The
---  node related to the object will not be collected by *Lua* when it no longer
---  is referenced. It lives on at the *TeX* end in its own memory space. When it
---  gets printed to *TeX* the node reference is used assuming that node stays
---  around. There is no *Lua* garbage collection involved. Again, you manage the
---  object yourself. The node itself is freed when *TeX* is done with it.
---
---If you consider the last remark you might realize that we have a problem when a
---printed mix of strings, tokens and nodes is reused. Inside *TeX* the sequence
---becomes a linked list of input buffers. So, `"123"` or `"\foo{123`"}
---gets read and parsed on the fly, while `<token userdata>` already is
---tokenized and effectively is a token list now. A `<node userdata>` is also
---tokenized into a token list but it has a reference to a real node. Normally this
---goes fine. But now assume that you store the whole lot in a macro: in that case
---the tokenized node can be flushed many times. But, after the first such flush the
---node is used and its memory freed. You can prevent this by using copies which is
---controlled by setting `luacopyinputnodes` to a non-zero value. This is one
---of these fuzzy areas you have to live with if you really mess with these low
---level issues.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L168-171](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L168-171)
---
---@param input PrintableInput
---@param ... PrintableInput
---
---@see tex.print
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sprint(input, ...) end

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L168-171](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L168-171)
---
---@param catcodetable_no integer The parameter can be used to print the strings using the catcode regime defined by `\catcodetable` `catcodetable_no`. If `catcodetable_no` is `-1`, the currently active catcode regime is used. If `catcodetable_no` is `-2`, the resulting catcodes are the result of `\the` `\toks`: all category codes are `12` (`other`) except for the space character, that has category code `10` (`space`). Otherwise, if `catcodetable_no` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.
---@param input PrintableInput
---@param ... PrintableInput
---
---@see tex.print
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sprint(catcodetable_no, input, ...) end

---
---(`s(ingle-input-line)print`).
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L168-171](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L168-171)
---
---@param input PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input argument.
---
---@see tex.print
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sprint(input) end

---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L168-171](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L168-171)
---
---@param catcodetable_no integer The parameter can be used to print the strings using the catcode regime defined by `\catcodetable` `catcodetable_no`. If `catcodetable_no` is `-1`, the currently active catcode regime is used. If `catcodetable_no` is `-2`, the resulting catcodes are the result of `\the` `\toks`: all category codes are `12` (`other`) except for the space character, that has category code `10` (`space`). Otherwise, if `catcodetable_no` is not a valid catcode table, then it is ignored, and the currently active catcode regime is used instead.---@param t table
---@param input PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input argument.
---
---@see tex.print
---@see tex.tprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sprint(catcodetable_no, input) end

---
---Print tables of strings to the input stream (`t(able)print`).
---
---This function is basically a shortcut for repeated calls to
---`tex.sprint(catcodetable_no,  input, ...)`, once for each of the
---supplied argument tables.
---
---```tex
---\begingroup
---\catcode`\_=12
---\savecatcodetable 2
---\endgroup
---\tt\directlua{tex.tprint({ 2, '_' })}
---```
---
---```lua
---tex.tprint({ 1, 1, 2, 3 }) -- output: 123
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L207-242](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L207-242)
---
---@param input PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input argument.
---@param ... PrintableInput[]
---
---@see tex.print
---@see tex.sprint
---@see tex.cprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.tprint(input, ...) end

---
---Print to the input stream and specify a catcode (`c(atcode)print`).
---
---```lua
---tex.cprint( 1, " 1: `&{\\foo}") tex.print("\\par") -- a lot of \bgroup s
---tex.cprint( 2, " 2: `&{\\foo}") tex.print("\\par") -- matching \egroup s
---tex.cprint( 9, " 9: `&{\\foo}") tex.print("\\par") -- all get ignored
---tex.cprint(10, "10: `&{\\foo}") tex.print("\\par") -- all become spaces
---tex.cprint(11, "11: `&{\\foo}") tex.print("\\par") -- letters
---tex.cprint(12, "12: `&{\\foo}") tex.print("\\par") -- other characters
---tex.cprint(14, "12: $&{\\foo}") tex.print("\\par") -- comment triggers
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L175-203](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L175-203)
---
---@param catcode integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---@param input PrintableInput
---@param ... PrintableInput
---
---@see tex.print
---@see tex.sprint
---@see tex.tprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.cprint(catcode, input, ...) end

---
---Print to the input stream and specify a catcode (`c(atcode)print`).
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L175-203](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L175-203)
---
---@param catcode integer # The category code (`0` stands for the escape character, normally `\`, `1` stands for begin grouping, normally `{` and so on).
---@param input PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input argument.
---
---@see tex.print
---@see tex.sprint
---@see tex.tprint
---@see tex.write
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.cprint(catcode, input) end

---
---Print to the input stream using category code `12` (`other`) except
---for the space character, that has category code `10` (`space`).
---
---Each string argument is treated by *TeX* as a special kind of input line that
---makes it suitable for use as a quick way to dump information:
---
---* All catcodes on that line are either “space” (for ` `) or “character” (for all others).
---* There is no `endlinechar` appended.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L175-203](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L154-157)
---
---@param input PrintableInput
---@param ... PrintableInput
---
---@see tex.print
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.write(input, ...) end

---
---Print to the input stream using category code `12` (`other`) except
---for the space character, that has category code `10` (`space`).
---
---Each string argument is treated by *TeX* as a special kind of input line that
---makes it suitable for use as a quick way to dump information:
---
---* All catcodes on that line are either “space” (for ` `) or “character” (for all others).
---* There is no `endlinechar` appended.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L175-203](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L154-157)
---
---@param input PrintableInput[] # Each string element of the input table is treated by *TeX* as a separate input argument.
---
---@see tex.print
---@see tex.sprint
---@see tex.tprint
---@see tex.cprint
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.write(input) end

_N._10_3_15 = "page 203"

_N._10_3_15_1 = "page 203"

---
---Rounds *Lua* number `o`, and returns a number that is in the range of a
---valid *TeX* register value. If the number starts out of range, it generates a
---“number too big” error as well.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2474-2482](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2474-2482)
---
---@param o number
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.round(o) end

_N._10_3_15_2 = "page 203"

---
---Multiplies the *Lua* numbers `o` and `delta`, and returns a rounded
---number that is in the range of a valid *TeX* register value. In the table
---version, it creates a copy of the table with all numeric top-level values scaled
---in that manner. If the multiplied number(s) are of range, it generates
---“number too big” error(s) as well.
---
---Note: the precision of the output of this function will depend on your computer's
---architecture and operating system, so use with care! An interface to *LuaTeX*'s
---internal, 100% portable scale function will be added at a later date.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2484-2513](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2484-2513)
---
---@param o number
---@param delta number
---
---@return number
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.scale(o, delta) end

---
---@param o table
---@param delta number
---
---@return table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.scale(o, delta) end

_N._15_3 = "page 204"

---
---Companion to the primitive `\number`.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2484-2513](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2484-2513)
---* https://www.tug.org/utilities/plain/cseq.html#number-rp
---
---@param n integer
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.number(n) end

---
---Companion to the primitive `\romannumeral`.
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2061-2064](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2061-2064)
---
---@param n integer # for example `2025`
---
---@return string # for example `mmxxv`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.romannumeral(n) end

_N._10_3_15_4 = "page 204"

---
---returns the `csname` string that matches a
---font id number (if there is one).
---
---__Reference:__
---
---* Corresponding C source code: [L2047-L2050](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2047-L2050)
---
---@param font_id integer
---
---@return string # for example `\tenrm`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.fontidentifier(font_id) end

---
---The first one returns the name only, the second one reports the size too.
---
---__Reference:__
---
---* Corresponding C source code: [L2042-L2045](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2042-L2045)
---
---@param font_id integer
---
---@return string # for example `cmr10`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.fontname(font_id) end

_N._10_3_15_5_sp = "page 204"

---
---Converts the number `o` that represents an explicit
---dimension into an integer number of scaled points.
---
---see `LuaTeX` manual: 10.3.15.5 `sp`
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1395-L1396](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1395-L1396)
---
---@param o integer
---
---@return integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sp(o) end

---
---Convert a string `s` that represents an explicit
---dimension into an integer number of scaled points.
---
---For parsing the string, the same scanning and conversion rules are used that
---*LuaTeX* would use if it was scanning a dimension specifier in its *TeX*-like
---input language (this includes generating errors for bad values), expect for the
---following:
---
---* only explicit values are allowed, control sequences are not handled
---* infinite dimension units (`fil...`) are forbidden
---* `mu` units do not generate an error (but may not be useful either)
---
---__Example__:
---
---```lua
---local scaled_points = tex.sp('1cm')
---print(scaled_points) -- 1864679
---```
---
---__Reference__:
---
---* `LuaTeX` manual: 10.3.15.5 `sp` page 204
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1386-L1413](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1386-L1413)
---
---@param s string # A string to convert into scaled points.
---
---@return integer # The dimension in the scaled points format.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.sp(s) end

_N._10_3_15_6 = "page 204"

-- Removed?

_N._10_3_15_7_error_show_context = "page 204"

---
---Create an error like the combination of `\errhelp` and
---`\errmessage`.
---
---During this error, deletions are disabled.
---
---see `LuaTeX` manual: 10.3.15.5 `sp`
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1438-L1457](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1438-L1457)
---* Corresponding C source code: [ltexlib.c#L654-692](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L654-692)
---
---@param message string # An error message like `\errmessage`.
---@param help? table # The array part of the `help` table has to contain strings, one for each line of error help.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.error(message, help) end

---
---Show the current
---(expansion) context in case of an error.
---
----__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L3210-L3215](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3210-L3215)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.show_context() end

_N._10_3_15_8_run_finish = "page 205"

---
---Start the interpretation.
---
---A run normally
---boils down to *TeX* entering the so called main loop. A token is fetched and
---depending on it current meaning some actions takes place. Sometimes that actions
---comes immediately, sometimes more scanning is needed. Quite often tokens get
---pushed back into the input. This all means that the *TeX* scanner is constantly
---pushing and popping input states, but in the end after all the action is done
---returns to the main loop.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1459-L1470](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1459-L1470)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.run() end

---
---Force the end of an interpretation.
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1464](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1464)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.finish() end

_N._10_3_15_9_runtoks = "page 205"

---
---Because of the fact that *TeX* is in a complex dance of expanding, dealing with
---fonts, typesetting paragraphs, messing around with boxes, building pages, and so
---on, you cannot easily run a nested *TeX* run (read nested main loop). However,
---there is an option to force a local run with `runtoks`. The content of the
---given token list register gets expanded locally after which we return to where we
---triggered this expansion, at the *Lua* end. Instead a function can get passed
---that does some work. You have to make sure that at the end *TeX* is in a sane
---state and this is not always trivial. A more complex mechanism would complicate
---*TeX* itself (and probably also harm performance) so this simple local expansion
---loop has to do.
---
---When the `tracingnesting` parameter is set to a value larger than 2 some
---information is reported about the state of the local loop.
---
---Inside for instance an `\edef` the `runtoks` function behaves (at
---least tries to) like it were an `\the`. This prevents unwanted side
---effects: normally in such an definition tokens remain tokens and (for instance)
---characters don't become nodes.
---
---__Example:__
---
---```lua
---\toks0{\setbox0\hbox{one}}
---\toks1{\setbox0\hbox{first}}
---\directlua {
---  tex.forcehmode(true)
---  tex.runtoks(0)
---  print(tex.getbox(0).width)
---  tex.runtoks(1)
---  print(tex.getbox(0).width)
---}
---```
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1472-L1508](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1472-L1508)
---* Corresponding C source code: [ltexlib.c#L3464-L3536](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3464-L3536)
---
---@param token_register integer
---@param force? boolean # force the local main loop
---@param grouped? boolean # adds a level of grouping.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.runtoks(token_register, force, grouped) end

---
---@param func function
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.runtoks(func) end

---
---You can quit the local loop with `\endlocalcontrol` or from the *Lua* end
---with `tex.quittoks`. In that case you end one level up! Of course in the
---end that can mean that you arrive at the main level in which case an extra end
---will trigger a redundancy warning (not an abort!).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.quittoks() end

_N._10_3_15_10_forcehmode = "page 205"

---
---An example of a (possible error triggering) complication is that *TeX* expects to
---be in some state, say horizontal mode, and you have to make sure it is when you
---start feeding back something from *Lua* into *TeX*. Normally a user will not run
---into issues but when you start writing tokens or nodes or have a nested run there
---can be situations that you need to run `forcehmode`. There is no recipe for
---this and intercepting possible cases would weaken *LuaTeX*'s flexibility.
---
---@param indented? boolean
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.forcehmode(indented) end

_N._10_3_15_11_hashtokens = "page 205"

---
---Return a list of names.
---
---This can be useful for debugging, but note that this
---also reports control sequences that may be unreachable at this moment due to
---local redefinitions: it is strictly a dump of the hash table. You can use `token.create` to inspect properties, for instance when the `command` key
---in a created table equals `123`, you have the `cmdname` value `undefined_cs`.
---
---```lua
---for i,v in pairs(tex.hashtokens()) do ... end
---```
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L2662-L2690](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2662-L2690)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.hashtokens() end

_N._10_3_15_12_definefont = "page 206"

---
---Associates `csname` with the internal font number `fontid`. The
---definition is global if (and only if) `global` is specified and true (the
---setting of `globaldefs` is not taken into account).
---
---@param csname string
---@param fontid integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.definefont(csname, fontid) end

---
---Associates `csname` with the internal font number `fontid`. The
---definition is global if (and only if) `global` is specified and true (the
---setting of `globaldefs` is not taken into account).
---
---@param global boolean
---@param csname string
---@param fontid integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.definefont(global, csname, fontid) end

_N._10_3_16_primitives = "page 206"

_N._10_3_16_1_enableprimitives = "page 206"

---
---This function accepts a prefix string and an array of primitive names. For each
---combination of “prefix” and “name”, the `tex.enableprimitives` first verifies that “name” is an actual primitive
---(it must be returned by one of the `tex.extraprimitives` calls explained
---below, or part of *TeX*82, or `directlua`). If it is not, `tex.enableprimitives` does nothing and skips to the next pair.
---
---But if it is, then it will construct a csname variable by concatenating the
---“prefix” and “name”, unless the “prefix” is already the
---actual prefix of “name”. In the latter case, it will discard the “prefix”, and just use “name”.
---
---Then it will check for the existence of the constructed csname. If the csname is
---currently undefined (note: that is not the same as `relax`), it will
---globally define the csname to have the meaning: run code belonging to the
---primitive “name”. If for some reason the csname is already defined, it
---does nothing and tries the next pair.
---
---An example:
---
---```lua
---tex.enableprimitives('LuaTeX', {'formatname'})
---```
---
---will define `\LuaTeXformatname` with the same intrinsic meaning as the
---documented primitive `formatname`, provided that the control sequences `\LuaTeXformatname` is currently undefined.
---
---When *LuaTeX* is run with `--ini` only the *TeX*82 primitives and `directlua` are available, so no extra primitives {\bf at all}.
---
---If you want to have all the new functionality available using their default
---names, as it is now, you will have to add
---
---```tex
---\ifx\directlua\undefined \else
---    \directlua {tex.enableprimitives('',tex.extraprimitives ())}
---\fi
---```
---
---near the beginning of your format generation file. Or you can choose different
---prefixes for different subsets, as you see fit.
---
---Calling some form of `tex.enableprimitives` is highly important though,
---because if you do not, you will end up with a *TeX*82-lookalike that can run *Lua*
---code but not do much else. The defined csnames are (of course) saved in the
---format and will be available at runtime.
---
---*
---
---* Corresponding C source code: [ltexlib.c#L2752-L2809](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2752-L2809)
---
---@param prefix string
---@param primitive_names string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.enableprimitives(prefix, primitive_names) end

_N._10_3_16_2_extraprimitives = "page 205"

---
---@alias TexEngine
---|'etex'
---|'tex'
---|'core'
---|'luatex'

---
---Return a list of the primitives that originate from the engine(s)
---given by the requested string value(s).
---
---The possible values and their (current)
---return values are given in the following table. In addition the somewhat special
---primitives “\tex{ ”}, “\tex {/”} and “`-`” are defined.
---
---Note that `luatex` does not contain `directlua`, as that is
---considered to be a core primitive, along with all the *TeX*82 primitives, so it is
---part of the list that is returned from `core`.
---
---Running `tex.extraprimitives()` will give you the complete list of
---primitives `-ini` startup. It is exactly equivalent to `tex.extraprimitives("etex","luatex")`.
---
---* Corresponding C source code: [ltexlib.c#L2710-L2750](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2710-L2750)
---
---@param ... TexEngine
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.extraprimitives(...) end

_N._10_3_16_3_primitives = "page 210"

---
---Return a list of all primitives that *LuaTeX* knows about.
---
---* Corresponding C source code: [ltexlib.c#L2691-L2708](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2691-L2708)
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.primitives() end

_N._10_3_17_core_functionality_interfaces = "page 210"

_N._10_3_17_1_badness = "page 210"

---
---Calculate the badness.
---
---This helper function is useful during linebreak calculations. The function returns the badness for when total `total`
---is supposed to be made from amounts that sum to `sum`. The returned number is
---a reasonable approximation of `100(total/sum)^3`.
---
---* Corresponding C source code: [ltexlib.c#L3069-L3075](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3069-L3075)
---* Corresponding C source code: [arithmetic.c#L275-L300](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/arithmetic.c#L275-L300)
---
---@param total integer # scaled values
---@param sum integer # scaled values
---
---@return integer badness
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.badness(total, sum) end

_N._10_3_17_2_resetparagraph = "page 210"

---
---Reset the parameters that *TeX* normally resets when a new paragraph
---is seen.
---
---* Corresponding C source code: [ltexlib.c#L3054-L3059](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3054-L3059)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.resetparagraph() end

_N._10_3_17_3_linebreak = "page 210"

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class LinebreakParameters
---@field pardir string
---@field pretolerance integer
---@field tracingparagraphs integer
---@field tolerance integer
---@field looseness integer
---@field hyphenpenalty integer
---@field exhyphenpenalty integer
---@field pdfadjustspacing integer
---@field adjdemerits integer
---@field pdfprotrudechars integer
---@field linepenalty integer
---@field lastlinefit integer
---@field doublehyphendemerits integer
---@field finalhyphendemerits integer
---@field hangafter integer
---@field interlinepenalty integer|table # or table  if a table, then it is an array like `interlinepenalties`
---@field clubpenalty integer|table # or table  if a table, then it is an array like `clubpenalties`
---@field widowpenalty integer|table # or table  if a table, then it is an array like `widowpenalties`
---@field brokenpenalty integer
---@field emergencystretch integer # in scaled points
---@field hangindent integer # in scaled points
---@field hsize integer # in scaled points
---@field leftskip GlueSpecNode
---@field rightskip GlueSpecNode
---@field parshape table
---

---
---Note that there is no interface for `displaywidowpenalties`, you have to
---pass the right choice for `widowpenalties` yourself.
---
---It is your own job to make sure that `listhead` is a proper paragraph list:
---this function does not add any nodes to it. To be exact, if you want to replace
---the core line breaking, you may have to do the following (when you are not
---actually working in the `pre_linebreak_filter` or `linebreak_filter`
---callbacks, or when the original list starting at listhead was generated in
---horizontal mode):
---
---* add an “indent box” and perhaps a `local_par` node at the start
---    (only if you need them)
---
---* replace any found final glue by an infinite penalty (or add such a penalty,
---    if the last node is not a glue)
---
---* add a glue node for the `parfillskip` after that penalty node
---
---* make sure all the `prev` pointers are OK
---
---The result is a node list, it still needs to be vpacked if you want to assign it
---to a `vbox`. The returned `info` table contains four values that are
---all numbers:
---
--- name       explanation
---
--- prevdepth  depth of the last line in the broken paragraph
--- prevgraf   number of lines in the broken paragraph
--- looseness  the actual looseness value in the broken paragraph
--- demerits   the total demerits of the chosen solution
---
---Note there are a few things you cannot interface using this function: You cannot
---influence font expansion other than via `pdfadjustspacing`, because the
---settings for that take place elsewhere. The same is true for hbadness and hfuzz
---etc. All these are in the `hpack` routine, and that fetches its own
---variables via globals.
---
---@param listhead Node
---@param parameters LinebreakParameters
---
---@return Node
---@return table
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.linebreak(listhead, parameters) end

---
---Ships out box number `n` to the output file, and clears the box register.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.shipout() end

---
---This helper reports the current page state: `empty`, `box_there` or
---`inserts_only` as integer value.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getpagestate() end

---
---This integer reports the current level of the local loop. It's only useful for
---debugging and the (relative state) numbers can change with the implementation.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.getlocallevel() end

_N._10_3_18_randomizers = "page 212"

-- { "uniform_rand",tex_unif_rand },
-- { "normal_rand", tex_norm_rand },
-- { "lua_math_randomseed", tex_init_rand }, /* syntactic sugar  */

---
---Initialize a new seed.
---
---`lua_math_randomseed` is
---equivalent to this function.
---
---* Corresponding C source code: [ltexlib.c#L3132-L3142](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3132-L3142)
---
---@see tex.lua_math_randomseed
---
---@param seed integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.init_rand(seed) end

---
---Initialize a new seed.
---
---`init_rand` is
---equivalent to this function.
---
---* Corresponding C source code: [ltexlib.c#L3132-L3142](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3132-L3142)
---
---@see tex.init_rand
---
---@param seed integer
---
---You can
---initialize with a new seed with `lua_math_randomseed` (`init_rand` is
---equivalent to this one.)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.lua_math_randomseed(seed) end

---
---For practical reasons *LuaTeX* has its own random number generator. This is the original
---*Lua* random function.
---
---* Corresponding C source code: [ltexlib.c#L3164-L3192](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3164-L3192)
---
---@param lower number
---@param upper number
---
---@return number
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.lua_math_random(lower, upper) end

---
---For practical reasons *LuaTeX* has its own random number generator. This is the original
---*Lua* random function.
---
---* Corresponding C source code: [ltexlib.c#L3164-L3192](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3164-L3192)
---
---@param upper? number
---
---@return number
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.lua_math_random(upper) end

---
---no argument is used
---
---* Corresponding C source code: [ltexlib.c#L3156-L3160](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3156-L3160)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.normal_rand() end

---
---takes a number that will get rounded before being used
---
---* Corresponding C source code: [ltexlib.c#L3144-L3154](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3144-L3154)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.uniform_rand() end

---
--- which behaves like the primitive and expects a scaled integer, so
---
---```lua
---tex.print(tex.uniformdeviate(65536)/65536)
---```
---
---will give a random number between zero and one.
---
---* Corresponding C source code: [ltexlib.c#L2051-L2054](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L2051-L2054)
---
---@param n integer a scaled integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.uniformdeviate(n) end

_N._10_3_19_synctex = "page 212"

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias SyntexMode
---|0 # is the default and used normal synctex logic
---|1 # uses the values set by the next helpers
---|2 # sets for glyph nodes
---|3 # sets glyph and glue nodes
---|4 # sets only glyph modes

---
---* Corresponding C source code: [ltexlib.c#L3377-L3382](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3377-L3382)
---
---@param mode SyntexMode
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.set_synctex_mode(mode) end

---
---Return the current mode.
---
---* Corresponding C source code: [ltexlib.c#L3383-L3387](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3383-L3387)
---
---@return SyntexMode mode
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.get_synctex_mode() end

---
---Set the current tag (file) value (obeys save stack).
---
---* Corresponding C source code: [ltexlib.c#L3389-L3394](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3389-L3394)
---
---@param tag integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.set_synctex_tag(tag) end

---
---Get the currently set value of a tag (file).
---
---* Corresponding C source code: [ltexlib.c#L3396-L3400](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3396-L3400)
---
---@return integer tag
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.get_synctex_tag() end

---
---Overload the tag (file) value  (`0` resets).
---
---* Corresponding C source code: [ltexlib.c#L3402-L3407](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3402-L3407)
---
---@param tag integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.force_synctex_tag(tag) end

---
---Set the current line value (obeys save stack).
---
---* Corresponding C source code: [ltexlib.c#L3416-L3421](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3416-L3421)
---
---@param line integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.set_synctex_line(line) end

---
---Get the currently set value of a line.
---
---* Corresponding C source code: [ltexlib.c#L3423-L3427](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3423-L3427)
---
---@return integer line
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.get_synctex_line() end

---
---Overload the line value (`0` resets)
---
---* Corresponding C source code: [L3409-L3414](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3409-L3414)
---
---@param line integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.force_synctex_line(line) end

---
---Disable synctex file logging.
---
---* Corresponding C source code: [ltexlib.c#L3429-L3434](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L3429-L3434)
---
---@param flag integer
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/tex.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function tex.set_synctex_no_files(flag) end
