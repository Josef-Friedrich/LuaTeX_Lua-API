jobname = luatex-type-definitions
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

.PHONY: all
all: format stylua

.PHONY: format
format: stylua
	./manage.py format

.PHONY: format
convert:
	./manage.py convert

.PHONY:
stylua:
	stylua --config-path ./stylua.toml library
	stylua --config-path ./stylua.toml examples

.PHONY:
debug:
	luatex --luaonly debug.lua

.PHONY:
print_namespace:
	luatex resources/print-namespace.tex

.PHONY:
generate_doc:
	$(HOME)/.vscode/extensions/sumneko.lua-3.6.8-linux-x64/server/bin/lua-language-server --doc library

# https://github.com/LuaLS/LuaParser
.PHONY:
luaparser_install:
	sudo luarocks install lpeglabel
	rm -rf /tmp/LuaParser
	git clone https://github.com/LuaLS/LuaParser.git /tmp/LuaParser
	sudo rsync -av --delete /tmp/LuaParser/src/parser/  /usr/local/share/lua/5.3/parser/
	sudo cp /tmp/LuaParser/src/utility.lua /usr/local/share/lua/5.3/utility.lua

.PHONY:
luaparser_download:
	sudo luarocks install lpeglabel
	./manage.py parser

.PHONY:
luaparser:
	cd parser; lua _tex-doc-generator.lua

.PHONY:
luaparser_test:
	cd parser; busted _test.lua

.PHONY:
dist:
	./manage.py dist

.PHONY:
update_lls_addons:
	resources/update-lls-addons.sh

.PHONY:
submodules:
	git submodule foreach --recursive git clean -xfd
	git submodule foreach --recursive git reset --hard
	git submodule update --init --recursive --remote

.PHONY:
test:
	./manage.py test

.PHONY:
diff:
	resources/patch.sh diff

.PHONY:
patch:
	resources/patch.sh patch

.PHONY:
doc:
	lualatex --shell-escape $(jobname)-doc.tex
	makeindex -s gglo.ist -o $(jobname)-doc.gls $(jobname)-doc.glo
	makeindex -s gind.ist -o $(jobname)-doc.ind $(jobname)-doc.idx
	lualatex --shell-escape $(jobname)-doc.tex
	mkdir -p $(texmf)/doc
	cp $(jobname)-doc.pdf $(texmf)/doc/$(jobname).pdf

.PHONY:
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

.PHONY:
clean:
	git clean -dfX

.PHONY:
download_manuals:
	./manage.py manuals

.PHONY:
update_manual:
	wget -O /usr/local/texlive/texmf-dist/doc/luatex/base/luatex.pdf https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/luatex.pdf
	wget -O /usr/local/texlive/texmf-dist/doc/context/documents/general/manuals/luametatex.pdf https://raw.githubusercontent.com/contextgarden/context/main/doc/context/documents/general/manuals/luametatex.pdf

LUATEX = ./manage.py example --print-docstring --subproject luatex

.PHONY:
namespace_luametatex:
	$(LUATEX) luametatex/namespace.lua
.PHONY:
namespace_luametatex_luaonly:
	luametatex --luaonly examples/luatex/namespace.lua

.PHONY:
namespace_luatex:
	$(LUATEX) namespace.lua
.PHONY:
namespace_luatex_luaonly:
	luatex --luaonly examples/luatex/namespace_luaonly.lua

# examples

## lualibs

E_LUALIBS = ./manage.py example --subproject lualibs

### io

example_lualibs_io: \
	example_lualibs_io_ask \
	example_lualibs_io_bytes \
	example_lualibs_io_characters \
	example_lualibs_io_exists \
	example_lualibs_io_loaddata \
	example_lualibs_io_noflines \
	example_lualibs_io_readnumber \
	example_lualibs_io_readstring \
	example_lualibs_io_savedata \
	example_lualibs_io_size
example_lualibs_io_ask:
	$(E_LUALIBS) io/ask
example_lualibs_io_bytes:
	$(E_LUALIBS) io/bytes
example_lualibs_io_characters:
	$(E_LUALIBS) io/characters
example_lualibs_io_exists:
	$(E_LUALIBS) io/exists
example_lualibs_io_loaddata:
	$(E_LUALIBS) io/loaddata
example_lualibs_io_noflines:
	$(E_LUALIBS) io/noflines
example_lualibs_io_readnumber:
	$(E_LUALIBS) io/readnumber
example_lualibs_io_readstring:
	$(E_LUALIBS) io/readstring
example_lualibs_io_savedata:
	$(E_LUALIBS) io/savedata
example_lualibs_io_size:
	$(E_LUALIBS) io/size

### lpeg

example_lualibs_lpeg: \
	example_lualibs_lpeg_firstofsplit \
	example_lualibs_lpeg_replacer \
	example_lualibs_lpeg_secondofsplit \
	example_lualibs_lpeg_splitat \
	example_lualibs_lpeg_stripper
example_lualibs_lpeg_firstofsplit:
	$(E_LUALIBS) lpeg/firstofsplit
example_lualibs_lpeg_replacer:
	$(E_LUALIBS) lpeg/replacer
example_lualibs_lpeg_secondofsplit:
	$(E_LUALIBS) lpeg/secondofsplit
example_lualibs_lpeg_splitat:
	$(E_LUALIBS) lpeg/splitat
