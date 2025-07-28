for byte in string.bytes("abc") do
  print(byte)
end
-- 97
-- 98
-- 99

for byte in string.bytes("äöü") do
  print(byte)
end
-- 195
-- 164
-- 195
-- 182
-- 195
-- 188
