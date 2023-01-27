---@meta
---`lpeg`, by Roberto Ierusalimschy, http://www.inf.puc-rio.br/ roberto/lpeg/lpeg.html. This library is not
---*Unicode*-aware, but interprets strings on a byte-per-byte basis. This
---mainly means that `lpeg.S` cannot be used with *UTF-8* characters encoded
---in more than two bytes, and thus `lpeg.S` will look for one of those
---two bytes when matching, not the combination of the two. The same is true for
---`lpeg.R`, although the latter will display an error message if used
---with multibyte characters. Therefore `lpeg.R('aä')` results in the
---message `bad argument #1 to 'R' (range must have two characters)`,
---since to `lpeg`, `ä` is two 'characters' (bytes), so `aä`
---totals three. In practice this is no real issue and with some care you can
---deal with *Unicode* just fine.
---http://www.inf.puc-rio.br/~roberto/lpeg/
---http://stevedonovan.github.io/lua-stdlibs/modules/lpeg.html
lpeg = {}

---@alias Pattern userdata

---@class Capture

---
---The matching function.
---It attempts to match the given pattern against the subject string.
---If the match succeeds,
---returns the index in the subject of the first character after the match,
---or the captured values
---(if the pattern captured any value).
---
---An optional numeric argument `init` makes the match
---start at that position in the subject string.
---As usual in Lua libraries,
---a negative value counts from the end.
---
---Unlike typical pattern-matching functions,
---`match` works only in anchoredmode;
---that is, it tries to match the pattern with a prefix of
---the given subject string (at position `init`),
---not with an arbitrary substring of the subject.
---So, if we want to find a pattern anywhere in a string,
---we must either write a loop in Lua or write a pattern that
---matches anywhere.
---This second approach is easy and quite efficient;
---see examples.
---@param pattern Pattern
---@param subject string
---@param init? integer
---
---@return integer|Capture
function lpeg.match(pattern, subject, init) end

---
---If the given value is a pattern,
---returns the string `"pattern"`.
---Otherwise returns nil.
---
---@return nil|string
function lpeg.type(value) end

---
---Returns a string with the running version of LPeg.
---
---@return string
function lpeg.version() end

---
---Sets a limit for the size of the backtrack stack used by LPeg to
---track calls and choices.
---(The default limit is 400.)
---Most well-written patterns need little backtrack levels and
---therefore you seldom need to change this limit;
---before changing it you should try to rewrite your
---pattern to avoid the need for extra space.
---Nevertheless, a few useful patterns may overflow.
---Also, with recursive grammars,
---subjects with deep recursion may also need larger limits.
---
---@param max integer
function lpeg.setmaxstack(max) end

---
---Converts the given value into a proper pattern,
---according to the following rules:
---
---* If the argument is a pattern,
---it is returned unmodified.
---
---* If the argument is a string,
---it is translated to a pattern that matches the string literally.
---
---* If the argument is a non-negative number n,
---the result is a pattern that matches exactly n characters.
---
---* If the argument is a negative number -n,
---the result is a pattern that
---succeeds only if the input string has less than ncharacters left:
---`lpeg.P(-n)`
---is equivalent to `-lpeg.P(n)`
---(see the  unary minus operation).
---
---* If the argument is a boolean,
---the result is a pattern that always succeeds or always fails
---(according to the boolean value),
---without consuming any input.
---
---* If the argument is a table,
---it is interpreted as a grammar
---(see Grammars).
---
---* If the argument is a function,
---returns a pattern equivalent to a
---match-time captureover the empty string.
---@param value Pattern|string|integer|boolean|table|function
---
---@return Pattern
function lpeg.P(value) end

---
---Returns a pattern that
---matches only if the input string at the current position
---is preceded by `patt`.
---Pattern `patt` must match only strings
---with some fixed length,
---and it cannot contain captures.
---
---Like the and predicate,
---this pattern never consumes any input,
---independently of success or failure.
---
---@param pattern Pattern
---
---@return integer|Capture
function lpeg.B(pattern) end

---
---Returns a pattern that matches any single character
---belonging to one of the given ranges.
---Each `range` is a string `xy` of length 2,
---representing all characters with code
---between the codes of `x` and `y`
---(both inclusive).
---
---As an example, the pattern
---`lpeg.R("09")` matches any digit,
---and `lpeg.R("az", "AZ")` matches any ASCII letter.
---
---@param ... string
---
---@return Pattern
function lpeg.R(...) end

