---@meta
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
---This library has functions that register, find and list callbacks. Callbacks are
---*Lua* functions that are called in well defined places. There are two kind of
---callbacks: those that mix with existing functionality, and those that (when
---enabled) replace functionality. In mosty cases the second category is expected to
---behave similar to the built in functionality because in a next step specific
---data is expected. For instance, you can replace the hyphenation routine. The
---function gets a list that can be hyphenated (or not). The final list should be
---valid and is (normally) used for constructing a paragraph. Another function can
---replace the ligature builder and/or kerner. Doing something else is possible
---but in the end might not give the user the expected outcome.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L17-L26](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-callbacks.tex#L17-L26)
---
callback = {}

---
---Source: `callback.list()`
---@alias CallbackName
---|"append_to_vlist_filter"
---|"build_page_insert"
---|"buildpage_filter"
---|"call_edit
---|"contribute_filter"
---|"define_font"
---|"find_cidmap_file"
---|"find_data_file"
---|"find_enc_file"
---|"find_font_file"
---|"find_format_file"
---|"find_image_file"
---|"find_map_file"
---|"find_opentype_file"
---|"find_output_file"
---|"find_pk_file"
---|"find_read_file"
---|"find_truetype_file"
---|"find_type1_file"
---|"find_vf_file"
---|"find_write_file"
---|"finish_pdffile"
---|"finish_pdfpage"
---|"hpack_quality"
---|"hyphenate
---|"input_level_string"
---|"insert_local_par"
---|"kerning
---|"ligaturing
---|"linebreak_filter"
---|"make_extensible"
---|"mlist_to_hlist"
---|"new_graf
---|"open_read_file"
---|"page_order_index"
---|"post_linebreak_filter"
---|"pre_dump
---|"pre_linebreak_filter"
---|"pre_output_filter"
---|"process_input_buffer"
---|"process_jobname"
---|"process_output_buffer"
---|"process_pdf_image_content"
---|"process_rule"
---|"provide_charproc_data"
---|"read_cidmap_file"
---|"read_data_file"
---|"read_enc_file"
---|"read_font_file"
---|"read_map_file"
---|"read_opentype_file"
---|"read_pk_file"
---|"read_truetype_file"
---|"read_type1_file"
---|"read_vf_file"
---|"show_error_hook"
---|"show_error_message"
---|"show_lua_error_hook"
---|"show_warning_message"
---|"start_file
---|"start_page_number"
---|"start_run
---|"stop_file
---|"stop_page_number"
---|"stop_run
---|"vpack_filter"
---|"vpack_quality"
---|"wrapup_run

---
---The first thing you need to do is registering a callback:
---
---Here the `callback_name` is a predefined callback name, see below.
---
---*LuaTeX* internalizes the callback function in such a way that it does not matter
---if you redefine a function accidentally.
---
---Callback assignments are always global. You can use the special value `nil`
---instead of a function for clearing the callback.
---
---For some minor speed gain, you can assign the boolean `false` to the
---non-file related callbacks, doing so will prevent *LuaTeX* from executing
---whatever it would execute by default (when no callback function is registered at
---all). Be warned: this may cause all sorts of grief unless you know `exactly` what you are doing!
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L28-L54](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-callbacks.tex#L28-L54)
---
---@param callback_name CallbackName
---@param func function|nil|false
---
---@return integer|nil id # The function returns the internal `id` of the callback or `nil`, if the callback could not be registered.
---@return string error # In the latter case, `error` contains an error message, otherwise it is `nil`. The function returns `No such callback exists.` if a wrong callback name was specified.
function callback.register(callback_name, func) end

---
---The keys in the table are the known callback names, the value is a boolean where
---`true` means that the callback is currently set (active).
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L56-L62](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-callbacks.tex#L56-L62)
---
---@return table info
function callback.list() end

---
---If the callback is not set, `find` returns `nil`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L64-L68](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-callbacks.tex#L64-L68)
---
---@param callback_name CallbackName
---
---@return function|nil f
function callback.find(callback_name) end

_N._2 = nil

_N._2_1_find_read_file = nil
_N._2_1_find_write_file = nil
_N._2_2_find_font_file = nil
_N._2_3_find_output_file = nil
_N._2_4_find_format_file = nil
_N._2_5_find_vf_file = nil
_N._2_6_find_map_file = nil
_N._2_7_find_enc_file = nil
_N._2_8_find_pk_file = nil
_N._2_9_find_data_file = nil
_N._2_0_find_opentype_file = nil
_N._2_1_find_truetype_file = nil
_N._2_1_find_type1_file = nil
_N._2_2_find_image_file = nil

_N._3 = nil

_N._3_1_open_read_file = nil

_N._4 = nil

_N._4_1_process_input_buffer = nil

---
---This callback allows you to change the contents of the line input buffer just
---before *LuaTeX* actually starts looking at it.
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
---@alias ProcessInputBuffer fun(buffer: string): string|nil

_N._4_2_process_output_buffer = nil

---
---This callback allows you to change the contents of the line output buffer just
---before *LuaTeX* actually starts writing it to a file as the result of a `write` command. It is only called for output to an actual file (that is,
---excluding the log, the terminal, and so called `write` 18 calls).
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
---@alias ProcessOutputBuffer fun(buffer: string): string|nil

_N._4_3_process_jobname = nil

---
---This callback allows you to change the jobname given by `jobname` in *TeX*
---and `tex.jobname` in Lua. It does not affect the internal job name or the
---name of the output or log files.
---
---The only argument is the actual job name; you should not use `tex.jobname`
---inside this function or infinite recursion may occur. If you return `nil`,
---*LuaTeX* will pretend your callback never happened. This callback does not
---replace any internal code.
---@alias ProcessJobname fun(jobname: string): string|nil

_N._5 = nil

_N._5_1_contribute_filter = nil

---
---@alias ContributeFilterExtrainfo
---|'pre_box'# interline material is being added
---|'pre_adjust' # `vadjust` material is being added
---|'box' # a typeset box is being added (always called)
---|'adjust'# `vadjust` material is being added

---
---This callback is called when *LuaTeX* adds contents to list:
---
---The string reports the group code. From this you can deduce from
---what list you can give a treat.
---@alias ContributeFilter fun(extrainfo: ContributeFilterExtrainfo)

_N._5_2_buildpage_filter = nil

---
---@alias BuildpageFilterExtrainfo
---|'alignment' # a (partial) alignment is being added
---|'after_output' # an output routine has just finished
---|'new_graf' # the beginning of a new paragraph
---|'vmode_par' # `par` was found in vertical mode
---|'hmode_par' # `par` was found in horizontal mode
---|'insert' # an insert is added
---|'penalty' # a penalty (in vertical mode)
---|'before_display' # immediately before a display starts
---|'after_display' # a display is finished
---|'end' # *LuaTeX* is terminating (it's all over)

---
---This callback is called whenever *LuaTeX* is ready to move stuff to the main
---vertical list. You can use this callback to do specialized manipulation of the
---page building stage like imposition or column balancing.
---
---The string `extrainfo` gives some additional information about what *TeX*'s
---state is with respect to the “current page”.
---@alias BuildpageFilter fun(extrainfo: ContributeFilterExtrainfo)

_N._5_3_build_page_insert = nil

---
---This callback is called when the pagebuilder adds an insert. There is not much
---control over this mechanism but this callback permits some last minute
---manipulations of the spacing before an insert, something that might be handy when
---for instance multiple inserts (types) are appended in a row.
---
---* `n`  the insert class
---* `i`  the order of the insert
---
---The return value is a number indicating the skip register to use for the
---prepended spacing. This permits for instance a different top space (when `i` equals one) and intermediate space (when `i` is larger than one). Of
---course you can mess with the insert box but you need to make sure that *LuaTeX*
---is happy afterwards.
---@alias BuildPageInsert fun(n: integer, i: integer): integer

_N._5_4_pre_linebreak_filter = nil

---
---The string called `groupcode` identifies the nodelist's context within
---*TeX*'s processing. The range of possibilities is given in the table below, but
---not all of those can actually appear in `pre_linebreak_filter`, some are
---for the `hpack_filter` and `vpack_filter` callbacks that will be
---explained in the next two paragraphs.
---@alias PreLinebreakFilterGroupCode
---|'' # main vertical list
---|'hbox' # hbox` in horizontal mode
---|'adjusted_hbox' #hbox` in vertical mode
---|'vbox' # vbox`
---|'vtop' # vtop' #
---|'align' # halign` or `valign`
---|'disc' # discretionaries
---|'insert' # packaging an insert
---|'vcenter' # vcenter`
---|'local_box' # localleftbox` or `localrightbox`
---|'split_off' # top of a `vsplit`
---|'split_keep' # remainder of a `vsplit`
---|'align_set' # alignment cell
---|'fin_row' # alignment row

---
---As for all the callbacks that deal with nodes, the return value can be one of
---three things:
---
---* boolean `true` signals successful processing
---* `<node>` signals that the “head” node should be replaced by the
---  returned node
---* boolean `false` signals that the “head” node list should be
---  ignored and flushed from memory
---@alias NodeCallbackReturn true|false|Node

---
---This callback is called just before *LuaTeX* starts converting a list of nodes
---into a stack of `hbox`es, after the addition of `parfillskip`.
---
---```lua
------@type PreLinebreakFilter
---function(head, groupcode)
---  --- true|false|node
---  return true
---end
---```
---
---This callback does not replace any internal code.
---@alias PreLinebreakFilter fun(head: Node, groupcode: PreLinebreakFilterGroupCode): NodeCallbackReturn

_N._5_5_linebreak_filter = nil

---
---This callback replaces *LuaTeX*'s line breaking algorithm.
---
---The returned node is the head of the list that will be added to the main vertical
---list, the boolean argument is true if this paragraph is interrupted by a
---following math display.
---
---If you return something that is not a `<node>`, *LuaTeX* will apply the
---internal linebreak algorithm on the list that starts at `<head>`.
---Otherwise, the `<node>` you return is supposed to be the head of a list of
---nodes that are all allowed in vertical mode, and at least one of those has to
---represent a hbox. Failure to do so will result in a fatal error.
---
---Setting this callback to `false` is possible, but dangerous, because it is
---possible you will end up in an unfixable “deadcycles loop”.
---@alias LinebreakFilter fun(head: Node, is_display: boolean): NodeCallbackReturn

---
---@alias AppendToVlistFilterLocationcode
---| 'box'
---| 'alignment'
---| 'equation'
---| 'equation_number'
---| 'post_linebreak'

_N._5_5_append_to_vlist_filter = nil

---
---This callback is called whenever *LuaTeX* adds a box to a vertical list:
---
---```
---function(<node> box, <string> locationcode, <number prevdepth>,
---    <boolean> mirrored)
---    return list, prevdepth
---end
---```
---
---It is ok to return nothing in which case you also need to flush the box or deal
---with it yourself. The prevdepth is also optional. You can pass `nil` instead of a node.
---@alias AppendToVlistFilter fun(box: Node, locationcode: AppendToVlistFilterLocationcode, prevdepth: integer, mirrored: boolean)

_N._5_7_post_linebreak_filter = nil

---
---This callback is called just after *LuaTeX* has converted a list of nodes into a
---stack of `\hbox`es.
---
---This callback does not replace any internal code.
---@alias PostLinebreakFilter fun(head: Node, groupcode: string): NodeCallbackReturn

_N._5_8_hpack_filter = nil

---
---This callback is called when *TeX* is ready to start boxing some horizontal mode
---material. Math items and line boxes are ignored at the moment.
---
---The `packtype` is either `additional` or `exactly`. If `additional`, then the `size` is a `\hbox spread ...` argument. If
---`exactly`, then the `size` is a `\hbox to ...`. In both cases,
---the number is in scaled points.
---
---The `direction` is either one of the three-letter direction specifier
---strings, or `nil`.
---
---This callback does not replace any internal code.
---@alias HpackFilter fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', direction?: DirectionSpecifier, attributelist?: Node): NodeCallbackReturn

_N._5_9_vpack_filter = nil

---
---This callback is called when *TeX* is ready to start boxing some vertical mode
---material. Math displays are ignored at the moment.
---
---This function is very similar to the `hpack_filter`. Besides the fact
---that it is called at different moments, there is an extra variable that matches
---*TeX*'s `maxdepth` setting.
---
---This callback does not replace any internal code.
---@alias VpackFilter fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', maxdepth: integer, direction?: DirectionSpecifier, attributelist?: Node): NodeCallbackReturn

_N._5_10_hpack_quality_filter = nil

---
---This callback can be used to intercept the overfull messages that can result from
---packing a horizontal list (as happens in the par builder).
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed
---(when protrusion or expansion is enabled, this is an intermediate list).
---Optionally you can return a node, for instance an overfull rule indicator. That
---node will be appended to the list (just like *TeX*'s own rule would).
---
---@alias HpackQualityFilter fun(incident: 'overfull'|'underfull'|'loose'|'tight', detail: integer, head: Node, first: integer, last: integer): Node

_N._5_11_vpack_quality_filter = nil

---
---This callback can be used to intercept the overfull messages that can result from
---packing a vertical list (as happens in the page builder).
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed.
---@alias VpackQualityFilter fun(incident: 'overfull'|'underfull'|'loose'|'tight', detail: integer, head: Node, first: integer, last: integer)

_N._5_12_process_rule_filter = nil

---
---This is an experimental callback. It can be used with rules of subtype 4
---(user). The callback gets three arguments: the node, the width and the
---height. The callback can use `pdf.print` to write code to the *PDF*
---file but beware of not messing up the final result. No checking is done.
---@alias ProcessRuleFilter fun(node: Node, width: integer, height: integer)

_N._5_13_pre_output_filter = nil

---
---This callback is called when *TeX* is ready to start boxing the box 255 for `output`.
---
---This callback does not replace any internal code.
---
---@alias PreOutputFilter fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', maxdepth: integer, direction?: DirectionSpecifier): NodeCallbackReturn

_N._5_14_hyphenate_filter = nil

---
---Setting this callback to `false` will prevent the internal discretionary
---insertion pass.
---@alias HyphenateFilter fun(head: Node, tail: Node): false|nil

_N._5_15_ligaturing = 179
_N._5_16_kerning = nil
_N._5_17_insert_local_par = nil
_N._5_18_mlist_to_hlist = nil

_N._6__ = 180

_N._6_1_pre_dump = 180
_N._6_2_start_run = 181
_N._6_3_stop_run = 181
_N._6_4_start_page_number = 181
_N._6_5_stop_page_number = 181
_N._6_6_show_error_hook = 181
_N._6_7_show_error_message = 182
_N._6_8_show_lua_error_hook = 182
_N._6_9_start_file = 182
_N._6_10_stop_file = 182
_N._6_11_call_edit = 182
_N._6_12_finish_synctex = 183
_N._6_13_wrapup_run = 183

_N._7__ = 183

_N._7_1_finish_pdffile = 183
_N._7_2_finish_pdfpage = 183
_N._7_3_page_order_index = 183
_N._7_4_process_pdf_image_content = 184

_N._8__ = 184

_N._8_1_define_font = 184
_N._8_2_glyph_info = 184
_N._8_2_glyph_not_found = 184
