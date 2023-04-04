---@meta

---
---This library contains variables and functions that are related to the *PDF*
---backend.
---
pdf = {}

_N._14_1_The_pdf_library = 281
_N._14_1_1_mapfile_mapline = 281

---
---Modify the map-file.
---
---This function modifies the map-file by adding, replacing, or removing all entries (lines) of <map_file>.
---
---@param map_file string # File name of map-file.
---The first character of <map_file> has a special meaning:
--- * `'+'`  Add new entries, if they do not exist already.
--- * `'='`  Replace existing entries.
--- * `'-'`  Remove entries, if they exist.
--- * `''`   Flush map file first, then insert new entries.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.mapfile(map_file) end

---
---Modify the map-file.
---
---This function modifies the map-file by adding, replacing, or removing exactly one entry (line).
---
---@param map_line string # Entry (line) to be added, replace, or removed.
---The first character of <map_line> has a special meaning:
--- * `'+'`  Insert new entry, if it doesn't exist already.
--- * `'='`  Replace existing entry.
--- * `'-'`  Remove entry, if it exists.
--- * `''`   Flush map file first, then insert new entry.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.mapline(map_line) end

_N._14_1_2_set_get_catalog_info_names_trailer = 281

---
---Insert string <catalog> into the `/Catalog` dictionary.
---
---@param catalog string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setcatalog(catalog) end

---
---Return string <catalog> that was set by `pdf.setcatalog()`.
---
---@return string | nil catalog # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getcatalog() end

---
---Insert string <info> into the `/Info` dictionary.
---
---@param info string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setinfo(info) end

---
---Return string <info> that was set by `pdf.setinfo()`.
---
---@return string | nil info # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getinfo() end

---
---Insert string <names> into the `/Names` dictionary of the `/Catalog`.
---
---@param names string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setnames(names) end

---
---Return string <names> that was set by `pdf.setnames()`.
---
---@return string | nil names # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getnames() end

---
---Insert string <trailer> into the `trailer` dictionary.
---
---@param trailer string # String.
---FIXME: pdf.settrailer() not working. Bug?
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.settrailer(trailer) end

---
---Return string <trailer> that was set by `pdf.settrailer()`.
---
---@return string | nil trailer # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.gettrailer() end

_N._14_1_3_set_get_pageattributes_pageresources_pagesattributes = 281

---
---Insert string <attributes> into the current `/Page` dictionary.
---
---@param attributes string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setpageattributes(attributes) end

---
---Return string <attributes> that was set by `pdf.setpageattributes()`.
---
---@return string | nil attributes # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpageattributes() end

---
---Insert string <resources> into the `/Resources` dictionary of the current page.
---
---@param resources string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setpageresources(resources) end

---
---Return string <resources> that was set by `pdf.setpageresources()`.
---
---@return string | nil resources # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpageresources() end

---
---Insert string <attributes> into the `/Pages` dictionary of the `/Catalog`.
---
---@param attributes string # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setpagesattributes(attributes) end

---
---Return string <attributes> that was set by `pdf.setpageattributes()`.
---
---@return string | nil attributes # String.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpagesattributes() end

_N._14_1_4_set_get_xformattributes_xformresources = 281

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setxformattributes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getxformattributes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setxformresources() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getxformresources() end

_N._14_1_5_set_get_major_minor_version = 281

---
---Set major version number of the PDF file format.
---
---Note: This function sets the version number of the file header. It does not set the `/Version` key of the `/Catalog` as recommended for PDF-1.4 and later.
---@param n integer # Major version number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setmajorversion(n) end

---
---Return major version number of the PDF file format.
---
---@see pdf.setmajorversion
---
---@return integer n # Major version number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getmajorversion() end

---
---Set minor version number of the PDF file format.
---
---Note: This function sets the version number of the file header. It does not set the `/Version` key of the `/Catalog` as recommended for PDF-1.4 and later.
---
---@param n integer # Minor version number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setminorversion(n) end

---
---Return minor version number of the PDF file format.
---
---@see pdf.setminorversion
---
---@return integer n # Minor version number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getminorversion() end

_N._14_1_6_getcreationdate = 282

---
---Return the `/CreationDate` string of the `/Info` dictionary.
---
---@return string
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getcreationdate() end

_N._14_1_7_set_get_inclusionerrorlevel_ignoreunknownimages = 282

---
---Set error level for inserting *PDF* files.
---
---A warning/error is issued if the inserted *PDF* file has a newer version number than the main *PDF* file.
--- * `level <= 0`: Issue a warning.
--- * `level > 0`: Issue an error.
---@param level integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setinclusionerrorlevel(level) end

