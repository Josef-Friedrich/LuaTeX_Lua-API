---This file is intended as a library for the various example files.
local inspect = require('inspect')

---Print the inspected version of the value
local function pinspect(value) print(inspect(value)) end

---
---@param names string[]
local function convert_string_array_to_alias_union(names)
    for index, name in ipairs(names) do print('---|`' .. name .. '`') end
end

---
---Returns the file extension from a given file path.
---
---@param path string: The file path to extract the extension from.
---
---@return string|nil: The file extension (including the dot), or nil if no extension is found.
local function get_file_extension(path) return path:match("^.+(%..+)$") end

---
---https://stackoverflow.com/a/49405922
---
---@param path string The path of a directory
---
---@return fun(...): string, LuaFileSystem.Attributes
local function list_files_recursively(path)
    assert(path and path ~= "", "Please pass directory parameter")
    if string.sub(path, -1) == "/" then path = string.sub(path, 1, -2) end

    ---
    ---@param dir string
    local function yieldtree(dir)
        for entry in lfs.dir(dir) do
            if entry ~= "." and entry ~= ".." then
                entry = dir .. "/" .. entry
                local attr = lfs.attributes(entry)
                coroutine.yield(entry, attr)
                if attr.mode == "directory" then yieldtree(entry) end
            end
        end
    end

    return coroutine.wrap(function() yieldtree(path) end)
end

return {
    pinspect = pinspect,
    convert_string_array_to_alias_union = convert_string_array_to_alias_union,
    list_files_recursively = list_files_recursively,
    get_file_extension = get_file_extension
}
