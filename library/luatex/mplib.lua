---@meta
mplib = {}

_N._11_2_mplib_library = 0

_N._11_2_1_new = 232

---
---The argument hash can have a number
---of different fields, as follows:
---
---The binary mode is no longer available in the *LuaTeX* version of *mplib*. It
---offers no real advantage and brings a ton of extra libraries with platform
---specific properties that we can now avoid. We might introduce a high resolution
---scaled variant at some point but only when it pays of performance wise.
---
---The `find_file` function should be of this form:
---
---```
---<string> found = finder (<string> name, <string> mode, <string> type)
---```
---@alias MpFindFileFunc fun(name: string, mode: MpFileFileMode, type: MpFindFileType): string
---@alias MpFileFileMode `r`|`w` the file mode
---@alias MpFindFileType `mp`|`tfm`|`map`|`pfb`|`enc` the kind of file
---
---Return either the full path name of the found file, or `nil` if the file
---cannot be found.
---@class MpArguments
---@field error_line integer # error line width, default 79
---@field print_line integer # line length in ps output  100
---@field random_seed integer # the initial random seed   variable
---@field math_mode `scaled`|`double`|`binary`|`decimal` # the number system to use, default `scaled`
---@field interaction `batch`|`nonstop`|`scroll`|`errorstop` # the interaction mode, default `errorstop`
---@field job_name string # `--jobname`, default `mpout`
---@field find_file MpFindFileFunc  a function to find files only local files

---
---@class MpInstance