example_lualibs_lpeg_stripper:
	$(E_LUALIBS) lpeg/stripper

### string

example_lualibs_string: \
	example_lualibs_string_checkedsplit \
	example_lualibs_string_collapsespaces \
	example_lualibs_string_containsws \
	example_lualibs_string_count \
	example_lualibs_string_escapedpattern \
	example_lualibs_string_formatter \
	example_lualibs_string_fullstrip \
	example_lualibs_string_limit \
	example_lualibs_string_longtostring \
	example_lualibs_string_nospaces \
	example_lualibs_string_quote \
	example_lualibs_string_quoted \
	example_lualibs_string_split \
	example_lualibs_string_strip \
	example_lualibs_string_texnewlines \
	example_lualibs_string_toHEX_uppercase \
	example_lualibs_string_tobytes \
	example_lualibs_string_todec \
	example_lualibs_string_todimen \
	example_lualibs_string_tohex_lowercase \
	example_lualibs_string_unquote \
	example_lualibs_string_unquoted \
	example_lualibs_string_utfpadding \
	example_lualibs_string_wordsplitter
example_lualibs_string_checkedsplit:
	$(E_LUALIBS) string/checkedsplit
example_lualibs_string_collapsespaces:
	$(E_LUALIBS) string/collapsespaces
example_lualibs_string_containsws:
	$(E_LUALIBS) string/containsws
example_lualibs_string_count:
	$(E_LUALIBS) string/count
example_lualibs_string_escapedpattern:
	$(E_LUALIBS) string/escapedpattern
example_lualibs_string_formatter:
	$(E_LUALIBS) string/formatter
example_lualibs_string_fullstrip:
	$(E_LUALIBS) string/fullstrip
example_lualibs_string_limit:
	$(E_LUALIBS) string/limit
example_lualibs_string_longtostring:
	$(E_LUALIBS) string/longtostring
example_lualibs_string_nospaces:
	$(E_LUALIBS) string/nospaces
example_lualibs_string_quote:
	$(E_LUALIBS) string/quote
example_lualibs_string_quoted:
	$(E_LUALIBS) string/quoted
example_lualibs_string_split:
	$(E_LUALIBS) string/split
example_lualibs_string_strip:
	$(E_LUALIBS) string/strip
example_lualibs_string_texnewlines:
	$(E_LUALIBS) string/texnewlines
example_lualibs_string_toHEX_uppercase:
	$(E_LUALIBS) string/toHEX_uppercase
example_lualibs_string_tobytes:
	$(E_LUALIBS) string/tobytes
example_lualibs_string_todec:
	$(E_LUALIBS) string/todec
example_lualibs_string_todimen:
	$(E_LUALIBS) string/todimen
example_lualibs_string_tohex_lowercase:
	$(E_LUALIBS) string/tohex_lowercase
example_lualibs_string_unquote:
	$(E_LUALIBS) string/unquote
example_lualibs_string_unquoted:
	$(E_LUALIBS) string/unquoted
example_lualibs_string_utfpadding:
	$(E_LUALIBS) string/utfpadding
example_lualibs_string_wordsplitter:
	$(E_LUALIBS) string/wordsplitter

### table

example_lualibs_table: \
	example_lualibs_table_append \
	example_lualibs_table_are_equal \
	example_lualibs_table_fromhash \
	example_lualibs_table_identical \
	example_lualibs_table_mirrored \
	example_lualibs_table_prepend \
	example_lualibs_table_reverse \
	example_lualibs_table_reversed \
	example_lualibs_table_serialize \
	example_lualibs_table_swapped \
	example_lualibs_table_tohash
example_lualibs_table_append:
	$(E_LUALIBS) table/append
example_lualibs_table_are_equal:
	$(E_LUALIBS) table/are_equal
example_lualibs_table_fromhash:
	$(E_LUALIBS) table/fromhash
example_lualibs_table_identical:
	$(E_LUALIBS) table/identical
example_lualibs_table_mirrored:
	$(E_LUALIBS) table/mirrored
example_lualibs_table_prepend:
	$(E_LUALIBS) table/prepend
example_lualibs_table_reverse:
	$(E_LUALIBS) table/reverse
example_lualibs_table_reversed:
	$(E_LUALIBS) table/reversed
example_lualibs_table_serialize:
	$(E_LUALIBS) table/serialize
example_lualibs_table_swapped:
	$(E_LUALIBS) table/swapped
example_lualibs_table_tohash:
	$(E_LUALIBS) table/tohash

### url

example_lualibs_url: \
	example_lualibs_url_query \
	example_lualibs_url_toquery
example_lualibs_url_query:
	$(E_LUALIBS) url/query
example_lualibs_url_toquery:
	$(E_LUALIBS) url/toquery

### utilities

example_lualibs_utilities: \


## luametatex

E_LUAMETATEX = ./manage.py example --subproject luametatex

### status

example_luametatex_status: \
	example_luametatex_status_getbufferstate \
	example_luametatex_status_list
example_luametatex_status_getbufferstate:
	$(E_LUAMETATEX) status/getbufferstate
example_luametatex_status_list:
	$(E_LUAMETATEX) status/list

### xcomplex

example_luametatex_xcomplex: \
	example_luametatex_xcomplex_new \
	example_luametatex_xcomplex_topair \
	example_luametatex_xcomplex_tostring \
	example_luametatex_xcomplex_totable
