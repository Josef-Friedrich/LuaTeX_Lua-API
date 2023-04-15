---@meta

---
---https://luarocks.org/modules/ignacio/lmathx

---
---https://github.com/LuaDist/lmathx
xmath = {}

---
---Compute the principal value of the arc cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L26-L30](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L26-L30)
---* cppreference.com: [numeric/math/acos](https://en.cppreference.com/w/c/numeric/math/acos)
---
---@param a number
---
---@return number
function xmath.acos(a) end

---
---Compute the inverse hyperbolic cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L32-L36](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L32-L36)
---* cppreference.com: [numeric/math/acosh](https://en.cppreference.com/w/c/numeric/math/acosh)
---
---@param a number
---
---@return number
function xmath.acosh(a) end

---
---Compute the principal values of the arc sine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L38-L42](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L38-L42)
---* cppreference.com: [numeric/math/asin](https://en.cppreference.com/w/c/numeric/math/asin)
---
---@param a number
---
---@return number
function xmath.asin(a) end

---
---Compute the inverse hyperbolic sine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L44-L48](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L44-L48)
---* cppreference.com: [numeric/math/asinh](https://en.cppreference.com/w/c/numeric/math/asinh)
---
---@param a number
---
---@return number
function xmath.asinh(a) end

---
---Compute the principal value of the arc tangent of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L50-L58](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L50-L58)
---* cppreference.com: [numeric/math/atan](https://en.cppreference.com/w/c/numeric/math/atan)
---
---@see xmath.atan2
---
---@param a number
---@param b? number # If the value is given, then the function `xmath.atan2` is calculated.
---
---@return number
function xmath.atan(a, b) end

---
---Compute the arc tangent of `a / b` using the signs of arguments to determine the correct quadrant.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L60-L64](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L60-L64)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/atan2)
---
---@param a number
---@param b number
---
---@return number
function xmath.atan2(a, b) end

---
---Compute the inverse hyperbolic tangent of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L66-L70](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L66-L70)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/atanh)
---
---@param a number
---
---@return number
function xmath.atanh(a) end

---
---Compute the cube root of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L72-L76](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L72-L76)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cbrt)
---
---@param a number
---
---@return number
function xmath.cbrt(a) end

