---@meta
img = {}

_N._11_1_The_img_library = 0
_N._11_1_1_new = 0

---
---@class Image

---
---* Corresponding C source code: [limglib.c#L75-L102](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L75-L102)
---
---@param image_spec? table
---
---@return Image
function img.new(image_spec) end

_N._11_1_2_fields = 0

---
---* Corresponding C source code: [limglib.c#L301-L304](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L301-L304)
---@return ImageSpec keys
function img.fields() end

---
---Alias for img.fields()
---
---* Corresponding C source code: [limglib.c#L301-L304](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L301-L304)
function img.keys() end

---
---* Corresponding C source code: [luatex-api.h#L506-L532](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luatex-api.h#L506-L532)
---
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

_N._11_1_3_scan = 0

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
function img.scan(image) end

_N._11_1_4_copy = 0

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
function img.copy(image) end

_N._11_1_5_write_immediatewrite_immediatewriteobject = 0

---
---By `img.write(a)` a *PDF* object number is allocated, and a rule node of
---subtype `image` is generated and put into the output list. By this the
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
function img.write(image) end

---
---By `img.immediatewrite(a)` a *PDF* object number is allocated, and the
---image file for image `a` is written out immediately into the *PDF* file as
---an image stream object (like with `immediate` `\pdfximage`). The object
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
function img.immediatewrite(image) end

---
---The next function is kind of special as it copies an object from a (*PDF*) image
---file. This features is experimental and might disappear.
---
---* Corresponding C source code: [limglib.c#L284-L293](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/limglib.c#L284-L293)
---
---@param image Image|ImageSpec
---@param objnum integer
---
---@return Image
function img.immediatewriteobject(image, objnum) end

_N._11_1_6_node = 0

---
---This function allocates a *PDF* object number and returns a whatsit node of
---subtype `pdf_refximage`, filled with the image parameters `width`,
---`height`, `depth`, and `objnum`. Also here you can do a terse
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
function img.node(image) end

_N._11_1_7_types = 0

---
---@alias ImgType `pdf` | `png` | `jpg` | `jp2` | `jbig2`

---
---This function returns a list with the supported image file type names, currently
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
function img.types() end

_N._11_1_8_boxes = 0

---
---* Corresponding C source code: [luatex-api.h#L534-L540](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/luatex-api.h#L534-L540)
---
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
function img.boxes() end
