local f = io.popen("cat ./moretext.txt")
if f then
  for char1, char2 in io.characters(f, 2) do
    io.write(string.format("“%s”, “%s”\n", char1, char2 or ""))
  end
  f:close()
end

f = io.open("./moretext.txt")
if f then
  for char1, char2, char3, char4 in io.characters(f, -4) do
    io.write(
      string.format(
        "1: “%s”, 2: “%s”, 3: “%s”, 4: “%s”\n",
        char1,
        char2 or "",
        char3 or "",
        char4 or ""
      )
    )
  end
  f:close()
end
