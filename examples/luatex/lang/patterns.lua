local l = lang.new()
print(l:patterns())
lang.patterns(l, ".ab3a .abb2 .ab5erk")

print('Function', lang.patterns(l))
print('Method', l:patterns())