---
---Return value set by `pdf.setinclusionerrorlevel()`.
---
---@return integer level # Error level.
---
---@see pdf.setinclusionerrorlevel
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getinclusionerrorlevel() end

---
---Set <ignore> status for inserting images.
--- * `ignore ~= 0`: Issue a warning if image file type is unknown.
--- * `ignore == 0`: Issue an error if image file type is unknown.
---LuaTeX can handle these file types: pdf, png, jpg, jbig2
---@param ignore integer # Ignore image.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setignoreunknownimages(ignore) end

---
---Return <ignore> status.
---
---@return integer ignore # Ignor image.
---
---@see pdf.setignoreunknownimages
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getignoreunknownimages() end

_N._14_1_8_set_get_suppressoptionalinfo_trailerid_omitcidset_omitinfodict = 282

---
---Set bit field suppressing certain informational keys in the *PDF* file.
---
---@param flags integer # Bit field.
--- --------------------------------------------------------------
--- Bit  Meaning
--- ---  ---------------------------------------------------------
---   1  `/PTEX.FullBanner` in `/Info` dictionary of the trailer.
---   2  `/PTEX.FileName` in `/XObject` dictionary of an image. (1)
---   4  `/PTEX.PageNumber` in `/XObject` dictionary of an image.
---   8  `/PTEX.InfoDict` in `/XObject` dictionary of an image.
---  16  `/Creator` in `/Info` dictionary of the trailer.
---  32  `/CreationDate` in `/Info` dictionary of the trailer.
---  64  `/ModDate` in `/Info` dictionary of the trailer.
--- 128  `/Producer` in `/Info` dictionary of the trailer.
--- 256  `/Trapped` in `/Info` dictionary of the trailer.
--- 512  `/ID` of the trailer.
--- --------------------------------------------------------------
--- (1) Seems to work only if '\pdfvariable imageaddfilename = 1'
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setsuppressoptionalinfo(flags) end

---
---Return bit field set by `pdf.setsuppressoptionalinfo()`.
---
---@return integer flags # Bit field.
---
---@see pdf.setsuppressoptionalinfo
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getsuppressoptionalinfo() end

---
---Set `/ID` of the trailer.
---
---@param id string # Trailer ID.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.settrailerid(id) end

---
---Return `/ID` of the trailer.
---
---@return string id # Trailer ID.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.gettrailerid() end

---
---Add or remove `/CIDSet` entry in `/FontDescriptor`.
--- * `n ~= 0`: Remove `/CIDSet` entry.
--- * `n == 0`: Add `/CIDSet` entry.
---
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setomitcidset(n) end

---
---Return <flag> set by `pdf.setomitcidset()`.
---
---@return integer flag
---
---@see pdf.setomitcidset
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getomitcidset() end

---
---Add or remove `/CharSet` entry in `/FontDescriptor`.
--- * `n ~= 0`: Remove `/CharSet` entry.
--- * `n == 0`: Add `/CharSet` entry.
---
---@param n integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setomitcharset(n) end

---
---Return value set by `pdf.setomitcharset()`.
---
---@return integer n
---
---@see pdf.setomitcharset
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getomitcharset() end

_N._14_1_9_set_get_obj_compresslevel_recompress = 282

---
---Set compression level of streams.
---
---@param level integer # Minimum: 0, Maximum: 9
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setcompresslevel(level) end

---
---Return compression level of streams.
---
---@return integer level # Compression level.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getcompresslevel() end

---
---Set compression level of objects.
---
---@param level integer # Minimum: 0, Maximum: 9
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setobjcompresslevel(level) end

---
---Return compression level of objects.
---
---@return integer level # Compression level.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getobjcompresslevel() end

---
---Switch for recompressing streams of `/XObject`s.
---
---@param switch integer # 0: don't recompress, 1: do recompress.
---FIXME: pdf.setrecompress() not working. Bug?
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setrecompress(switch) end

---
---Return value set by `pdf.setrecompress()`.
---
---@return integer switch # 0: don't recompress, 1: do recompress.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getrecompress() end

_N._14_1_10_set_get_gentounicode = 282

---
---Add or remove `/ToUnicode` entry in a font dictionary.
---
---@param n integer
--- * `n ~= 0`: Add `/ToUnicode` entry.
--- * `n == 0`: Remove `/ToUnicode` entry.
--- Note: Use `\pdfextension glyphtounicode` to add a CMap mapping from character codes to Unicode values.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setgentounicode(n) end

