jobname = luatex-type-definitions
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

.PHONY: all
all: format

.PHONY: format
format:
	./manage format

.PHONY: convert
convert:
	./manage convert

.PHONY: debug
debug:
	luatex --luaonly debug.lua

.PHONY: print_namespace
print_namespace:
	luatex resources/print-namespace.tex

.PHONY: dist
dist:
	./manage dist

.PHONY: update_lls_addons
update_lls_addons:
	resources/update-lls-addons.sh

.PHONY: submodules
submodules:
	./manage submodules

.PHONY: submodules_init
submodules_init:
	git submodule update --init --recursive --remote
	cd manager; make install

.PHONY: test
test:
	./manage test

.PHONY: doc
doc:
	lualatex --shell-escape $(jobname)-doc.tex
	makeindex -s gglo.ist -o $(jobname)-doc.gls $(jobname)-doc.glo
	makeindex -s gind.ist -o $(jobname)-doc.ind $(jobname)-doc.idx
	lualatex --shell-escape $(jobname)-doc.tex
	mkdir -p $(texmf)/doc
	cp $(jobname)-doc.pdf $(texmf)/doc/$(jobname).pdf

.PHONY: ctan
ctan: doc dist_rsync
	rm -rf $(jobname)
	rm -rf $(jobname).tar.gz
	mkdir $(jobname)
	./manage merge luatex
	$(HOME)/.cargo/bin/stylua $(jobname)
	cp -f README.md $(jobname)
	cp -f $(jobname)-doc.tex $(jobname)
	cp -f $(jobname)-doc.pdf $(jobname)
	tar cvfz $(jobname).tar.gz $(jobname)
	# rm -rf $(jobname)

.PHONY: clean
clean:
	git clean -dfX

.PHONY: download_manuals
download_manuals:
	./manage manuals

.PHONY: update_manual
update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

LUATEX = ./manage example --print-docstring --subproject luatex

.PHONY: namespace_luametatex
namespace_luametatex:
	$(LUATEX) luametatex/namespace.lua
.PHONY: namespace_luametatex_luaonly
namespace_luametatex_luaonly:
	luametatex --luaonly examples/luatex/namespace.lua

.PHONY: namespace_luatex
namespace_luatex:
	$(LUATEX) namespace.lua

.PHONY: namespace_luatex_luaonly
namespace_luatex_luaonly:
	luatex --luaonly examples/luatex/namespace_luaonly.lua
