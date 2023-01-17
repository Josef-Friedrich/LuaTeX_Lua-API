---@meta

---The `texio` library takes care of the low-level I/O interface: writing to the log file
---and/or console.
texio = {}

---
---Write all given strings to a target.
---
---@param target 'term'|'log'|'term and log' # The optional `target` can be one of three possibilities: `term`, `log` or `term and log`.
---@param ... string
function texio.write(target, ...) end

---
---Write all given strings to the same
---location(s) *TeX* writes messages to at this moment.If `batchmode` is in
---effect, it writes only to the log, otherwise it writes to the log and the
---terminal.
---
---@param ... string
function texio.write(...) end

---
---Write all given strings to a target.
---
---It makes sure that the given
---strings will appear at the beginning of a new line.
---
---@param target 'term'|'log'|'term and log' # The optional `target` can be one of three possibilities: `term`, `log` or `term and log`.
---@param ... string
function texio.write_nl(target, ...) end

---
---Write all given strings to the same
---location(s) *TeX* writes messages to at this moment. It makes sure that the given
---strings will appear at the beginning of a new line.
---
---Note: If several strings are given, and if the first of these strings is or might
---be one of the targets above, the `target` must be specified explicitly to
---prevent *Lua* from interpreting the first string as the target.
---@param ... string
function texio.write_nl(...) end

---
---Disable `^^` escaping of control characters.
---
---@param escape_controls boolean
function texio.setescape(escape_controls) end

---
---Force a jump back to *TeX*.
---
---This function that should be used with care. It acts as `endinput` but at
---the *Lua* end. Normally a
---*Lua* will just collect prints and at the end bump an input level and flush these
---prints. This function can help you stay at the current level but you need to know
---what you're doing (or more precise: what *TeX* is doing with input).
function texio.closeinput() end
