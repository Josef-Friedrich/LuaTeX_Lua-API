all: fix_lua_docstrings convert_tex_to_lua

fix_lua_docstrings:
	resources/fix-lua-docstrings.py

convert_tex_to_lua:
	resources/convert-tex-to-lua-docstrings.py
	# resources/convert-html-to-lua-docstrings.py

debug:
	luatex --luaonly debug.lua

print_namespace:
	luatex resources/print-namespace.tex

generate_doc:
	$(HOME)/.vscode/extensions/sumneko.lua-3.6.8-linux-x64/server/bin/lua-language-server --doc library

dist: fix_lua_docstrings
	rsync -av --delete library/ dist/
	resources/remove-navigation-table.py
	rsync -av --delete dist/luatex/ $(HOME)/repos/lua/luatex/library/

test:
	 luatex --luaonly examples/unicode/all.lua

.PHONY: all fix_lua_docstrings convert_tex_to_lua debug print_namespace generate_doc
