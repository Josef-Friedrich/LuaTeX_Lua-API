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
function pdf.mapline(map_line) end

_N._14_1_2_set_get_catalog_info_names_trailer = 281

---
---Insert string <catalog> into the `/Catalog` dictionary.
---
---@param catalog string # String.
function pdf.setcatalog(catalog) end

---
---Return string <catalog> that was set by `pdf.setcatalog()`.
---
---@return string | nil catalog # String.
function pdf.getcatalog() end

---
---Insert string <info> into the `/Info` dictionary.
---
---@param info string # String.
function pdf.setinfo(info) end

---
---Return string <info> that was set by `pdf.setinfo()`.
---
---@return string | nil info # String.
function pdf.getinfo() end

---
---Insert string <names> into the `/Names` dictionary of the `/Catalog`.
---
---@param names string # String.
function pdf.setnames(names) end

---
---Return string <names> that was set by `pdf.setnames()`.
---
---@return string | nil names # String.
function pdf.getnames() end

---
---Insert string <trailer> into the `trailer` dictionary.
---
---@param trailer string # String.
---FIXME: pdf.settrailer() not working. Bug?
function pdf.settrailer(trailer) end

---
---Return string <trailer> that was set by `pdf.settrailer()`.
---
---@return string | nil trailer # String.
function pdf.gettrailer() end

_N._14_1_3_set_get_pageattributes_pageresources_pagesattributes = 281

---
---Insert string <attributes> into the current `/Page` dictionary.
---
---@param attributes string # String.
function pdf.setpageattributes(attributes) end

---
---Return string <attributes> that was set by `pdf.setpageattributes()`.
---
---@return string | nil attributes # String.
function pdf.getpageattributes() end

---
---Insert string <resources> into the `/Resources` dictionary of the current page.
---
---@param resources string # String.
function pdf.setpageresources(resources) end

---
---Return string <resources> that was set by `pdf.setpageresources()`.
---
---@return string | nil resources # String.
function pdf.getpageresources() end

---
---Insert string <attributes> into the `/Pages` dictionary of the `/Catalog`.
---
---@param attributes string # String.
function pdf.setpagesattributes(attributes) end

---
---Return string <attributes> that was set by `pdf.setpageattributes()`.
---
---@return string | nil attributes # String.
function pdf.getpagesattributes() end

_N._14_1_4_set_get_xformattributes_xformresources = 281

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.setxformattributes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.getxformattributes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.setxformresources() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.getxformresources() end

_N._14_1_5_set_get_major_minor_version = 281

---
---Set major version number of the PDF file format.
---
---Note: This function sets the version number of the file header. It does not set the `/Version` key of the `/Catalog` as recommended for PDF-1.4 and later.
---@param n integer # Major version number.
function pdf.setmajorversion(n) end

---
---Return major version number of the PDF file format.
---
---@see pdf.setmajorversion
---
---@return integer n # Major version number.
function pdf.getmajorversion() end

---
---Set minor version number of the PDF file format.
---
---Note: This function sets the version number of the file header. It does not set the `/Version` key of the `/Catalog` as recommended for PDF-1.4 and later.
---
---@param n integer # Minor version number.
function pdf.setminorversion(n) end

---
---Return minor version number of the PDF file format.
---
---@see pdf.setminorversion
---
---@return integer n # Minor version number.
function pdf.getminorversion() end

_N._14_1_6_getcreationdate = 282

---
---Return the `/CreationDate` string of the `/Info` dictionary.
---
---@return string
function pdf.getcreationdate() end

_N._14_1_7_set_get_inclusionerrorlevel_ignoreunknownimages = 282

---
---Set error level for inserting *PDF* files.
---
---A warning/error is issued if the inserted *PDF* file has a newer version number than the main *PDF* file.
--- * `level <= 0`: Issue a warning.
--- * `level > 0`: Issue an error.
---@param level integer
function pdf.setinclusionerrorlevel(level) end

