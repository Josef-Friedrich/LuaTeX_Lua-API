local text = "Some Text."

text = text:gsub(".\n", "") .. " and again " .. text:lower()
io.savedata("./moretext.txt", text)
os.execute("cat ./moretext.txt")

local sometable = { "spam", "spam", "spam", "baked beans", "spam" }
io.savedata("./moretext.txt", sometable, ",")
os.execute("cat ./moretext.txt && echo '\n'")

local function weird_write(obj)
  for i = 1, 10 do
    if i % 2 == 0 then
      obj:write("But cool. ")
    else
      obj:write("Weird. ")
    end
  end
  obj:write("\n")
end

io.savedata("./weirdtext.txt", weird_write)
os.execute("cat ./weirdtext.txt")
