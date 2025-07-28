print(string.explode("one  two three"))

for _, word in ipairs(string.explode("one  two three")) do
  print(word)
end
-- one
-- two
-- three

for _, word in ipairs(string.explode("one,,two,three", ",")) do
  print(word)
end
-- one
--
-- two
-- three

for _, word in ipairs(string.explode("one,,two,three", ",+")) do
  print(word)
end
-- one
-- two
-- three
