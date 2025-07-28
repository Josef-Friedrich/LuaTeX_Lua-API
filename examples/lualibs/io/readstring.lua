local f = io.open("text.txt", "r")
local str = io.readstring(f, 5, 3)
print(str)
if f then
  f:close()
end
