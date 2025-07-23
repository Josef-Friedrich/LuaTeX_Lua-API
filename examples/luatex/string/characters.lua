for character in string.characters('abc') do
  print(character)
end
-- a
-- b
-- c

for character in string.characters('äöü') do
  print(character)
end
-- �
-- �
-- �
-- �
-- �
-- �
