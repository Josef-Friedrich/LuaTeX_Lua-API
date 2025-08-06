jobname = luatex-type-definitions
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

.PHONY: all
all: format stylua

.PHONY: format
format: stylua
	./manage.py format
	./manage.py example --makefile .

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

# examples

## lualibs

E_LUALIBS = ./manage.py example --print-docstring --subproject lualibs

### io

example_lualibs_io: example_lualibs_io.ask \
	example_lualibs_io.bytes \
	example_lualibs_io.characters \
	example_lualibs_io.exists \
	example_lualibs_io.loaddata \
	example_lualibs_io.noflines \
	example_lualibs_io.readnumber \
	example_lualibs_io.readstring \
	example_lualibs_io.savedata \
	example_lualibs_io.size
example_lualibs_io.ask:
	$(E_LUALIBS) io/ask
example_lualibs_io.bytes:
	$(E_LUALIBS) io/bytes
example_lualibs_io.characters:
	$(E_LUALIBS) io/characters
example_lualibs_io.exists:
	$(E_LUALIBS) io/exists
example_lualibs_io.loaddata:
	$(E_LUALIBS) io/loaddata
example_lualibs_io.noflines:
	$(E_LUALIBS) io/noflines
example_lualibs_io.readnumber:
	$(E_LUALIBS) io/readnumber
example_lualibs_io.readstring:
	$(E_LUALIBS) io/readstring
example_lualibs_io.savedata:
	$(E_LUALIBS) io/savedata
example_lualibs_io.size:
	$(E_LUALIBS) io/size

### lpeg

example_lualibs_lpeg: example_lualibs_lpeg.firstofsplit \
	example_lualibs_lpeg.replacer \
	example_lualibs_lpeg.secondofsplit \
	example_lualibs_lpeg.splitat \
	example_lualibs_lpeg.stripper
example_lualibs_lpeg.firstofsplit:
	$(E_LUALIBS) lpeg/firstofsplit
example_lualibs_lpeg.replacer:
	$(E_LUALIBS) lpeg/replacer
example_lualibs_lpeg.secondofsplit:
	$(E_LUALIBS) lpeg/secondofsplit
example_lualibs_lpeg.splitat:
	$(E_LUALIBS) lpeg/splitat
example_lualibs_lpeg.stripper:
	$(E_LUALIBS) lpeg/stripper

### string

example_lualibs_string: example_lualibs_string.checkedsplit \
	example_lualibs_string.collapsespaces \
	example_lualibs_string.containsws \
	example_lualibs_string.count \
	example_lualibs_string.escapedpattern \
	example_lualibs_string.formatter \
	example_lualibs_string.fullstrip \
	example_lualibs_string.limit \
	example_lualibs_string.longtostring \
	example_lualibs_string.nospaces \
	example_lualibs_string.quote \
	example_lualibs_string.quoted \
	example_lualibs_string.split \
	example_lualibs_string.strip \
	example_lualibs_string.texnewlines \
	example_lualibs_string.toHEX_uppercase \
	example_lualibs_string.tobytes \
	example_lualibs_string.todec \
	example_lualibs_string.todimen \
	example_lualibs_string.tohex_lowercase \
	example_lualibs_string.unquote \
	example_lualibs_string.unquoted \
	example_lualibs_string.utfpadding \
	example_lualibs_string.wordsplitter
example_lualibs_string.checkedsplit:
	$(E_LUALIBS) string/checkedsplit
example_lualibs_string.collapsespaces:
	$(E_LUALIBS) string/collapsespaces
example_lualibs_string.containsws:
	$(E_LUALIBS) string/containsws
example_lualibs_string.count:
	$(E_LUALIBS) string/count
example_lualibs_string.escapedpattern:
	$(E_LUALIBS) string/escapedpattern
example_lualibs_string.formatter:
	$(E_LUALIBS) string/formatter
example_lualibs_string.fullstrip:
	$(E_LUALIBS) string/fullstrip
example_lualibs_string.limit:
	$(E_LUALIBS) string/limit
example_lualibs_string.longtostring:
	$(E_LUALIBS) string/longtostring
example_lualibs_string.nospaces:
	$(E_LUALIBS) string/nospaces
example_lualibs_string.quote:
	$(E_LUALIBS) string/quote
example_lualibs_string.quoted:
	$(E_LUALIBS) string/quoted
example_lualibs_string.split:
	$(E_LUALIBS) string/split
example_lualibs_string.strip:
	$(E_LUALIBS) string/strip
example_lualibs_string.texnewlines:
	$(E_LUALIBS) string/texnewlines
example_lualibs_string.toHEX_uppercase:
	$(E_LUALIBS) string/toHEX_uppercase
example_lualibs_string.tobytes:
	$(E_LUALIBS) string/tobytes
example_lualibs_string.todec:
	$(E_LUALIBS) string/todec
example_lualibs_string.todimen:
	$(E_LUALIBS) string/todimen
example_lualibs_string.tohex_lowercase:
	$(E_LUALIBS) string/tohex_lowercase
example_lualibs_string.unquote:
	$(E_LUALIBS) string/unquote
example_lualibs_string.unquoted:
	$(E_LUALIBS) string/unquoted
example_lualibs_string.utfpadding:
	$(E_LUALIBS) string/utfpadding
