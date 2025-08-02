local f = io.open("tmp.txt", "w+")
if f then
  print(f)
  f:write("test test test test test test")
  f:close()
end

local f2 = io.open("tmp.txt", "r")
if f2 then
  print(fio.readcardinal1(f2))
  print(fio.readcardinal2(f2))
  print(fio.readcardinal3(f2))
  print(fio.readcardinal4(f2))
  f2:close()
end
