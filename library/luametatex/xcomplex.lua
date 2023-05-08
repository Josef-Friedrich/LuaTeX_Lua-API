---@meta
---https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c
---https://web.tecgraf.puc-rio.br/~lhf/ftp/lua/ar/lcomplex-100.tar.gz
---https://luarocks.org/modules/edubart/lcomplex
xcomplex = {}

---
---@alias Complex userdata

---
---@param r number
---@param i number
---
---@return Complex
function xcomplex.new(r, i) end

---
---@param c Complex
---
---@return string
function xcomplex.tostring(c) end

---
---@param c Complex
---
---@return number r
---@return number i
function xcomplex.topair(c) end

---
---@param c Complex
---
---@return table
function xcomplex.totable(c) end
function xcomplex.i() end

function xcomplex.abs() end
function xcomplex.arg() end
function xcomplex.imag() end
function xcomplex.real() end
function xcomplex.onj() end
function xcomplex.proj() end
function xcomplex.exp() end
function xcomplex.log() end
function xcomplex.sqrt() end
function xcomplex.pow() end
function xcomplex.sin() end
function xcomplex.cos() end
function xcomplex.tan() end
function xcomplex.asin() end
function xcomplex.acos() end
function xcomplex.atan() end
function xcomplex.sinh() end
function xcomplex.cosh() end
function xcomplex.tanh() end
function xcomplex.asinh() end
function xcomplex.acosh() end
function xcomplex.atanh() end