---
---To create a new *METAPOST* instance, call
---
---```
---<mpinstance> mp = mplib.new({...})
---```
---
---This creates the `mp` instance object.
---
---Note that the new version of *MPlib* no longer uses binary mem files, so the way
---to preload a set of macros is simply to start off with an `input` command
---in the first `execute` call.
---
---When you are processing a snippet of text starting with `btex` and
---ending with either `etex` or `verbatimtex`, the *METAPOST*
---`texscriptmode` parameter controls how spaces and newlines get honoured.
---The default value is 1. Possible values are:
---
--- name       meaning
---
--- `0`  no newlines
--- `1`  newlines in `verbatimtex`
--- `2`  newlines in `verbatimtex` and `etex`
--- `3`  no leading and trailing strip in `verbatimtex`
--- `4`  no leading and trailing strip in `verbatimtex` and `btex`
---
---That way the *Lua* handler (assigned to `make_text`) can do what it likes.
---An `etex` has to be followed by a space or `;` or be at the end of a
---line and preceded by a space or at the beginning of a line.
---
---* Corresponding C source code: [lmplib.c#L532-L627](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L532-L627)
---
---@param args MpArguments
---
---@return MpInstance
function mplib.new(args) end

_N._11_2_2_statistics = 233

---
---You can request statistics with:
---
---```
---<table> stats = mp:statistics()
---```
---
---This function returns the vital statistics for an *MPlib* instance. There are
---four fields, giving the maximum number of used items in each of four allocated
---object classes:
---
---@class MpStats
---@field main_memory integer # memory size
---@field hash_size integer # hash size
---@field param_size integer # simultaneous macro parameters
---@field max_in_open integer # input file nesting levels
---
---Note that in the new version of *MPlib*, this is informational only. The objects
---are all allocated dynamically, so there is no chance of running out of space
---unless the available system memory is exhausted.
---
---* Corresponding C source code: [lmplib.c#L771-L792](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L771-L792)
---@return MpStats
function mplib.statistics() end

_N._11_2_3_execute = 233

---
---You can ask the *MetaPost* interpreter to run a chunk of code by calling
---
---```
---<table> rettable = execute(mp,"metapost code")
---```
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
---* Corresponding C source code: [lmplib.c#L692-L711](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L692-L711)
---
---@param mp MpInstance
---@param code string
---
---@return MpResult
function mplib.execute(mp, code) end

_N._11_2_4_finish = 233

---
---```
---<table> rettable = finish(mp)
---```
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
function mplib.finish(mp) end

_N._11_2_5_result_table = 233

---
---The return value of `execute` and `finish` is a table with a
---few possible keys (only `status` is always guaranteed to be present).
---
---@class MpResult
---@field log? string # output to the “log” stream
---@field term? string # output to the “term” stream
---@field error? string # output to the “error” stream (only used for “out of memory”)
---@field status number # the return value: `0` = good, `1` = warning, `2` = errors, `3` = fatal error
---@field fig? MpFig # an array of generated figures (if any)
---
---When `status` equals 3, you should stop using this *MPlib* instance
---immediately, it is no longer capable of processing input.
---
---If it is present, each of the entries in the `fig` array is a userdata
---representing a figure object, and each of those has a number of object methods
---you can call:

---
---@class MpFig
---@field boundingbox   function  returns the bounding box, as an array of 4 values
---@field postscript    function  returns a string that is the ps output of the `fig`. this function accepts two optional integer arguments for specifying the values of `prologues` (first argument) and `procset` (second argument)
---@field svg           function  returns a string that is the svg output of the `fig`. This function accepts an optional integer argument for specifying the value of `prologues`
---@field objects       function  returns the actual array of graphic objects in this `fig`
---@field copy_objects  function  returns a deep copy of the array of graphic objects in this `fig`
---@field filename      function  the filename this `fig`'s *PostScript* output would have written to in stand alone mode
---@field width         function  the `fontcharwd` value
---@field height        function  the `fontcharht` value
---@field depth         function  the `fontchardp` value
---@field italcorr      function  the `fontcharit` value
---@field charcode      function  the (rounded) `charcode` value
---
---Note: you can call `fig:objects()` only once for any one `fig`
---object!
---
---When the boundingbox represents a “negated rectangle”, i.e. when the
---first set of coordinates is larger than the second set, the picture is empty.

_N._11_2_5_1_fill = 234

---
---There is a helper function (`mplib.fields(obj)`) to get the list of
---accessible values for a particular object, but you can just as easily use the
---tables given below.
---
---All graphical objects have a field `type` that gives the object type as a
---string value; it is not explicit mentioned in the following tables. In the
---following, `number`s are *PostScript* points represented as a floating
---point number, unless stated otherwise. Field values that are of type `table` are explained in the next section.
---
---Get the list of accessible values for a particular object
---
---* Corresponding C source code: [lmplib.c#L1548-L1591](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1548-L1591)
function mplib.fields(obj) end

---
---@class MpFill
---@field path table # the list of knots
---@field htap table # the list of knots for the reversed trajectory
---@field pen table # knots of the pen
---@field color table # the object's color
---@field linejoin integer # line join style (bare number)
---@field miterlimit integer # miterlimit
---@field prescript string # the prescript text
---@field postscript string # the postscript text

_N._11_2_5_2_outline = 234

---
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

_N._11_2_5_3_text = 234

---
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

_N._11_2_5_4_special = 236

---
---@class MpSpecial
---@field prescript string # special text

_N._11_2_5_5_start_bounds_start_clip = 236

---
---@class MpStartBoundsClip
---@field path table # the list of knots

_N._11_2_5_6_stop_bounds_stop_clip = 236

_N._11_2_6_subsidiary_table_formats = 236
_N._11_2_6_1_paths_pens = 236

---
---Paths and pens (that are really just a special type of paths as far as mplib is
---concerned) are represented by an array where each entry is a table that
---represents a knot.
---
---@class MpPathPen
---@field left_type string # when present: endpoint, but usually absent
---@field right_type string # like `left_type`
---@field x_coord integer # X coordinate of this knot
---@field y_coord integer # Y coordinate of this knot
---@field left_x integer # X coordinate of the precontrol point of this knot
---@field left_y integer # Y coordinate of the precontrol point of this knot
---@field right_x integer # X coordinate of the postcontrol point of this knot
---@field right_y integer # Y coordinate of the postcontrol point of this knot
---
---There is one special case: pens that are (possibly transformed) ellipses have an
---extra string-valued key `type` with value `elliptical` besides the
---array part containing the knot list.
---

_N._11_2_6_2_Colors = 236

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
---@type table MpColor

_N._11_2_6_3_Transforms = 237

---
---Each transform is a six-item array.
---
---@class MPTransform
---@field item1 integer # represents x
---@field item2 integer # represents y
---@field item3 integer # represents xx
---@field item4 integer # represents yx
---@field item5 integer # represents xy
---@field item6 integer # represents yy
---
---Note that the translation (index 1 and 2) comes first. This differs from the
---ordering in *PostScript*, where the translation comes last.

_N._11_2_6_4_Dashes = 237

---
---Each `dash` is two-item hash, using the same model as *PostScript* for the
---representation of the dashlist. `dashes` is an array of “on” and
---“off”, values, and `offset` is the phase of the pattern.
---
--- field   type  explanation
---
---@class MpDash
---@field dashes  table    an array of on-off numbers
---@field offset integer # the starting offset value

_N._11_2_7_Pens_and_pen_info = 237

---
---There is helper function (`pen_info(obj)`) that returns a table containing
---a bunch of vital characteristics of the used pen (all values are floats):
---
---@class PenInfo
---@field width integer # width of the pen
---@field sx integer # `x` scale
---@field rx integer # `xy` multiplier
---@field ry integer # `yx` multiplier
---@field sy integer # `y` scale
---@field tx integer # `x` offset
---@field ty integer # `y` offset
---
---* Corresponding C source code: [lmplib.c#L1474-L1539](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1474-L1539)
---@return PenInfo
function mplib.pen_info() end

_N._11_2_8_Character_size_information = 238
_N._11_2_8_1_char_width = 238

---
---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---```
---<number> w = char_width(mp,<string> fontname, <number> char)
---```
---
---* Corresponding C source code: [lmplib.c#L748-L751](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L748-L751)
function mplib.char_width() end

_N._11_2_8_2_char_height = 238

---
---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---```
---<number> w = char_height(mp,<string> fontname, <number> char)
---```
---
---* Corresponding C source code: [lmplib.c#L758-L761](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L758-L761)
function mplib.char_height() end

_N._11_2_8_3_char_depth = 238

---
---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---```
---<number> w = char_depth(mp,<string> fontname, <number> char)
---```
---
---* Corresponding C source code: [lmplib.c#L753-L756](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L753-L756)
function mplib.char_depth() end

_N._11_2_8_4_get_boolean_numeric_string_path = 238

---
---```
---<boolean> w = get_boolean(mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L497-L510](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L497-L510)
function mplib.get_boolean() end

---
---Not documented alias for get_numeric
---function mplib.get_number() end

---
---```
---<number>  n = get_numeric(mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L482-L495](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L482-L495)
function mplib.get_numeric() end

---
---```
---<string>  s = get_string (mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L512-L528](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L512-L528)
function mplib.get_string() end

---
---```
---<table>   p = get_path   (mp,<string> name)
---```
---
---* Corresponding C source code: [lmplib.c#L1649-L1693](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L1649-L1693)
function mplib.get_path() end

---
---* Corresponding C source code: [lmplib.c#L763-L769](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L763-L769)
---
---@return string version # for example `2.02`
function mplib.version() end

---
---* Corresponding C source code: [lmplib.c#L978-L1195](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/mplibdir/lmplib.c#L978-L1195)
function mplib.solve_path() end
