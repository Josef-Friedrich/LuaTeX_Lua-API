_N._9_lua_callbacks = "page 169"
_N._9_1_registering_callbacks = "page 169"

---
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
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L17-L26](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-callbacks.tex#L17-L26)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
callback = {}

---
---__Reference:__
---
---* Corresponding C source code: [lcallbacklib.c#L33-L90](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lcallbacklib.c#L33-L90)
---
---Source: `callback.list()`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias CallbackName
---|"append_to_vlist_filter"
---|"build_page_insert"
---|"buildpage_filter"
---|"call_edit"
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
---|"hyphenate"
---|"input_level_string"
---|"insert_local_par"
---|"kerning"
---|"ligaturing"
---|"linebreak_filter"
---|"make_extensible"
---|"mlist_to_hlist"
---|"new_graf"
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
---|"start_file"
---|"start_page_number"
---|"start_run"
---|"stop_file"
---|"stop_page_number"
---|"stop_run"
---|"vpack_filter"
---|"vpack_quality"
---|"wrapup_run

---
---__Reference:__
---
---* Corresponding C source code: [](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lcallbacklib.c#L198-L208)
---
-- #define CALLBACK_BOOLEAN        'b'
-- #define CALLBACK_INTEGER        'd'
-- #define CALLBACK_FLOAT          'f'
-- #define CALLBACK_LINE           'l'
-- #define CALLBACK_STRNUMBER      's'
-- #define CALLBACK_STRING         'S'
-- #define CALLBACK_RESULT         'R' /* a string but nil is also ok */
-- #define CALLBACK_CHARNUM        'c'
-- #define CALLBACK_LSTRING        'L'
-- #define CALLBACK_NODE           'N'
-- #define CALLBACK_DIR            'D'

---
---Register a callback. Passing `nil` removes an existing callback. Returns `nil`, `error` on failure.
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
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L28-L54](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-callbacks.tex#L28-L54)
---* Corresponding C source code: [lcallbacklib.c#L517-L557](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lcallbacklib.c#L517-L557)
---
---@param callback_name CallbackName
---@param func function|nil|false
---
---@return integer|nil id # The function returns the internal `id` of the callback or `nil`, if the callback could not be registered.
---@return string error # In the latter case, `error` contains an error message, otherwise it is `nil`. The function returns `No such callback exists.` if a wrong callback name was specified.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function callback.register(callback_name, func) end

---
---Produce a list of all known callback names.
---
---The keys in the table are the known callback names, the value is a boolean where
---`true` means that the callback is currently set (active).
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L56-L62](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-callbacks.tex#L56-L62)
---* Corresponding C source code: [lcallbacklib.c#L584-L599](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lcallbacklib.c#L584-L599)
---
---@return table<string, boolean> info
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function callback.list() end

---
---If the callback is not set, `find` returns `nil`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-callbacks.tex#L64-L68](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-callbacks.tex#L64-L68)
---* Corresponding C source code: [lcallbacklib.c#L559-L582](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lcallbacklib.c#L559-L582)
---
---@param callback_name CallbackName
---
---@return function|nil f
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function callback.find(callback_name) end

_N._9_2_file_discovery_callbacks = "page 169"

_N._9_2_1_find_read_file = "page 170"
_N._9_2_1_find_write_file = "page 170"

---
---Find a file for `input` (0) or `openin` (higher integers).
---
---Arguments:
---
---__id_number__
---
---This number is zero for the log or `input` files. For *TeX*'s `read`
---or `write` the number is incremented by one, so `\read0` becomes 1.
---
---__asked_name__
---
---This is the user-supplied filename, as found by `input`, `openin`
---or `openout`.
---
---Return value:
---
---__actual_name__
---
---This is the filename used. For the very first file that is read in by *TeX*, you
---have to make sure you return an `actual_name` that has an extension and
---that is suitable for use as `jobname`. If you don't, you will have to
---manually fix the name of the log file and output file after *LuaTeX* is finished,
---and an eventual format filename will become mangled. That is because these file
---names depend on the jobname.
---
---You have to return `nil` if the file cannot be found.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindReadFileCallback fun(id_number: integer, asked_name: string): actual_name: string|nil

---
---Find a file for writing to the log file (0) or with `write` (higher integers).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindWriteFileCallback fun(id_number: integer, asked_name: string): actual_name: string|nil

_N._9_2_2_find_font_file = "page 170"

---
---Find a font metrics file.
---
---The `asked_name` is an *OTF* or *TFM* font metrics file.
---
---Return `nil` if the file cannot be found.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindFontFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_3_find_output_file = "page 170"

---
---The `asked_name` is the *PDF* or *DVI* file for writing.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindOutputFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_4_find_format_file = "page 170"

---
---Find the format file.
---
---The `asked_name` is a format file for reading (the format file for writing
---is always opened in the current directory).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindFormatFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_5_find_vf_file = "page 171"

---
---Find a VF (virtual font) file.
---
---Like `find_font_file`, but for virtual fonts. This applies to both *ALEPH's
---*OVF* files and traditional Knuthian *VF* files.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindVfFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_6_find_map_file = "page 171"

---
---Like `find_font_file`, but for map files.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindMapFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_7_find_enc_file = "page 171"

---
---Find a font encoding file.
---
---Like `find_font_file`, but for enc files.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindEncFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_8_find_pk_file = "page 171"

---
---Find a PK font bitmap file.
---
---Like `find_font_file`, but for pk bitmap files. This callback takes two
---arguments: `name` and `dpi`. In your callback you can decide to
---look for:
---
---```
---<base res>dpi/<fontname>.<actual res>pk
---```
---
---but other strategies are possible. It is up to you to find a “reasonable”
---bitmap file to go with that specification.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindPkFileCallback fun(asked_name: string, dpi: integer): actual_name: string|nil

_N._9_2_9_find_data_file = "page 171"

---
---Find an input data file for PDF attachment.
---
---Like `find_font_file`, but for embedded files (`\pdfobj file '...'`).
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindDataFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_0_find_opentype_file = "page 171"

---
---Find an OpenType font file.
---
---Like `find_font_file`, but for *OpenType* font files.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindOpentypeFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_1_find_truetype_file = "page 171"

---
---Find a TrueType font file.
---
---The `asked_name` is a font file. This callback is called while *LuaTeX* is
---building its internal list of needed font files, so the actual timing may
---surprise you. Your return value is later fed back into the matching `read_file` callback.
---
---Strangely enough, `find_type1_file` is also used for *OpenType* (OTF)
---fonts.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindTruetypeFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_1_find_type1_file = "page 171"

---
---Find an Type1 (PostScript) font file.
---
---The `asked_name` is a font file. This callback is called while *LuaTeX* is
---building its internal list of needed font files, so the actual timing may
---surprise you. Your return value is later fed back into the matching `read_file` callback.
---
---Strangely enough, `find_type1_file` is also used for *OpenType* (OTF)
---fonts.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindType1FileCallback fun(asked_name: string): actual_name: string|nil

_N._9_2_2_find_image_file = "page 172"

---
---Find an image file for inclusion.
---
---The `asked_name` is an image file. Your return value is used to open a file
---from the hard disk, so make sure you return something that is considered the name
---of a valid file by your operating system.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FindImageFileCallback fun(asked_name: string): actual_name: string|nil

_N._9_3 = "page 172"

_N._9_3_1_open_read_file = "page 172"

---
---*LuaTeX* never looks at the rest of the table, so you can use it to store your
---private per-file data. Both the callback functions will receive the table as
---their only argument.
---
---@class OpenReadFileEnv
local OpenReadFileEnv = {}

---
---Read a line from a file opened with the `open_read_file` callback. The argument is the return value from `open_read_file`
---
---*LuaTeX* will run this function whenever it needs a new input line from the file.
---
---Your function should return either a string or `nil`. The value `nil`
---signals that the end of file has occurred, and will make *TeX* call the optional
---@param env OpenReadFileEnv
---
---@return string|nil line
function OpenReadFileEnv.reader(env) end

---
---Close a file opened with the `open_read_file` callback. The argument is the return value from the `open_read_file`.
---
---*LuaTeX* will run this optional function when it decides to close the file.
---
---@param env OpenReadFileEnv
---
function OpenReadFileEnv.close(env) end

---
---Open a file for reading. The returned table should define key functions for  `reader` and `close`.
---
---The filename returned by a previous `find_read_file` or the return value of
---`kpse.find_file()` if there was no such callback defined.
---
---@alias OpenReadFileCallback fun(file_name: string): OpenReadFileEnv

---
---callback for the loading of binary data files.
---The `name` will normally be a full path name as it is returned by either
---one of the file discovery callbacks or the internal version of `kpse.find_file()`.
---
---__success__
---
---Return `false` when a fatal error occurred (e.g.\ when the file cannot be
---found, after all).
---
---__data__
---
---The bytes comprising the file.
---
---__data_size__
---
---The length of the `data`, in bytes.
---
---Return an empty string and zero if the file was found but there was a
---reading problem.
---@alias ReadFileCallback fun(file_name: string): success: boolean, data: string, data_size: integer

---
---Read a TFM metrics file. Return `true`,  the data, and the data length for success, `false` otherwise
---
---ofm or tfm files
---@alias ReadFontFileCallback ReadFileCallback

---
---Read a VF metrics file.
---
---virtual fonts
---@alias ReadVfFileCallback ReadFileCallback

---
---Read a font map file.
---
--- map files
---@alias ReadMapFileCallback ReadFileCallback

---
---Read a font encoding file.
---
---encoding files
---@alias ReadEncFileCallback ReadFileCallback

---
---Read a font bitmap PK file.
---
---pk bitmap files
---@alias ReadPkFileCallback ReadFileCallback

---
---Read a data file.
---
---embedded files (as is possible with *PDF* objects)
---@alias ReadDataFileCallback ReadFileCallback

---
---Read a TrueType font.
---*TrueType* font files
---@alias ReadTruetypeFileCallback ReadFileCallback

---
---Read a Type1 font.
---
---*Type1* font files
---@alias ReadType1FileCallback ReadFileCallback

---
---Read an OpenType font.
---
---*OpenType* font files
---@alias ReadOpentypeFileCallback ReadFileCallback

_N._9_4 = nil

_N._9_4_1_process_input_buffer = nil

---
---Modify the encoding of the input buffer.
---
---This callback allows you to change the contents of the line input buffer just
---before *LuaTeX* actually starts looking at it.
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ProcessInputBufferCallback fun(buffer: string): string|nil

_N._9_4_2_process_output_buffer = nil

---
---Modify the encoding of the output buffer.
---
---This callback allows you to change the contents of the line output buffer just
---before *LuaTeX* actually starts writing it to a file as the result of a `write` command. It is only called for output to an actual file (that is,
---excluding the log, the terminal, and so called `write` 18 calls).
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ProcessOutputBufferCallback fun(buffer: string): adjusted_buffer: string|nil

_N._9_4_3_process_jobname = nil

---
---This callback allows you to change the jobname given by `jobname` in *TeX*
---and `tex.jobname` in Lua. It does not affect the internal job name or the
---name of the output or log files.
---
---The only argument is the actual job name; you should not use `tex.jobname`
---inside this function or infinite recursion may occur. If you return `nil`,
---*LuaTeX* will pretend your callback never happened. This callback does not
---replace any internal code.
---
---__Reference:__
---
---* Corresponding C source code: [textoken.c#L2511](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/textoken.c#L2511)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ProcessJobnameCallback fun(jobname: string): string|nil

_N._9_5 = nil

_N._9_5_1_contribute_filter = nil

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ContributeFilterExtrainfo
---|'pre_box' # interline material is being added
---|'pre_adjust' # `vadjust` material is being added
---|'box' # a typeset box is being added (always called)
---|'adjust' # `vadjust` material is being added

---
---This callback is called when *LuaTeX* adds contents to list:
---
---The string reports the group code. From this you can deduce from
---what list you can give a treat.
---
---__Reference:__
---
---* Corresponding C source code: [luatexcallbackids.h#L163](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luatexcallbackids.h#L163)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ContributeFilterCallback fun(extrainfo: ContributeFilterExtrainfo)

_N._9_5_2_buildpage_filter = nil

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---Process objects as they are added to the main vertical list. The string argument gives some context.
---
---This callback is called whenever *LuaTeX* is ready to move stuff to the main
---vertical list. You can use this callback to do specialized manipulation of the
---page building stage like imposition or column balancing.
---
---The string `extrainfo` gives some additional information about what *TeX*'s
---state is with respect to the “current page”.
---
---__Reference:__
---
---* Corresponding C source code: [align.c#L1281](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/align.c#L1281)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias BuildpageFilterCallback fun(extrainfo: ContributeFilterExtrainfo)

_N._9_5_3_build_page_insert = nil

---
---This callback is called when the pagebuilder adds an insert. There is not much
---control over this mechanism but this callback permits some last minute
---manipulations of the spacing before an insert, something that might be handy when
---for instance multiple inserts (types) are appended in a row.
---
---__Reference:__
---
---* `n`  the insert class
---* `i`  the order of the insert
---
---The return value is a number indicating the skip register to use for the
---prepended spacing. This permits for instance a different top space (when `i` equals one) and intermediate space (when `i` is larger than one). Of
---course you can mess with the insert box but you need to make sure that *LuaTeX*
---is happy afterwards.
---
---__Reference:__
---
---* Corresponding C source code: [buildpage.c#L507](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/buildpage.c#L507)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias BuildPageInsertCallback fun(n: integer, i: integer): integer

_N._9_5_4_pre_linebreak_filter = nil

---
---The string called `groupcode` identifies the nodelist's context within
---*TeX*'s processing. The range of possibilities is given in the table below, but
---not all of those can actually appear in `pre_linebreak_filter`, some are
---for the `hpack_filter` and `vpack_filter` callbacks that will be
---explained in the next two paragraphs.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---__Reference:__
---
---* boolean `true` signals successful processing
---* `<node>` signals that the “head” node should be replaced by the
---  returned node
---* boolean `false` signals that the “head” node list should be
---  ignored and flushed from memory
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias NodeCallbackReturn true|false|Node

---
---Alter a node list before linebreaking takes place. The string argument gives some context.
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
---
---__Reference:__
---
---* Corresponding C source code: [linebreak.c#L124](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/linebreak.c#L124)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PreLinebreakFilterCallback fun(head: Node, groupcode: PreLinebreakFilterGroupCode): NodeCallbackReturn

_N._9_5_5_linebreak_filter = nil

---
---Override the linebreaking algorithm. The boolean is `true` if this is a pre-display break.
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
---
---__Reference:__
---
---* Corresponding C source code: [luanode.c#L125](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luanode.c#L125)
---* Corresponding C source code: [linebreak.c#L128](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/linebreak.c#L128)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias LinebreakFilterCallback fun(head: Node, is_display: boolean): NodeCallbackReturn

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias AppendToVlistFilterLocationcode
---| 'box'
---| 'alignment'
---| 'equation'
---| 'equation_number'
---| 'post_linebreak'

_N._9_5_5_append_to_vlist_filter = nil

---
---This callback is called whenever *LuaTeX* adds a box to a vertical list.
---
---It is ok to return nothing in which case you also need to flush the box or deal
---with it yourself. The prevdepth is also optional. You can pass `nil` instead of a node.
---
---__Reference:__
---
---* Corresponding C source code: [luanode.c#L164](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luanode.c#L164)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias AppendToVlistFilterCallback fun(box: Node, locationcode: AppendToVlistFilterLocationcode, prevdepth: integer, mirrored: boolean): list: Node, prevdepth: integer

_N._9_5_7_post_linebreak_filter = nil

---
---Alter a node list afer linebreaking has taken place. The string argument gives some context.
---
---This callback is called just after *LuaTeX* has converted a list of nodes into a
---stack of `\hbox`es.
---
---This callback does not replace any internal code.
---
---__Reference:__
---
---* Corresponding C source code: [linebreak.c#L196](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/linebreak.c#L196)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PostLinebreakFilterCallback fun(head: Node, groupcode: string): NodeCallbackReturn

_N._9_5_8_hpack_filter = nil

---
---Alter a node list before horizontal packing takes place. The first string gives some context,
---the number is the desired size, the second string is either `exact` or `additional` (modifies the first string),
---the third string is the desired direction
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
---
---__Reference:__
---
---* Corresponding C source code: [luanode.c#L205](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luanode.c#L205)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias HpackFilterCallback fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', direction?: DirectionSpecifier, attributelist?: Node): NodeCallbackReturn

_N._9_5_9_vpack_filter = nil

---
---Alter a node list before vertical packing takes place. The second number is the desired max depth.
---
---This callback is called when *TeX* is ready to start boxing some vertical mode
---material. Math displays are ignored at the moment.
---
---This function is very similar to the `hpack_filter`. Besides the fact
---that it is called at different moments, there is an extra variable that matches
---*TeX*'s `maxdepth` setting.
---
---This callback does not replace any internal code.
---
---__Reference:__
---
---* Corresponding C source code: [luanode.c#L264](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luanode.c#L264)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias VpackFilterCallback fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', maxdepth: integer, direction?: DirectionSpecifier, attributelist?: Node): NodeCallbackReturn

_N._9_5_10_hpack_quality = nil

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
---__Reference:__
---
---* Corresponding C source code: [packaging.c#L862](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/packaging.c#L862)
---* Corresponding C source code: [packaging.c#L932](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/packaging.c#L932)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias HpackQualityCallback fun(incident: 'overfull'|'underfull'|'loose'|'tight', detail: integer, head: Node, first: integer, last: integer): Node

_N._9_5_11_vpack_quality = nil

---
---This callback can be used to intercept the overfull messages that can result from
---packing a vertical list (as happens in the page builder).
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed.
---
---__Reference:__
---
---* Corresponding C source code: [packaging.c#L1345](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/packaging.c#L1345)
---* Corresponding C source code: [packaging.c#L1405](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/packaging.c#L1405)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias VpackQualityCallback fun(incident: 'overfull'|'underfull'|'loose'|'tight', detail: integer, head: Node, first: integer, last: integer)

_N._9_5_12_process_rule = nil

---
---This is an experimental callback. It can be used with rules of subtype 4
---(user). The callback gets three arguments: the node, the width and the
---height. The callback can use `pdf.print` to write code to the *PDF*
---file but beware of not messing up the final result. No checking is done.
---
---__Reference:__
---
---* Corresponding C source code: [pdfshipout.c#L246](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfshipout.c#L246)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ProcessRuleCallback fun(node: Node, width: integer, height: integer)

_N._9_5_13_pre_output_filter = nil

---
---Alter a node list before boxing to `outputbox` takes place.
---
---This callback is called when *TeX* is ready to start boxing the box 255 for `output`.
---
---This callback does not replace any internal code.
---
---__Reference:__
---
---* Corresponding C source code: [luanode.c#L262](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luanode.c#L262)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PreOutputFilterCallback fun(head: Node, groupcode: string, size: integer, packtype: 'additional'|'exactly', maxdepth: integer, direction?: DirectionSpecifier): NodeCallbackReturn

_N._9_5_14_hyphenate = nil

---
---Apply hyphenation to a node list.
---
---Setting this callback to `false` will prevent the internal discretionary
---insertion pass.
---
---__Reference:__
---
---* Corresponding C source code: [texlang.c#L1179](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lang/texlang.c#L1179)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias HyphenateCallback fun(head: Node, tail: Node): false|nil

_N._9_5_15_ligaturing = "page 179"

---
---Apply ligaturing to a node list.
---
---No return values. This callback has to apply ligaturing to the node list it
---receives.
---
---You don't have to worry about return values because the `head` node that is
---passed on to the callback is guaranteed not to be a glyph_node (if need be, a
---temporary node will be prepended), and therefore it cannot be affected by the
---mutations that take place. After the callback, the internal value of the “tail of the list” will be recalculated.
---
---The `next` of `head` is guaranteed to be non-nil.
---
---The `next` of `tail` is guaranteed to be nil, and therefore the
---second callback argument can often be ignored. It is provided for orthogonality,
---and because it can sometimes be handy when special processing has to take place.
---
---Setting this callback to `false` will prevent the internal ligature
---creation pass.
---
---You must not ruin the node list. For instance, the head normally is a local par node,
---and the tail a glue. Messing too much can push *LuaTeX* into panic mode.
---
---__Reference:__
---
---* Corresponding C source code: [luafont.c#L2688](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/font/luafont.c#L2688)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias LigaturingCallback fun(head: Node, tail: Node): false|nil

_N._9_5_16_kerning = nil

---
---Apply kerning to a node list.
---
---No return values. This callback has to apply kerning between the nodes in the
---node list it receives. See `ligaturing` for calling conventions.
---
---Setting this callback to `false` will prevent the internal kern insertion
---pass.
---
---You must not ruin the node list. For instance, the head normally is a local par node,
---and the tail a glue. Messing too much can push *LuaTeX* into panic mode.
---
---__Reference:__
---
---* Corresponding C source code: [luafont.c#L2704](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/font/luafont.c#L2704)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias KerningCallback fun(head: Node, tail: Node): false|nil

_N._9_5_17_insert_local_par = nil

---
---Each paragraph starts with a local par node that keeps track of for instance
---the direction. You can hook a callback into the creator:
---
---There is no return value and you should make sure that the node stays valid
---as otherwise *TeX* can get confused.
---
---__Reference:__
---
---* Corresponding C source code: [texnodes.c#L4812](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L4812)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias InsertLocalParCallback fun(local_par: Node, location: string)

_N._9_5_18_mlist_to_hlist = nil

---
---Convert a math node list into a horizontal node list.
---
---This callback replaces *LuaTeX*'s math list to node list conversion algorithm.
---
---The returned node is the head of the list that will be added to the vertical or
---horizontal list, the string argument is either “text” or “display”
---depending on the current math mode, the boolean argument is `true` if
---penalties have to be inserted in this list, `false` otherwise.
---
---Setting this callback to `false` is bad, it will almost certainly result in
---an endless loop.
---
---__Reference:__
---
---* Corresponding C source code: [mlist.c#L1866](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/mlist.c#L1866)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MlistToHlistCallback fun(head: Node, display_type: string, need_penalties: boolean): newhead: Node

_N._9_6_information_reporting = "page 180"

_N._9_6_1_pre_dump = "page 180"

---
---Run actions just before format dumping takes place.
---
---This function is called just before dumping to a format file starts. It does not
---replace any code and there are neither arguments nor return values.
---
---__Reference:__
---
---* Corresponding C source code: [dumpdata.c#L95](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/dumpdata.c#L95)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PreDumpCallback fun()

_N._9_6_2_start_run = "page 181"

---
---Run actions at the start of the typesetting run.
---
---This callback replaces the code that prints *LuaTeX*'s banner. Note that for
---successful use, this callback has to be set in the *Lua* initialization script,
---otherwise it will be seen only after the run has already started.
---
---__Reference:__
---
---* Corresponding C source code: [printing.c#L557](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/printing.c#L557)
---* Corresponding C source code: [texfileio.c#L917](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texfileio.c#L917)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StartRunCallback fun()

_N._9_6_3_stop_run = "page 181"

---
---Run actions just before the end of the typesetting run.
---
---This callback replaces the code that prints *LuaTeX*'s statistics and “output written to” messages. The engine can still do housekeeping and therefore
---you should not rely on this hook for postprocessing the *PDF* or log file.
---
---__Reference:__
---
---* Corresponding C source code: [mainbody.c#L609](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/mainbody.c#L609)
---* Corresponding C source code: [dvigen.c#L1447](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/dvi/dvigen.c#L1447)
---* Corresponding C source code: [pdfgen.c#L2243](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfgen.c#L2243)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StopRunCallback fun()

_N._9_6_4_start_page_number = "page 181"

---
---Run actions at the start of typeset page number message reporting.
---
---Replaces the code that prints the `[` and the page number at the begin of
---`shipout`. This callback will also override the printing of box information
---that normally takes place when `tracingoutput` is positive.
---
---__Reference:__
---
---* Corresponding C source code: [pdfshipout.c#L61](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfshipout.c#L61)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StartPageNumberCallback fun()

_N._9_6_5_stop_page_number = "page 181"

---
---Run actions at the end of typeset page number message reporting.
---
---Replaces the code that prints the `]` at the end of `shipout`.
---
---__Reference:__
---
---* Corresponding C source code: [pdfshipout.c#L62](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfshipout.c#L62)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StopPageNumberCallback fun()

_N._9_6_6_show_error_hook = "page 181"

---
---Run action at error reporting time.
---
---This callback is run from inside the *TeX* error function, and the idea is to
---allow you to do some extra reporting on top of what *TeX* already does (none of
---the normal actions are removed). You may find some of the values in the `status` table useful. This callback does not replace any internal code.
---
---__Reference:__
---
---* Corresponding C source code: [filename.c#L282](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/filename.c#L282)
---* Corresponding C source code: [errors.c#L430](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/errors.c#L430)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ShowErrorHookCallback fun()

_N._9_6_7_show_error_message = "page 182"

---
---This callback replaces the code that prints the error message. The usual
---interaction after the message is not affected.
---
---__Reference:__
---
---* Corresponding C source code: [errors.c#L105](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/errors.c#L105)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ShowErrorMessageCallback fun()

_N._9_6_8_show_lua_error_hook = "page 182"

---
---This callback replaces the code that prints the extra *Lua* error message.
---
---__Reference:__
---
---* Corresponding C source code: [errors.c#L995](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/errors.c#L995)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ShowLuaErrorHookCallback fun()

_N._9_6_9_start_file = "page 182"

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StartFileCallbackCategory
---|1 # a normal data file, like a *TeX* source
---|2 # a font map coupling font names to resources
---|3 # an image file (`png`, `pdf`, etc)
---|4 # an embedded font subset
---|5 # a fully embedded font

---
---This callback replaces the code that prints *LuaTeX*'s when a file is opened like
---`(filename` for regular files.
---
---__Reference:__
---
---* Corresponding C source code: [luatexcallbackids.h#L127](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luatexcallbackids.h#L127)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StartFileCallback fun(category: StartFileCallbackCategory, filename: string)

_N._9_6_10_stop_file = "page 182"

---
---This callback replaces the code that prints *LuaTeX*'s when a file is closed like
---the `)` for regular files.
---
---__Reference:__
---
---* Corresponding C source code: [luatexcallbackids.h#L150](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/luatexcallbackids.h#L150)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias StopFileCallback fun(category: integer)

_N._9_6_11_call_edit = "page 182"

---
---This callback replaces the call to an external editor when “E” is pressed
---in reply to an error message. Processing will end immediately after the callback
---returns control to the main program.
---
---__Reference:__
---
---* Corresponding C source code: [errors.c#L531](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/errors.c#L531)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias CallEditCallback fun(filename: string, linenumber: integer)

_N._9_6_12_finish_synctex = "page 183"

---
---This callback can be used to wrap up alternative synctex methods. It kicks in
---after the normal synctex finalizer (that happens to remove the synctex files
---after a run when native synctex is not enabled).
---
---__Reference:__
---
---* Corresponding C source code: [mainbody.c#L668](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/mainbody.c#L668)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FinishSynctexCallback fun()

_N._9_6_13_wrapup_run = "page 183"

---
---This callback is called after the *PDF* and log files are closed. Use it at your own
---risk.
---
---__Reference:__
---
---* Corresponding C source code: [mainbody.c#L687](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/mainbody.c#L687)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias WrapupRunCallback fun()

_N._9_7_pdf_related = "page 183"

_N._9_7_1_finish_pdffile = "page 183"

---
---Run actions just before the PDF closing takes place.
---
---This callback is called when all document pages are already written to the *PDF*
---file and *LuaTeX* is about to finalize the output document structure. Its
---intended use is final update of *PDF* dictionaries such as `/Catalog` or
---`/Info`. The callback does not replace any code. There are neither
---arguments nor return values.
---
---__Reference:__
---
---* Corresponding C source code: [pdfgen.c#L2244](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfgen.c#L2244)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FinishPdffileCallback fun()

_N._9_7_2_finish_pdfpage = "page 183"

---
---```
---function(shippingout)
---end
---```
---
---This callback is called after the *PDF* page stream has been assembled and before
---the page object gets finalized.
---
---* Corresponding C source code: [pdfgen.c#L1788](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfgen.c#L1788)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FinishPdfpageCallback fun(shippingout: string)

_N._9_7_3_page_order_index = "page 183"

---
---This is one that experts can use to juggle the page tree, a data structure
---that determines the order in a *PDF* file:
---
---Say that we have 12 pages, then we can do this:
---
---```lua
---callback.register("page_order_index",function(page)
---        if page ==  1 then return 12
---    elseif page ==  2 then return 11
---    elseif page == 11 then return  2
---    elseif page == 12 then return  1
---    else                   return page
---    end
---end)
---```
---
---This will swap the first two and last two pages. You need to know the number of
---pages which is a side effect of the implementation. When you mess things up
---\unknown\ don't complain.
---
---__Reference:__
---
---* Corresponding C source code: [pdfgen.c#L1793](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/pdf/pdfgen.c#L1793)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PageOrderIndexCallback fun(pagenumber: integer): pagenumber: string

_N._9_7_4_process_pdf_image_content = "page 184"

---
---When a page from a *PDF* file is embedded its page stream as well as related
---objects are copied to the target file. However, it can be that the page stream
---has operators that assume additional resources, for instance marked text. You can
---decide to filter that for which *LuaTeX* provides a callback. Here is a simple
---demonstration of use:
---
---```lua
---pdf.setrecompress(1)
---
---callback.register("process_pdf_image_content",function(s)
---    print(s)
---    return s
---end)
---```
---
---You need to explicitly enable recompression because otherwise the content stream
---gets just passed on in its original compressed form.
---
---__Reference:__
---
---* Corresponding C source code: [pdftoepdf.c#L440](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/image/pdftoepdf.c#L440)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ProcessPdfImageContentCallback fun(s: string): string

_N._9_8_font_related = "page 184"

_N._9_8_1_define_font = "page 184"

---
---Define a font from within lua code.
---
---The arguments are the user-supplied information, with negative numbers indicating `scaled`, positive numbers `at`
---
---The string `name` is the filename part of the font specification, as given
---by the user.
---
---The number `size` is a bit special:
---
---* If it is positive, it specifies an “at size” in scaled points.
---* If it is negative, its absolute value represents a “scaled” setting
---    relative to the designsize of the font.
---
---The `id` is the internal number assigned to the font.
---
---The internal structure of the `font` table that is to be returned is
---explained in chapter fonts. That table is saved internally, so you can
---put extra fields in the table for your later *Lua* code to use. In alternative,
---`retval` can be a previously defined fontid. This is useful if a previous
---definition can be reused instead of creating a whole new font structure.
---
---Setting this callback to `false` is pointless as it will prevent font
---loading completely but will nevertheless generate errors.
---
---__Reference:__
---
---* Corresponding C source code: [dofont.c#L52](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/font/dofont.c#L52)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias DefineFontCallback fun(name: string, size: number, id: number): Font|integer

_N._9_8_2_glyph_not_found = "page 184"

---
---The `glyph_not_found` callback, when set, kicks in when the backend cannot
---insert a glyph. When no callback is defined a message is written to the log.
---
---__Reference:__
---
---* Corresponding C source code: [texfont.c#L364](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/font/texfont.c#L364)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlyphNotFoundCallback fun(id: number, char: number)

_N._9_8_2_glyph_info = "page 184"

---
---The `glyph_info` callback can be set to report a useful representation of a
---glyph.
---
---When `nil` is returned the character code is printed, otherwise the
---returned string is used. By default the *UTF-8* representation is shown which is
---not always that useful, especially when there is no real representation. Keep in
---mind that setting this callback can change the log in an incompatible way.
---
---__Reference:__
---
---* Corresponding C source code: [printing.c#L1036](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/printing.c#L1036)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/callback.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlyphInfoCallback fun(g: Node): string|nil
