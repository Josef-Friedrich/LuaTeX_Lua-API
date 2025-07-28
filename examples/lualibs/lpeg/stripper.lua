local str =
  "A dromedary has one hump and a camel has a refreshment car, buffet, and ticket collector."
print(lpeg.stripper("aeiou"):match(str))
print(lpeg.stripper(lpeg.P("camel ")):match(str))
