require("busted.runner")()

it("unicode.utf8.byte", function()
  local one, two, three, four = unicode.utf8.byte("Test", 1, 4)
  assert.is.equal(one, 84)
  assert.is.equal(two, 101)
  assert.is.equal(three, 115)
  assert.is.equal(four, 116)

  assert.is.equal(unicode.ascii.byte("Test"), 84)
  assert.is.equal(unicode.latin1.byte("Test"), 84)
  assert.is.equal(unicode.grapheme.byte("Test"), 84)
  assert.is.equal(unicode.utf8.byte("Test"), 84)
end)

it("unicode.xxx.char", function()
  assert.is.equal(unicode.ascii.char(84, 101, 115, 116), "Test")
  assert.is.equal(unicode.latin1.char(84, 101, 115, 116), "Test")
  assert.is.equal(unicode.grapheme.char(84, 101, 115, 116), "Test")
  assert.is.equal(unicode.utf8.char(84, 101, 115, 116), "Test")
end)

it("unicode.xxx.dump", function()
  local f = function()
    return "Test"
  end
  assert.is.equal(type(unicode.ascii.dump(f)), "string")
  assert.is.equal(type(unicode.latin1.dump(f)), "string")
  assert.is.equal(type(unicode.grapheme.dump(f)), "string")
  assert.is.equal(type(unicode.utf8.dump(f)), "string")
end)

it("unicode.xxx.find", function()
  print(unicode.ascii.find("Test", "e", 1, true))
  assert.is.equal(unicode.ascii.find("Test", "e"), "Test")
  assert.is.equal(unicode.latin1.char(84, 101, 115, 116), "Test")
  assert.is.equal(unicode.grapheme.char(84, 101, 115, 116), "Test")
  assert.is.equal(unicode.utf8.char(84, 101, 115, 116), "Test")
end)

-- ---
-- ---Returns a formatted version of its variable number of arguments following the description given in its first argument.
-- ---
-- ---@param s any
-- ---@param ... any
-- ---
-- ---@return string
-- function unicode.utf8.format(s, ...) end

it("unicode.xxx.gfind", function()
  assert.has_error(function()
    unicode.ascii.gfind("test")
  end, "'string.gfind' was renamed to 'string.gmatch'")

  assert.has_error(function()
    unicode.latin1.gfind("test")
  end, "'string.gfind' was renamed to 'string.gmatch'")

  assert.has_error(function()
    unicode.grapheme.gfind("test")
  end, "'string.gfind' was renamed to 'string.gmatch'")

  assert.has_error(function()
    unicode.utf8.gfind("test")
  end, "'string.gfind' was renamed to 'string.gmatch'")
end)

it("unicode.xxx.gmatch", function()
  assert.is.equal(type(unicode.ascii.gmatch("test", "t")), "function")
  assert.is.equal(type(unicode.latin1.gmatch("test", "t")), "function")
  assert.is.equal(type(unicode.grapheme.gmatch("test", "t")), "function")
  assert.is.equal(type(unicode.utf8.gmatch("test", "t")), "function")
end)

it("unicode.xxx.gsub", function()
  assert.is.equal(unicode.ascii.gsub("test", "t", "x", 1), "xest")
  assert.is.equal(unicode.latin1.gsub("test", "t", "x", 1), "xest")
  assert.is.equal(unicode.grapheme.gsub("test", "t", "x", 1), "xest")
  assert.is.equal(unicode.utf8.gsub("test", "t", "x", 1), "xest")
end)

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

it("unicode.xxx.match", function()
  assert.is.equal(unicode.ascii.match("Test", "e", 3), nil)

  assert.is.equal(unicode.ascii.match("Test", "e"), "e")
  assert.is.equal(unicode.latin1.match("Test", "e"), "e")
  assert.is.equal(unicode.grapheme.match("Test", "e"), "e")
  assert.is.equal(unicode.utf8.match("Test", "e"), "e")
end)

it("unicode.xxx.rep", function()
  assert.is.equal(unicode.ascii.rep("a", 3), "aaa")
  assert.is.equal(unicode.latin1.rep("a", 3), "aaa")
  assert.is.equal(unicode.grapheme.rep("a", 3), "aaa")
  assert.is.equal(unicode.utf8.rep("a", 3), "aaa")
end)

-- ---
-- ---Returns a string that is the string `s` reversed.
-- ---
-- ---@param s string
-- ---
-- ---@return string
-- function unicode.utf8.reverse(s) end

it("unicode.xxx.sub", function()
  assert.is.equal(unicode.ascii.sub("Test", 2), "est")

  assert.is.equal(unicode.ascii.sub("Test", 2, 3), "es")
  assert.is.equal(unicode.latin1.sub("Test", 2), "est")
  assert.is.equal(unicode.grapheme.sub("Test", 2), "est")
  assert.is.equal(unicode.utf8.sub("Test", 2), "est")
end)

-- ---
-- ---Returns a copy of this string with all lowercase letters changed to uppercase.
-- ---
-- ---@param s string
-- ---
-- ---@return string
-- function unicode.utf8.upper(s) end

-- return unicode
