---@meta

tex = {}

---This creates an error somewhat like the combination of `\errhelp` and
---`\errmessage` would. During this error, deletions are disabled.
---
---In case of an error the `show_context` function will show the current
---context where we're at (in the expansion).
---
---@param s string # An error message like `\errmessage`.
---@param help? string # The array part of the `help` table has to contain strings, one for each line of error help.
function tex.error(s, help) end

---https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-tex.tex#L1161