---
---Return value set by `pdf.setgentounicode()`.
---
---@return integer n
---@see pdf.setgentounicode
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getgentounicode() end

_N._14_1_11_set_get_decimaldigits = 282

---
---Set number of decimal digits used for writing numbers (floats) in the *PDF* file.
---
---@param ndigits integer # Number of decimal digits.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setdecimaldigits(ndigits) end

---
---Return value set by `pdf.setdecimaldigits()`.
---
---@return integer ndigits # Number of digits.
---
---@see pdf.setdecimaldigits
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getdecimaldigits() end

_N._14_1_12_set_get_pkresolution = 283

---
---Set resolution of PK fonts.
---@param resolution integer
---@param fixed_dpi integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setpkresolution(resolution, fixed_dpi) end

---
---Return resolution of PK fonts.
---
---@return integer resolution
---@return integer fixed_dpi
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpkresolution() end

_N._14_1_13_getlast_obj_link_annot_and_getretval = 283

---
---Return object number of latest created objects.
---
---@return integer objnum # Number of latest created object.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getlastobj() end

---
---Return object number of latest created `/Annot` object (subtype `/Link`) that was created by `/pdfextension startlink`.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getlastlink() end

---
---Return object number of latest created `/Annot` object that was created by `pdf.reserveobj('annot')`.
---
---@return integer objnum # Number of latest created object.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getlastannot() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getretval() end

_N._14_1_14_getmaxobjnum_getobjtype_getfontname_getfontobjnum_getfontsize_getxformname = 283

---
---Return the object number of the latest created pdf object.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getmaxobjnum() end

---
---Return a string describing the object type.
---
---@param objnum integer # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getobjtype(objnum) end

---
---Return the number of the font resource name.
---The `/Font` entry of a `/Resource` dictionary maps resource names to font dictionaries.
---LuaTeX uses resource names like `/F36` or `/F52`, where the number corresponds to
---the font ID.
---
---@param id integer # Font ID.
---
---@return integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getfontname(id) end

---
---Return the object number of the `/Font` dictionary.
---
---@param id integer # Font ID.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getfontobjnum(id) end

---
---Return the font size in scaled points.
---
---@param id integer # Font ID.
---
---@return integer # Font size.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getfontsize(id) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getxformname() end

_N._14_1_15_set_get_origin = 283

---
---Set horizontal and vertical offset from the top left corner of the page.
---
---@param h integer # Horizontal offset in scaled points.
---@param v integer # Vertical offset in scaled points.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setorigin(h, v) end

---
---Return values set by `pdf.setorigin()`.
---
---@return integer h # Horizontal offset in scaled points.
---@return integer v # Vertical offset in scaled points.
---
---@see pdf.setorigin
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getorigin() end

_N._14_1_16_set_get_imageresolution = 283

---
---Set default resolution of a bitmap image.
---
---@param dpi integer # Resolution.
--- LuaTeX determines the size of an image as follows:
--- 1. It uses <width> and <height> parameter of `\useimageresource`.
--- 2. If (1) is missing, it uses the resolution given in the metadata of the image.
--- 3. If (2) is missing, it uses the resolution given by this function.
--- 4. If (3) is missing, it uses a resolution of 72 dpi.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setimageresolution(dpi) end

---
---Return value set by `pdf.setimageresolution()`.
---
---@return integer dpi # Resolution.
---
---@see pdf.setimageresolution
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getimageresolution() end

_N._14_1_17_set_get_link_dest_thread_xform_margin = 283

---
---Set margin size of hyperlinks.
---
---@param margin integer # Margin in scaled points.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setlinkmargin(margin) end

---
---Return value set by `pdf.setlinkmargin()`.
---
---@return integer margin # Margin in scaled points.
---@see pdf.setlinkmargin
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getlinkmargin() end

---
---Set margin size of destination.
---
---@param margin integer # Margin in scaled points.
---FIXME pdf.setdestmargin() is not working. Bug?
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setdestmargin(margin) end

---
---Return value set by `pdf.setdestmargin()`.
---
---@return integer margin # Margin in scaled points.
---@see pdf.setdestmargin
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getdestmargin() end

---
---Set size of margin for threads.
---
---@param margin integer # Margin in scaled points.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setthreadmargin(margin) end

---
---Return value set by `pdf.setthreadmargin()`.
---
---@return integer margin # Margin in scaled points.
---
---@see pdf.setthreadmargin
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getthreadmargin() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setxformmargin() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getxformmargin() end

