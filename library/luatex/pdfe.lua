---@meta
pdfe = {}

---
---@class PdfeDocument
---@class PdfeDictionary
---@class PdfeArray
---@class PdfeStream
---@class PdfeReference

_N._14_2_1_introduction = 287
_N._14_2_2_open_new_getstatus_close_unencrypt = 287

---
---Open a pdf file.
---@param filename string # File name.
---@return PdfeDocument doc # Pdfe document.
---
---* Corresponding C source code: [lpdfelib.c#L834-L851](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L834-L851)
function pdfe.open(filename) end

---
---Open a pseudo (in-memory) pdf file.
---@param contents string # A string containing a complete pdf file.
---@param size integer # Size of contents in bytes.
---@return PdfeDocument
---
---* Corresponding C source code: [lpdfelib.c#L853-L917](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L853-L917)
function pdfe.new(contents, size) end

---
---Return the encryption status of a pdfe document.
---@param doc PdfeDocument # Pdfe document.
---@return integer status # Encryption status.
-- - -2  <doc> is encrypted
-- - -1  <doc> is encrypted and decryption with `pdfe.unencrypt()` failed
-- -  0  <doc> is not encrypted
-- -  1  <doc> successfully unencrypted with `pdfe.unencrypt()`
---
---* Corresponding C source code: [lpdfelib.c#L1031-L1038](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1031-L1038)
function pdfe.getstatus(doc) end

---
---Close a pdfe document.
---@param doc PdfeDocument # Pdfe document.
---
---* Corresponding C source code: [lpdfelib.c#L945-L948](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L945-L948)
function pdfe.close(doc) end

---
---Unencrypt a pdfe document.
---@param doc PdfeDocument # Pdfe document.
---@param userpassword string|nil # User password.
---@param ownerpassword string|nil # Owner password.
---
---* Corresponding C source code: [lpdfelib.c#L963-L991](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L963-L991)
function pdfe.unencrypt(doc, userpassword, ownerpassword) end

_N._14_2_3_getsize_getversion_getnofobjects_getnofpages_getmemoryusage = 288

---
---Return the size of a pdfe document in bytes.
---@param doc PdfeDocument # Pdfe document.
---@return integer size # Size of pdf document is bytes.
---
---* Corresponding C source code: [lpdfelib.c#L1008-L1015](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1008-L1015)
function pdfe.getsize(doc) end

---
---Return the version number of the pdf document.
---@param doc PdfeDocument
---@return integer major # major version number
---@return integer minor # minor version number
---
---* Corresponding C source code: [lpdfelib.c#L1017-L1029](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1017-L1029)
function pdfe.getversion(doc) end

---
---Return number of objects referenced in the XREF table.
---@param doc PdfeDocument # Pdf document.
---@return integer nobj # Number of objects.
---
---* Corresponding C source code: [lpdfelib.c#L1040-L1047](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1040-L1047)
function pdfe.getnofobjects(doc) end

---
---Return the number of pages of the pdf document.
---@param document PdfeDocument # Pdfe document.
---@return integer npages # Number of pages.
---
---* Corresponding C source code: [lpdfelib.c#L1049-L1056](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1049-L1056)
function pdfe.getnofpages(document) end

---
---Return memory usage of pplib library in bytes.
---@param doc PdfeDocument # Pdfe document.
---@return integer used # Used memory including waste.
---@return integer waste # Waste (E.g. optional keys of pdf objects that are not used.)
---
---* Corresponding C source code: [lpdfelib.c#L1058-L1069](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1058-L1069)
function pdfe.getmemoryusage(doc) end

_N._14_2_4_get_catalog_trailer_info = 288

---
---Return pdf catalog.
---@param doc PdfeDocument # Pdfe document.
---@return PdfeDictionary catalog # Catalog of the pdf.
---
---* Corresponding C source code: [lpdfelib.c#L465-L471](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L465-L471)
function pdfe.getcatalog(doc) end

---
---Return pdf trailer.
---@param doc PdfeDocument # Pdfe document
---@return PdfeDictionary trailor # Trailer of the pdf.
---
---* Corresponding C source code: [lpdfelib.c#L473-L479](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L473-L479)
function pdfe.gettrailer(doc) end

---
---Return pdf info.
---@param doc PdfeDocument # Pdfe document
---@return PdfeDictionary info # Info of the pdf.
---
---* Corresponding C source code: [lpdfelib.c#L481-L487](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L481-L487)
function pdfe.getinfo(doc) end

_N._14_2_5_getpage_getbox = 288

---
---Return a specific pdf page.
---@param doc PdfeDocument # Pdfe document.
---@param page integer # Page number.
---@return PdfeDictionary page # Page object.
---
---* Corresponding C source code: [lpdfelib.c#L1091-L1099](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1091-L1099)
function pdfe.getpage(doc, page) end

---
---Return a table of pages.
---@param doc PdfeDocument # Pdfe document.
---@return table< PdfeDictionary > table # Lua table.
---Each item of the returned table is a PdfeDictionary of one page of the pdf.
---
---* Corresponding C source code: [lpdfelib.c#L1114-L1122](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1114-L1122)
function pdfe.getpages(doc) end

---
---Return bounding box of a pdf page.
---@param page PdfeDictionary # Pdfe dictionary.
---@param bbox_name string # Name of bounding box.
---E.g. 'MediaBox', 'CropBox', 'BleedBox', 'TrimBox', 'ArtBox'
---@return number[] bbox # [llx lly urx ury]
---
---* Corresponding C source code: [lpdfelib.c#L1136-L1161](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1136-L1161)
function pdfe.getbox(page, bbox_name) end

_N._14_2_6_get_string_integer_number_boolean_name_type = 289

---
---Return a pdf string object as a string.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index integer # Key or index.
---@return string string # String.
---If the pdf string is hex encoded then the returned string is hex encoded too.
---
---* Corresponding C source code: [lpdfelib.c#L1342-L1369](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1342-L1369)
function pdfe.getstring(dict_or_array, key_or_index) end

---
---Return a pdf string object as a string.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@param decode boolean # `True`, if a hex encoded string shall be decoded.
---@return string string # String.
---@return boolean was_encoded # `True`, if string was hex encoded.
---Return value `was_encoded` is only available if `decode` is `false`.
---
---* Corresponding C source code: [lpdfelib.c#L1342-L1369](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1342-L1369)
function pdfe.getstring(dict_or_array, key_or_index, decode) end

---
---Return a pdf integer object as integer.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return integer value # Integer.
---
---* Corresponding C source code: [lpdfelib.c#L1371-L1383](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1371-L1383)
function pdfe.getinteger(dict_or_array, key_or_index) end

---
---Return a pdf number object as number.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return number value # Number.
---
---* Corresponding C source code: [lpdfelib.c#L1385-L1397](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1385-L1397)
function pdfe.getnumber(dict_or_array, key_or_index) end

---
---Return a pdf boolean value as boolean.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return boolean value # Boolean.
---
---* Corresponding C source code: [lpdfelib.c#L1399-L1411](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1399-L1411)
function pdfe.getboolean(dict_or_array, key_or_index) end

---
---Return a pdf name object as string.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return string value # Name.
---
---* Corresponding C source code: [lpdfelib.c#L1413-L1425](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1413-L1425)
function pdfe.getname(dict_or_array, key_or_index) end

---
---Return a string representing the pdfe type of <pdfe_obj>.
---@param pdfe_obj PdfeDocument|PdfeDictionary|PdfeArray|PdfeStream|PdfeReference
---@return string|nil pdfe_type # Type of pdfe object.
--
--  ------------------------------------
--  returned string   type of <pdfe_obj>
--  ---------------   ------------------
--  pdfe              PdfeDocument
--  pdfe.dictionary   PdfeDictionary
--  pdfe.array        PdfeArray
--  pdfe.stream       PdfeStream
--  pdfe.reference    PdfeReference
--  ------------------------------------
--  Note: Returns `nil` for all other objects like integer, string, etc.
---
---* Corresponding C source code: [lpdfelib.c#L224-L235](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L224-L235)
function pdfe.type(pdfe_obj) end

_N._14_2_7_get_dictionary_array_stream = 289

---
---Return a pdf dictionary as a pdfe dictionary.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return PdfeDictionary dict # Pdfe dictionary.
---
---* Corresponding C source code: [lpdfelib.c#L1427-L1437](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1427-L1437)
function pdfe.getdictionary(dict_or_array, key_or_index) end

---
---Return a pdf array as a pdfe array.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return PdfeArray array # Pdfe array.
---
---* Corresponding C source code: [lpdfelib.c#L1439-L1449](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1439-L1449)
function pdfe.getarray(dict_or_array, key_or_index) end

---
---Return a pdf stream as a pdfe stream.
---The corresponding dictionary of the stream is returned too.
---@param dict_or_array PdfeDictionary|PdfeArray # Pdfe dictionary or array.
---@param key_or_index string|integer # Key or index.
---@return PdfeStream stream # Pdfe stream.
---@return PdfeDictionary dict # Pdfe dictionary of the stream.
---
---* Corresponding C source code: [lpdfelib.c#L1451-L1461](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1451-L1461)
function pdfe.getstream(dict_or_array, key_or_index) end

---
---Return a value of a pdf stream dictionary, including low level details about this value.
---Like `pdfe.getfromdictionary()` except that this functions works on a 'dictionary of a stream'.
---@param stream PdfeStream
---@param key integer
---@return integer type # Integer representing the type of a value. (See table below.)
---@return any value # The value itself.
---@return any details # Details about this value. (See table below.)
-- -----------------------------------------------------------
-- Type  PDF type      Lua type           Details
-- ----  ------------  -----------------  --------------------
--   0   none          nil
--   1   null          nil
--   2   boolean       boolean
--   3   integer       integer
--   4   number        number
--   5   name          string
--   6   string        string             Is_hex? (1)
--   7   array         PdfeArray          Size of array
--   8   dictionary    PdfeDictionary     Size of dictionary
--   9   stream        PdfeStream         PdfeDictionary
--  10   reference     PdfeReference      Number of reference
-- -----------------------------------------------------------
-- (1) `true` for hexadecimal string, `false` for normal string
---
---* Corresponding C source code: [lpdfelib.c#L544-L570](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L544-L570)
function pdfe.getfromstream(stream, key) end

_N._14_2_8_open_close_readfrom_whole_stream = 289

---
---Open a stream.
---@param stream PdfeStream # Pdfe stream object.
---@param decode? boolean # `True`, if stream should be decompressed.
---@return boolean okay # `True`, if reading the stream was successful.
---
---* Corresponding C source code: [lpdfelib.c#L764-L778](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L764-L778)
function pdfe.openstream(stream, decode) end

---
---Close a stream.
---@param stream PdfeStream # Pdfe stream object
---
---* Corresponding C source code: [lpdfelib.c#L780-L791](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L780-L791)
function pdfe.closestream(stream) end

---
---Read a stream object in chunks.
---@param stream PdfeStream # Pdfe stream object.
---@return string contents # Contents of stream.
---@return integer size# Length of stream.
---
---* Corresponding C source code: [lpdfelib.c#L793-L812](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L793-L812)
function pdfe.readfromstream(stream) end

---
---Read stream object as a whole.
---Opening and closing the stream with `pdfe.openstream()` and `pdfe.closestream()` is not necessary.
---@param stream PdfeStream # Pdfe stream object.
---@param decode boolean # `True`, if stream should be decompressed.
---@return string contents # Contents of stream.
---@return integer size # Length of stream.
---
---* Corresponding C source code: [lpdfelib.c#L728-L750](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L728-L750)
function pdfe.readwholestream(stream, decode) end

---
---Return a table in which each item represents one page of a pdf.
---@param doc PdfeDocument # Pdfe document.
---@return table table # Lua table.
-- Each item (page) of the returned table is a table itself like this:
-- `{ page, size, objnum }`
-- * `page` - pdfe dictionary of a page
-- * `size` - number of keys of the `page` dictionary
-- * `objnum` - pdf object number of the page object
---
---* Corresponding C source code: [lpdfelib.c#L686-L716](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L686-L716)
function pdfe.pagestotable(doc) end

_N._14_2_9_getfrom_dictionary_array = 290

---
---Return a value of a pdf dictionary, including low level details about this value.
---@param dict PdfeDictionary
---@param key string
---@return integer type # Integer representing the type of a value. (See table below.)
---@return any value # The value itself.
---@return any details # Details about this value. (See table below.)
-- -----------------------------------------------------------
-- Type  PDF type      Lua type           Details
-- ----  ------------  -----------------  --------------------
--   0   none          nil
--   1   null          nil
--   2   boolean       boolean
--   3   integer       integer
--   4   number        number
--   5   name          string
--   6   string        string             Is_hex? (1)
--   7   array         PdfeArray          Size of array
--   8   dictionary    PdfeDictionary     Size of dictionary
--   9   stream        PdfeStream         PdfeDictionary
--  10   reference     PdfeReference      Number of reference
-- -----------------------------------------------------------
-- (1) `true`, for hexadecimal string, `false` for normal string
---
---* Corresponding C source code: [lpdfelib.c#L517-L542](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L517-L542)
function pdfe.getfromdictionary(dict, key) end

---
---Return a value of a pdf dictionary, including low level details about this value.
---@param array PdfeArray
---@param index integer
---@return integer type # Integer representing the type of a value. (See table below.)
---@return any value # The value itself.
---@return any details # Details about this value. (See table below.)
-- -----------------------------------------------------------
-- Type  PDF type      Lua type           Details
-- ----  ------------  -----------------  --------------------
--   0   none          nil
--   1   null          nil
--   2   boolean       boolean
--   3   integer       integer
--   4   number        number
--   5   name          string
--   6   string        string             Is_hex? (1)
--   7   array         PdfeArray          Size of array
--   8   dictionary    PdfeDictionary     Size of dictionary
--   9   stream        PdfeStream         PdfeDictionary
--  10   reference     PdfeReference      Number of reference
-- -----------------------------------------------------------
-- (1) `true` for hexadecimal string, `false` for normal string
---
---* Corresponding C source code: [lpdfelib.c#L501-L515](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L501-L515)
function pdfe.getfromarray(array, index) end

_N._14_2_10_dictionary_array_totable = 290

---
---Convert a pdfe dictionary into a lua table.
---@param dict PdfeDictionary # Pdfe dictionary.
---@return table<string, table<integer, any, any> > table # Lua table
-- This function returns a lua table. Its keys are the keys of the pdfe dictionary and its values are what `pdfe.getfromdictionary(dict, key)` returns.
---
---* Corresponding C source code: [lpdfelib.c#L651-L674](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L651-L674)
function pdfe.dictionarytotable(dict) end

---
---Convert a pdfe array into a lua table.
---@param array PdfeArray # Pdfe array.
---@return table<integer, table<integer, any, any> > table # Lua table
-- This function returns a lua table. Its indices are the indices of the pdfe array and its values are what `pdfe.getfromarray(array, index)` returns.
---
---* Corresponding C source code: [lpdfelib.c#L628-L649](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L628-L649)
function pdfe.arraytotable(array) end

_N._14_2_11_getfromreference = 290

---
---Return the value of a reference, including low level details about this value.
---@param ref PdfeReference
---@return integer type # Type of value. (See table below.)
---@return any value # The value itself.
---@return any details # Details about this value. (See table below.)
-- -----------------------------------------------------------
-- Type  PDF type      Lua type           Details
-- ----  ------------  -----------------  --------------------
--   0   none          nil
--   1   null          nil
--   2   boolean       boolean
--   3   integer       integer
--   4   number        number
--   5   name          string
--   6   string        string             Is_hex? (1)
--   7   array         PdfeArray          Size of array
--   8   dictionary    PdfeDictionary     Size of dictionary
--   9   stream        PdfeStream         PdfeDictionary
--  10   reference     PdfeReference      Number of reference
-- -----------------------------------------------------------
-- (1) `true` for hexadecimal string, `false` for normal string
---
---* Corresponding C source code: [lpdfelib.c#L1174-L1188](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lpdfelib.c#L1174-L1188)
function pdfe.getfromreference(ref) end