example_lualibs_string.wordsplitter:
	$(E_LUALIBS) string/wordsplitter

### table

example_lualibs_table: example_lualibs_table.append \
	example_lualibs_table.are_equal \
	example_lualibs_table.fromhash \
	example_lualibs_table.identical \
	example_lualibs_table.mirrored \
	example_lualibs_table.prepend \
	example_lualibs_table.reverse \
	example_lualibs_table.reversed \
	example_lualibs_table.serialize \
	example_lualibs_table.swapped \
	example_lualibs_table.tohash
example_lualibs_table.append:
	$(E_LUALIBS) table/append
example_lualibs_table.are_equal:
	$(E_LUALIBS) table/are_equal
example_lualibs_table.fromhash:
	$(E_LUALIBS) table/fromhash
example_lualibs_table.identical:
	$(E_LUALIBS) table/identical
example_lualibs_table.mirrored:
	$(E_LUALIBS) table/mirrored
example_lualibs_table.prepend:
	$(E_LUALIBS) table/prepend
example_lualibs_table.reverse:
	$(E_LUALIBS) table/reverse
example_lualibs_table.reversed:
	$(E_LUALIBS) table/reversed
example_lualibs_table.serialize:
	$(E_LUALIBS) table/serialize
example_lualibs_table.swapped:
	$(E_LUALIBS) table/swapped
example_lualibs_table.tohash:
	$(E_LUALIBS) table/tohash

### url

example_lualibs_url: example_lualibs_url.query \
	example_lualibs_url.toquery
example_lualibs_url.query:
	$(E_LUALIBS) url/query
example_lualibs_url.toquery:
	$(E_LUALIBS) url/toquery

### utilities


## luametatex

E_LUAMETATEX = ./manage.py example --print-docstring --subproject luametatex

### status

example_luametatex_status: example_luametatex_status.getbufferstate \
	example_luametatex_status.list
example_luametatex_status.getbufferstate:
	$(E_LUAMETATEX) status/getbufferstate
example_luametatex_status.list:
	$(E_LUAMETATEX) status/list

### xcomplex

example_luametatex_xcomplex: example_luametatex_xcomplex.new \
	example_luametatex_xcomplex.topair \
	example_luametatex_xcomplex.tostring \
	example_luametatex_xcomplex.totable
example_luametatex_xcomplex.new:
	$(E_LUAMETATEX) xcomplex/new
example_luametatex_xcomplex.topair:
	$(E_LUAMETATEX) xcomplex/topair
example_luametatex_xcomplex.tostring:
	$(E_LUAMETATEX) xcomplex/tostring
example_luametatex_xcomplex.totable:
	$(E_LUAMETATEX) xcomplex/totable

## luatex

E_LUATEX = ./manage.py example --print-docstring --subproject luatex

### callback

example_luatex_callback: example_luatex_callback.process_pdf_image_content
example_luatex_callback.process_pdf_image_content:
	$(E_LUATEX) callback/process_pdf_image_content

### fio

example_luatex_fio: example_luatex_fio.read2dot14 \
	example_luatex_fio.readbytes \
	example_luatex_fio.readbytetable \
	example_luatex_fio.readcardinal1 \
	example_luatex_fio.readcardinal2 \
	example_luatex_fio.readcardinal3 \
	example_luatex_fio.readcardinal4 \
	example_luatex_fio.readfixed2 \
	example_luatex_fio.readfixed4 \
	example_luatex_fio.readinteger1le \
	example_luatex_fio.readinteger2le \
	example_luatex_fio.readinteger3le \
	example_luatex_fio.readinteger4le \
	example_luatex_fio.readline
example_luatex_fio.read2dot14:
	$(E_LUATEX) fio/read2dot14
example_luatex_fio.readbytes:
	$(E_LUATEX) fio/readbytes
example_luatex_fio.readbytetable:
	$(E_LUATEX) fio/readbytetable
example_luatex_fio.readcardinal1:
	$(E_LUATEX) fio/readcardinal1
example_luatex_fio.readcardinal2:
	$(E_LUATEX) fio/readcardinal2
example_luatex_fio.readcardinal3:
	$(E_LUATEX) fio/readcardinal3
example_luatex_fio.readcardinal4:
	$(E_LUATEX) fio/readcardinal4
example_luatex_fio.readfixed2:
	$(E_LUATEX) fio/readfixed2
example_luatex_fio.readfixed4:
	$(E_LUATEX) fio/readfixed4
example_luatex_fio.readinteger1le:
	$(E_LUATEX) fio/readinteger1le
example_luatex_fio.readinteger2le:
	$(E_LUATEX) fio/readinteger2le
example_luatex_fio.readinteger3le:
	$(E_LUATEX) fio/readinteger3le
example_luatex_fio.readinteger4le:
	$(E_LUATEX) fio/readinteger4le
example_luatex_fio.readline:
	$(E_LUATEX) fio/readline

### font

example_luatex_font: example_luatex_font.definefont \
	example_luatex_font.each \
	example_luatex_font.getcopy \
	example_luatex_font.getparameters \
	example_luatex_font.read_tfm \
	example_luatex_font.read_vf
example_luatex_font.definefont:
	$(E_LUATEX) font/definefont
example_luatex_font.each:
	$(E_LUATEX) font/each