example_luametatex_xcomplex_new:
	$(E_LUAMETATEX) xcomplex/new
example_luametatex_xcomplex_topair:
	$(E_LUAMETATEX) xcomplex/topair
example_luametatex_xcomplex_tostring:
	$(E_LUAMETATEX) xcomplex/tostring
example_luametatex_xcomplex_totable:
	$(E_LUAMETATEX) xcomplex/totable

## luatex

E_LUATEX = ./manage.py example --subproject luatex

### callback

example_luatex_callback: \
	example_luatex_callback_process_pdf_image_content \
	example_luatex_callback_process_pdf_image_content copy
example_luatex_callback_process_pdf_image_content:
	$(E_LUATEX) callback/process_pdf_image_content
example_luatex_callback_process_pdf_image_content copy:
	$(E_LUATEX) callback/process_pdf_image_content copy

### fio

example_luatex_fio: \
	example_luatex_fio_read2dot14 \
	example_luatex_fio_readbytes \
	example_luatex_fio_readbytetable \
	example_luatex_fio_readcardinal1 \
	example_luatex_fio_readcardinal2 \
	example_luatex_fio_readcardinal3 \
	example_luatex_fio_readcardinal4 \
	example_luatex_fio_readfixed2 \
	example_luatex_fio_readfixed4 \
	example_luatex_fio_readinteger1le \
	example_luatex_fio_readinteger2le \
	example_luatex_fio_readinteger3le \
	example_luatex_fio_readinteger4le \
	example_luatex_fio_readline
example_luatex_fio_read2dot14:
	$(E_LUATEX) fio/read2dot14
example_luatex_fio_readbytes:
	$(E_LUATEX) fio/readbytes
example_luatex_fio_readbytetable:
	$(E_LUATEX) fio/readbytetable
example_luatex_fio_readcardinal1:
	$(E_LUATEX) fio/readcardinal1
example_luatex_fio_readcardinal2:
	$(E_LUATEX) fio/readcardinal2
example_luatex_fio_readcardinal3:
	$(E_LUATEX) fio/readcardinal3
example_luatex_fio_readcardinal4:
	$(E_LUATEX) fio/readcardinal4
example_luatex_fio_readfixed2:
	$(E_LUATEX) fio/readfixed2
example_luatex_fio_readfixed4:
	$(E_LUATEX) fio/readfixed4
example_luatex_fio_readinteger1le:
	$(E_LUATEX) fio/readinteger1le
example_luatex_fio_readinteger2le:
	$(E_LUATEX) fio/readinteger2le
example_luatex_fio_readinteger3le:
	$(E_LUATEX) fio/readinteger3le
example_luatex_fio_readinteger4le:
	$(E_LUATEX) fio/readinteger4le
example_luatex_fio_readline:
	$(E_LUATEX) fio/readline

### font

example_luatex_font: \
	example_luatex_font_definefont \
	example_luatex_font_each \
	example_luatex_font_getcopy \
	example_luatex_font_getparameters \
	example_luatex_font_read_tfm \
	example_luatex_font_read_vf
example_luatex_font_definefont:
	$(E_LUATEX) font/definefont
example_luatex_font_each:
	$(E_LUATEX) font/each
example_luatex_font_getcopy:
	$(E_LUATEX) font/getcopy
example_luatex_font_getparameters:
	$(E_LUATEX) font/getparameters
example_luatex_font_read_tfm:
	$(E_LUATEX) font/read_tfm
example_luatex_font_read_vf:
	$(E_LUATEX) font/read_vf

### fontloader

example_luatex_fontloader: \
	example_luatex_fontloader_Fontinfo \
	example_luatex_fontloader_FontloaderPfminfo \
	example_luatex_fontloader_close \
	example_luatex_fontloader_fields \
	example_luatex_fontloader_info \
	example_luatex_fontloader_open \
	example_luatex_fontloader_table_glyphs \
	example_luatex_fontloader_table_map \
	example_luatex_fontloader_table_root \
	example_luatex_fontloader_to_table
example_luatex_fontloader_Fontinfo:
	$(E_LUATEX) fontloader/Fontinfo
example_luatex_fontloader_FontloaderPfminfo:
	$(E_LUATEX) fontloader/FontloaderPfminfo
example_luatex_fontloader_close:
	$(E_LUATEX) fontloader/close
example_luatex_fontloader_fields:
	$(E_LUATEX) fontloader/fields
example_luatex_fontloader_info:
	$(E_LUATEX) fontloader/info
example_luatex_fontloader_open:
	$(E_LUATEX) fontloader/open
example_luatex_fontloader_table_glyphs:
	$(E_LUATEX) fontloader/table_glyphs
example_luatex_fontloader_table_map:
	$(E_LUATEX) fontloader/table_map
example_luatex_fontloader_table_root:
	$(E_LUATEX) fontloader/table_root
example_luatex_fontloader_to_table:
	$(E_LUATEX) fontloader/to_table

### gzip

example_luatex_gzip: \
	example_luatex_gzip_close \
	example_luatex_gzip_lines \
	example_luatex_gzip_open
example_luatex_gzip_close:
	$(E_LUATEX) gzip/close
example_luatex_gzip_lines:
	$(E_LUATEX) gzip/lines
example_luatex_gzip_open:
	$(E_LUATEX) gzip/open

### img

example_luatex_img: \
	example_luatex_img_boxes \
	example_luatex_img_copy \
	example_luatex_img_fields \
	example_luatex_img_keys \
	example_luatex_img_types
