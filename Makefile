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

doc:
	lualatex --shell-escape $(jobname)-doc.tex
	makeindex -s gglo.ist -o $(jobname)-doc.gls $(jobname)-doc.glo
	makeindex -s gind.ist -o $(jobname)-doc.ind $(jobname)-doc.idx
	lualatex --shell-escape $(jobname)-doc.tex
	mkdir -p $(texmf)/doc
	cp $(jobname)-doc.pdf $(texmf)/doc/$(jobname).pdf

ctan: doc dist_rsync
	rm -rf $(jobname)
	rm -rf $(jobname).tar.gz
	mkdir $(jobname)
	./manage.py merge luatex
	$(HOME)/.cargo/bin/stylua $(jobname)
	cp -f README.md $(jobname)
	cp -f $(jobname)-doc.tex $(jobname)
	cp -f $(jobname)-doc.pdf $(jobname)
	tar cvfz $(jobname).tar.gz $(jobname)
	# rm -rf $(jobname)

clean:
	git clean -dfX

download_manuals:
	./manage.py manuals

update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

namespace_luametatex:
	./manage.py example luametatex/namespace.lua
namespace_luametatex_luaonly:
	luametatex --luaonly examples/luatex/namespace.lua

namespace_luatex:
	./manage.py example luatex/namespace.lua
namespace_luatex_luaonly:
	luatex --luaonly examples/luatex/namespace_luaonly.lua

# examples

## luatex

### fontloader
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

### string
example_luatex_string_bytepairs:
	luatex --luaonly examples/luatex/string/bytepairs.lua
example_luatex_string_bytes:
	luatex --luaonly examples/luatex/string/bytes.lua
example_luatex_string_characterpairs:
	luatex --luaonly examples/luatex/string/characterpairs.lua
example_luatex_string_characters:
	luatex --luaonly examples/luatex/string/characters.lua
example_luatex_string_explode:
	luatex --luaonly examples/luatex/string/explode.lua
example_luatex_string_utfcharacter:
	luatex --luaonly examples/luatex/string/utfcharacter.lua
example_luatex_string_utfcharacters:
	luatex --luaonly examples/luatex/string/utfcharacters.lua
example_luatex_string_utflength:
	luatex --luaonly examples/luatex/string/utflength.lua
example_luatex_string_utfvalue:
	luatex --luaonly examples/luatex/string/utfvalue.lua
example_luatex_string_utfvalues:
	luatex --luaonly examples/luatex/string/utfvalues.lua

.PHONY: all format convert_tex_to_lua stylua debug print_namespace generate_doc dist update_lls_addons test diff patch clean update_manual