example_luatex_font.getcopy:
	$(E_LUATEX) font/getcopy
example_luatex_font.getparameters:
	$(E_LUATEX) font/getparameters
example_luatex_font.read_tfm:
	$(E_LUATEX) font/read_tfm
example_luatex_font.read_vf:
	$(E_LUATEX) font/read_vf

### fontloader

example_luatex_fontloader: example_luatex_fontloader.Fontinfo \
	example_luatex_fontloader.FontloaderPfminfo \
	example_luatex_fontloader.close \
	example_luatex_fontloader.fields \
	example_luatex_fontloader.info \
	example_luatex_fontloader.open \
	example_luatex_fontloader.table_glyphs \
	example_luatex_fontloader.table_map \
	example_luatex_fontloader.table_root \
	example_luatex_fontloader.to_table
example_luatex_fontloader.Fontinfo:
	$(E_LUATEX) fontloader/Fontinfo
example_luatex_fontloader.FontloaderPfminfo:
	$(E_LUATEX) fontloader/FontloaderPfminfo
example_luatex_fontloader.close:
	$(E_LUATEX) fontloader/close
example_luatex_fontloader.fields:
	$(E_LUATEX) fontloader/fields
example_luatex_fontloader.info:
	$(E_LUATEX) fontloader/info
example_luatex_fontloader.open:
	$(E_LUATEX) fontloader/open
example_luatex_fontloader.table_glyphs:
	$(E_LUATEX) fontloader/table_glyphs
example_luatex_fontloader.table_map:
	$(E_LUATEX) fontloader/table_map
example_luatex_fontloader.table_root:
	$(E_LUATEX) fontloader/table_root
example_luatex_fontloader.to_table:
	$(E_LUATEX) fontloader/to_table

### gzip

example_luatex_gzip: example_luatex_gzip.close \
	example_luatex_gzip.lines \
	example_luatex_gzip.open
example_luatex_gzip.close:
	$(E_LUATEX) gzip/close
example_luatex_gzip.lines:
	$(E_LUATEX) gzip/lines
example_luatex_gzip.open:
	$(E_LUATEX) gzip/open

### img

example_luatex_img: example_luatex_img.boxes \
	example_luatex_img.copy \
	example_luatex_img.fields \
	example_luatex_img.keys \
	example_luatex_img.types
example_luatex_img.boxes:
	$(E_LUATEX) img/boxes
example_luatex_img.copy:
	$(E_LUATEX) img/copy
example_luatex_img.fields:
	$(E_LUATEX) img/fields
example_luatex_img.keys:
	$(E_LUATEX) img/keys
example_luatex_img.types:
	$(E_LUATEX) img/types

### lang

example_luatex_lang: example_luatex_lang.Language_clear_hyphenation \
	example_luatex_lang.clean \
	example_luatex_lang.clear_hyphenation \
	example_luatex_lang.hyphenation \
	example_luatex_lang.id \
	example_luatex_lang.new \
	example_luatex_lang.patterns
example_luatex_lang.Language_clear_hyphenation:
	$(E_LUATEX) lang/Language:clear_hyphenation
example_luatex_lang.clean:
	$(E_LUATEX) lang/clean
example_luatex_lang.clear_hyphenation:
	$(E_LUATEX) lang/clear_hyphenation
example_luatex_lang.hyphenation:
	$(E_LUATEX) lang/hyphenation
example_luatex_lang.id:
	$(E_LUATEX) lang/id
example_luatex_lang.new:
	$(E_LUATEX) lang/new
example_luatex_lang.patterns:
	$(E_LUATEX) lang/patterns

### lpeg

example_luatex_lpeg: example_luatex_lpeg.C \
	example_luatex_lpeg.Cf \
	example_luatex_lpeg.Cp \
	example_luatex_lpeg.Cs \
	example_luatex_lpeg.R \
	example_luatex_lpeg.V \
	example_luatex_lpeg.locale \
	example_luatex_lpeg.match
example_luatex_lpeg.C:
	$(E_LUATEX) lpeg/C
example_luatex_lpeg.Cf:
	$(E_LUATEX) lpeg/Cf
example_luatex_lpeg.Cp:
	$(E_LUATEX) lpeg/Cp
example_luatex_lpeg.Cs:
	$(E_LUATEX) lpeg/Cs
example_luatex_lpeg.R:
	$(E_LUATEX) lpeg/R
example_luatex_lpeg.V:
	$(E_LUATEX) lpeg/V
example_luatex_lpeg.locale:
	$(E_LUATEX) lpeg/locale
example_luatex_lpeg.match:
	$(E_LUATEX) lpeg/match

### lua

example_luatex_lua: example_luatex_lua.get_functions_table \
	example_luatex_lua.getluaname \
	example_luatex_lua.setbytecode \
	example_luatex_lua.setluaname
example_luatex_lua.get_functions_table:
	$(E_LUATEX) lua/get_functions_table
example_luatex_lua.getluaname:
	$(E_LUATEX) lua/getluaname
example_luatex_lua.setbytecode:
	$(E_LUATEX) lua/setbytecode
example_luatex_lua.setluaname:
	$(E_LUATEX) lua/setluaname

### luaharfbuzz