example_luatex_img_boxes:
	$(E_LUATEX) img/boxes
example_luatex_img_copy:
	$(E_LUATEX) img/copy
example_luatex_img_fields:
	$(E_LUATEX) img/fields
example_luatex_img_keys:
	$(E_LUATEX) img/keys
example_luatex_img_types:
	$(E_LUATEX) img/types

### lang

example_luatex_lang: \
	example_luatex_lang_Language:clear_hyphenation \
	example_luatex_lang_clean \
	example_luatex_lang_clear_hyphenation \
	example_luatex_lang_hyphenation \
	example_luatex_lang_id \
	example_luatex_lang_new \
	example_luatex_lang_patterns
example_luatex_lang_Language:clear_hyphenation:
	$(E_LUATEX) lang/Language:clear_hyphenation
example_luatex_lang_clean:
	$(E_LUATEX) lang/clean
example_luatex_lang_clear_hyphenation:
	$(E_LUATEX) lang/clear_hyphenation
example_luatex_lang_hyphenation:
	$(E_LUATEX) lang/hyphenation
example_luatex_lang_id:
	$(E_LUATEX) lang/id
example_luatex_lang_new:
	$(E_LUATEX) lang/new
example_luatex_lang_patterns:
	$(E_LUATEX) lang/patterns

### lpeg

example_luatex_lpeg: \
	example_luatex_lpeg_C \
	example_luatex_lpeg_Cf \
	example_luatex_lpeg_Cp \
	example_luatex_lpeg_Cs \
	example_luatex_lpeg_R \
	example_luatex_lpeg_V \
	example_luatex_lpeg_locale \
	example_luatex_lpeg_match
example_luatex_lpeg_C:
	$(E_LUATEX) lpeg/C
example_luatex_lpeg_Cf:
	$(E_LUATEX) lpeg/Cf
example_luatex_lpeg_Cp:
	$(E_LUATEX) lpeg/Cp
example_luatex_lpeg_Cs:
	$(E_LUATEX) lpeg/Cs
example_luatex_lpeg_R:
	$(E_LUATEX) lpeg/R
example_luatex_lpeg_V:
	$(E_LUATEX) lpeg/V
example_luatex_lpeg_locale:
	$(E_LUATEX) lpeg/locale
example_luatex_lpeg_match:
	$(E_LUATEX) lpeg/match

### lua

example_luatex_lua: \
	example_luatex_lua_get_functions_table \
	example_luatex_lua_getluaname \
	example_luatex_lua_setbytecode \
	example_luatex_lua_setluaname
example_luatex_lua_get_functions_table:
	$(E_LUATEX) lua/get_functions_table
example_luatex_lua_getluaname:
	$(E_LUATEX) lua/getluaname
example_luatex_lua_setbytecode:
	$(E_LUATEX) lua/setbytecode
example_luatex_lua_setluaname:
	$(E_LUATEX) lua/setluaname

### luaharfbuzz

example_luatex_luaharfbuzz: \
	example_luatex_luaharfbuzz_Buffer \
	example_luatex_luaharfbuzz_Direction \
	example_luatex_luaharfbuzz_shapers \
	example_luatex_luaharfbuzz_version
example_luatex_luaharfbuzz_Buffer:
	$(E_LUATEX) luaharfbuzz/Buffer
example_luatex_luaharfbuzz_Direction:
	$(E_LUATEX) luaharfbuzz/Direction
example_luatex_luaharfbuzz_shapers:
	$(E_LUATEX) luaharfbuzz/shapers
example_luatex_luaharfbuzz_version:
	$(E_LUATEX) luaharfbuzz/version

### md5

example_luatex_md5: \
	example_luatex_md5_crypt \
	example_luatex_md5_decrypt \
	example_luatex_md5_exor \
	example_luatex_md5_sum \
	example_luatex_md5_sumHEXA_uppercase \
	example_luatex_md5_sumhexa_lowercase
example_luatex_md5_crypt:
	$(E_LUATEX) md5/crypt
example_luatex_md5_decrypt:
	$(E_LUATEX) md5/decrypt
example_luatex_md5_exor:
	$(E_LUATEX) md5/exor
example_luatex_md5_sum:
	$(E_LUATEX) md5/sum
example_luatex_md5_sumHEXA_uppercase:
	$(E_LUATEX) md5/sumHEXA_uppercase
example_luatex_md5_sumhexa_lowercase:
	$(E_LUATEX) md5/sumhexa_lowercase

### mplib

example_luatex_mplib: \
	example_luatex_mplib_execute \
	example_luatex_mplib_min-test \
	example_luatex_mplib_mplib.new \
	example_luatex_mplib_myluamplib \
	example_luatex_mplib_new \
	example_luatex_mplib_statistics \
	example_luatex_mplib_test \
	example_luatex_mplib_version \
	example_luatex_mplib_wikitex
example_luatex_mplib_execute:
	$(E_LUATEX) mplib/execute
example_luatex_mplib_min-test:
	$(E_LUATEX) mplib/min-test
example_luatex_mplib_mplib.new:
	$(E_LUATEX) mplib/mplib.new
example_luatex_mplib_myluamplib:
	$(E_LUATEX) mplib/myluamplib
example_luatex_mplib_new:
	$(E_LUATEX) mplib/new
