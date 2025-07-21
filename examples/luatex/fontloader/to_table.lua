local inspect = require('inspect')

local utils = require('./resources/utils')

for path in utils.list_files_recursively('/usr/share/fonts') do
  local f = fontloader.open(path)
  if f then
    print(path)
    utils.pinspect(fontloader.to_table(f))
  end
end