---
---Returns a pattern that matches any single character that
---appears in the given string.
---(The `S` stands for Set.)
---
---As an example, the pattern
---`lpeg.S("+-*/")` matches any arithmetic operator.
---
---Note that, if `s` is a character
---(that is, a string of length 1),
---then `lpeg.P(s)` is equivalent to `lpeg.S(s)`
---which is equivalent to `lpeg.R(s..s)`.
---Note also that both `lpeg.S("")` and `lpeg.R()`
---are patterns that always fail.
---
---@param string string
---
---@return Pattern
function lpeg.S(string) end

---
---This operation creates a non-terminal (a variable)
---for a grammar.
---The created non-terminal refers to the rule indexed by `v`
---in the enclosing grammar.
---@param v string
---
---@return Pattern
function lpeg.V(v) end

---@class Locale
---@field alnum userdata
---@field alpha userdata
---@field cntrl userdata
---@field digit userdata
---@field graph userdata
---@field lower userdata
---@field print userdata
---@field punct userdata
---@field space userdata
---@field upper userdata
---@field xdigit userdata

---Returns a table with patterns for matching some character classes
---according to the current locale.
---The table has fields named
---`alnum`,
---`alpha`,
---`cntrl`,
---`digit`,
---`graph`,
---`lower`,
---`print`,
---`punct`,
---`space`,
---`upper`, and
---`xdigit`,
---each one containing a correspondent pattern.
---Each pattern matches any single character that belongs to its class.
--
---If called with an argument `table`,
---then it creates those fields inside the given table and
---returns that table.
---@param tab? table
---
---@return Locale
function lpeg.locale(tab) end

---  the match for `patt` plus all captures
---      made by `patt`
---@param patt Pattern
---
---@return string
function lpeg.C(patt) end

---    the value of the nth extra argument to
---        `lpeg.match` (matches the empty string)
---@param n integer
---
---@return string
function lpeg.Carg(n) end

---
---    the values produced by the previous
---        group capture named `name`
---        (matches the empty string)
function lpeg.Cb(name) end

---
---the given values (matches the empty string)
function lpeg.Cc(values) end

---
---a folding of the captures from `patt`
---
---Creates a fold capture.
---If `patt` produces a list of captures
---C1 C2 ... Cn,
---this capture will produce the value
---`func(...func(func(C1, C2), C3)...,Cn)`,
---that is, it will fold
---(or accumulate, or reduce)
---the captures from `patt` using function `func`.
---
---This capture assumes that `patt` should produce
---at least one capture with at least one value (of any type),
---which becomes the initial value of an accumulator.
---(If you need a specific initial value,
---you may prefix a constant captureto `patt`.)
---For each subsequent capture,
---LPeg calls `func`
---with this accumulator as the first argument and all values produced
---by the capture as extra arguments;
---the first result from this call
---becomes the new value for the accumulator.
---The final value of the accumulator becomes the captured value.
---
---
---
---__Example:__
---
---```lua
----- matches a numeral and captures its numerical value
---number = lpeg.R"09"^1 / tonumber
---
----- matches a list of numbers, capturing their values
---list = number * ("," * number)^0
---
----- auxiliary function to add two numbers
---function add (acc, newvalue) return acc + newvalue end
---
----- folds the list of numbers adding them
---sum = lpeg.Cf(list, add)
---
----- example of use
---print(sum:match("10,30,43"))   --> 83
---```
---
---@param patt Pattern
---@param func fun(acc, newvalue)
function lpeg.Cf(patt, func) end

---    the values produced by `patt`,
---        optionally tagged with `name`
---@param patt Pattern
---@param name string
function lpeg.Cg(patt, name) end

---
---the returns of `function` applied to the captures
---      of `patt`; the application is done at match time
---@param patt Pattern
---@param fn function
function lpeg.Cmt(patt, fn) end

---
---the current position (matches the empty string)
function lpeg.Cp() end

---
---the match for `patt`
---      with the values from nested captures replacing their matches
---@param patt Pattern
function lpeg.Cs(patt) end

---
---a table with all captures from `patt`
---@param patt Pattern
function lpeg.Ct(patt) end
