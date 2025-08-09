jobname = luatex-type-definitions
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

.PHONY: all
all: format stylua

.PHONY: format
format: stylua
	./manage.py format

.PHONY: convert
convert:
	./manage.py convert

.PHONY: stylua
stylua:
	stylua --config-path ./stylua.toml library
	stylua --config-path ./stylua.toml examples

.PHONY: debug
debug:
	luatex --luaonly debug.lua

.PHONY: print_namespace
print_namespace:
	luatex resources/print-namespace.tex

.PHONY: rust_doc_generator
rust_doc_generator: dist
	/usr/local/bin/emmylua_doc dist/luatex --output dist-doc/luatex

.PHONY: rust_doc_generator_install
rust_doc_generator_install:
	cd doc-generators/rust; cargo build -p emmylua_doc_cli --release
	sudo cp ./doc-generators/rust/target/release/emmylua_doc_cli /usr/local/bin/emmylua_doc

.PHONY: lua_doc_generator_test
lua_doc_generator_test:
	cd doc-generators/lua; busted test.lua

.PHONY: lua_doc_generator
lua_doc_generator:
	cd doc-generators/lua; lua doc-generator.lua

export VIRTUAL_ENV = /opt/venvs/mkdocs
mkdocs_install:
	sudo rm -rf /opt/venvs/mkdocs
	sudo /home/jf/.local/bin/uv venv /opt/venvs/mkdocs
	sudo chown -R jf:jf /opt/venvs/mkdocs
	/home/jf/.local/bin/uv pip install mkdocs mkdocs-material

mkdocs_luatex:
	cd dist/docs/luatex; mkdocs serve

.PHONY: dist
dist:
	./manage.py --debug dist

.PHONY: update_lls_addons
update_lls_addons:
	resources/update-lls-addons.sh

.PHONY: submodules
submodules:
	git submodule foreach --recursive git clean -xfd
	git submodule foreach --recursive git reset --hard
	git submodule update --init --recursive --remote

.PHONY: test
test:
	./manage.py test

.PHONY: diff
diff:
	resources/patch.sh diff

.PHONY: patch
patch:
	resources/patch.sh patch

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
	./manage.py merge luatex
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
	./manage.py manuals

.PHONY: update_manual
update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

LUATEX = ./manage.py example --print-docstring --subproject luatex

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
