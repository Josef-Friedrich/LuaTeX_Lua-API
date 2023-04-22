#! luatex --luaonly

lfs.chdir('/tmp')
local dir = os.tmpdir()
assert(type(dir) == 'string')
assert(lfs.isdir('/tmp/' .. dir))

dir = os.tmpdir('tmp.XXXXXX')
assert(type(dir) == 'string')
assert(lfs.isdir('/tmp/' .. dir))

dir = os.tmpdir('tmp.X')
assert(dir == nil)
