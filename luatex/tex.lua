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