example_luatex_mplib_statistics:
	$(E_LUATEX) mplib/statistics
example_luatex_mplib_test:
	$(E_LUATEX) mplib/test
example_luatex_mplib_version:
	$(E_LUATEX) mplib/version
example_luatex_mplib_wikitex:
	$(E_LUATEX) mplib/wikitex

### node

example_luatex_node: \
	example_luatex_node_Node_AttributeListNode \
	example_luatex_node_Node_AttributeNode \
	example_luatex_node_Node_FenceNode \
	example_luatex_node_Node_LateLuaWhatsitNode \
	example_luatex_node_Node_ShapeNode \
	example_luatex_node__node-info \
	example_luatex_node_direct.getdir \
	example_luatex_node_direct.getdirection \
	example_luatex_node_direct.getlist \
	example_luatex_node_direct.setlist \
	example_luatex_node_direct.setwhd \
	example_luatex_node_direct.setwidth \
	example_luatex_node_direct.tostring \
	example_luatex_node_direct.usedlist \
	example_luatex_node_fields \
	example_luatex_node_getboth \
	example_luatex_node_getchar \
	example_luatex_node_getfield \
	example_luatex_node_getfont \
	example_luatex_node_getid \
	example_luatex_node_getlist \
	example_luatex_node_getnext \
	example_luatex_node_getprev \
	example_luatex_node_getsubtype \
	example_luatex_node_id \
	example_luatex_node_is_char \
	example_luatex_node_is_glyph \
	example_luatex_node_remove \
	example_luatex_node_setfield \
	example_luatex_node_subtype \
	example_luatex_node_subtypes \
	example_luatex_node_todirect \
	example_luatex_node_tonode \
	example_luatex_node_tostring \
	example_luatex_node_traverse \
	example_luatex_node_type \
	example_luatex_node_types \
	example_luatex_node_usedlist \
	example_luatex_node_values \
	example_luatex_node_whatsits
example_luatex_node_Node_AttributeListNode:
	$(E_LUATEX) node/Node_AttributeListNode
example_luatex_node_Node_AttributeNode:
	$(E_LUATEX) node/Node_AttributeNode
example_luatex_node_Node_FenceNode:
	$(E_LUATEX) node/Node_FenceNode
example_luatex_node_Node_LateLuaWhatsitNode:
	$(E_LUATEX) node/Node_LateLuaWhatsitNode
example_luatex_node_Node_ShapeNode:
	$(E_LUATEX) node/Node_ShapeNode
example_luatex_node__node-info:
	$(E_LUATEX) node/_node-info
example_luatex_node_direct.getdir:
	$(E_LUATEX) node/direct.getdir
example_luatex_node_direct.getdirection:
	$(E_LUATEX) node/direct.getdirection
example_luatex_node_direct.getlist:
	$(E_LUATEX) node/direct.getlist
example_luatex_node_direct.setlist:
	$(E_LUATEX) node/direct.setlist
example_luatex_node_direct.setwhd:
	$(E_LUATEX) node/direct.setwhd
example_luatex_node_direct.setwidth:
	$(E_LUATEX) node/direct.setwidth
example_luatex_node_direct.tostring:
	$(E_LUATEX) node/direct.tostring
example_luatex_node_direct.usedlist:
	$(E_LUATEX) node/direct.usedlist
example_luatex_node_fields:
	$(E_LUATEX) node/fields
example_luatex_node_getboth:
	$(E_LUATEX) node/getboth
example_luatex_node_getchar:
	$(E_LUATEX) node/getchar
example_luatex_node_getfield:
	$(E_LUATEX) node/getfield
example_luatex_node_getfont:
	$(E_LUATEX) node/getfont
example_luatex_node_getid:
	$(E_LUATEX) node/getid
example_luatex_node_getlist:
	$(E_LUATEX) node/getlist
example_luatex_node_getnext:
	$(E_LUATEX) node/getnext
example_luatex_node_getprev:
	$(E_LUATEX) node/getprev
example_luatex_node_getsubtype:
	$(E_LUATEX) node/getsubtype
example_luatex_node_id:
	$(E_LUATEX) node/id
example_luatex_node_is_char:
	$(E_LUATEX) node/is_char
example_luatex_node_is_glyph:
	$(E_LUATEX) node/is_glyph
example_luatex_node_remove:
	$(E_LUATEX) node/remove
example_luatex_node_setfield:
	$(E_LUATEX) node/setfield
example_luatex_node_subtype:
	$(E_LUATEX) node/subtype
example_luatex_node_subtypes:
	$(E_LUATEX) node/subtypes
example_luatex_node_todirect:
	$(E_LUATEX) node/todirect
example_luatex_node_tonode:
	$(E_LUATEX) node/tonode
example_luatex_node_tostring:
	$(E_LUATEX) node/tostring
example_luatex_node_traverse:
	$(E_LUATEX) node/traverse
example_luatex_node_type:
	$(E_LUATEX) node/type
example_luatex_node_types:
	$(E_LUATEX) node/types
example_luatex_node_usedlist:
	$(E_LUATEX) node/usedlist
example_luatex_node_values:
	$(E_LUATEX) node/values
example_luatex_node_whatsits:
	$(E_LUATEX) node/whatsits

### os

