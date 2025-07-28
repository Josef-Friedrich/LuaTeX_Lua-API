io.savedata("nums.txt", "\001\001\001\001\002\002\002\002\003\003\003\003")

local f = io.open("nums.txt", "r")
if f then
  print(io.readnumber(f, 1))
  print(io.readnumber(f, 5, 1))
  print(io.readnumber(f, 4))
  print(io.readnumber(f, 2))
  f:close()
end
