---@meta
mplib = {}

_N._11_2_mplib_library = "page 200"

_N._11_2_1_new = "page 230"

---
---* Corresponding C source code: [lmplib.c#L330-L374](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L330-L374)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpFindFileFunc fun(name: string, mode: MpFileFileMode, type: MpFindFileType): string

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpFileFileMode `r`|`w` the file mode

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpFindFileType `mp`|`tfm`|`map`|`pfb`|`enc` the kind of file

---
---* Corresponding C source code: [lmplib.c#L408-L442](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L408-L442)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpRunScriptFunc fun(name: string): string

---
---* Corresponding C source code: [lmplib.c#L444-L480](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L444-L480)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpMakeTextFunc fun(name: string, what: integer): string

---
---* Corresponding C source code: [lmplib.c#L381-L406C2](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L381-L406C2)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpScriptErrorFunc fun(name: string)

---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L387-L409](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L387-L409)
---* Corresponding C source code: [lmplib.c#L308-L322](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L308-L322)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpArguments
---@field error_line? integer # error line width, default 79
---@field print_line? integer # line length in ps output 100
---@field random_seed? integer # the initial random seed variable
---@field interaction? `batch`|`nonstop`|`scroll`|`errorstop` # the interaction mode, default `errorstop`
---@field job_name? string # `--jobname`, default `mpout`
---@field find_file? MpFindFileFunc # a function to find files only local files
---@field run_script? MpRunScriptFunc
---@field make_text? MpMakeTextFunc
---@field script_error? MpScriptErrorFunc
---@field extensions? integer
---@field math_mode? `scaled`|`double`|`binary`|`decimal` # the number system to use, default `scaled`
---@field utf8_mode? boolean

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpInstance
local MpInstance = {}

---
---Create a new metapost instance.
---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L381-L385](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L381-L385)
---* Corresponding C source code: [lmplib.c#L532-L627](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L532-L627)
---
---@param args? MpArguments
---
---@return MpInstance
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.new(args) end

_N._11_2_2_statistics = "page 233"

---
---There are
---four fields, giving the maximum number of used items in each of four allocated
---object classes.
---

---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L460-L470](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L460-L470)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpStats
---@field main_memory integer # The memory size.
---@field hash_size integer # The hash size.
---@field param_size integer # The simultaneous macro parameters.
---@field max_in_open integer # The input file nesting levels.

---
---Return some statistics for this metapost instance.
---
---This function returns the vital statistics for an *MPlib* instance.
---
---Note that in the new version of *MPlib*, this is informational only. The objects
---are all allocated dynamically, so there is no chance of running out of space
---unless the available system memory is exhausted.
---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L470-L482](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L470-L482)
---* Corresponding C source code: [lmplib.c#L771-L792](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L771-L792)
---
---@param mp MpInstance
---
---@return MpStats
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.statistics(mp) end

---
---Return some statistics for this metapost instance.
---
---This function returns the vital statistics for an *MPlib* instance.
---
---Note that in the new version of *MPlib*, this is informational only. The objects
---are all allocated dynamically, so there is no chance of running out of space
---unless the available system memory is exhausted.
---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L470-L482](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L470-L482)
---* Corresponding C source code: [lmplib.c#L771-L792](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L771-L792)
---
---@return MpStats
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:statistics() end

_N._11_2_3_execute = "page 233"

---
---Execute metapost code in the instance.
---
---You can ask the *MetaPost* interpreter to run a chunk of code by calling mp.execute()
---
---for various bits of *MetaPost* language input. Be sure to check the `rettable.status` (see below) because when a fatal *MetaPost* error occurs the
---*MPlib* instance will become unusable thereafter.
---
---Generally speaking, it is best to keep your chunks small, but beware that all
---chunks have to obey proper syntax, like each of them is a small file. For
---instance, you cannot split a single statement over multiple chunks.
---
---In contrast with the normal stand alone `mpost` command, there is
---`no` implied “input” at the start of the first chunk.
---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L488-L507](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L488-L507)
---* Corresponding C source code: [lmplib.c#L692-L711](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L692-L711)
---
---@param mp MpInstance
---@param code string
---
---@return MpResult
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.execute(mp, code) end

---
---Execute metapost code in the instance.
---
---You can ask the *MetaPost* interpreter to run a chunk of code by calling mp.execute()
---
---for various bits of *MetaPost* language input. Be sure to check the `rettable.status` (see below) because when a fatal *MetaPost* error occurs the
---*MPlib* instance will become unusable thereafter.
---
---Generally speaking, it is best to keep your chunks small, but beware that all
---chunks have to obey proper syntax, like each of them is a small file. For
---instance, you cannot split a single statement over multiple chunks.
---
---In contrast with the normal stand alone `mpost` command, there is
---`no` implied “input” at the start of the first chunk.
---
---* Source code of the `LuaTeX` manual: [luatex-graphics.tex#L488-L507](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-graphics.tex#L488-L507)
---* Corresponding C source code: [lmplib.c#L692-L711](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L692-L711)
---
---@param code string
---
---@return MpResult
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:execute(code) end

_N._11_2_4_finish = "page 233"

---
---Finish a metapost instance.
---
---If for some reason you want to stop using an *MPlib* instance while processing is
---not yet actually done, you can call `finish`. Eventually, used memory
---will be freed and open files will be closed by the *Lua* garbage collector, but
---an explicit `finish` is the only way to capture the final part of the
---output streams.
---
---* Corresponding C source code: [lmplib.c#L713-L728](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L713-L728)
---
---@param mp MpInstance
---
---@return MpResult
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.finish(mp) end

---
---Finish a metapost instance.
---
---If for some reason you want to stop using an *MPlib* instance while processing is
---not yet actually done, you can call `finish`. Eventually, used memory
---will be freed and open files will be closed by the *Lua* garbage collector, but
---an explicit `finish` is the only way to capture the final part of the
---output streams.
---
---* Corresponding C source code: [lmplib.c#L713-L728](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L713-L728)
---
---@return MpResult
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:finish() end

_N._11_2_5_result_table = "page 233"

---
---@alias MpResultStatus
---|0 # good
---|1 # warning
---|2 # errors
---|3 # fatal error

---
---The return value of `execute` and `finish` is a table with a
---few possible keys (only `status` is always guaranteed to be present).
---
---* Corresponding C source code: [lmplib.c#L649-L690](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L649-L690)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpResult
---@field log? string # The output to the “log” stream.
---@field term? string # The output to the “term” stream.
---@field error? string # The output to the “error” stream (only used for “out of memory”).
---@field status MpResultStatus # The return value: `0` = good, `1` = warning, `2` = errors, `3` = fatal error.
---@field fig? MpFig[] # An array of generated figures (if any).
---
---When `status` equals 3, you should stop using this *MPlib* instance
---immediately, it is no longer capable of processing input.
---
---If it is present, each of the entries in the `fig` array is a userdata
---representing a figure object, and each of those has a number of object methods
---you can call:

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpFig
local MpFig = {}

---
---Return the bounding box, as an array of 4 values.
---number.
---
---When the boundingbox represents a “negated rectangle”, i.e. when the
---first set of coordinates is larger than the second set, the picture is empty.
---
---* Corresponding C source code: [lmplib.c#L1375-L1388](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1375-L1388)
---
---@return number[] # minx miny maxx maxy
function MpFig.boundingbox() end

---
---Return a string that is the ps output of the `fig`.
---
---this function accepts two optional integer arguments for specifying the values of `prologues` (first argument) and `procset` (second argument)
---
---* Corresponding C source code: [lmplib.c#L1262-L1276](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1262-L1276)
---@param prologues? integer
---@param procset? integer
---
---@return string|nil
function MpFig.postscript(prologues, procset) end

---
---Return a string that is the svg output of the `fig`.
---
---This function accepts an optional integer argument for specifying the value of `prologues`.
---
---* Corresponding C source code: [lmplib.c#L1278-L1291](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1278-L1291)
---
---@param prologues? integer
---
---@return string|nil
function MpFig.svg(prologues) end

---
---* Corresponding C source code: [lmplib.c#L1293-L1306](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1293-L1306)
---
---@param options? string
---
---@return string|nil
function MpFig.png(options) end

---
---Return the actual array of graphic objects in this `fig`.
---
---Note: you can call `fig:objects()` only once for any one `fig`
---object!
---
---* Corresponding C source code: [lmplib.c#L1213-L1233](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1213-L1233)
---@return table
function MpFig.objects() end

---
---Return a deep copy of the array of graphic objects in this `fig`.
---
---* Corresponding C source code: [lmplib.c#L1235-L1253](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1235-L1253)
---
---@return table
function MpFig.copy_objects() end

---
---The filename this `fig`'s *PostScript* output would have written to in stand alone mode
---
---* Corresponding C source code: [lmplib.c#L1308-L1318](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1308-L1318)
---
---@return string|nil
function MpFig.filename() end

---
---Return the `fontcharwd` value.
---
---* Corresponding C source code: [lmplib.c#L1320-L1329](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1320-L1329)
---
---@return number|nil
function MpFig.width() end

---
---Return the `fontcharht` value.
---
---* Corresponding C source code: [lmplib.c#L1331-L1340](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1331-L1340)
---
---@return number|nil
function MpFig.height() end

---
---Return the `fontchardp` value.
---
---* Corresponding C source code: [lmplib.c#L1342-L1351](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1342-L1351)
---
---@return number|nil
function MpFig.depth() end

---
---Return the `fontcharit` value.
---
---* Corresponding C source code: [lmplib.c#L1353-L1362](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1353-L1362)
---
---@return number|nil
function MpFig.italcorr() end

---
---Return the (rounded) `charcode` value.
---
---* Corresponding C source code: [lmplib.c#L1364-L1373](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1364-L1373)
---
---@return number|nil
function MpFig.charcode() end

---

_N._11_2_5_1_fill = "page 234"

---
---All graphical objects have a field `type` that gives the object type as a
---string value;
---
---* Corresponding C source code: [psout.w#L5308-L5310](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/psout.w#L5308-L5310)
---
---@class MpGraphicObject
---@field type string

---
---Get the list of
---accessible values for a particular object.
---
---* Corresponding C source code: [lmplib.c#L1548-L1591](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1548-L1591)
---
---@param obj MpGraphicObject
---
---@return string[]
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.fields(obj) end

---
---* Corresponding C source code: [psout.w#L5335-L5346](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/psout.w#L5335-L5346)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpFill
---@field path table # the list of knots
---@field htap table # the list of knots for the reversed trajectory
---@field pen table # knots of the pen
---@field color table # the object's color
---@field linejoin integer # line join style (bare number)
---@field miterlimit integer # miterlimit
---@field prescript string # the prescript text
---@field postscript string # the postscript text

_N._11_2_5_2_outline = "page 234"

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpOutline
---@field path table # the list of knots
---@field pen table # knots of the pen
---@field color table # the object's color
---@field linejoin integer # line join style (bare number)
---@field miterlimit integer # miterlimit
---@field linecap integer # line cap style (bare number)
---@field dash table # representation of a dash list
---@field prescript string # the prescript text
---@field postscript string # the postscript text

_N._11_2_5_3_text = "page 234"

---
---* Corresponding C source code: [psout.w#L5312-L5333](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/psout.w#L5312-L5333)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpText
---@field text string # the text
---@field font string # font tfm name
---@field dsize integer # font size
---@field color table # the object's color
---@field width integer #
---@field height integer #
---@field depth integer #
---@field transform table # a text transformation
---@field prescript string # the prescript text
---@field postscript string # the postscript text

_N._11_2_5_4_special = "page 236"

---
---* Corresponding C source code: [psout.w#L5372-L5375](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/psout.w#L5372-L5375)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpSpecial
---@field prescript string # special text

_N._11_2_5_5_start_bounds_start_clip = "page 236"

---
---* Corresponding C source code: [psout.w#L5362-L5370](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/psout.w#L5362-L5370)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpStartBoundsClip
---@field path table # the list of knots

_N._11_2_5_6_stop_bounds_stop_clip = "page 236"

_N._11_2_6_subsidiary_table_formats = "page 236"
_N._11_2_6_1_paths_pens = "page 236"

---
---Paths and pens (that are really just a special type of paths as far as mplib is
---concerned) are represented by an array where each entry is a table that
---represents a knot.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpKnot
---@field left_type string # when present: endpoint, but usually absent
---@field right_type string # like `left_type`
---@field x_coord number # X coordinate of this knot
---@field y_coord number # Y coordinate of this knot
---@field left_x number # X coordinate of the precontrol point of this knot
---@field left_y number # Y coordinate of the precontrol point of this knot
---@field right_x number # X coordinate of the postcontrol point of this knot
---@field right_y number # Y coordinate of the postcontrol point of this knot
---
---There is one special case: pens that are (possibly transformed) ellipses have an
---extra string-valued key `type` with value `elliptical` besides the
---array part containing the knot list.
---

---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpPathPen MpKnot[]

_N._11_2_6_2_Colors = "page 236"

---
---A color is an integer array with 0, 1, 3 or 4 values:
---
--- field   type  explanation
---
--- `0`  marking only  no values
--- `1`  greyscale     one value in the range `(0,1)`, “black” is `0`
--- `3`  \RGB          three values in the range `(0,1)`, “black” is `0,0,0`
--- `4`  \CMYK         four values in the range `(0,1)`, “black” is `0,0,0,1`
---
---If the color model of the internal object was `uninitialized`, then it was
---initialized to the values representing “black” in the colorspace `defaultcolormodel` that was in effect at the time of the `shipout`.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MpColor integer[]

_N._11_2_6_3_Transforms = "page 237"

---
---Each transform is a six-item array.
---
---Note that the translation (index 1 and 2) comes first. This differs from the
---ordering in *PostScript*, where the translation comes last.
---
---```
---{ x, y, xx, yx, xy, yy }
---```
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MPTransform number[]

_N._11_2_6_4_Dashes = "page 237"

---
---Each `dash` is two-item hash, using the same model as *PostScript* for the
---representation of the dashlist. `dashes` is an array of “on” and
---“off”, values, and `offset` is the phase of the pattern.
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MpDash
---@field dashes table # an array of on-off numbers
---@field offset integer # the starting offset value

_N._11_2_7_Pens_and_pen_info = "page 237"

---
---There is helper function (`pen_info(obj)`) that returns a table containing
---a bunch of vital characteristics of the used pen (all values are floats):
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PenInfo
---@field width number # width of the pen
---@field sx number # `x` scale
---@field rx number # `xy` multiplier
---@field ry number # `yx` multiplier
---@field sy number # `y` scale
---@field tx number # `x` offset
---@field ty number # `y` offset
---

---
---* Corresponding C source code: [lmplib.c#L1474-L1539](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1474-L1539)
---
---@param obj MpGraphicObject
---
---@return PenInfo|nil
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.pen_info(obj) end

_N._11_2_8_Character_size_information = "page 238"
_N._11_2_8_1_char_width = "page 238"

---
---Report a character's width.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `width` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L748-L751](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L748-L751)
---
---@param mp MpInstance
---@param fontname string
---@param char integer
---
---@return number width # AFM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.char_width(mp, fontname, char) end

---
---Report a character's width.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `width` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L748-L751](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L748-L751)
---
---@param fontname string
---@param char integer
---
---@return number width # AFM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:char_width(fontname, char) end

_N._11_2_8_2_char_height = "page 238"

---
---Report a character's height.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `height` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L758-L761](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L758-L761)
---
---@param mp MpInstance
---@param fontname string
---@param char integer
---
---@return number height # AFM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.char_height(mp, fontname, char) end

---
---Report a character's height.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `height` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L758-L761](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L758-L761)
---
---@param fontname string
---@param char integer
---
---@return number height # FM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:char_height(fontname, char) end

_N._11_2_8_3_char_depth = "page 238"

---
---Report a character's depth.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `depth` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L753-L756](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L753-L756)
---
---@param mp MpInstance
---@param fontname string
---@param char integer
---
---@return number depth # AFM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.char_depth(mp, fontname, char) end

---
---Report a character's depth.
---
---This function finds the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `depth` is in AFM units.
---
---* Corresponding C source code: [lmplib.c#L753-L756](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L753-L756)
---
---@param fontname string
---@param char integer
---
---@return number depth # AFM units
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:char_depth(fontname, char) end

_N._11_2_8_4_get_boolean_numeric_string_path = "page 238"

---
---* Corresponding C source code: [lmplib.c#L497-L510](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L497-L510)
---
---@param mp MpInstance
---@param name string
---
---@return boolean value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.get_boolean(mp, name) end

---
---* Corresponding C source code: [lmplib.c#L497-L510](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L497-L510)
---
---@param name string
---
---@return boolean value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:get_boolean(name) end

---
---Not documented alias for get_numeric
---function mplib.get_number() end

---
---* Corresponding C source code: [lmplib.c#L482-L495](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L482-L495)
---
---@param mp MpInstance
---@param name string
---
---@return integer value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.get_numeric(mp, name) end

---
---* Corresponding C source code: [lmplib.c#L482-L495](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L482-L495)
---
---@param name string
---
---@return integer value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:get_numeric(name) end

---
---* Corresponding C source code: [lmplib.c#L512-L528](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L512-L528)
---
---@param mp MpInstance
---@param name string
---
---@return string value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.get_string(mp, name) end

---
---* Corresponding C source code: [lmplib.c#L512-L528](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L512-L528)
---
---@param name string
---
---@return string value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:get_string(name) end

---
---* Corresponding C source code: [lmplib.c#L1649-L1693](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1649-L1693)
---
---@param mp MpInstance
---@param name string
---
---@return table value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.get_path(mp, name) end

---
---* Corresponding C source code: [lmplib.c#L1649-L1693](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1649-L1693)
---
---@param name string
---
---@return table value
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function MpInstance:get_path(name) end

---
---* Corresponding C source code: [lmplib.c#L763-L769](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L763-L769)
---
---@return string version # for example `2.02`
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function mplib.version() end

---
---* Corresponding C source code: [lmplib.c#L978-L1195](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L978-L1195)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
--
---@param mp MpInstance
---@param coordinates table
---@param cyclic boolean
function mplib.solve_path(mp, coordinates, cyclic) end

---
---* Corresponding C source code: [lmplib.c#L978-L1195](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L978-L1195)
---
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mplib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---
---@param coordinates table
---@param cyclic boolean
function MpInstance:solve_path(coordinates, cyclic) end

return mplib