example_luatex_luaharfbuzz: example_luatex_luaharfbuzz.Buffer \
	example_luatex_luaharfbuzz.Direction \
	example_luatex_luaharfbuzz.shapers \
	example_luatex_luaharfbuzz.version
example_luatex_luaharfbuzz.Buffer:
	$(E_LUATEX) luaharfbuzz/Buffer
example_luatex_luaharfbuzz.Direction:
	$(E_LUATEX) luaharfbuzz/Direction
example_luatex_luaharfbuzz.shapers:
	$(E_LUATEX) luaharfbuzz/shapers
example_luatex_luaharfbuzz.version:
	$(E_LUATEX) luaharfbuzz/version

### md5

example_luatex_md5: example_luatex_md5.crypt \
	example_luatex_md5.decrypt \
	example_luatex_md5.exor \
	example_luatex_md5.sum \
	example_luatex_md5.sumHEXA_uppercase \
	example_luatex_md5.sumhexa_lowercase
example_luatex_md5.crypt:
	$(E_LUATEX) md5/crypt
example_luatex_md5.decrypt:
	$(E_LUATEX) md5/decrypt
example_luatex_md5.exor:
	$(E_LUATEX) md5/exor
example_luatex_md5.sum:
	$(E_LUATEX) md5/sum
example_luatex_md5.sumHEXA_uppercase:
	$(E_LUATEX) md5/sumHEXA_uppercase
example_luatex_md5.sumhexa_lowercase:
	$(E_LUATEX) md5/sumhexa_lowercase

### mplib

example_luatex_mplib: example_luatex_mplib.execute \
	example_luatex_mplib.min-test \
	example_luatex_mplib.mplib.new \
	example_luatex_mplib.myluamplib \
	example_luatex_mplib.new \
	example_luatex_mplib.statistics \
	example_luatex_mplib.test \
	example_luatex_mplib.version \
	example_luatex_mplib.wikitex
example_luatex_mplib.execute:
	$(E_LUATEX) mplib/execute
example_luatex_mplib.min-test:
	$(E_LUATEX) mplib/min-test
example_luatex_mplib.mplib.new:
	$(E_LUATEX) mplib/mplib.new
example_luatex_mplib.myluamplib:
	$(E_LUATEX) mplib/myluamplib
example_luatex_mplib.new:
	$(E_LUATEX) mplib/new
example_luatex_mplib.statistics:
	$(E_LUATEX) mplib/statistics
example_luatex_mplib.test:
	$(E_LUATEX) mplib/test
example_luatex_mplib.version:
	$(E_LUATEX) mplib/version
example_luatex_mplib.wikitex:
	$(E_LUATEX) mplib/wikitex

### node

example_luatex_node: example_luatex_node.Node_AttributeListNode \
	example_luatex_node.Node_AttributeNode \
	example_luatex_node.Node_FenceNode \
	example_luatex_node.Node_LateLuaWhatsitNode \
	example_luatex_node.Node_ShapeNode \
	example_luatex_node._node-info \
	example_luatex_node.direct.getboth \
	example_luatex_node.direct.getchar \
	example_luatex_node.direct.getdir \
	example_luatex_node.direct.getdirection \
	example_luatex_node.direct.getfont \
	example_luatex_node.direct.getid \
	example_luatex_node.direct.getlist \
	example_luatex_node.direct.getnext \
	example_luatex_node.direct.getprev \
	example_luatex_node.direct.getwhd \
	example_luatex_node.direct.has_field \
	example_luatex_node.direct.is_glyph \
	example_luatex_node.direct.new \
	example_luatex_node.direct.remove \
	example_luatex_node.direct.setboth \
	example_luatex_node.direct.setchar \
	example_luatex_node.direct.setfield \
	example_luatex_node.direct.setfont \
	example_luatex_node.direct.setlist \
	example_luatex_node.direct.setnext \
	example_luatex_node.direct.setprev \
	example_luatex_node.direct.setwhd \
	example_luatex_node.direct.setwidth \
	example_luatex_node.direct.todirect \
	example_luatex_node.direct.tonode \
	example_luatex_node.direct.tostring \
	example_luatex_node.direct.usedlist \
	example_luatex_node.fields \
	example_luatex_node.getboth \
	example_luatex_node.getchar \
	example_luatex_node.getfield \
	example_luatex_node.getfont \
	example_luatex_node.getid \
	example_luatex_node.getlist \
	example_luatex_node.getnext \
	example_luatex_node.getprev \
	example_luatex_node.getsubtype \
	example_luatex_node.has_field \
	example_luatex_node.id \
	example_luatex_node.is_char \
	example_luatex_node.is_glyph \
	example_luatex_node.new \
	example_luatex_node.remove \
	example_luatex_node.setfield \
	example_luatex_node.subtype \
	example_luatex_node.subtypes \
	example_luatex_node.tostring \
	example_luatex_node.traverse \
	example_luatex_node.type \
	example_luatex_node.types \
	example_luatex_node.usedlist \
	example_luatex_node.values \
	example_luatex_node.whatsits
example_luatex_node.Node_AttributeListNode:
	$(E_LUATEX) node/Node_AttributeListNode
example_luatex_node.Node_AttributeNode:
	$(E_LUATEX) node/Node_AttributeNode
example_luatex_node.Node_FenceNode:
	$(E_LUATEX) node/Node_FenceNode
