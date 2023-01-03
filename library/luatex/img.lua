---@meta
img = {}

---@class Image

---
---@param image_spec? table
---
---@return Image
function img.new(image_spec) end

---
---@return ImageSpec keys
function img.fields() end

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

---
---@param image Image|table
---
---@return Image
function img.scan(image) end

---
---@param image Image|table
---
---@return Image
function img.copy(image) end

---
---@param image Image|table
---
---@return Image
function img.write(image) end

---
---@param image Image|table
---
---@return Image
function img.immediatewrite(image) end

---
---@param image Image|table
---@param objnum integer
---
---@return Image
function img.immediatewriteobject(image, objnum) end

---
---@param image Image|table
---
---@return Node
function img.node(image) end

---
---@return table
function img.types() end

---
---@return table
function img.boxes() end