---
---Return value set by `pdf.setinclusionerrorlevel()`.
---
---@return integer level # Error level.
---
---@see pdf.setinclusionerrorlevel
function pdf.getinclusionerrorlevel() end

---
---Set <ignore> status for inserting images.
--- * `ignore ~= 0`: Issue a warning if image file type is unknown.
--- * `ignore == 0`: Issue an error if image file type is unknown.
---LuaTeX can handle these file types: pdf, png, jpg, jbig2
---@param ignore integer # Ignore image.
function pdf.setignoreunknownimages(ignore) end

---
---Return <ignore> status.
---
---@return integer ignore # Ignor image.
---
---@see pdf.setignoreunknownimages
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
function pdf.setsuppressoptionalinfo(flags) end

---
---Return bit field set by `pdf.setsuppressoptionalinfo()`.
---
---@return integer flags # Bit field.
---
---@see pdf.setsuppressoptionalinfo
function pdf.getsuppressoptionalinfo() end

---
---Set `/ID` of the trailer.
---
---@param id string # Trailer ID.
function pdf.settrailerid(id) end

---
---Return `/ID` of the trailer.
---
---@return string id # Trailer ID.
function pdf.gettrailerid() end

---
---Add or remove `/CIDSet` entry in `/FontDescriptor`.
--- * `n ~= 0`: Remove `/CIDSet` entry.
--- * `n == 0`: Add `/CIDSet` entry.
---
---@param n integer
function pdf.setomitcidset(n) end

---
---Return <flag> set by `pdf.setomitcidset()`.
---
---@return integer flag
---
---@see pdf.setomitcidset
function pdf.getomitcidset() end

---
---Add or remove `/CharSet` entry in `/FontDescriptor`.
--- * `n ~= 0`: Remove `/CharSet` entry.
--- * `n == 0`: Add `/CharSet` entry.
---
---@param n integer
function pdf.setomitcharset(n) end

---
---Return value set by `pdf.setomitcharset()`.
---
---@return integer n
---
---@see pdf.setomitcharset
function pdf.getomitcharset() end

_N._14_1_9_set_get_obj_compresslevel_recompress = 282

---
---Set compression level of streams.
---
---@param level integer # Minimum: 0, Maximum: 9
function pdf.setcompresslevel(level) end

---
---Return compression level of streams.
---
---@return integer level # Compression level.
function pdf.getcompresslevel() end

---
---Set compression level of objects.
---
---@param level integer # Minimum: 0, Maximum: 9
function pdf.setobjcompresslevel(level) end

---
---Return compression level of objects.
---
---@return integer level # Compression level.
function pdf.getobjcompresslevel() end

---
---Switch for recompressing streams of `/XObject`s.
---
---@param switch integer # 0: don't recompress, 1: do recompress.
---FIXME: pdf.setrecompress() not working. Bug?
function pdf.setrecompress(switch) end

---
---Return value set by `pdf.setrecompress()`.
---
---@return integer switch # 0: don't recompress, 1: do recompress.
function pdf.getrecompress() end

_N._14_1_10_set_get_gentounicode = 282

---
---Add or remove `/ToUnicode` entry in a font dictionary.
---
---@param n integer
--- * `n ~= 0`: Add `/ToUnicode` entry.
--- * `n == 0`: Remove `/ToUnicode` entry.
--- Note: Use `\pdfextension glyphtounicode` to add a CMap mapping from character codes to Unicode values.
function pdf.setgentounicode(n) end

---
---Return value set by `pdf.setgentounicode()`.
---
---@return integer n
---@see pdf.setgentounicode
function pdf.getgentounicode() end

_N._14_1_11_set_get_decimaldigits = 282

---
---Set number of decimal digits used for writing numbers (floats) in the *PDF* file.
---
---@param ndigits integer # Number of decimal digits.
function pdf.setdecimaldigits(ndigits) end

---
---Return value set by `pdf.setdecimaldigits()`.
---
---@return integer ndigits # Number of digits.
---
---@see pdf.setdecimaldigits
function pdf.getdecimaldigits() end

