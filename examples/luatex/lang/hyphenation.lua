
local l = lang.new()
print(l:hyphenation())
lang.hyphenation(l, "man-u-script")
l:hyphenation("ca-tas-tro-phe")

print('Function', lang.hyphenation(l))
print('Method', l:hyphenation())