_N._14_1_18_get_pos_hpos_vpos = 283

---
---Return coordinates of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer h # Horizontal position in scaled points.
---@return integer v # Vertical position in scaled points.
---
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpos() end

---
---Return horizontal coordinate of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer h # Horizontal position in scaled points.
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.gethpos() end

---
---Return vertical coordinate of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer v # Vertical position in scaled points.
---
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getvpos() end

_N._14_1_19_has_get_matrix = 283

---
---Returns `true` is a CTM is currently used.
---
---@return boolean
---
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.hasmatrix() end

---
---Return the CTM (current transformation matrix) at the current position.
--- ┌         ┐
--- │ a  b  0 │
--- │ c  d  0 │
--- │ e  f  1 │
--- └         ┘
---@return integer a
---@return integer b
---@return integer c
---@return integer d
---@return integer e
---@return integer f
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getmatrix() end

_N._14_1_20_print = 284

---
---Write a string into the contents stream of the current page. If LuaTeX is currently inside a text block (**BT**...**ET**), close the text block first.
---
---@param str string # String.
---
---Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.print(str) end

---
---Write a string into the contents stream of the current page.
---
---@param type string # Type.
---@param str string # String.
---Parameter <type> determines how the string is written:
--- * `text`: String <str> is written inside a text block (**BT**...**ET**).
--- * `page`: String <str> is written outside a text block (**BT**...**ET**).
--- * `origin`: Like `page` but the CTM is inserted just before the string <str>.
--- * `direct`: String <str> is written directly, independ of whether this is inside or outside a text block.
--- * `raw`: Like `direct`.
----Note: This function is mainly used inside `\latelua` calls.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.print(type, str) end

_N._14_1_21_immediateobj = 283

---
---Create an object and write it immediately to the pdf file.
---
---The created object looks like this:
--->  <objnum> 0 obj
--->    <str>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param str string # Contents of the object.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.immediateobj(str) end

---
---Create an object and write it immediately to the pdf file.
---The created object looks like this:
--->  <objnum> 0 obj
--->    <contents of file <filename>>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param file string # Literal string `"file"`.
---@param filename string # File name.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.immediateobj(objnum, file, filename) end

---
---Create an object and write it immediately to the pdf file.
---
---The created object looks like this:
--->   <objnum> 0 obj
--->   <<
--->   <streamdict>
--->   /Length 123 >>
--->   stream
--->   <streamcontents>
--->   endstream
--->   endobj
---@param objnum? integer # Object number (optional argument).
---@param stream string # Literal string `"stream"`.
---@param streamcontents string # Contents of the stream.
---@param streamdict string # Stream dictionary.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.immediateobj(stream, streamcontents, streamdict) end

---
---Create an object and write it immediately to the pdf file.
---
---The created object looks like this:
--->   <objnum> 0 obj
--->   <<
--->   <contents of `file` <filename>>
--->   /Length 123 >>
--->   stream
--->   <streamcontents>
--->   endstream
--->   endobj
---@param objnum? integer # Object number (optional argument).
---@param streamfile string # Literal string `"streamfile"`.
---@param filename string # File name.
---@param streamdict string # Stream dictionary.
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.immediateobj(streamfile, filename, streamdict) end

_N._14_1_22_obj = 285

---
---Create an object.
---
---This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->  <objnum> 0 obj
--->    <str>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param str string # Contents of the object.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.obj(str) end

---
---Create an object.
---
---This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->  <objnum> 0 obj
--->    <contents of file <filename>>
--->  endobj
---
---@param objnum? integer # Object number (optional argument).
---@param file string # Literal string `"file"`.
---@param filename string # File name.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.obj(objnum, file, filename) end

---
---Create an object.
---
---This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->   <objnum> 0 obj
--->   <<
--->   <streamdict>
--->   /Length 123 >>
--->   stream
--->   <streamcontents>
--->   endstream
--->   endobj
---@param objnum? integer # Object number (optional argument).
---@param stream string # Literal string `"stream"`.
---@param streamcontents string # Contents of the stream.
---@param streamdict string # Stream dictionary.
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.obj(stream, streamcontents, streamdict) end

---
---Create an object.
---
---This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->   <objnum> 0 obj
--->   <<
--->   <contents of `file` <filename>>
--->   /Length 123 >>
--->   stream
--->   <streamcontents>
--->   endstream
--->   endobj
---@param objnum? integer # Object number (optional argument).
---@param streamfile string # Literal string `"streamfile"`.
---@param filename string # File name.
---@param streamdict string # Stream dictionary.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.obj(streamfile, filename, streamdict) end

