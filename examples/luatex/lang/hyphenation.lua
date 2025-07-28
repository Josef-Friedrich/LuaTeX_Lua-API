local l = lang.new()
print(l:hyphenation())
lang.hyphenation(l, "man-u-script")
print(l:hyphenation())
l:hyphenation("ca-tas-tro-phe")
print(l:hyphenation())

print("Function", lang.hyphenation(l))
print("Method", l:hyphenation())
