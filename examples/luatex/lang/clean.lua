print(lang.clean("man-u-script")) --  manuscript

local l = lang.new()
lang.hyphenation(l, "man-u-script")
print(lang.clean(l, "manuscript")) --  manuscript
print("Function", lang.hyphenation(l))
