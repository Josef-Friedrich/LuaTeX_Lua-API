local preamble = [[
input %s ; dump ;
]]

local metapost = {}

metapost.make = function(name, mem_name)
  local mpx = mplib.new({
    ini_version = true,
    find_file = metapost.finder,
    job_name = name,
  })
  if mpx then
    local result = mpx:execute(string.format(preamble, name))
    mpx:finish()
  end
end
function replacesuffix(filename, suffix)
  return (string.gsub(filename, "%.[%a%d]+$", "")) .. "." .. suffix
end
metapost.load = function(name)
  local mpx = mplib.new({
    ini_version = false,
    mem_name = replacesuffix(name, "mem"),
    find_file = finder,
  })
  local result
  if not mpx then
    metapost.make(name)
    metapost.report("creating %s.mem", name)
    mpx = mplib.new({
      ini_version = false,
      mem_name = replacesuffix(name, "mem"),
      find_file = finder,
    })
  end
  if not mpx then
    result = { status = 99, error = "out of memory" }
  end
  return mpx, result
end
