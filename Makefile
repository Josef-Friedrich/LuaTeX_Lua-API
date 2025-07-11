all: fix_lua_docstrings convert_tex_to_lua stylua

fix_lua_docstrings:
	resources/fix-lua-docstrings.py

convert_tex_to_lua:
	resources/convert-tex-to-lua-docstrings.py
	# resources/convert-html-to-lua-docstrings.py

stylua:
	$(HOME)/.cargo/bin/stylua library

debug:
	luatex --luaonly debug.lua

print_namespace:
	luatex resources/print-namespace.tex

generate_doc:
	$(HOME)/.vscode/extensions/sumneko.lua-3.6.8-linux-x64/server/bin/lua-language-server --doc library

dist: fix_lua_docstrings clean
	rsync -av --delete library/ dist/
	resources/sync-projects.sh
	resources/update-lls-addons.sh

update_lls_addons:
	resources/update-lls-addons.sh

test:
	 luatex --luaonly examples/unicode/all.lua

diff:
	resources/patch.sh diff

patch:
	resources/patch.sh patch

clean:
	git clean -dfX

update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

.PHONY: all fix_lua_docstrings convert_tex_to_lua stylua debug print_namespace generate_doc dist update_lls_addons test diff patch clean update_manual