example_luatex_os: \
	example_luatex_os_exec \
	example_luatex_os_gettimeofday \
	example_luatex_os_name \
	example_luatex_os_sleep \
	example_luatex_os_spawn \
	example_luatex_os_times \
	example_luatex_os_tmpdir \
	example_luatex_os_type \
	example_luatex_os_uname
example_luatex_os_exec:
	$(E_LUATEX) os/exec
example_luatex_os_gettimeofday:
	$(E_LUATEX) os/gettimeofday
example_luatex_os_name:
	$(E_LUATEX) os/name
example_luatex_os_sleep:
	$(E_LUATEX) os/sleep
example_luatex_os_spawn:
	$(E_LUATEX) os/spawn
example_luatex_os_times:
	$(E_LUATEX) os/times
example_luatex_os_tmpdir:
	$(E_LUATEX) os/tmpdir
example_luatex_os_type:
	$(E_LUATEX) os/type
example_luatex_os_uname:
	$(E_LUATEX) os/uname

### pdf

example_luatex_pdf: \
	example_luatex_pdf_getcreationdate
example_luatex_pdf_getcreationdate:
	$(E_LUATEX) pdf/getcreationdate

### pdfscanner

example_luatex_pdfscanner: \
	example_luatex_pdfscanner_scan
example_luatex_pdfscanner_scan:
	$(E_LUATEX) pdfscanner/scan

### sio

example_luatex_sio: \
	example_luatex_sio_read2dot14 \
	example_luatex_sio_readbytes \
	example_luatex_sio_readbytetable \
	example_luatex_sio_readcardinal1 \
	example_luatex_sio_readcardinal1le \
	example_luatex_sio_readcardinal2 \
	example_luatex_sio_readcardinal2le \
	example_luatex_sio_readcardinal3 \
	example_luatex_sio_readcardinal3le \
	example_luatex_sio_readcardinal4 \
	example_luatex_sio_readcardinal4le \
	example_luatex_sio_readcardinaltable \
	example_luatex_sio_readfixed2 \
	example_luatex_sio_readfixed4 \
	example_luatex_sio_readinteger1 \
	example_luatex_sio_readinteger1le \
	example_luatex_sio_readinteger2 \
	example_luatex_sio_readinteger2le \
	example_luatex_sio_readinteger3 \
	example_luatex_sio_readinteger3le \
	example_luatex_sio_readinteger4 \
	example_luatex_sio_readinteger4le \
	example_luatex_sio_readintegertable
example_luatex_sio_read2dot14:
	$(E_LUATEX) sio/read2dot14
example_luatex_sio_readbytes:
	$(E_LUATEX) sio/readbytes
example_luatex_sio_readbytetable:
	$(E_LUATEX) sio/readbytetable
example_luatex_sio_readcardinal1:
	$(E_LUATEX) sio/readcardinal1
example_luatex_sio_readcardinal1le:
	$(E_LUATEX) sio/readcardinal1le
example_luatex_sio_readcardinal2:
	$(E_LUATEX) sio/readcardinal2
example_luatex_sio_readcardinal2le:
	$(E_LUATEX) sio/readcardinal2le
example_luatex_sio_readcardinal3:
	$(E_LUATEX) sio/readcardinal3
example_luatex_sio_readcardinal3le:
	$(E_LUATEX) sio/readcardinal3le
example_luatex_sio_readcardinal4:
	$(E_LUATEX) sio/readcardinal4
example_luatex_sio_readcardinal4le:
	$(E_LUATEX) sio/readcardinal4le
example_luatex_sio_readcardinaltable:
	$(E_LUATEX) sio/readcardinaltable
example_luatex_sio_readfixed2:
	$(E_LUATEX) sio/readfixed2
example_luatex_sio_readfixed4:
	$(E_LUATEX) sio/readfixed4
example_luatex_sio_readinteger1:
	$(E_LUATEX) sio/readinteger1
example_luatex_sio_readinteger1le:
	$(E_LUATEX) sio/readinteger1le
example_luatex_sio_readinteger2:
	$(E_LUATEX) sio/readinteger2
example_luatex_sio_readinteger2le:
	$(E_LUATEX) sio/readinteger2le
example_luatex_sio_readinteger3:
	$(E_LUATEX) sio/readinteger3
example_luatex_sio_readinteger3le:
	$(E_LUATEX) sio/readinteger3le
example_luatex_sio_readinteger4:
	$(E_LUATEX) sio/readinteger4
example_luatex_sio_readinteger4le:
	$(E_LUATEX) sio/readinteger4le
example_luatex_sio_readintegertable:
	$(E_LUATEX) sio/readintegertable

### socket

example_luatex_socket: \
	example_luatex_socket_gettime
example_luatex_socket_gettime:
	$(E_LUATEX) socket/gettime

### status

example_luatex_status: \
	example_luatex_status_list
example_luatex_status_list:
	$(E_LUATEX) status/list

### string

example_luatex_string: \
	example_luatex_string_bytepairs \
	example_luatex_string_bytes \
	example_luatex_string_characterpairs \
	example_luatex_string_characters \
	example_luatex_string_explode \
	example_luatex_string_utfcharacter \
	example_luatex_string_utfcharacters \
	example_luatex_string_utflength \
	example_luatex_string_utfvalue \
	example_luatex_string_utfvalues
example_luatex_string_bytepairs:
	$(E_LUATEX) string/bytepairs
example_luatex_string_bytes:
	$(E_LUATEX) string/bytes
example_luatex_string_characterpairs:
	$(E_LUATEX) string/characterpairs
