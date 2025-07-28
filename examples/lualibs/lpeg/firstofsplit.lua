local str =
  "menu = spam, spam, spam, spam, spam, baked beans, spam, spam and spam"
print(lpeg.firstofsplit(" = "):match(str))
