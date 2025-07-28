#! luatex --luaonly

print(os.name)
assert(os.name == "linux")