example_luatex_node.Node_LateLuaWhatsitNode:
	$(E_LUATEX) node/Node_LateLuaWhatsitNode
example_luatex_node.Node_ShapeNode:
	$(E_LUATEX) node/Node_ShapeNode
example_luatex_node._node-info:
	$(E_LUATEX) node/_node-info
example_luatex_node.direct.getboth:
	$(E_LUATEX) node/direct.getboth
example_luatex_node.direct.getchar:
	$(E_LUATEX) node/direct.getchar
example_luatex_node.direct.getdir:
	$(E_LUATEX) node/direct.getdir
example_luatex_node.direct.getdirection:
	$(E_LUATEX) node/direct.getdirection
example_luatex_node.direct.getfont:
	$(E_LUATEX) node/direct.getfont
example_luatex_node.direct.getid:
	$(E_LUATEX) node/direct.getid
example_luatex_node.direct.getlist:
	$(E_LUATEX) node/direct.getlist
example_luatex_node.direct.getnext:
	$(E_LUATEX) node/direct.getnext
example_luatex_node.direct.getprev:
	$(E_LUATEX) node/direct.getprev
example_luatex_node.direct.getwhd:
	$(E_LUATEX) node/direct.getwhd
example_luatex_node.direct.has_field:
	$(E_LUATEX) node/direct.has_field
example_luatex_node.direct.is_glyph:
	$(E_LUATEX) node/direct.is_glyph
example_luatex_node.direct.new:
	$(E_LUATEX) node/direct.new
example_luatex_node.direct.remove:
	$(E_LUATEX) node/direct.remove
example_luatex_node.direct.setboth:
	$(E_LUATEX) node/direct.setboth
example_luatex_node.direct.setchar:
	$(E_LUATEX) node/direct.setchar
example_luatex_node.direct.setfield:
	$(E_LUATEX) node/direct.setfield
example_luatex_node.direct.setfont:
	$(E_LUATEX) node/direct.setfont
example_luatex_node.direct.setlist:
	$(E_LUATEX) node/direct.setlist
example_luatex_node.direct.setnext:
	$(E_LUATEX) node/direct.setnext
example_luatex_node.direct.setprev:
	$(E_LUATEX) node/direct.setprev
example_luatex_node.direct.setwhd:
	$(E_LUATEX) node/direct.setwhd
example_luatex_node.direct.setwidth:
	$(E_LUATEX) node/direct.setwidth
example_luatex_node.direct.todirect:
	$(E_LUATEX) node/direct.todirect
example_luatex_node.direct.tonode:
	$(E_LUATEX) node/direct.tonode
example_luatex_node.direct.tostring:
	$(E_LUATEX) node/direct.tostring
example_luatex_node.direct.usedlist:
	$(E_LUATEX) node/direct.usedlist
example_luatex_node.fields:
	$(E_LUATEX) node/fields
example_luatex_node.getboth:
	$(E_LUATEX) node/getboth
example_luatex_node.getchar:
	$(E_LUATEX) node/getchar
example_luatex_node.getfield:
	$(E_LUATEX) node/getfield
example_luatex_node.getfont:
	$(E_LUATEX) node/getfont
example_luatex_node.getid:
	$(E_LUATEX) node/getid
example_luatex_node.getlist:
	$(E_LUATEX) node/getlist
example_luatex_node.getnext:
	$(E_LUATEX) node/getnext
example_luatex_node.getprev:
	$(E_LUATEX) node/getprev
example_luatex_node.getsubtype:
	$(E_LUATEX) node/getsubtype
example_luatex_node.has_field:
	$(E_LUATEX) node/has_field
example_luatex_node.id:
	$(E_LUATEX) node/id
example_luatex_node.is_char:
	$(E_LUATEX) node/is_char
example_luatex_node.is_glyph:
	$(E_LUATEX) node/is_glyph
example_luatex_node.new:
	$(E_LUATEX) node/new
example_luatex_node.remove:
	$(E_LUATEX) node/remove
example_luatex_node.setfield:
	$(E_LUATEX) node/setfield
example_luatex_node.subtype:
	$(E_LUATEX) node/subtype
example_luatex_node.subtypes:
	$(E_LUATEX) node/subtypes
example_luatex_node.tostring:
	$(E_LUATEX) node/tostring
example_luatex_node.traverse:
	$(E_LUATEX) node/traverse
example_luatex_node.type:
	$(E_LUATEX) node/type
example_luatex_node.types:
	$(E_LUATEX) node/types
example_luatex_node.usedlist:
	$(E_LUATEX) node/usedlist
example_luatex_node.values:
	$(E_LUATEX) node/values
example_luatex_node.whatsits:
	$(E_LUATEX) node/whatsits

### os

example_luatex_os: example_luatex_os.exec \
	example_luatex_os.gettimeofday \
	example_luatex_os.name \
	example_luatex_os.sleep \
	example_luatex_os.spawn \
	example_luatex_os.times \
	example_luatex_os.tmpdir \
	example_luatex_os.type \
	example_luatex_os.uname
example_luatex_os.exec:
	$(E_LUATEX) os/exec
example_luatex_os.gettimeofday:
	$(E_LUATEX) os/gettimeofday
example_luatex_os.name:
	$(E_LUATEX) os/name
