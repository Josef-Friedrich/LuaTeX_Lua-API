local l = lang.new()
print(l:hyphenation()) -- nil
l:hyphenation("man-u-script")
l:hyphenation("ca-tas-tro-phe")
print(l:hyphenation()) --  man-u-script ca-tas-tro-phe
l:clear_hyphenation()
print(l:hyphenation()) -- nil
