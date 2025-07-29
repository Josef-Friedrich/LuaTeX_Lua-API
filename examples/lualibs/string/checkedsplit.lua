require("lualibs")

local theory =
  [[All brontosauruses are thin at one end, much much thicker in the middle, and then thin again at the far end.]]

local theorems = string.checkedsplit(theory, lpeg.P(", ") * lpeg.P("and ") ^ -1)

for n, element in ipairs(theorems) do
  io.write(string.format("Theorem %u: %s\n", n, element))
end
