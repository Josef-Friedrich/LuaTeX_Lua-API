local l = lang.new()
print(lang.hyphenation(l)) -- nil
lang.hyphenation(l, "man-u-script")
lang.hyphenation(l, "ca-tas-tro-phe")
print(lang.hyphenation(l)) --  man-u-script ca-tas-tro-phe
lang.clear_hyphenation(l)
print(lang.hyphenation(l)) -- nil
