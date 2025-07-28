local str = [[
Number twenty-three. The shin.
Number twenty-four. Reginald Maudling's shin.
Number twenty-five. The brain.
Number twenty-six. Magaret Thatcher's brain.
Number twenty-seven. More naughty bits.
]]

local t = { lpeg.splitat("Number", false):match(str) }
for n, element in pairs(t) do
  element = element == "" and element .. "\n" or element
  io.write(n .. ": " .. element)
end