---
---Compute the smallest integer value not less than `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L78-L82](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L78-L82)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/ceil)
---
---@param a number
---
---@return number
function xmath.ceil(a) end

---
---Compose a floating point value with the magnitude of `a` and the sign of `b`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L84-L88](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L84-L88)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/copysign)
---
---@param a number
---@param b number
---
---@return number
function xmath.copysign(a, b) end

---
---Compute the cosine of `a` (measured in radians).
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L90-L94](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L90-L94)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cos)
---
---@param a number
---
---@return number
function xmath.cos(a) end

---
---Compute the hyperbolic cosine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L96-L100](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L96-L100)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/cosh)
---
---@param a number
---
---@return number
function xmath.cosh(a) end

---
---Compute the degrees (`a * (180 / pi)`).
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L102-L106](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L102-L106)
---
---@param a number # radians
---
---@return number # degrees
function xmath.deg(a) end

---
---Compute the error function of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L108-L112](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L108-L112)
---* cppreference.com: [numeric/math/erf](https://en.cppreference.com/w/c/numeric/math/erf)
---
---@param a number
---
---@return number
function xmath.erf(a) end

---
---Compute the complementary error function of `a`, that is `1.0 - erf(a)`, but without loss of precision for large `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L114-L118](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L114-L118)
---* cppreference.com: [numeric/math/erfc](https://en.cppreference.com/w/c/numeric/math/erfc)
---
---@param a number
---
---@return number
function xmath.erfc(a) end

---
---Computes the `e` (Euler's number, `2.7182818`) raised to the given power `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L120-L124](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L120-L124)
---* cppreference.com: [numeric/math/exp](https://en.cppreference.com/w/c/numeric/math/exp)
---
---@param a number
---
---@return number
function xmath.exp(a) end

---
---Compute `2` raised to the given power `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L126-L130](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L126-L130)
---* cppreference.com: [numeric/math/exp2](https://en.cppreference.com/w/c/numeric/math/exp2)
---
---@param a number
---
---@return number
function xmath.exp2(a) end

---
---Compute the `e` (Euler's number, `2.7182818`) raised to the given power `a`, minus `1.0`.
---
---This function is more accurate than the expression `exp(arg)-1.0` if `a` is close to zero.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L132-L136](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L132-L136)
---* cppreference.com: [numeric/math/expm1](https://en.cppreference.com/w/c/numeric/math/expm1)
---
---@param a number
---
---@return number
function xmath.expm1(a) end

---
---Compute the absolute value of a value `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L138-L142](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L138-L142)
---* cppreference.com: [numeric/math/fabs](https://en.cppreference.com/w/c/numeric/math/fabs)
---
---@param a number
---
---@return number
function xmath.fabs(a) end

---
---Return the positive difference between `a` and `b`, that is, if `a > b`, returns `a - b`, otherwise (if `a <= b`), returns `+0`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L144-L148](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L144-L148)
---* cppreference.com: [numeric/math/fdim](https://en.cppreference.com/w/c/numeric/math/fdim)
---
---@param a number
---
---@return number
function xmath.fdim(a, b) end

---
---Compute the largest integer value not greater than `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L150-L154](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L150-L154)
---* cppreference.com: [numeric/math/floor](https://en.cppreference.com/w/c/numeric/math/floor)
---
---@param a number
---
---@return number
function xmath.floor(a) end

---
---Compute `(a*b) + c` as if to infinite precision and rounded only once to fit the result type.
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L156-L160](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L156-L160)
---* cppreference.com: [numeric/math/fma](https://en.cppreference.com/w/c/numeric/math/fma)
---
---@param a number
---@param b number
---@param c number
---
---@return number
function xmath.fma(a, b, c) end

---
--- Return the larger of the numbers.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L162-L171](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L162-L171)
---* cppreference.com: [numeric/math/fmax](https://en.cppreference.com/w/c/numeric/math/fmax)
---
---@param ... number
---
---@return number
function xmath.fmax(...) end

---
---Return the smaller of the numbers.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L173-L182](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L173-L182)
---* cppreference.com: [numeric/math/fmin](https://en.cppreference.com/w/c/numeric/math/fmin)
---
---@param ... number
---
---@return number
function xmath.fmin(...) end

---
---Compute the floating-point remainder of the division operation `a / b`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L184-L188](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L184-L188)
---* cppreference.com: [numeric/math/fmod](https://en.cppreference.com/w/c/numeric/math/fmod)
---
---@param a number
---@param b number
---
---@return number
function xmath.fmod(a, b) end

---
---Decompose given value `a` into a normalized fraction and an integral power of two.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L190-L196](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L190-L196)
---* cppreference.com: [numeric/math/frexp](https://en.cppreference.com/w/c/numeric/math/frexp)
---
---@param a number
---
---@return number
---@return integer e
function xmath.frexp(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L205-L209](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L205-L209)
---
---@param a number
---
---@return number
function xmath.gamma(a) end

---
---Compute the square root of the sum of the squares of `a` and `b`, without undue overflow or underflow at intermediate stages of the computation.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L211-L215](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L211-L215)
---* cppreference.com: [numeric/math/hypot](https://en.cppreference.com/w/c/numeric/math/hypot)
---
---@param a number
---
---@return number
function xmath.hypot(a, b) end

---
---Determine if the given  number `a` has finite value i.e. it is normal, subnormal or zero, but not infinite or NaN.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L217-L221](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L217-L221)
---* cppreference.com: [numeric/math/isfinite](https://en.cppreference.com/w/c/numeric/math/isfinite)
---
---@param a number
---
---@return number
function xmath.isfinite(a) end

---
---Determines if the given number `a` is positive or negative infinity.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L223-L227](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L223-L227)
---* cppreference.com: [numeric/math/isinf](https://en.cppreference.com/w/c/numeric/math/isinf)
---
---@param a number
---
---@return number
function xmath.isinf(a) end

---
---Determine if the given number `a` is a not-a-number (NaN) value.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L229-L233](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L229-L233)
---* cppreference.com: [numeric/math/isnan](https://en.cppreference.com/w/c/numeric/math/isnan)
---
---@param a number
---
---@return number
function xmath.isnan(a) end

---
---Determine if the given number `a` is normal, i.e. is neither zero, subnormal, infinite, nor NaN.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L235-L239](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L235-L239)
---* cppreference.com: [numeric/math/isnormal](https://en.cppreference.com/w/c/numeric/math/isnormal)
---
---@param a number
---
---@return number
function xmath.isnormal(a) end

---
---Multiplies a floating point value `a` by the number `2` raised to the `b` power.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L259-L263](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L259-L263)
---* cppreference.com: [numeric/math/ldexp](https://en.cppreference.com/w/c/numeric/math/ldexp)
---
---@param a number
---
---@return number
function xmath.ldexp(a, b) end

---
---Compute the natural logarithm of the absolute value of the gamma function of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L265-L269](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L265-L269)
---* cppreference.com: [numeric/math/lgamma](https://en.cppreference.com/w/c/numeric/math/lgamma)
---
---@param a number
---
---@return number
function xmath.lgamma(a) end

---
---Compute the natural (base `e`) logarithm of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L271-L287](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L271-L287)
---* cppreference.com: [numeric/math/log](https://en.cppreference.com/w/c/numeric/math/log)
---
---@param a number
---@param b number
---
---@return number
function xmath.log(a, b) end

---
---Compute the common (base-10) logarithm of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L289-L293](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L289-L293)
---* cppreference.com: [numeric/math/log10](https://en.cppreference.com/w/c/numeric/math/log10)
---
---@param a number
---
---@return number
function xmath.log10(a) end

---
---Compute the natural (base `e`) logarithm of `1+arg`. This function is more precise than the expression `log(1+a)` if `a` is close to zero.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L295-L299](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L295-L299)
---* cppreference.com: [numeric/math/log1p](https://en.cppreference.com/w/c/numeric/math/log1p)
---
---@param a number
---
---@return number
function xmath.log1p(a) end

---
--- Compute the base `2` logarithm of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L301-L305](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L301-L305)
---* cppreference.com: [numeric/math/log2](https://en.cppreference.com/w/c/numeric/math/log2)
---
---@param a number
---
---@return number
function xmath.log2(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L307-L311](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L307-L311)
---* cppreference.com: [numeric/math/logb](https://en.cppreference.com/w/c/numeric/math/logb)
---
---@param a number
---
---@return number
function xmath.logb(a) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L313-L320](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L313-L320)
---* cppreference.com: [numeric/math/modf](https://en.cppreference.com/w/c/numeric/math/modf)
---
---@param a number
---
---@return number
function xmath.modf(a, b) end

---
---Rounds the floating-point argument `a` to an integer value in floating-point format, using the current rounding mode.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L322-L326](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L322-L326)
---* cppreference.com: [numeric/math/nearbyint](https://en.cppreference.com/w/c/numeric/math/nearbyint)
---
---@param a number
---
---@return number
function xmath.nearbyint(a) end

---
---First, convert both arguments to the type of the function, then return the next representable value of from in the direction of to. If from equals to to, to is returned.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L328-L332](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L328-L332)
---* cppreference.com: [numeric/math/nextafter](https://en.cppreference.com/w/c/numeric/math/nextafter)
---
---@param a number
---@param b number
---
---@return number
function xmath.nextafter(a, b) end

---
---Compute the value of base raised to the power exponent.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L334-L338](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L334-L338)
---* cppreference.com: [numeric/math/pow](https://en.cppreference.com/w/c/numeric/math/pow)
---
---@param a number
---@param b number
---
---@return number
function xmath.pow(a, b) end

---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L340-L344](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L340-L344)
---
---@param a number
---
---@return number
function xmath.rad(a) end

---
---Computes the IEEE remainder of the floating point division operation `a/b`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L346-L350](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L346-L350)
---* cppreference.com: [numeric/math/remainder](https://en.cppreference.com/w/c/numeric/math/remainder)
---
---@param a number
---@param b number
---
---@return number
function xmath.remainder(a, b) end

---
---Compute the floating-point remainder of the division operation `a/b` as the remainder() function does.
---
---Additionally, the sign and at least the three of the last bits of `a/b` will be returned in `quo`, sufficient to determine the octant of the result within a period.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L197-L203](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L197-L203)
---* cppreference.com: [numeric/math/remquo](https://en.cppreference.com/w/c/numeric/math/remquo)
---* [man3/remquo](https://man7.org/linux/man-pages/man3/remquo.3.html)
---
---@see xmath.remainder
---
---@param a number
---@param b number
---
---@return number
---@return integer quo
function xmath.remquo(a, b) end

---
---Computes the nearest integer value to `a`, rounding halfway cases away from zero.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L352-L356](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L352-L356)
---* cppreference.com: [numeric/math/round](https://en.cppreference.com/w/c/numeric/math/round)
---
---@param a number
---
---@return number
function xmath.round(a) end

---
---Multiplies `a` by `FLT_RADIX` (probably 2) raised to power `b`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L358-L362](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L358-L362)
---* cppreference.com: [numeric/math/scalbn](https://en.cppreference.com/w/c/numeric/math/scalbn)
---
---@param a number
---@param b integer
---
---@return number
function xmath.scalbn(a, b) end

---
---Compute the sine of `a` (measured in radians).
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L364-L368](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L364-L368)
---* cppreference.com: [numeric/math/sin](https://en.cppreference.com/w/c/numeric/math/sin)
---
---@param a number
---
---@return number
function xmath.sin(a) end

---
---Compute the hyperbolic sine of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L370-L374](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L370-L374)
---* cppreference.com: [numeric/math/sinh](https://en.cppreference.com/w/c/numeric/math/sinh)
---
---@param a number
---
---@return number
function xmath.sinh(a) end

---
---Compute the square root of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L376-L380](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L376-L380)
---* cppreference.com: [numeric/math/sqrt](https://en.cppreference.com/w/c/numeric/math/sqrt)
---
---@param a number
---
---@return number
function xmath.sqrt(a) end

---
---Compute the tangent of `a` (measured in radians).
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L382-L386](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L382-L386)
---* cppreference.com: [numeric/math/tan](https://en.cppreference.com/w/c/numeric/math/tan)
---
---@param a number
---
---@return number
function xmath.tan(a) end

---
---Compute the hyperbolic tangent of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L388-L392](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L388-L392)
---* cppreference.com: [numeric/math/tanh](https://en.cppreference.com/w/c/numeric/math/tanh)
---
---@param a number
---
---@return number
function xmath.tanh(a) end

---
---Compute the gamma function of `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L394-L398](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L394-L398)
---* cppreference.com: [numeric/math/tgamma](https://en.cppreference.com/w/c/numeric/math/tgamma)
---
---@param a number
---
---@return number
function xmath.tgamma(a) end

---
---Compute the nearest integer not greater in magnitude than `a`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L400-L404](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L400-L404)
---* cppreference.com: [numeric/math/trunc](https://en.cppreference.com/w/c/numeric/math/trunc)
---
---@param a number
---
---@return number
function xmath.trunc(a) end

---
---Return the Bessel functions of `a` of the *first* kind of orders `0`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L241-L245](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L241-L245)
---* [man3/j0.3](https://man7.org/linux/man-pages/man3/j0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param a number
---
---@return number
function xmath.j0(a) end

---
---Return the Bessel functions of `a` of the *first* kind of orders `1`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L247-L251](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L247-L251)
---* [man3/j0.3](https://man7.org/linux/man-pages/man3/j0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param a number
---
---@return number
function xmath.j1(a) end

---
---Return the Bessel function of `a` of the *first* kind of order `n`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L253-L257](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L253-L257)
---* [man3/j0.3](https://man7.org/linux/man-pages/man3/j0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param n integer
---@param a number
---
---@return number
function xmath.jn(n, a) end

---
---Return the Bessel functions of `a` of the *second* kind of orders `0`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L406-L410](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L406-L410)
---* [man3/y0.3](https://man7.org/linux/man-pages/man3/y0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param a number
---
---@return number
function xmath.y0(a) end

---
---Return the Bessel functions of `a` of the *second* kind of orders `1`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L412-L416](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L412-L416)
---* cppreference.com: [numeric/math/atan2](https://en.cppreference.com/w/c/numeric/math/)
---* [man3/y0.3](https://man7.org/linux/man-pages/man3/y0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param a number
---
---@return number
function xmath.y1(a) end

---
---Return the Bessel function of `a` of the *second* kind of order `n`.
---
---__Reference:__
---
---* Corresponding C source code: [lmtxmathlib.c#L418-L422](https://github.com/contextgarden/luametatex/blob/812e28feca3cf5de5f41a7fb3ebf25e4a4b2ae00/source/luarest/lmtxmathlib.c#L418-L422)
---* [man3/y0.3](https://man7.org/linux/man-pages/man3/y0.3.html)
---* [Wikipedia: Bessel function](https://en.wikipedia.org/wiki/Bessel_function)
---
---@param n number
---@param a integer
---
---@return number
function xmath.yn(n, a) end