example_luatex_os.sleep:
	$(E_LUATEX) os/sleep
example_luatex_os.spawn:
	$(E_LUATEX) os/spawn
example_luatex_os.times:
	$(E_LUATEX) os/times
example_luatex_os.tmpdir:
	$(E_LUATEX) os/tmpdir
example_luatex_os.type:
	$(E_LUATEX) os/type
example_luatex_os.uname:
	$(E_LUATEX) os/uname

### pdf

example_luatex_pdf: example_luatex_pdf.getcreationdate
example_luatex_pdf.getcreationdate:
	$(E_LUATEX) pdf/getcreationdate

### pdfscanner

example_luatex_pdfscanner: example_luatex_pdfscanner.scan
example_luatex_pdfscanner.scan:
	$(E_LUATEX) pdfscanner/scan

### sio

example_luatex_sio: example_luatex_sio.read2dot14 \
	example_luatex_sio.readbytes \
	example_luatex_sio.readbytetable \
	example_luatex_sio.readcardinal1 \
	example_luatex_sio.readcardinal1le \
	example_luatex_sio.readcardinal2 \
	example_luatex_sio.readcardinal2le \
	example_luatex_sio.readcardinal3 \
	example_luatex_sio.readcardinal3le \
	example_luatex_sio.readcardinal4 \
	example_luatex_sio.readcardinal4le \
	example_luatex_sio.readcardinaltable \
	example_luatex_sio.readfixed2 \
	example_luatex_sio.readfixed4 \
	example_luatex_sio.readinteger1 \
	example_luatex_sio.readinteger1le \
	example_luatex_sio.readinteger2 \
	example_luatex_sio.readinteger2le \
	example_luatex_sio.readinteger3 \
	example_luatex_sio.readinteger3le \
	example_luatex_sio.readinteger4 \
	example_luatex_sio.readinteger4le \
	example_luatex_sio.readintegertable
example_luatex_sio.read2dot14:
	$(E_LUATEX) sio/read2dot14
example_luatex_sio.readbytes:
	$(E_LUATEX) sio/readbytes
example_luatex_sio.readbytetable:
	$(E_LUATEX) sio/readbytetable
example_luatex_sio.readcardinal1:
	$(E_LUATEX) sio/readcardinal1
example_luatex_sio.readcardinal1le:
	$(E_LUATEX) sio/readcardinal1le
example_luatex_sio.readcardinal2:
	$(E_LUATEX) sio/readcardinal2
example_luatex_sio.readcardinal2le:
	$(E_LUATEX) sio/readcardinal2le
example_luatex_sio.readcardinal3:
	$(E_LUATEX) sio/readcardinal3
example_luatex_sio.readcardinal3le:
	$(E_LUATEX) sio/readcardinal3le
example_luatex_sio.readcardinal4:
	$(E_LUATEX) sio/readcardinal4
example_luatex_sio.readcardinal4le:
	$(E_LUATEX) sio/readcardinal4le
example_luatex_sio.readcardinaltable:
	$(E_LUATEX) sio/readcardinaltable
example_luatex_sio.readfixed2:
	$(E_LUATEX) sio/readfixed2
example_luatex_sio.readfixed4:
	$(E_LUATEX) sio/readfixed4
example_luatex_sio.readinteger1:
	$(E_LUATEX) sio/readinteger1
example_luatex_sio.readinteger1le:
	$(E_LUATEX) sio/readinteger1le
example_luatex_sio.readinteger2:
	$(E_LUATEX) sio/readinteger2
example_luatex_sio.readinteger2le:
	$(E_LUATEX) sio/readinteger2le
example_luatex_sio.readinteger3:
	$(E_LUATEX) sio/readinteger3
example_luatex_sio.readinteger3le:
	$(E_LUATEX) sio/readinteger3le
example_luatex_sio.readinteger4:
	$(E_LUATEX) sio/readinteger4
example_luatex_sio.readinteger4le:
	$(E_LUATEX) sio/readinteger4le
example_luatex_sio.readintegertable:
	$(E_LUATEX) sio/readintegertable

### socket

example_luatex_socket: example_luatex_socket.gettime
example_luatex_socket.gettime:
	$(E_LUATEX) socket/gettime

### status

example_luatex_status: example_luatex_status.list
example_luatex_status.list:
	$(E_LUATEX) status/list

### string

example_luatex_string: example_luatex_string.bytepairs \
	example_luatex_string.bytes \
	example_luatex_string.characterpairs \
	example_luatex_string.characters \
	example_luatex_string.explode \
	example_luatex_string.utfcharacter \
	example_luatex_string.utfcharacters \
	example_luatex_string.utflength \
	example_luatex_string.utfvalue \
	example_luatex_string.utfvalues
example_luatex_string.bytepairs:
	$(E_LUATEX) string/bytepairs
example_luatex_string.bytes:
	$(E_LUATEX) string/bytes
example_luatex_string.characterpairs:
	$(E_LUATEX) string/characterpairs
example_luatex_string.characters:
	$(E_LUATEX) string/characters
example_luatex_string.explode:
	$(E_LUATEX) string/explode
example_luatex_string.utfcharacter:
	$(E_LUATEX) string/utfcharacter
example_luatex_string.utfcharacters:
	$(E_LUATEX) string/utfcharacters
