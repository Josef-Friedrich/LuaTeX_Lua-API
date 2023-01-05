convert_tex_to_lua:
	resources/manuals/convert-tex-to-lua-docstrings.py

debug:
	luatex --luaonly debug.lua

.PHONY: convert_tex_to_lua debug
