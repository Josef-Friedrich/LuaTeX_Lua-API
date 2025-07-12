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

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L182-L186](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L182-L186)
---
---@param c Complex
---
---@return Complex c
function xcomplex.abs(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L198-L202](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L198-L202)
---
---@param c Complex
---
---@return number n
function xcomplex.arg(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L240-L243](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L240-L243)
---
---@param c Complex
---
---@return number n
function xcomplex.imag(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L260-L264](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L260-L264)
---
---@param c Complex
---
---@return number n
function xcomplex.real(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L165-L168](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L165-L168)
---
---@param c Complex
---
---@return Complex c
function xcomplex.conj(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L255-L258](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L255-L258)
---
---@param c Complex
---
---@return Complex c
function xcomplex.proj(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L234-L238](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L234-L238)
---
---@param c Complex
---
---@return Complex c
function xcomplex.exp(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L245-L248](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L245-L248)
---
---@param c Complex
---
---@return Complex c
function xcomplex.log(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L276-L279](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L276-L279)
---
---@param c Complex
---
---@return Complex c
function xcomplex.sqrt(c) end
---
---* Corresponding C source code: [lmtxcomplexlib.c#L250-L253](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L250-L253)
---
---@param a Complex
---@param b Complex
---
---@return Complex c
function xcomplex.pow(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L266-L269](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L266-L269)
---
---@param c Complex
---
---@return Complex c
function xcomplex.sin(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L224-L227](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L224-L227)
---
---@param c Complex
---
---@return Complex c
function xcomplex.cos(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L281-L284](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L281-L284)
---
---@param c Complex
---
---@return Complex c
function xcomplex.tan(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L204-L207](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L204-L207)
---
---@param c Complex
---
---@return Complex c
function xcomplex.asin(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L188-L191](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L188-L191)
---
---@param c Complex
---
---@return Complex c
function xcomplex.acos(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L214-L217](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L214-L217)
---
---@param c Complex
---
---@return Complex c
function xcomplex.atan(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L271-L274](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L271-L274)
---
---@param c Complex
---
---@return Complex c
function xcomplex.sinh(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L229-L232](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L229-L232)
---
---@param c Complex
---
---@return Complex c
function xcomplex.cosh(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L286-L289](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L286-L289)
---
---@param c Complex
---
---@return Complex c
function xcomplex.tanh(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L209-L212](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L209-L212)
---
---@param c Complex
---
---@return Complex c
function xcomplex.asinh(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L193-L196](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L193-L196)
---
---@param c Complex
---
---@return Complex c
function xcomplex.acosh(c) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxcomplexlib.c#L219-L222](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxcomplexlib.c#L219-L222)
---
---@param c Complex
---
---@return Complex c
function xcomplex.atanh(c) end
