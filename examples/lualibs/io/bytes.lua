local f = io.open("./moretext.txt")
if f then
  for char1, char2, char3, char4 in io.bytes(f, 4) do
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