example_luatex_string.utflength:
	$(E_LUATEX) string/utflength
example_luatex_string.utfvalue:
	$(E_LUATEX) string/utfvalue
example_luatex_string.utfvalues:
	$(E_LUATEX) string/utfvalues

### tex

example_luatex_tex: example_luatex_tex.baselineskip \
	example_luatex_tex.catcode \
	example_luatex_tex.cprint \
	example_luatex_tex.delcode \
	example_luatex_tex.eTeXVersion \
	example_luatex_tex.eTeXrevision \
	example_luatex_tex.fontidentifier \
	example_luatex_tex.fontname \
	example_luatex_tex.formatname \
	example_luatex_tex.get \
	example_luatex_tex.get_glue \
	example_luatex_tex.getbox \
	example_luatex_tex.getcatcode \
	example_luatex_tex.getmathcode \
	example_luatex_tex.getmathcodes \
	example_luatex_tex.hashtokens \
	example_luatex_tex.isbox \
	example_luatex_tex.jobname \
	example_luatex_tex.lccode \
	example_luatex_tex.luatexbanner \
	example_luatex_tex.luatexrevision \
	example_luatex_tex.mathcode \
	example_luatex_tex.number \
	example_luatex_tex.print \
	example_luatex_tex.romannumeral \
	example_luatex_tex.runtoks \
	example_luatex_tex.scantoks \
	example_luatex_tex.setbox \
	example_luatex_tex.setcatcode \
	example_luatex_tex.settoks \
	example_luatex_tex.sfcode \
	example_luatex_tex.sp \
	example_luatex_tex.sprint \
	example_luatex_tex.tprint \
	example_luatex_tex.uccode \
	example_luatex_tex.write
example_luatex_tex.baselineskip:
	$(E_LUATEX) tex/baselineskip
example_luatex_tex.catcode:
	$(E_LUATEX) tex/catcode
example_luatex_tex.cprint:
	$(E_LUATEX) tex/cprint
example_luatex_tex.delcode:
	$(E_LUATEX) tex/delcode
example_luatex_tex.eTeXVersion:
	$(E_LUATEX) tex/eTeXVersion
example_luatex_tex.eTeXrevision:
	$(E_LUATEX) tex/eTeXrevision
example_luatex_tex.fontidentifier:
	$(E_LUATEX) tex/fontidentifier
example_luatex_tex.fontname:
	$(E_LUATEX) tex/fontname
example_luatex_tex.formatname:
	$(E_LUATEX) tex/formatname
example_luatex_tex.get:
	$(E_LUATEX) tex/get
example_luatex_tex.get_glue:
	$(E_LUATEX) tex/get_glue
example_luatex_tex.getbox:
	$(E_LUATEX) tex/getbox
example_luatex_tex.getcatcode:
	$(E_LUATEX) tex/getcatcode
example_luatex_tex.getmathcode:
	$(E_LUATEX) tex/getmathcode
example_luatex_tex.getmathcodes:
	$(E_LUATEX) tex/getmathcodes
example_luatex_tex.hashtokens:
	$(E_LUATEX) tex/hashtokens
example_luatex_tex.isbox:
	$(E_LUATEX) tex/isbox
example_luatex_tex.jobname:
	$(E_LUATEX) tex/jobname
example_luatex_tex.lccode:
	$(E_LUATEX) tex/lccode
example_luatex_tex.luatexbanner:
	$(E_LUATEX) tex/luatexbanner
example_luatex_tex.luatexrevision:
	$(E_LUATEX) tex/luatexrevision
example_luatex_tex.mathcode:
	$(E_LUATEX) tex/mathcode
example_luatex_tex.number:
	$(E_LUATEX) tex/number
example_luatex_tex.print:
	$(E_LUATEX) tex/print
example_luatex_tex.romannumeral:
	$(E_LUATEX) tex/romannumeral
example_luatex_tex.runtoks:
	$(E_LUATEX) tex/runtoks
example_luatex_tex.scantoks:
	$(E_LUATEX) tex/scantoks
example_luatex_tex.setbox:
	$(E_LUATEX) tex/setbox
example_luatex_tex.setcatcode:
	$(E_LUATEX) tex/setcatcode
example_luatex_tex.settoks:
	$(E_LUATEX) tex/settoks
example_luatex_tex.sfcode:
	$(E_LUATEX) tex/sfcode
example_luatex_tex.sp:
	$(E_LUATEX) tex/sp
example_luatex_tex.sprint:
	$(E_LUATEX) tex/sprint
example_luatex_tex.tprint:
	$(E_LUATEX) tex/tprint
example_luatex_tex.uccode:
	$(E_LUATEX) tex/uccode
example_luatex_tex.write:
	$(E_LUATEX) tex/write

### texconfig

example_luatex_texconfig: example_luatex_texconfig.texconfig
example_luatex_texconfig.texconfig:
	$(E_LUATEX) texconfig/texconfig

### texio

example_luatex_texio: example_luatex_texio.write
example_luatex_texio.write:
	$(E_LUATEX) texio/write

### token