---
---Create an object.
---
---@param keyvals table # Object specification.
---> keyvals = {
--->    type           = <string>, -- `'stream'` (stream object), `'raw'` (non-stream object)
--->    immediate      = <boolean>,
--->    objnum         = <number>, -- object number
--->    attr           = <string>, -- stream dictionary
--->    compresslevel  = <number>,
--->    objcompression = <boolean>,
--->    file           = <string>, -- contents of object/stream
--->    string         = <string>, -- contents of object/stream
--->    nolength       = <boolean>, -- omit `/Length` entry of stream dictionary
---> }
--- Keys `string` and `file` are mutual exclusive.
--- Key `nolength` omits `/Length` entry of the stream dictionary only if a `/Length` entry is given in the `attr` key.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.obj(keyvals) end

_N._14_1_23_refobj = 286

---
---Write referenced object to pdf file.
---
---@param objnum integer # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.refobj(objnum) end

_N._14_1_24_reserveobj = 286

---
---Create an empty object.
---
---Use `pdf.obj()` or `pdf.immediateobj()` to define this object.
---
---@return integer objnum  # Object number.
---
---@see pdf.obj
---@see pdf.immediateobj
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.reserveobj() end

---
---Create a annotation object.
---
---Annotation object are not written to file directly but must be registered with `pdf.registerannot()`.
---
---@param annot string # Literal string `'annot'`.
---
---@return integer objnum # Object number.
---@see pdf.registerannot
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.reserveobj(annot) end

_N._14_1_25_getpageref = 286

---
---Return object number of page <pagenum>.
---
---This can be a forwar reference, i.e. page <pagenum> doesn't have to be created yet.
---
---@param pagenum integer # Page number.
---
---@return integer objnum # Object number.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getpageref(pagenum) end

_N._14_1_26_registerannot = 286

---
---Add an `/Annot` object to the `/Annots` dictionary.
---
---@param objnum integer # Object number of `/Annot` object.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.registerannot(objnum) end

_N._14_1_27_newcolorstack = 286

---
---Allocate a new color stack and returns it's id. The arguments
---are the same as for the similar backend extension primitive.
---
---```
---pdf.newcolorstack("0 g","page",true) --
---```
---
---* Corresponding C source code: [lpdflib.c#L1166-L1199](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1166-L1199)
---
---@param s string
---@param literal_mode 'page'|'direct'|'origin'|'text'|'raw'
---@param page_start boolean
--
---
---@return integer color_stack_id
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.newcolorstack(s, literal_mode, page_start) end

_N._14_1_28_setfontattributes = 286

---
---Force some additional code into the font resource.
---
---It can for
---instance be used to add a custom `ToUnicode` vector to a bitmap file.
---
---* Corresponding C source code: [lpdflib.c#L1202-L1216](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1202-L1216)
---@param font_id integer
---@param pdf_code integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setfontattributes(font_id, pdf_code) end

---
---@deprecated
---@see pdf.getfontname
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.fontname() end

---
---@deprecated
---@see pdf.getpdffontsize
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.fontsize() end

---
---Return how many objects were created so far.
---
---@return integer n # Number of objects.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.maxobjnum() end

---
---Return number of object that are written or not yet written to file.
---
---* Corresponding C source code: [lpdflib.c#L1270-L1285](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1270-L1285)
---
---@return integer written_obj # Object written to file.
---@return integer not_written_obj # Object not yet written to file.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.getnofobjects() end

---
---* Corresponding C source code: [lpdflib.c#L1218-L1235](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1218-L1235)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.includechar() end

---
---* Corresponding C source code: [lpdflib.c#L1237-L1242](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1237-L1242)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.includefont() end

---
---* Corresponding C source code: [lpdflib.c#L1244-L1268](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1244-L1268)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.includeimage() end

---
---@deprecated
---@see pdf.getobjtype
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.objtype() end

---
---@deprecated
---@see pdf.getpageref
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.pageref() end

---
---* Corresponding C source code: [lpdflib.c#L871-L879](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L871-L879)
---
---@param force boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.setforcefile(force) end

---
---* Corresponding C source code: [lpdflib.c#L1294-L1298](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdflib.c#L1294-L1298)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.settypeonewidemode() end

---
---@deprecated
---@see pdf.getxformname
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function pdf.xformname() end
