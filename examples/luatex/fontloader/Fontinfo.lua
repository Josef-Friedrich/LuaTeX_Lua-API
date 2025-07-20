local utils = require('./resources/utils')

for path in utils.list_files_recursively('/usr/share/fonts') do
  local info = fontloader.info(path)
  if info then
    print(path)
    utils.pinspect(info)
  end
end
