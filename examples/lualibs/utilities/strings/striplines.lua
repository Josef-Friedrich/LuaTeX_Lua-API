require("lualibs")

-- The "aap, noot, mies" reading boards were used in the Netherlands for
-- a long time (from many years before WWII till the late 1960's) as the
-- main tool for teaching students in the first year of primary school
-- the main vowels and consonants of the Dutch Language. The reading
-- boards were used in combination with reading books containing the Zus
-- & Jet stories.

local str = table.concat({
  "  ",
  "    aap",
  "  noot mies",
  "  ",
  "    ",
  " zus    wim jet",
  "zus    wim jet",
  "       zus    wim jet",
  "    ",
}, "\n")

for k, v in table.sortedhash(utilities.strings.striplinepatterns) do
  print(
    "\n__`" .. k .. "`:__\n\n",
    "\n```\n" .. utilities.strings.striplines(str, k) .. "\n```"
  )
end
