for c1, c2 in string.characterpairs("äöü") do
  print(c1, c2)
  print(c1 .. c2)
end
-- �	�
-- ä
-- �	�
-- ö
-- �	�
-- ü

for c1, c2 in string.characterpairs("a") do
  print("'" .. c1 .. "'", "'" .. c2 .. "'")
end
-- 'a'	''
