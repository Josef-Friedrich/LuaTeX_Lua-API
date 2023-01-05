---@meta

---
---# Hashes conform `sha2`
---
---This library is a side effect of the `pdfe` library that needs such
---helpers. The `sha2.digest256`, `sha2.digest384` and
---`sha2.digest512` functions accept a string and return a string with the
---hash.
---

sha2 = {}

function sha2.digest256() end
function sha2.digest384() end
function sha2.digest512() end
