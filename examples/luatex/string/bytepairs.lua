for b1, b2 in string.bytepairs("abc") do
  print(b1, b2)
end
-- 97	98
-- 99	nil

for b1, b2 in string.bytepairs("äöü") do
  print(b1, b2)
end
-- 195	164
-- 195	182
-- 195	188
