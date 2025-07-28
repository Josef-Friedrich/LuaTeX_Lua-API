local f = io.popen("dmesg")
if f then
  local infolength = io.noflines(f)
  f:close()
  print("There's " .. infolength .. " lines in the kernel ring buffer.")
end