_N._14_1_12_set_get_pkresolution = 283

---
---Set resolution of PK fonts.
---@param resolution integer
---@param fixed_dpi integer
function pdf.setpkresolution(resolution, fixed_dpi) end

---
---Return resolution of PK fonts.
---
---@return integer resolution
---@return integer fixed_dpi
function pdf.getpkresolution() end

_N._14_1_13_getlast_obj_link_annot_and_getretval = 283

---
---Return object number of latest created objects.
---
---@return integer objnum # Number of latest created object.
function pdf.getlastobj() end

---
---Return object number of latest created `/Annot` object (subtype `/Link`) that was created by `/pdfextension startlink`.
---
---@return integer objnum # Object number.
function pdf.getlastlink() end

---
---Return object number of latest created `/Annot` object that was created by `pdf.reserveobj('annot')`.
---
---@return integer objnum # Number of latest created object.
function pdf.getlastannot() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.getretval() end

_N._14_1_14_getmaxobjnum_getobjtype_getfontname_getfontobjnum_getfontsize_getxformname = 283

---
---Return the object number of the latest created pdf object.
---
---@return integer objnum # Object number.
function pdf.getmaxobjnum() end

---
---Return a string describing the object type.
---
---@param objnum integer # Object number.
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
function pdf.getfontname(id) end

---
---Return the object number of the `/Font` dictionary.
---
---@param id integer # Font ID.
---
---@return integer objnum # Object number.
function pdf.getfontobjnum(id) end

---
---Return the font size in scaled points.
---
---@param id integer # Font ID.
---
---@return integer # Font size.
function pdf.getfontsize(id) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.getxformname() end

_N._14_1_15_set_get_origin = 283

---
---Set horizontal and vertical offset from the top left corner of the page.
---
---@param h integer # Horizontal offset in scaled points.
---@param v integer # Vertical offset in scaled points.
function pdf.setorigin(h, v) end

---
---Return values set by `pdf.setorigin()`.
---
---@return integer h # Horizontal offset in scaled points.
---@return integer v # Vertical offset in scaled points.
---
---@see pdf.setorigin
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
function pdf.setimageresolution(dpi) end

---
---Return value set by `pdf.setimageresolution()`.
---
---@return integer dpi # Resolution.
---
---@see pdf.setimageresolution
function pdf.getimageresolution() end

_N._14_1_17_set_get_link_dest_thread_xform_margin = 283

---
---Set margin size of hyperlinks.
---
---@param margin integer # Margin in scaled points.
function pdf.setlinkmargin(margin) end

---
---Return value set by `pdf.setlinkmargin()`.
---
---@return integer margin # Margin in scaled points.
---@see pdf.setlinkmargin
function pdf.getlinkmargin() end

---
---Set margin size of destination.
---
---@param margin integer # Margin in scaled points.
---FIXME pdf.setdestmargin() is not working. Bug?
function pdf.setdestmargin(margin) end

---
---Return value set by `pdf.setdestmargin()`.
---
---@return integer margin # Margin in scaled points.
---@see pdf.setdestmargin
function pdf.getdestmargin() end

---
---Set size of margin for threads.
---
---@param margin integer # Margin in scaled points.
function pdf.setthreadmargin(margin) end

---
---Return value set by `pdf.setthreadmargin()`.
---
---@return integer margin # Margin in scaled points.
---
---@see pdf.setthreadmargin
function pdf.getthreadmargin() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.setxformmargin() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.getxformmargin() end

_N._14_1_18_get_pos_hpos_vpos = 283

---
---Return coordinates of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer h # Horizontal position in scaled points.
---@return integer v # Vertical position in scaled points.
---
---Note: This function is mainly used inside `\latelua` calls.
function pdf.getpos() end

---
---Return horizontal coordinate of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer h # Horizontal position in scaled points.
---Note: This function is mainly used inside `\latelua` calls.
function pdf.gethpos() end

---
---Return vertical coordinate of the current position. The origin of the coordinate system is at the lower left corner of the page.
---
---@return integer v # Vertical position in scaled points.
---
---Note: This function is mainly used inside `\latelua` calls.
function pdf.getvpos() end

