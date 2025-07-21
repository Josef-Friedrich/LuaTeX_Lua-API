jobname = luatex-type-definitions
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

all: format stylua

format:
	./manage.py format

convert:
	./manage.py convert

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

dist_rsync:
	rsync -av --delete ./library/ ./dist/
	./manage.py remove-navigation-table

update_lls_addons:
	resources/update-lls-addons.sh

test:
	 luatex --luaonly examples/unicode/all.lua

diff:
	resources/patch.sh diff

patch:
	resources/patch.sh patch

doc_pdf:
	lualatex --shell-escape $(jobname)-doc.tex
	makeindex -s gglo.ist -o $(jobname)-doc.gls $(jobname)-doc.glo
	makeindex -s gind.ist -o $(jobname)-doc.ind $(jobname)-doc.idx
	lualatex --shell-escape $(jobname)-doc.tex
	mkdir -p $(texmf)/doc
	cp $(jobname)-doc.pdf $(texmf)/doc/$(jobname).pdf

ctan_luatex: dist_rsync
	./manage.py merge luatex
	rm -rf luatex-type-definitions.tar.gz
	rm -rf luatex-type-definitions
	mkdir luatex-type-definitions
	cp -f dist-ctan/luatex/README.md luatex-type-definitions
	cp -f dist-ctan/luatex/luatex-type-definitions.lua luatex-type-definitions
	tar cvfz luatex-type-definitions.tar.gz luatex-type-definitions
	rm -rf luatex-type-definitions

clean:
	git clean -dfX

download_manuals:
	./manage.py manuals

update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

example_luatex_fontloader_close:
	luatex --luaonly examples/luatex/fontloader/close.lua
example_luatex_fontloader_fields:
	luatex --luaonly examples/luatex/fontloader/fields.lua
example_luatex_fontloader_fontinfo:
	luatex --luaonly examples/luatex/fontloader/Fontinfo.lua
example_luatex_fontloader_info:
	luatex --luaonly examples/luatex/fontloader/info.lua
example_luatex_fontloader_to_table:
	luatex --luaonly examples/luatex/fontloader/to_table.lua

.PHONY: all format convert_tex_to_lua stylua debug print_namespace generate_doc dist update_lls_addons test diff patch clean update_manual
