#! luatex --luaonly

assert(md5.exor('', '') == '')
assert(md5.exor('alo alo', '\0\0\0\0\0\0\0') == 'alo alo')