example_luatex_token: example_luatex_token._catcodes \
	example_luatex_token._get_next_while-to-end \
	example_luatex_token._par-insertion \
	example_luatex_token._token-object \
	example_luatex_token.biggest_char \
	example_luatex_token.command_id \
	example_luatex_token.commands \
	example_luatex_token.create \
	example_luatex_token.expand \
	example_luatex_token.expand_ng \
	example_luatex_token.get_macro \
	example_luatex_token.get_meaning \
	example_luatex_token.get_next \
	example_luatex_token.is_defined \
	example_luatex_token.is_token \
	example_luatex_token.new \
	example_luatex_token.scan_argument \
	example_luatex_token.scan_dimen \
	example_luatex_token.scan_float \
	example_luatex_token.scan_glue \
	example_luatex_token.scan_int \
	example_luatex_token.scan_keyword \
	example_luatex_token.scan_keyword_cs \
	example_luatex_token.scan_real \
	example_luatex_token.scan_string \
	example_luatex_token.scan_token \
	example_luatex_token.scan_toks \
	example_luatex_token.set_char \
	example_luatex_token.set_lua \
	example_luatex_token.set_macro \
	example_luatex_token.type
example_luatex_token._catcodes:
	$(E_LUATEX) token/_catcodes
example_luatex_token._get_next_while-to-end:
	$(E_LUATEX) token/_get_next_while-to-end
example_luatex_token._par-insertion:
	$(E_LUATEX) token/_par-insertion
example_luatex_token._token-object:
	$(E_LUATEX) token/_token-object
example_luatex_token.biggest_char:
	$(E_LUATEX) token/biggest_char
example_luatex_token.command_id:
	$(E_LUATEX) token/command_id
example_luatex_token.commands:
	$(E_LUATEX) token/commands
example_luatex_token.create:
	$(E_LUATEX) token/create
example_luatex_token.expand:
	$(E_LUATEX) token/expand
example_luatex_token.expand_ng:
	$(E_LUATEX) token/expand_ng
example_luatex_token.get_macro:
	$(E_LUATEX) token/get_macro
example_luatex_token.get_meaning:
	$(E_LUATEX) token/get_meaning
example_luatex_token.get_next:
	$(E_LUATEX) token/get_next
example_luatex_token.is_defined:
	$(E_LUATEX) token/is_defined
example_luatex_token.is_token:
	$(E_LUATEX) token/is_token
example_luatex_token.new:
	$(E_LUATEX) token/new
example_luatex_token.scan_argument:
	$(E_LUATEX) token/scan_argument
example_luatex_token.scan_dimen:
	$(E_LUATEX) token/scan_dimen
example_luatex_token.scan_float:
	$(E_LUATEX) token/scan_float
example_luatex_token.scan_glue:
	$(E_LUATEX) token/scan_glue
example_luatex_token.scan_int:
	$(E_LUATEX) token/scan_int
example_luatex_token.scan_keyword:
	$(E_LUATEX) token/scan_keyword
example_luatex_token.scan_keyword_cs:
	$(E_LUATEX) token/scan_keyword_cs
example_luatex_token.scan_real:
	$(E_LUATEX) token/scan_real
example_luatex_token.scan_string:
	$(E_LUATEX) token/scan_string
example_luatex_token.scan_token:
	$(E_LUATEX) token/scan_token
example_luatex_token.scan_toks:
	$(E_LUATEX) token/scan_toks
example_luatex_token.set_char:
	$(E_LUATEX) token/set_char
example_luatex_token.set_lua:
	$(E_LUATEX) token/set_lua
example_luatex_token.set_macro:
	$(E_LUATEX) token/set_macro
example_luatex_token.type:
	$(E_LUATEX) token/type

### unicode

example_luatex_unicode: example_luatex_unicode.all
example_luatex_unicode.all:
	$(E_LUATEX) unicode/all

### zip

example_luatex_zip: example_luatex_zip.close \
	example_luatex_zip.open \
	example_luatex_zip.openfile \
	example_luatex_zip.type
example_luatex_zip.close:
	$(E_LUATEX) zip/close
example_luatex_zip.open:
	$(E_LUATEX) zip/open
example_luatex_zip.openfile:
	$(E_LUATEX) zip/openfile
example_luatex_zip.type:
	$(E_LUATEX) zip/type

### zlib

example_luatex_zlib: example_luatex_zlib.adler32 \
	example_luatex_zlib.all \
	example_luatex_zlib.compress \
	example_luatex_zlib.compressobj \
	example_luatex_zlib.crc32 \
	example_luatex_zlib.decompress \
	example_luatex_zlib.decompressobj \
	example_luatex_zlib.deflate \
	example_luatex_zlib.version
example_luatex_zlib.adler32:
	$(E_LUATEX) zlib/adler32
example_luatex_zlib.all:
	$(E_LUATEX) zlib/all
example_luatex_zlib.compress:
	$(E_LUATEX) zlib/compress
example_luatex_zlib.compressobj:
	$(E_LUATEX) zlib/compressobj
example_luatex_zlib.crc32:
	$(E_LUATEX) zlib/crc32
example_luatex_zlib.decompress:
	$(E_LUATEX) zlib/decompress
example_luatex_zlib.decompressobj:
	$(E_LUATEX) zlib/decompressobj
example_luatex_zlib.deflate:
	$(E_LUATEX) zlib/deflate
example_luatex_zlib.version:
	$(E_LUATEX) zlib/version