example_luatex_string_characters:
	$(E_LUATEX) string/characters
example_luatex_string_explode:
	$(E_LUATEX) string/explode
example_luatex_string_utfcharacter:
	$(E_LUATEX) string/utfcharacter
example_luatex_string_utfcharacters:
	$(E_LUATEX) string/utfcharacters
example_luatex_string_utflength:
	$(E_LUATEX) string/utflength
example_luatex_string_utfvalue:
	$(E_LUATEX) string/utfvalue
example_luatex_string_utfvalues:
	$(E_LUATEX) string/utfvalues

### tex

example_luatex_tex: \
	example_luatex_tex_baselineskip \
	example_luatex_tex_catcode \
	example_luatex_tex_cprint \
	example_luatex_tex_delcode \
	example_luatex_tex_eTeXVersion \
	example_luatex_tex_eTeXrevision \
	example_luatex_tex_fontidentifier \
	example_luatex_tex_fontname \
	example_luatex_tex_formatname \
	example_luatex_tex_get \
	example_luatex_tex_get_glue \
	example_luatex_tex_getbox \
	example_luatex_tex_getcatcode \
	example_luatex_tex_getmathcode \
	example_luatex_tex_getmathcodes \
	example_luatex_tex_hashtokens \
	example_luatex_tex_isbox \
	example_luatex_tex_jobname \
	example_luatex_tex_lccode \
	example_luatex_tex_luatexbanner \
	example_luatex_tex_luatexrevision \
	example_luatex_tex_mathcode \
	example_luatex_tex_number \
	example_luatex_tex_print \
	example_luatex_tex_romannumeral \
	example_luatex_tex_runtoks \
	example_luatex_tex_scantoks \
	example_luatex_tex_setbox \
	example_luatex_tex_setcatcode \
	example_luatex_tex_settoks \
	example_luatex_tex_sfcode \
	example_luatex_tex_sp \
	example_luatex_tex_sprint \
	example_luatex_tex_tprint \
	example_luatex_tex_uccode \
	example_luatex_tex_write
example_luatex_tex_baselineskip:
	$(E_LUATEX) tex/baselineskip
example_luatex_tex_catcode:
	$(E_LUATEX) tex/catcode
example_luatex_tex_cprint:
	$(E_LUATEX) tex/cprint
example_luatex_tex_delcode:
	$(E_LUATEX) tex/delcode
example_luatex_tex_eTeXVersion:
	$(E_LUATEX) tex/eTeXVersion
example_luatex_tex_eTeXrevision:
	$(E_LUATEX) tex/eTeXrevision
example_luatex_tex_fontidentifier:
	$(E_LUATEX) tex/fontidentifier
example_luatex_tex_fontname:
	$(E_LUATEX) tex/fontname
example_luatex_tex_formatname:
	$(E_LUATEX) tex/formatname
example_luatex_tex_get:
	$(E_LUATEX) tex/get
example_luatex_tex_get_glue:
	$(E_LUATEX) tex/get_glue
example_luatex_tex_getbox:
	$(E_LUATEX) tex/getbox
example_luatex_tex_getcatcode:
	$(E_LUATEX) tex/getcatcode
example_luatex_tex_getmathcode:
	$(E_LUATEX) tex/getmathcode
example_luatex_tex_getmathcodes:
	$(E_LUATEX) tex/getmathcodes
example_luatex_tex_hashtokens:
	$(E_LUATEX) tex/hashtokens
example_luatex_tex_isbox:
	$(E_LUATEX) tex/isbox
example_luatex_tex_jobname:
	$(E_LUATEX) tex/jobname
example_luatex_tex_lccode:
	$(E_LUATEX) tex/lccode
example_luatex_tex_luatexbanner:
	$(E_LUATEX) tex/luatexbanner
example_luatex_tex_luatexrevision:
	$(E_LUATEX) tex/luatexrevision
example_luatex_tex_mathcode:
	$(E_LUATEX) tex/mathcode
example_luatex_tex_number:
	$(E_LUATEX) tex/number
example_luatex_tex_print:
	$(E_LUATEX) tex/print
example_luatex_tex_romannumeral:
	$(E_LUATEX) tex/romannumeral
example_luatex_tex_runtoks:
	$(E_LUATEX) tex/runtoks
example_luatex_tex_scantoks:
	$(E_LUATEX) tex/scantoks
example_luatex_tex_setbox:
	$(E_LUATEX) tex/setbox
example_luatex_tex_setcatcode:
	$(E_LUATEX) tex/setcatcode
example_luatex_tex_settoks:
	$(E_LUATEX) tex/settoks
example_luatex_tex_sfcode:
	$(E_LUATEX) tex/sfcode
example_luatex_tex_sp:
	$(E_LUATEX) tex/sp
example_luatex_tex_sprint:
	$(E_LUATEX) tex/sprint
example_luatex_tex_tprint:
	$(E_LUATEX) tex/tprint
example_luatex_tex_uccode:
	$(E_LUATEX) tex/uccode
example_luatex_tex_write:
	$(E_LUATEX) tex/write

### texconfig

example_luatex_texconfig: \
	example_luatex_texconfig_texconfig
example_luatex_texconfig_texconfig:
	$(E_LUATEX) texconfig/texconfig

### token