_N._14_1_19_has_get_matrix = 283

---
---Returns `true` is a CTM is currently used.
---
---@return boolean
---
---Note: This function is mainly used inside `\latelua` calls.
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
function pdf.getmatrix() end

_N._14_1_20_print = 284

---
---Write a string into the contents stream of the current page. If LuaTeX is currently inside a text block (**BT**...**ET**), close the text block first.
---
---@param str string # String.
---
---Note: This function is mainly used inside `\latelua` calls.
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
function pdf.print(type, str) end

_N._14_1_21_immediateobj = 283

---
---Create an object and write it immediately to the pdf file.
---The created object looks like this:
--->  <objnum> 0 obj
--->    <str>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param str string # Contents of the object.
---@return integer objnum # Object number.
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
---@return integer objnum # Object number.
function pdf.immediateobj(objnum, file, filename) end

---
---Create an object and write it immediately to the pdf file.
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
function pdf.immediateobj(stream, streamcontents, streamdict) end

---
---Create an object and write it immediately to the pdf file.
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
function pdf.immediateobj(streamfile, filename, streamdict) end

_N._14_1_22_obj = 285

---
---Create an object. This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->  <objnum> 0 obj
--->    <str>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param str string # Contents of the object.
---@return integer objnum # Object number.
function pdf.obj(str) end

---
---Create an object. This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
---The created object looks like this:
--->  <objnum> 0 obj
--->    <contents of file <filename>>
--->  endobj
---@param objnum? integer # Object number (optional argument).
---@param file string # Literal string `"file"`.
---@param filename string # File name.
---@return integer objnum # Object number.
function pdf.obj(objnum, file, filename) end

---
---Create an object. This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
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
function pdf.obj(stream, streamcontents, streamdict) end

---
---Create an object. This object is written to the pdf file only if it is referenced later by `pdf.refobj()`
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
function pdf.obj(streamfile, filename, streamdict) end

---
---Create an object.
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
---@return integer objnum # Object number.
function pdf.obj(keyvals) end

_N._14_1_23_refobj = 286

---
---Write referenced object to pdf file.
---@param objnum integer # Object number.
function pdf.refobj(objnum) end

_N._14_1_24_reserveobj = 286

---
---Create an empty object.
---Use `pdf.obj()` or `pdf.immediateobj()` to define this object.
---@return objnum integer # Object number.
---@see pdf.obj
---@see pdf.immediateobj
function pdf.reserveobj() end

---
---Create a annotation object.
---Annotation object are not written to file directly but must be registered with `pdf.registerannot()`.
---@param annot strint # Literal string `'annot'`.
---@return integer objnum # Object number.
---@see pdf.registerannot
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
function pdf.getpageref(pagenum) end

_N._14_1_26_registerannot = 286

---
---Add an `/Annot` object to the `/Annots` dictionary.
---
---@param objnum integer # Object number of `/Annot` object.
function pdf.registerannot(objnum) end

_N._14_1_27_newcolorstack = 286

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.newcolorstack() end

_N._14_1_28_setfontattributes = 286

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.setfontattributes() end

---
---@deprecated
---@see pdf.getfontname
function pdf.fontname() end

---
---@deprecated
---@see pdf.getpdffontsize
function pdf.fontsize() end

---
---Return how many objects were created so far.
---@return integer n # Number of objects.
function pdf.maxobjnum() end

---
---Return number of object that are written or not yet written to file.
---@return integer written_obj # Object written to file.
---@return integer not_written_obj # Object not yet written to file.
function pdf.getnofobjects() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.includechar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.includefont() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.includeimage() end

---
---@deprecated
---@see pdf.getobjtype
function pdf.objtype() end

---
---@deprecated
---@see pdf.getpageref
function pdf.pageref() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.setforcefile() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function pdf.settypeonewidemode() end

---
---@deprecated
---@see pdf.getxformname
function pdf.xformname() end
