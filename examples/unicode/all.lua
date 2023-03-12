require('busted.runner')()

it('unicode.utf8.byte', function()
    local one, two, three, four = unicode.utf8.byte('Test', 1, 4)
    assert.is.equal(one, 84)
    assert.is.equal(two, 101)
    assert.is.equal(three, 115)
    assert.is.equal(four, 116)

    assert.is.equal(unicode.ascii.byte('Test'), 84)
    assert.is.equal(unicode.latin1.byte('Test'), 84)
    assert.is.equal(unicode.grapheme.byte('Test'), 84)
    assert.is.equal(unicode.utf8.byte('Test'), 84)
end)

it('unicode.xxx.char', function()
    assert.is.equal(unicode.ascii.char(84, 101, 115, 116), 'Test')
    assert.is.equal(unicode.latin1.char(84, 101, 115, 116), 'Test')
    assert.is.equal(unicode.grapheme.char(84, 101, 115, 116), 'Test')
    assert.is.equal(unicode.utf8.char(84, 101, 115, 116), 'Test')
end)

it('unicode.xxx.dump', function()
  local f = function() return 'Test' end
  assert.is.equal(type(unicode.ascii.dump(f)), 'string')
  assert.is.equal(type(unicode.latin1.dump(f)), 'string')
  assert.is.equal(type(unicode.grapheme.dump(f)), 'string')
  assert.is.equal(type(unicode.utf8.dump(f)), 'string')
end)

-- ---
-- ---Looks for the first match of pattern in the string.
-- ---
-- ---@param s string
-- ---@param pattern string
-- ---@param init? integer
-- ---@param plain? boolean
-- ---
-- ---@return integer start
-- ---@return integer end
-- ---@return any ... captured
-- function unicode.utf8.find(s, pattern, init, plain) end

-- ---
-- ---Returns a formatted version of its variable number of arguments following the description given in its first argument.
-- ---
-- ---@param s any
-- ---@param ... any
-- ---
-- ---@return string
-- function unicode.utf8.format(s, ...) end

-- function unicode.utf8.gfind() end

-- ---
-- ---Returns an iterator function that, each time it is called, returns the next captures from `pattern` over the string `s`.
-- ---
-- ---@param s string
-- ---@param pattern string
-- ---
-- ---@return fun():string, ...
-- function unicode.utf8.gmatch(s, pattern) end

-- ---
-- ---Returns a copy of `s` in which all (or the first `n`, if given) occurrences of the pattern have been replaced by a replacement string specified by `repl`.
-- ---
-- ---@param s string
-- ---@param pattern string
-- ---@param repl string|number|table|function
-- ---@param n? integer
-- ---
-- ---@return string
-- ---@return integer count
-- function unicode.utf8.gsub(s, pattern, repl, n) end

-- ---
-- ---Returns its length.
-- ---
-- ---@param s string
-- ---
-- ---@return integer
-- function unicode.utf8.len(s) end

-- ---
-- ---Returns a copy of this string with all uppercase letters changed to lowercase.
-- ---
-- ---@param s string
-- ---
-- ---@return string
-- function unicode.utf8.lower(s) end

-- ---
-- ---Looks for the first match of pattern in the string.
-- ---
-- ---@param s string
-- ---@param pattern string
-- ---@param init? integer
-- ---
-- ---@return any ...
-- function unicode.utf8.match(s, pattern, init) end

-- ---
-- ---Returns a string that is the concatenation of `n` copies of the string `s`.
-- ---
-- ---@param s string
-- ---@param n integer
-- ---
-- ---@return string
-- function unicode.utf8.rep(s, n) end

it('unicode.xxx.rep', function()
  assert.is.equal(unicode.ascii.rep('a', 3), 'aaa')
  assert.is.equal(unicode.latin1.rep('a', 3), 'aaa')
  assert.is.equal(unicode.grapheme.rep('a', 3), 'aaa')
  assert.is.equal(unicode.utf8.rep('a', 3), 'aaa')
end)

-- ---
-- ---Returns a string that is the string `s` reversed.
-- ---
-- ---@param s string
-- ---
-- ---@return string
-- function unicode.utf8.reverse(s) end

it('unicode.xxx.sub', function()
  assert.is.equal(unicode.ascii.sub('Test', 2), 'est')

  assert.is.equal(unicode.ascii.sub('Test', 2, 3), 'es')
  assert.is.equal(unicode.latin1.sub('Test', 2), 'est')
  assert.is.equal(unicode.grapheme.sub('Test', 2), 'est')
  assert.is.equal(unicode.utf8.sub('Test', 2), 'est')
end)

-- ---
-- ---Returns a copy of this string with all lowercase letters changed to uppercase.
-- ---
-- ---@param s string
-- ---
-- ---@return string
-- function unicode.utf8.upper(s) end

-- return unicode