example_luatex_token: \
	example_luatex_token__catcodes \
	example_luatex_token__get_next_while-to-end \
	example_luatex_token__par-insertion \
	example_luatex_token__token-object \
	example_luatex_token_biggest_char \
	example_luatex_token_command_id \
	example_luatex_token_commands \
	example_luatex_token_create \
	example_luatex_token_expand \
	example_luatex_token_expand_ng \
	example_luatex_token_get_macro \
	example_luatex_token_get_meaning \
	example_luatex_token_get_next \
	example_luatex_token_is_defined \
	example_luatex_token_is_token \
	example_luatex_token_new \
	example_luatex_token_scan_argument \
	example_luatex_token_scan_dimen \
	example_luatex_token_scan_float \
	example_luatex_token_scan_glue \
	example_luatex_token_scan_int \
	example_luatex_token_scan_keyword \
	example_luatex_token_scan_keyword_cs \
	example_luatex_token_scan_real \
	example_luatex_token_scan_string \
	example_luatex_token_scan_token \
	example_luatex_token_scan_toks \
	example_luatex_token_set_char \
	example_luatex_token_set_lua \
	example_luatex_token_set_macro \
	example_luatex_token_type
example_luatex_token__catcodes:
	$(E_LUATEX) token/_catcodes
example_luatex_token__get_next_while-to-end:
	$(E_LUATEX) token/_get_next_while-to-end
example_luatex_token__par-insertion:
	$(E_LUATEX) token/_par-insertion
example_luatex_token__token-object:
	$(E_LUATEX) token/_token-object
example_luatex_token_biggest_char:
	$(E_LUATEX) token/biggest_char
example_luatex_token_command_id:
	$(E_LUATEX) token/command_id
example_luatex_token_commands:
	$(E_LUATEX) token/commands
example_luatex_token_create:
	$(E_LUATEX) token/create
example_luatex_token_expand:
	$(E_LUATEX) token/expand
example_luatex_token_expand_ng:
	$(E_LUATEX) token/expand_ng
example_luatex_token_get_macro:
	$(E_LUATEX) token/get_macro
example_luatex_token_get_meaning:
	$(E_LUATEX) token/get_meaning
example_luatex_token_get_next:
	$(E_LUATEX) token/get_next
example_luatex_token_is_defined:
	$(E_LUATEX) token/is_defined
example_luatex_token_is_token:
	$(E_LUATEX) token/is_token
example_luatex_token_new:
	$(E_LUATEX) token/new
example_luatex_token_scan_argument:
	$(E_LUATEX) token/scan_argument
example_luatex_token_scan_dimen:
	$(E_LUATEX) token/scan_dimen
example_luatex_token_scan_float:
	$(E_LUATEX) token/scan_float
example_luatex_token_scan_glue:
	$(E_LUATEX) token/scan_glue
example_luatex_token_scan_int:
	$(E_LUATEX) token/scan_int
example_luatex_token_scan_keyword:
	$(E_LUATEX) token/scan_keyword
example_luatex_token_scan_keyword_cs:
	$(E_LUATEX) token/scan_keyword_cs
example_luatex_token_scan_real:
	$(E_LUATEX) token/scan_real
example_luatex_token_scan_string:
	$(E_LUATEX) token/scan_string
example_luatex_token_scan_token:
	$(E_LUATEX) token/scan_token
example_luatex_token_scan_toks:
	$(E_LUATEX) token/scan_toks
example_luatex_token_set_char:
	$(E_LUATEX) token/set_char
example_luatex_token_set_lua:
	$(E_LUATEX) token/set_lua
example_luatex_token_set_macro:
	$(E_LUATEX) token/set_macro
example_luatex_token_type:
	$(E_LUATEX) token/type

### unicode

example_luatex_unicode: \
	example_luatex_unicode_all
example_luatex_unicode_all:
	$(E_LUATEX) unicode/all

### zip

example_luatex_zip: \
	example_luatex_zip_close \
	example_luatex_zip_open \
	example_luatex_zip_openfile \
	example_luatex_zip_type
example_luatex_zip_close:
	$(E_LUATEX) zip/close
example_luatex_zip_open:
	$(E_LUATEX) zip/open
example_luatex_zip_openfile:
	$(E_LUATEX) zip/openfile
example_luatex_zip_type:
	$(E_LUATEX) zip/type

### zlib

example_luatex_zlib: \
	example_luatex_zlib_adler32 \
	example_luatex_zlib_all \
	example_luatex_zlib_compress \
	example_luatex_zlib_compressobj \
	example_luatex_zlib_crc32 \
	example_luatex_zlib_decompress \
	example_luatex_zlib_decompressobj \
	example_luatex_zlib_deflate \
	example_luatex_zlib_version
example_luatex_zlib_adler32:
	$(E_LUATEX) zlib/adler32
example_luatex_zlib_all:
	$(E_LUATEX) zlib/all
example_luatex_zlib_compress:
	$(E_LUATEX) zlib/compress
example_luatex_zlib_compressobj:
	$(E_LUATEX) zlib/compressobj
example_luatex_zlib_crc32:
	$(E_LUATEX) zlib/crc32
example_luatex_zlib_decompress:
	$(E_LUATEX) zlib/decompress
example_luatex_zlib_decompressobj:
	$(E_LUATEX) zlib/decompressobj
example_luatex_zlib_deflate:
	$(E_LUATEX) zlib/deflate
example_luatex_zlib_version:
	$(E_LUATEX) zlib/version
