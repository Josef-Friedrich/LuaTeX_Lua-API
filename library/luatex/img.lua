---@meta
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
img = {}

_N._11_1_the_img_library = "page 225"
_N._11_1_1_new = "page 225"

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Image

---
---* Corresponding C source code: [limglib.c#L75-L102](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L75-L102)
---
---@param image_spec? table
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.new(image_spec) end

_N._11_1_2_fields = "page 226"

---
---* Corresponding C source code: [limglib.c#L301-L304](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L301-L304)
---@return ImageSpec keys
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.fields() end

---
---Alias for img.fields()
---
---* Corresponding C source code: [limglib.c#L301-L304](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L301-L304)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.keys() end

---
---* Corresponding C source code: [luatex-api.h#L506-L532](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luatex-api.h#L506-L532)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class ImageSpec
---@field attr string # the image attributes for *LuaTeX*
---@field bbox table # table with 4 boundingbox dimensions `llx`, `lly`, `urx` and `ury` overruling the `pagebox` entry
---@field colordepth number # the number of bits used by the color space
---@field colorspace number # the color space object number
---@field depth number # the image depth for *LuaTeX*
---@field filename string # the image file name
---@field filepath string # the full (expanded) file name of the image
---@field height number # the image height for *LuaTeX*
---@field imagetype string # one of `pdf`, `png`, `jpg`, `jp2` or `jbig2`
---@field index number # the *PDF* image name suffix
---@field objnum number # the *PDF* image object number
---@field page number # the identifier for the requested image page
---@field pagebox string # the requested bounding box, one of `none`, `media`, `crop`, `bleed`, `trim`, `art`
---@field pages number # the total number of available pages
---@field rotation number # the image rotation from included *PDF* file, in multiples of 90 deg.
---@field stream string # the raw stream data for an `/Xobject` `/Form` object
---@field transform number # the image transform, integer number 0..7
---@field orientation number # the (jpeg) image orientation, integer number 1..8 (0 for unset)
---@field width number # the image width for *LuaTeX*
---@field xres number # the horizontal natural image resolution (in \DPI)
---@field xsize number # the natural image width
---@field yres number # the vertical natural image resolution (in \DPI)
---@field ysize number # the natural image height
---@field visiblefilename string # when set, this name will find its way in the *PDF* file as `PTEX` specification; when an empty string is assigned nothing is written to file; otherwise the natural filename is taken
---@field userpassword string # the userpassword needed for opening a *PDF* file
---@field ownerpassword string # the ownerpassword needed for opening a *PDF* file
---@field keepopen boolean # keep the *PDF* file open
---@field nobbox boolean # don't add a boundingbox specification for streams
---@field nolength boolean # don't add length key nor compress for streams
---@field nosize boolean # don't add size fields for streams

_N._11_1_3_scan = "page 227"

---
---When you say `img.scan(a)` for a new image, the file is scanned, and
---variables such as `xsize`, `ysize`, image `type`, number of
---`pages`, and the resolution are extracted. Each of the `width`, `height`, `depth` fields are set up according to the image dimensions, if
---they were not given an explicit value already. An image file will never be
---scanned more than once for a given image variable. With all subsequent `img.scan(a)` calls only the dimensions are again set up (if they have been
---changed by the user in the meantime).
---
---For ease of use, you can do right-away a
---
---```lua
---<image> a = img.scan { filename = "foo.png" }
---```
---
---without a prior `img.new`.
---
---Nothing is written yet at this point, so you can do `a=img.scan`, retrieve
---the available info like image width and height, and then throw away `a`
---again by saying `a=nil`. In that case no image object will be reserved in
---the PDF, and the used memory will be cleaned up automatically.
---
---* Corresponding C source code: [limglib.c#L145-L157](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L145-L157)
---
---@param image Image|ImageSpec
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.scan(image) end

_N._11_1_4_copy = "page 230"

---
---If you say `a = b`, then both variables point to the same `<image>`
---object. if you want to write out an image with different sizes, you can do
---`b = img.copy(a)`.
---
---Afterwards, `a` and `b` still reference the same actual image
---dictionary, but the dimensions for `b` can now be changed from their
---initial values that were just copies from `a`.
---
---* Corresponding C source code: [limglib.c#L104-L114](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L104-L114)
---
---@param image Image|ImageSpec
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.copy(image) end

_N._11_1_5_write_immediatewrite_immediatewriteobject = "page 228"

---
---Allocate a *PDF* object number and generate a rule node of
---subtype `image` and put it into the output list.
---
---By this the
---image `a` is placed into the page stream, and the image file is written out
---into an image stream object after the shipping of the current page is finished.
---
---Again you can do a terse call like
---
---```
---img.write { filename = "foo.png" }
---```
---
---The `<image>` variable is returned in case you want it for later
---processing. You can also write an object.
---
---* Corresponding C source code: [limglib.c#L267-L271](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L267-L271)
---
---@param image Image|ImageSpec
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.write(image) end

---
---Allocate a *PDF* object number and write the
---image file for image `a` out immediately into the *PDF* file as
---an image stream object (like with `immediate` `\pdfximage`).
---
---The object
---number of the image stream dictionary is then available by the `objnum`
---key. No `pdf_refximage` whatsit node is generated. You will need an
---`img.write(a)` or `img.node(a)` call to let the image appear on the
---page, or reference it by another trick; else you will have a dangling image
---object in the *PDF* file.
---
---Also here you can do a terse call like
---
---```
---a = img.immediatewrite { filename = "foo.png" }
---```
---
---The `<image>` variable is returned and you will most likely need it.
---
---* Corresponding C source code: [limglib.c#L273-L282](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L273-L282)
---
---@param image Image|ImageSpec
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.immediatewrite(image) end

---
---Copie an object from a (*PDF*) image
---file.
---
---This features is experimental and might disappear.
---
---* Corresponding C source code: [limglib.c#L284-L293](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L284-L293)
---
---@param image Image|ImageSpec
---@param objnum integer
---
---@return Image
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.immediatewriteobject(image, objnum) end

_N._11_1_6_node = "page 229"

---
---Allocate a *PDF* object number and return a whatsit node of
---subtype `pdf_refximage`, filled with the image parameters `width`,
---`height`, `depth`, and `objnum`.
---
---Also here you can do a terse
---call like:
---
---```
---n = img.node ({ filename = "foo.png" })
---```
---
---This example outputs an image:
---
---```
---node.write(img.node{filename="foo.png"})
---```
---
---* Corresponding C source code: [limglib.c#L295-L299](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L295-L299)
---
---@param image Image|ImageSpec
---
---@return Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.node(image) end

_N._11_1_7_types = "page 229"

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ImgType `pdf` | `png` | `jpg` | `jp2` | `jbig2`

---
---Return a list with the supported image file type names, currently
---these are `pdf`, `png`, `jpg`, `jp2` (JPEG 2000), and
---`jbig2`.
---
---```lua
---types = img.types()
---```
---
---* Corresponding C source code: [limglib.c#L306-L309](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L306-L309)
---
---@return ImgType[]
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.types() end

_N._11_1_8_boxes = "page 229"

---
---* Corresponding C source code: [luatex-api.h#L534-L540](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luatex-api.h#L534-L540)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias ImgBox `media` | `crop` | `bleed` | `trim` | `art`

---
---Return a list with the supported *PDF* page box names, currently
---these are `media`, `crop`, `bleed`, `trim`, and `art`, all in lowercase.
---
---```lua
---boxes = img.boxes()
---```
---
---* Corresponding C source code: [limglib.c#L311-L314](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L311-L314)
---
---@return ImgBox[]
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/img.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function img.boxes() end
