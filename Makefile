convert_tex_to_lua:
	resources/convert-tex-to-lua-docstrings.py
	resources/convert-html-to-lua-docstrings.py

debug:
	luatex --luaonly debug.lua

print_namespace:
	luatex resources/print-namespace.tex

.PHONY: convert_tex_to_lua debug
