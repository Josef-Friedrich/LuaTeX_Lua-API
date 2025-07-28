local f = io.open("./text.txt", "w")
if f then
  f:write("Some Text.")
  f:close()
end

local text = io.loaddata("./text.txt")
io.write(text)
