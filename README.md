# LuaTeX Lua API

Type definitions / Stubs for the Lua interface of LuaTeX and related Lua modules.

Install [Visual Studio Code](https://code.visualstudio.com/) and the
[lua-language-server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

[LuaTeX reference manual sources](https://github.com/TeX-Live/luatex/tree/trunk/manual)

```
git clone https://github.com/Josef-Friedrich/LuaTeX_Lua-API.git
```

`.vscode/settings.json`:

```json
{
"Lua.workspace.library": [
    "<repo>/library"
  ]
}
```

Quick info `node.id(type)`

![](resources/images/node.id.png)

Type error in `node.id(type)`

![](resources/images/node.id_wrong-type.png)

`node.id(type)` type definition

![](resources/images/node.id_definition.png)

Quick info `node.write(n)`

![](resources/images/node.write.png)

Signature overloads in `tex.sp()`

![](resources/images/tex.sp.png)

Documentation for the field `data` of the `pdf_colorstack` node:

![](resources/images/PdfColorstockWhatsitNode.data.png)

## Documentation

* [LuaTeX Mirror](https://github.com/TeX-Live/luatex)
* [pdfTeX Mirror](https://github.com/tex-mirror/pdftex)

## Howtos

* [Custom libraries](https://github.com/sumneko/lua-language-server/wiki/Libraries#custom)
* [@meta annotation](https://github.com/sumneko/lua-language-server/wiki/Annotations#meta)

## Other type definition / stub repos:

* [Template of the Lua interface itself](https://github.com/sumneko/lua-language-server/tree/master/meta/template)
* [In the lua-language-server included 3rd party libraries](https://github.com/sumneko/lua-language-server/tree/master/meta/3rd)
* [FiveM Lua Stubs](https://github.com/jamie-34254/fivem_lua_stubs)


```lua
------
---Source: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1199-L1211)
---
```

```lua
------
---Source: []()
---
```

## Global namespace

The following listing is generated inside from `LuaTeX` using the small
script below.

### _G

- `_G.CONTEXTLMTXMODE` (number)
- `_G.LUAMAJORVERSION` (number)
- `_G.LUAMINORVERSION` (number)
- `_G.LUATEXCOREVERSION` (number)
- `_G.LUATEXENGINE` (string)
- `_G.LUAVERSION` (number)
- *`_G._G` (table)*
- `_G._VERSION` (string)
- *`_G.arg` (table)*
- __`_G.assert` (function)__
- *`_G.bit32` (table)*
- *`_G.boolean` (table)*
- *`_G.callback` (table)*
- __`_G.collectgarbage` (function)__
- __`_G.combine` (function)__
- *`_G.config` (table)*
- *`_G.coroutine` (table)*
- *`_G.debug` (table)*
- __`_G.dimen` (function)__
- *`_G.dir` (table)*
- __`_G.dofile` (function)__
- __`_G.error` (function)__
- *`_G.file` (table)*
- *`_G.fio` (table)*
- *`_G.font` (table)*
- *`_G.fontloader` (table)*
- *`_G.fonts` (table)*
- *`_G.functions` (table)*
- __`_G.getmetatable` (function)__
- *`_G.gzip` (table)*
- *`_G.img` (table)*
- __`_G.inspect` (function)__
- *`_G.io` (table)*
- __`_G.ipairs` (function)__
- *`_G.kpse` (table)*
- *`_G.lang` (table)*
- *`_G.lfs` (table)*
- __`_G.load` (function)__
- __`_G.loadfile` (function)__
- __`_G.loadstring` (function)__
- *`_G.logs` (table)*
- *`_G.lpeg` (table)*
- *`_G.ltn12` (table)*
- *`_G.ltx` (table)*
- *`_G.lua` (table)*
- *`_G.luaharfbuzz` (table)*
- *`_G.lualibs` (table)*
- *`_G.luaotfload` (table)*
- *`_G.luatexbase` (table)*
- *`_G.math` (table)*
- *`_G.mbox` (table)*
- *`_G.md5` (table)*
- *`_G.mime` (table)*
- __`_G.module` (function)__
- *`_G.modules` (table)*
- *`_G.mplib` (table)*
- __`_G.next` (function)__
- *`_G.node` (table)*
- *`_G.nodes` (table)*
- *`_G.number` (table)*
- __`_G.optionalrequire` (function)__
- *`_G.os` (table)*
- *`_G.package` (table)*
- __`_G.pairs` (function)__
- __`_G.pcall` (function)__
- *`_G.pdf` (table)*
- *`_G.pdfe` (table)*
- *`_G.pdfscanner` (table)*
- __`_G.print` (function)__
- __`_G.rawequal` (function)__
- __`_G.rawget` (function)__
- __`_G.rawlen` (function)__
- __`_G.rawset` (function)__
- __`_G.registered` (function)__
- __`_G.require` (function)__
- __`_G.select` (function)__
- *`_G.set` (table)*
- __`_G.setinspector` (function)__
- __`_G.setmetatable` (function)__
- *`_G.sha2` (table)*
- *`_G.sio` (table)*
- *`_G.socket` (table)*
- *`_G.statistics` (table)*
- *`_G.status` (table)*
- *`_G.string` (table)*
- *`_G.table` (table)*
- *`_G.tex` (table)*
- *`_G.texconfig` (table)*
- *`_G.texio` (table)*
- __`_G.to_nfd_table` (function)__
- __`_G.toboolean` (function)__
- *`_G.token` (table)*
- __`_G.tonumber` (function)__
- __`_G.tostring` (function)__
- *`_G.trackers` (table)*
- __`_G.type` (function)__
- *`_G.unicode` (table)*
- __`_G.unpack` (function)__
- *`_G.url` (table)*
- *`_G.utf` (table)*
- *`_G.utf8` (table)*
- *`_G.utilities` (table)*
- *`_G.vf` (table)*
- __`_G.xpcall` (function)__
- *`_G.xzip` (table)*
- *`_G.zip` (table)*
- *`_G.zlib` (table)*

### arg

- `arg.0` (string)
- `arg.1` (string)

### bit32

- __`bit32.arshift` (function)__
- __`bit32.band` (function)__
- __`bit32.bnot` (function)__
- __`bit32.bor` (function)__
- __`bit32.btest` (function)__
- __`bit32.bxor` (function)__
- __`bit32.extract` (function)__
- __`bit32.lrotate` (function)__
- __`bit32.lshift` (function)__
- __`bit32.replace` (function)__
- __`bit32.rrotate` (function)__
- __`bit32.rshift` (function)__

### boolean

- __`boolean.tonumber` (function)__

### callback

- __`callback.find` (function)__
- __`callback.list` (function)__
- __`callback.register` (function)__

### config

- *`config.actions` (table)*
- *`config.lualibs` (table)*
- *`config.luaotfload` (table)*

### coroutine

- __`coroutine.create` (function)__
- __`coroutine.isyieldable` (function)__
- __`coroutine.resume` (function)__
- __`coroutine.running` (function)__
- __`coroutine.status` (function)__
- __`coroutine.wrap` (function)__
- __`coroutine.yield` (function)__

### debug

- __`debug.debug` (function)__
- __`debug.gethook` (function)__
- __`debug.getinfo` (function)__
- __`debug.getlocal` (function)__
- __`debug.getmetatable` (function)__
- __`debug.getregistry` (function)__
- __`debug.getupvalue` (function)__
- __`debug.getuservalue` (function)__
- __`debug.sethook` (function)__
- __`debug.setlocal` (function)__
- __`debug.setmetatable` (function)__
- __`debug.setupvalue` (function)__
- __`debug.setuservalue` (function)__
- __`debug.traceback` (function)__
- __`debug.upvalueid` (function)__
- __`debug.upvaluejoin` (function)__

### dir

- __`dir.collectpattern` (function)__
- __`dir.current` (function)__
- __`dir.expandname` (function)__
- __`dir.found` (function)__
- __`dir.glob` (function)__
- __`dir.globdirs` (function)__
- __`dir.globfiles` (function)__
- __`dir.globpattern` (function)__
- __`dir.ls` (function)__
- __`dir.makedirs` (function)__
- __`dir.mkdirs` (function)__
- __`dir.pop` (function)__
- __`dir.push` (function)__

### file

- __`file.addsuffix` (function)__
- __`file.basename` (function)__
- __`file.checksum` (function)__
- __`file.collapse_path` (function)__
- __`file.collapsepath` (function)__
- __`file.copy` (function)__
- __`file.dirname` (function)__
- __`file.expandname` (function)__
- __`file.extname` (function)__
- __`file.is_qualified_path` (function)__
- __`file.is_readable` (function)__
- __`file.is_rootbased_path` (function)__
- __`file.is_writable` (function)__
- __`file.isreadable` (function)__
- __`file.iswritable` (function)__
- __`file.join` (function)__
- __`file.joinpath` (function)__
- __`file.loadchecksum` (function)__
- __`file.nameonly` (function)__
- __`file.nametotable` (function)__
- __`file.needs_updating` (function)__
- __`file.needsupdating` (function)__
- __`file.pathpart` (function)__
- __`file.readdata` (function)__
- __`file.removesuffix` (function)__
- __`file.replacesuffix` (function)__
- __`file.reslash` (function)__
- __`file.robustname` (function)__
- __`file.savechecksum` (function)__
- __`file.savedata` (function)__
- __`file.size` (function)__
- __`file.split_path` (function)__
- __`file.splitbase` (function)__
- __`file.splitname` (function)__
- __`file.splitpath` (function)__
- __`file.strip` (function)__
- __`file.suffix` (function)__
- __`file.suffixes` (function)__
- __`file.suffixesonly` (function)__
- __`file.suffixonly` (function)__
- __`file.syncmtimes` (function)__
- __`file.withinbase` (function)__

### fio

- __`fio.getposition` (function)__
- __`fio.read2dot14` (function)__
- __`fio.readbytes` (function)__
- __`fio.readbytetable` (function)__
- __`fio.readcardinal1` (function)__
- __`fio.readcardinal1le` (function)__
- __`fio.readcardinal2` (function)__
- __`fio.readcardinal2le` (function)__
- __`fio.readcardinal3` (function)__
- __`fio.readcardinal3le` (function)__
- __`fio.readcardinal4` (function)__
- __`fio.readcardinal4le` (function)__
- __`fio.readcardinaltable` (function)__
- __`fio.readfixed2` (function)__
- __`fio.readfixed4` (function)__
- __`fio.readinteger1` (function)__
- __`fio.readinteger1le` (function)__
- __`fio.readinteger2` (function)__
- __`fio.readinteger2le` (function)__
- __`fio.readinteger3` (function)__
- __`fio.readinteger3le` (function)__
- __`fio.readinteger4` (function)__
- __`fio.readinteger4le` (function)__
- __`fio.readintegertable` (function)__
- __`fio.readline` (function)__
- __`fio.setposition` (function)__
- __`fio.skipposition` (function)__

### font

- __`font.addcharacters` (function)__
- __`font.current` (function)__
- __`font.define` (function)__
- __`font.each` (function)__
- *`font.fonts` (table)*
- __`font.frozen` (function)__
- __`font.getcopy` (function)__
- __`font.getfont` (function)__
- __`font.getparameters` (function)__
- __`font.id` (function)__
- __`font.max` (function)__
- __`font.nextid` (function)__
- __`font.originaleach` (function)__
- __`font.read_tfm` (function)__
- __`font.read_vf` (function)__
- __`font.setexpansion` (function)__
- __`font.setfont` (function)__

### fontloader

- __`fontloader.apply_afmfile` (function)__
- __`fontloader.apply_featurefile` (function)__
- __`fontloader.close` (function)__
- __`fontloader.fields` (function)__
- __`fontloader.info` (function)__
- __`fontloader.open` (function)__
- __`fontloader.to_table` (function)__

### fonts

- *`fonts.analyzers` (table)*
- *`fonts.cid` (table)*
- *`fonts.constructors` (table)*
- *`fonts.definers` (table)*
- *`fonts.encodings` (table)*
- *`fonts.expansions` (table)*
- *`fonts.formats` (table)*
- *`fonts.handlers` (table)*
- *`fonts.hashes` (table)*
- *`fonts.helpers` (table)*
- *`fonts.loggers` (table)*
- *`fonts.mappings` (table)*
- *`fonts.names` (table)*
- *`fonts.privateoffsets` (table)*
- *`fonts.protrusions` (table)*
- *`fonts.readers` (table)*
- *`fonts.specifiers` (table)*
- *`fonts.tables` (table)*
- *`fonts.tracers` (table)*

### functions

- __`functions.dummy` (function)__

### gzip

- __`gzip.close` (function)__
- __`gzip.compress` (function)__
- __`gzip.compressed` (function)__
- __`gzip.decompress` (function)__
- __`gzip.lines` (function)__
- __`gzip.load` (function)__
- __`gzip.open` (function)__
- __`gzip.save` (function)__
- __`gzip.suffix` (function)__

### img

- __`img.boxes` (function)__
- __`img.copy` (function)__
- __`img.fields` (function)__
- __`img.immediatewrite` (function)__
- __`img.immediatewriteobject` (function)__
- __`img.keys` (function)__
- __`img.new` (function)__
- __`img.node` (function)__
- __`img.scan` (function)__
- __`img.types` (function)__
- __`img.write` (function)__

### io

- __`io.ask` (function)__
- __`io.bytes` (function)__
- __`io.characters` (function)__
- __`io.close` (function)__
- __`io.copydata` (function)__
- __`io.exists` (function)__
- `io.fileseparator` (string)
- __`io.flush` (function)__
- __`io.input` (function)__
- __`io.lines` (function)__
- __`io.loadchunk` (function)__
- __`io.loaddata` (function)__
- __`io.loadlines` (function)__
- __`io.noflines` (function)__
- __`io.open` (function)__
- __`io.output` (function)__
- `io.pathseparator` (string)
- __`io.popen` (function)__
- __`io.read` (function)__
- __`io.readall` (function)__
- __`io.readnumber` (function)__
- __`io.readstring` (function)__
- __`io.saved_lines` (function)__
- __`io.savedata` (function)__
- __`io.size` (function)__
- `io.stderr` (userdata)
- `io.stdin` (userdata)
- `io.stdout` (userdata)
- __`io.tmpfile` (function)__
- __`io.type` (function)__
- __`io.write` (function)__

### kpse

- __`kpse.check_permission` (function)__
- __`kpse.default_texmfcnf` (function)__
- __`kpse.expand_braces` (function)__
- __`kpse.expand_path` (function)__
- __`kpse.expand_var` (function)__
- __`kpse.find_file` (function)__
- __`kpse.init_prog` (function)__
- __`kpse.lookup` (function)__
- __`kpse.new` (function)__
- __`kpse.readable_file` (function)__
- __`kpse.record_input_file` (function)__
- __`kpse.record_output_file` (function)__
- __`kpse.set_program_name` (function)__
- __`kpse.show_path` (function)__
- __`kpse.var_value` (function)__
- __`kpse.version` (function)__

### lang

- __`lang.clean` (function)__
- __`lang.clear_hyphenation` (function)__
- __`lang.clear_patterns` (function)__
- __`lang.gethjcode` (function)__
- __`lang.hyphenate` (function)__
- __`lang.hyphenation` (function)__
- __`lang.hyphenationmin` (function)__
- __`lang.id` (function)__
- __`lang.new` (function)__
- __`lang.patterns` (function)__
- __`lang.postexhyphenchar` (function)__
- __`lang.posthyphenchar` (function)__
- __`lang.preexhyphenchar` (function)__
- __`lang.prehyphenchar` (function)__
- __`lang.sethjcode` (function)__

### lfs

- `lfs._COPYRIGHT` (string)
- `lfs._DESCRIPTION` (string)
- `lfs._VERSION` (string)
- __`lfs.attributes` (function)__
- __`lfs.chdir` (function)__
- __`lfs.currentdir` (function)__
- __`lfs.dir` (function)__
- __`lfs.isdir` (function)__
- __`lfs.isfile` (function)__
- __`lfs.isfound` (function)__
- __`lfs.link` (function)__
- __`lfs.lock` (function)__
- __`lfs.lock_dir` (function)__
- __`lfs.mkdir` (function)__
- __`lfs.mkdirs` (function)__
- __`lfs.modification` (function)__
- __`lfs.readlink` (function)__
- __`lfs.rmdir` (function)__
- __`lfs.setmode` (function)__
- __`lfs.shortname` (function)__
- __`lfs.symlinkattributes` (function)__
- __`lfs.touch` (function)__
- __`lfs.unlock` (function)__

### logs

- __`logs.disable` (function)__
- __`logs.enable` (function)__
- `logs.name` (string)
- __`logs.newline` (function)__
- __`logs.reporter` (function)__

### lpeg

- __`lpeg.B` (function)__
- __`lpeg.C` (function)__
- __`lpeg.Carg` (function)__
- __`lpeg.Cb` (function)__
- __`lpeg.Cc` (function)__
- __`lpeg.Cf` (function)__
- __`lpeg.Cg` (function)__
- __`lpeg.Cmt` (function)__
- __`lpeg.Cp` (function)__
- __`lpeg.Cs` (function)__
- __`lpeg.Ct` (function)__
- __`lpeg.P` (function)__
- __`lpeg.R` (function)__
- __`lpeg.S` (function)__
- __`lpeg.UP` (function)__
- __`lpeg.UR` (function)__
- __`lpeg.US` (function)__
- __`lpeg.V` (function)__
- __`lpeg.afterprefix` (function)__
- __`lpeg.anywhere` (function)__
- __`lpeg.append` (function)__
- __`lpeg.balancer` (function)__
- __`lpeg.beforesuffix` (function)__
- __`lpeg.checkedsplit` (function)__
- __`lpeg.containsws` (function)__
- __`lpeg.counter` (function)__
- __`lpeg.endstripper` (function)__
- __`lpeg.finder` (function)__
- __`lpeg.firstofsplit` (function)__
- __`lpeg.frontstripper` (function)__
- __`lpeg.instringchecker` (function)__
- __`lpeg.is_lpeg` (function)__
- __`lpeg.keeper` (function)__
- __`lpeg.locale` (function)__
- __`lpeg.match` (function)__
- __`lpeg.oneof` (function)__
- *`lpeg.patterns` (table)*
- __`lpeg.pcode` (function)__
- __`lpeg.print` (function)__
- __`lpeg.ptree` (function)__
- __`lpeg.replacer` (function)__
- __`lpeg.secondofsplit` (function)__
- __`lpeg.setmaxstack` (function)__
- __`lpeg.setutfcasers` (function)__
- __`lpeg.split` (function)__
- __`lpeg.splitat` (function)__
- __`lpeg.splitter` (function)__
- *`lpeg.splitters` (table)*
- __`lpeg.stripper` (function)__
- __`lpeg.times` (function)__
- __`lpeg.tsplitat` (function)__
- __`lpeg.tsplitter` (function)__
- __`lpeg.type` (function)__
- __`lpeg.utfchartabletopattern` (function)__
- __`lpeg.utfreplacer` (function)__
- __`lpeg.version` (function)__

### ltn12

- `ltn12.BLOCKSIZE` (number)
- *`ltn12._M` (table)*
- `ltn12._NAME` (string)
- `ltn12._PACKAGE` (string)
- `ltn12._VERSION` (string)
- *`ltn12.filter` (table)*
- *`ltn12.pump` (table)*
- *`ltn12.sink` (table)*
- *`ltn12.source` (table)*

### ltx

- *`ltx.utils` (table)*

### lua

- *`lua.bytecode` (table)*
- __`lua.get_functions_table` (function)__
- __`lua.getbytecode` (function)__
- __`lua.getcalllevel` (function)__
- __`lua.getcodepage` (function)__
- __`lua.getluaname` (function)__
- __`lua.getstacktop` (function)__
- *`lua.name` (table)*
- __`lua.newtable` (function)__
- __`lua.setbytecode` (function)__
- __`lua.setluaname` (function)__
- `lua.version` (string)

### luaharfbuzz

- *`luaharfbuzz.Blob` (table)*
- *`luaharfbuzz.Buffer` (table)*
- *`luaharfbuzz.Direction` (table)*
- *`luaharfbuzz.Face` (table)*
- *`luaharfbuzz.Feature` (table)*
- *`luaharfbuzz.Font` (table)*
- *`luaharfbuzz.Language` (table)*
- *`luaharfbuzz.Script` (table)*
- *`luaharfbuzz.Tag` (table)*
- *`luaharfbuzz.Variation` (table)*
- *`luaharfbuzz.ot` (table)*
- __`luaharfbuzz.shape_full` (function)__
- __`luaharfbuzz.shapers` (function)__
- *`luaharfbuzz.unicode` (table)*
- __`luaharfbuzz.version` (function)__

### lualibs

- `lualibs.basic_loaded` (boolean)
- `lualibs.extended_loaded` (boolean)
- __`lualibs.info` (function)__
- `lualibs.load_extended` (boolean)
- __`lualibs.loadmodule` (function)__
- *`lualibs.module_info` (table)*
- `lualibs.prefer_merged` (boolean)
- __`lualibs.warn` (function)__

### luaotfload

- __`luaotfload.add_colorscheme` (function)__
- __`luaotfload.add_fallback` (function)__
- __`luaotfload.add_multiscript` (function)__
- __`luaotfload.apply_default_features` (function)__
- *`luaotfload.aux` (table)*
- *`luaotfload.default_config` (table)*
- __`luaotfload.define_font` (function)__
- *`luaotfload.features` (table)*
- *`luaotfload.fontloader` (table)*
- `luaotfload.fontloader_package` (string)
- __`luaotfload.get_script_mark` (function)__
- *`luaotfload.harf` (table)*
- *`luaotfload.harfbuzz` (table)*
- *`luaotfload.letterspace` (table)*
- *`luaotfload.loaders` (table)*
- *`luaotfload.log` (table)*
- __`luaotfload.main` (function)__
- *`luaotfload.parsers` (table)*
- *`luaotfload.resolvers` (table)*
- __`luaotfload.set_colorhandler` (function)__
- __`luaotfload.set_transparent_colorstack` (function)__
- __`luaotfload.set_transparenthandler` (function)__
- `luaotfload.version` (string)

### luatexbase

- __`luatexbase.add_to_callback` (function)__
- *`luatexbase.attributes` (table)*
- __`luatexbase.call_callback` (function)__
- __`luatexbase.callback_descriptions` (function)__
- *`luatexbase.callbacktypes` (table)*
- __`luatexbase.create_callback` (function)__
- __`luatexbase.declare_callback_rule` (function)__
- __`luatexbase.disable_callback` (function)__
- __`luatexbase.in_callback` (function)__
- __`luatexbase.module_error` (function)__
- __`luatexbase.module_info` (function)__
- __`luatexbase.module_warning` (function)__
- __`luatexbase.new_attribute` (function)__
- __`luatexbase.new_bytecode` (function)__
- __`luatexbase.new_chunkname` (function)__
- __`luatexbase.new_luafunction` (function)__
- __`luatexbase.new_whatsit` (function)__
- __`luatexbase.provides_module` (function)__
- __`luatexbase.registernumber` (function)__
- __`luatexbase.remove_from_callback` (function)__
- __`luatexbase.uninstall` (function)__

### math

- __`math.abs` (function)__
- __`math.acos` (function)__
- __`math.asin` (function)__
- __`math.atan` (function)__
- __`math.atan2` (function)__
- __`math.ceil` (function)__
- __`math.ceiling` (function)__
- __`math.cos` (function)__
- __`math.cosd` (function)__
- __`math.cosh` (function)__
- __`math.deg` (function)__
- __`math.div` (function)__
- __`math.even` (function)__
- __`math.exp` (function)__
- __`math.floor` (function)__
- __`math.fmod` (function)__
- __`math.frexp` (function)__
- `math.huge` (number)
- `math.initialseed` (number)
- __`math.ldexp` (function)__
- __`math.log` (function)__
- __`math.log10` (function)__
- __`math.max` (function)__
- `math.maxinteger` (number)
- __`math.min` (function)__
- `math.mininteger` (number)
- __`math.mod` (function)__
- __`math.modf` (function)__
- __`math.odd` (function)__
- `math.pi` (number)
- __`math.pow` (function)__
- __`math.rad` (function)__
- __`math.random` (function)__
- __`math.randomseed` (function)__
- __`math.round` (function)__
- __`math.sin` (function)__
- __`math.sind` (function)__
- __`math.sinh` (function)__
- __`math.sqrt` (function)__
- __`math.tan` (function)__
- __`math.tand` (function)__
- __`math.tanh` (function)__
- __`math.tointeger` (function)__
- __`math.type` (function)__
- __`math.ult` (function)__

### mbox

- __`mbox.parse` (function)__
- __`mbox.parse_from` (function)__
- __`mbox.parse_header` (function)__
- __`mbox.parse_headers` (function)__
- __`mbox.parse_message` (function)__
- __`mbox.split_headers` (function)__
- __`mbox.split_mbox` (function)__
- __`mbox.split_message` (function)__

### md5

- __`md5.HEX` (function)__
- __`md5.crypt` (function)__
- __`md5.dec` (function)__
- __`md5.decrypt` (function)__
- __`md5.exor` (function)__
- __`md5.hex` (function)__
- __`md5.sum` (function)__
- __`md5.sumHEXA` (function)__
- __`md5.sumhexa` (function)__

### mime

- `mime._VERSION` (string)
- __`mime.b64` (function)__
- __`mime.decode` (function)__
- *`mime.decodet` (table)*
- __`mime.dot` (function)__
- __`mime.encode` (function)__
- *`mime.encodet` (table)*
- __`mime.eol` (function)__
- __`mime.normalize` (function)__
- __`mime.qp` (function)__
- __`mime.qpwrp` (function)__
- __`mime.stuff` (function)__
- __`mime.unb64` (function)__
- __`mime.unqp` (function)__
- __`mime.wrap` (function)__
- *`mime.wrapt` (table)*
- __`mime.wrp` (function)__

### modules

- *`modules.data-con` (table)*
- *`modules.font-afk` (table)*
- *`modules.font-cff` (table)*
- *`modules.font-cid` (table)*
- *`modules.font-con` (table)*
- *`modules.font-def` (table)*
- *`modules.font-dsp` (table)*
- *`modules.font-imp-effects` (table)*
- *`modules.font-imp-italics` (table)*
- *`modules.font-imp-ligatures` (table)*
- *`modules.font-imp-tex` (table)*
- *`modules.font-ini` (table)*
- *`modules.font-lua` (table)*
- *`modules.font-map` (table)*
- *`modules.font-ocl` (table)*
- *`modules.font-one` (table)*
- *`modules.font-onr` (table)*
- *`modules.font-osd` (table)*
- *`modules.font-ota` (table)*
- *`modules.font-otc` (table)*
- *`modules.font-oti` (table)*
- *`modules.font-otj` (table)*
- *`modules.font-otl` (table)*
- *`modules.font-oto` (table)*
- *`modules.font-otr` (table)*
- *`modules.font-ots` (table)*
- *`modules.font-ott` (table)*
- *`modules.font-oup` (table)*
- *`modules.font-shp` (table)*
- *`modules.font-ttf` (table)*
- *`modules.font-vfc` (table)*
- *`modules.l-boolean` (table)*
- *`modules.l-dir` (table)*
- *`modules.l-file` (table)*
- *`modules.l-functions` (table)*
- *`modules.l-io` (table)*
- *`modules.l-lpeg` (table)*
- *`modules.l-lua` (table)*
- *`modules.l-math` (table)*
- *`modules.l-md5` (table)*
- *`modules.l-number` (table)*
- *`modules.l-os` (table)*
- *`modules.l-package` (table)*
- *`modules.l-set` (table)*
- *`modules.l-string` (table)*
- *`modules.l-table` (table)*
- *`modules.l-unicode` (table)*
- *`modules.l-url` (table)*
- *`modules.luat-basics-gen` (table)*
- *`modules.luatex-font-enc` (table)*
- *`modules.luatex-font-mis` (table)*
- *`modules.luatex-fonts-def` (table)*
- *`modules.luatex-fonts-ext` (table)*
- *`modules.luatex-fonts-gbn` (table)*
- *`modules.luatex-fonts-nod` (table)*
- *`modules.luatex-fonts-tfm` (table)*
- *`modules.trac-inf` (table)*
- *`modules.util-deb` (table)*
- *`modules.util-dim` (table)*
- *`modules.util-fil` (table)*
- *`modules.util-jsn` (table)*
- *`modules.util-lua` (table)*
- *`modules.util-prs` (table)*
- *`modules.util-sac` (table)*
- *`modules.util-sta` (table)*
- *`modules.util-sto` (table)*
- *`modules.util-str` (table)*
- *`modules.util-tab` (table)*
- *`modules.util-tpl` (table)*
- *`modules.util-zip` (table)*

### mplib

- __`mplib.char_depth` (function)__
- __`mplib.char_height` (function)__
- __`mplib.char_width` (function)__
- __`mplib.execute` (function)__
- __`mplib.fields` (function)__
- __`mplib.finish` (function)__
- __`mplib.get_boolean` (function)__
- __`mplib.get_number` (function)__
- __`mplib.get_numeric` (function)__
- __`mplib.get_path` (function)__
- __`mplib.get_string` (function)__
- __`mplib.new` (function)__
- __`mplib.pen_info` (function)__
- __`mplib.solve_path` (function)__
- __`mplib.statistics` (function)__
- __`mplib.version` (function)__

### node

- __`node.check_discretionaries` (function)__
- __`node.check_discretionary` (function)__
- __`node.copy` (function)__
- __`node.copy_list` (function)__
- __`node.count` (function)__
- __`node.current_attr` (function)__
- __`node.dimensions` (function)__
- *`node.direct` (table)*
- __`node.effective_glue` (function)__
- __`node.end_of_math` (function)__
- __`node.family_font` (function)__
- __`node.fields` (function)__
- __`node.find_attribute` (function)__
- __`node.first_glyph` (function)__
- __`node.fix_node_lists` (function)__
- __`node.flatten_discretionaries` (function)__
- __`node.flush_list` (function)__
- __`node.flush_node` (function)__
- __`node.flush_properties_table` (function)__
- __`node.free` (function)__
- __`node.get_attribute` (function)__
- __`node.get_properties_table` (function)__
- __`node.getboth` (function)__
- __`node.getchar` (function)__
- __`node.getdisc` (function)__
- __`node.getfield` (function)__
- __`node.getfont` (function)__
- __`node.getglue` (function)__
- __`node.getid` (function)__
- __`node.getleader` (function)__
- __`node.getlist` (function)__
- __`node.getnext` (function)__
- __`node.getprev` (function)__
- __`node.getproperty` (function)__
- __`node.getsubtype` (function)__
- __`node.getwhd` (function)__
- __`node.has_attribute` (function)__
- __`node.has_field` (function)__
- __`node.has_glyph` (function)__
- __`node.hpack` (function)__
- __`node.hyphenating` (function)__
- __`node.id` (function)__
- __`node.insert_after` (function)__
- __`node.insert_before` (function)__
- __`node.is_char` (function)__
- __`node.is_glyph` (function)__
- __`node.is_node` (function)__
- __`node.is_zero_glue` (function)__
- __`node.kerning` (function)__
- __`node.last_node` (function)__
- __`node.length` (function)__
- __`node.ligaturing` (function)__
- __`node.make_extensible` (function)__
- __`node.mlist_to_hlist` (function)__
- __`node.new` (function)__
- __`node.next` (function)__
- __`node.prepend_prevdepth` (function)__
- __`node.prev` (function)__
- __`node.protect_glyph` (function)__
- __`node.protect_glyphs` (function)__
- __`node.protrusion_skippable` (function)__
- __`node.rangedimensions` (function)__
- __`node.remove` (function)__
- __`node.set_attribute` (function)__
- __`node.set_properties_mode` (function)__
- __`node.setfield` (function)__
- __`node.setglue` (function)__
- __`node.setproperty` (function)__
- __`node.slide` (function)__
- __`node.subtype` (function)__
- __`node.subtypes` (function)__
- __`node.tail` (function)__
- __`node.tostring` (function)__
- __`node.traverse` (function)__
- __`node.traverse_char` (function)__
- __`node.traverse_glyph` (function)__
- __`node.traverse_id` (function)__
- __`node.traverse_list` (function)__
- __`node.type` (function)__
- __`node.types` (function)__
- __`node.unprotect_glyph` (function)__
- __`node.unprotect_glyphs` (function)__
- __`node.unset_attribute` (function)__
- __`node.usedlist` (function)__
- __`node.uses_font` (function)__
- __`node.values` (function)__
- __`node.vpack` (function)__
- __`node.whatsits` (function)__
- __`node.write` (function)__

### nodes

- *`nodes.dirvalues` (table)*
- *`nodes.disccodes` (table)*
- *`nodes.glyphcodes` (table)*
- *`nodes.handlers` (table)*
- *`nodes.injections` (table)*
- *`nodes.nodecodes` (table)*
- *`nodes.nuts` (table)*
- *`nodes.properties` (table)*
- __`nodes.simple_font_handler` (function)__
- __`nodes.tonode` (function)__
- __`nodes.tonut` (function)__

### number

- __`number.%` (function)__
- __`number.basepoints` (function)__
- __`number.bytetodecimal` (function)__
- __`number.compactfloat` (function)__
- __`number.decimaltobyte` (function)__
- *`number.dimenfactors` (table)*
- __`number.formatted` (function)__
- __`number.formattedfloat` (function)__
- __`number.idiv` (function)__
- `number.maxdimen` (number)
- __`number.nubasepoints` (function)__
- __`number.nupoints` (function)__
- __`number.percent` (function)__
- __`number.points` (function)__
- __`number.signed` (function)__
- __`number.sparseexponent` (function)__
- __`number.splitdimen` (function)__
- __`number.to16dot16` (function)__
- __`number.tobasepoints` (function)__
- __`number.tobitstring` (function)__
- __`number.tocentimeters` (function)__
- __`number.tociceros` (function)__
- __`number.todidots` (function)__
- __`number.todimen` (function)__
- __`number.toevenhex` (function)__
- __`number.toinches` (function)__
- __`number.tomillimeters` (function)__
- __`number.tonumberf` (function)__
- __`number.tonumberg` (function)__
- __`number.topicas` (function)__
- __`number.topoints` (function)__
- __`number.toscaled` (function)__
- __`number.toscaledpoints` (function)__
- __`number.valid` (function)__

### os

- __`os.__getenv__` (function)__
- __`os.__setenv__` (function)__
- `os.binsuffix` (string)
- *`os.binsuffixes` (table)*
- `os.bits` (number)
- __`os.clock` (function)__
- __`os.converttime` (function)__
- __`os.date` (function)__
- __`os.difftime` (function)__
- *`os.env` (table)*
- __`os.exec` (function)__
- __`os.execute` (function)__
- __`os.exit` (function)__
- __`os.fulltime` (function)__
- __`os.getenv` (function)__
- __`os.gettimeofday` (function)__
- __`os.isleapyear` (function)__
- __`os.launch` (function)__
- `os.libsuffix` (string)
- __`os.localtime` (function)__
- `os.name` (string)
- `os.newline` (string)
- __`os.nofdays` (function)__
- __`os.now` (function)__
- __`os.pipeto` (function)__
- `os.platform` (string)
- __`os.remove` (function)__
- __`os.rename` (function)__
- __`os.resultof` (function)__
- __`os.runtime` (function)__
- `os.selfdir` (string)
- __`os.setenv` (function)__
- __`os.setexitcode` (function)__
- __`os.setlocale` (function)__
- __`os.sleep` (function)__
- __`os.spawn` (function)__
- __`os.time` (function)__
- __`os.times` (function)__
- __`os.timezone` (function)__
- __`os.tmpdir` (function)__
- __`os.tmpname` (function)__
- __`os.today` (function)__
- `os.type` (string)
- __`os.uname` (function)__
- __`os.uuid` (function)__
- __`os.validdate` (function)__
- __`os.weekday` (function)__
- __`os.where` (function)__
- __`os.which` (function)__

### package

- `package.config` (string)
- `package.cpath` (string)
- __`package.extralibpath` (function)__
- __`package.extralibpaths` (function)__
- __`package.extraluapath` (function)__
- __`package.extraluapaths` (function)__
- *`package.helpers` (table)*
- __`package.libpaths` (function)__
- *`package.loaded` (table)*
- *`package.loaders` (table)*
- __`package.loadlib` (function)__
- __`package.luapaths` (function)__
- `package.path` (string)
- __`package.poplibpath` (function)__
- __`package.popluapath` (function)__
- *`package.preload` (table)*
- __`package.pushlibpath` (function)__
- __`package.pushluapath` (function)__
- *`package.searchers` (table)*
- __`package.searchpath` (function)__
- __`package.seeall` (function)__

### pdf

- __`pdf.fontname` (function)__
- __`pdf.fontobjnum` (function)__
- __`pdf.fontsize` (function)__
- __`pdf.getcatalog` (function)__
- __`pdf.getcompresslevel` (function)__
- __`pdf.getcreationdate` (function)__
- __`pdf.getdecimaldigits` (function)__
- __`pdf.getdestmargin` (function)__
- __`pdf.getfontname` (function)__
- __`pdf.getfontobjnum` (function)__
- __`pdf.getfontsize` (function)__
- __`pdf.getgentounicode` (function)__
- __`pdf.gethpos` (function)__
- __`pdf.getignoreunknownimages` (function)__
- __`pdf.getimageresolution` (function)__
- __`pdf.getinclusionerrorlevel` (function)__
- __`pdf.getinfo` (function)__
- __`pdf.getlastannot` (function)__
- __`pdf.getlastlink` (function)__
- __`pdf.getlastobj` (function)__
- __`pdf.getlinkmargin` (function)__
- __`pdf.getmajorversion` (function)__
- __`pdf.getmatrix` (function)__
- __`pdf.getmaxobjnum` (function)__
- __`pdf.getminorversion` (function)__
- __`pdf.getnames` (function)__
- __`pdf.getnofobjects` (function)__
- __`pdf.getobjcompresslevel` (function)__
- __`pdf.getobjtype` (function)__
- __`pdf.getomitcharset` (function)__
- __`pdf.getomitcidset` (function)__
- __`pdf.getorigin` (function)__
- __`pdf.getpageattributes` (function)__
- __`pdf.getpageref` (function)__
- __`pdf.getpageresources` (function)__
- __`pdf.getpagesattributes` (function)__
- __`pdf.getpkresolution` (function)__
- __`pdf.getpos` (function)__
- __`pdf.getrecompress` (function)__
- __`pdf.getretval` (function)__
- __`pdf.getsuppressoptionalinfo` (function)__
- __`pdf.getthreadmargin` (function)__
- __`pdf.gettrailer` (function)__
- __`pdf.gettrailerid` (function)__
- __`pdf.getvpos` (function)__
- __`pdf.getxformattributes` (function)__
- __`pdf.getxformmargin` (function)__
- __`pdf.getxformname` (function)__
- __`pdf.getxformresources` (function)__
- __`pdf.hasmatrix` (function)__
- __`pdf.immediateobj` (function)__
- __`pdf.includechar` (function)__
- __`pdf.includefont` (function)__
- __`pdf.includeimage` (function)__
- __`pdf.mapfile` (function)__
- __`pdf.mapline` (function)__
- __`pdf.maxobjnum` (function)__
- __`pdf.newcolorstack` (function)__
- __`pdf.obj` (function)__
- __`pdf.objtype` (function)__
- __`pdf.pageref` (function)__
- __`pdf.print` (function)__
- __`pdf.refobj` (function)__
- __`pdf.registerannot` (function)__
- __`pdf.reserveobj` (function)__
- __`pdf.setcatalog` (function)__
- __`pdf.setcompresslevel` (function)__
- __`pdf.setdecimaldigits` (function)__
- __`pdf.setdestmargin` (function)__
- __`pdf.setfontattributes` (function)__
- __`pdf.setforcefile` (function)__
- __`pdf.setgentounicode` (function)__
- __`pdf.setignoreunknownimages` (function)__
- __`pdf.setimageresolution` (function)__
- __`pdf.setinclusionerrorlevel` (function)__
- __`pdf.setinfo` (function)__
- __`pdf.setlinkmargin` (function)__
- __`pdf.setmajorversion` (function)__
- __`pdf.setminorversion` (function)__
- __`pdf.setnames` (function)__
- __`pdf.setobjcompresslevel` (function)__
- __`pdf.setomitcharset` (function)__
- __`pdf.setomitcidset` (function)__
- __`pdf.setorigin` (function)__
- __`pdf.setpageattributes` (function)__
- __`pdf.setpageresources` (function)__
- __`pdf.setpagesattributes` (function)__
- __`pdf.setpkresolution` (function)__
- __`pdf.setrecompress` (function)__
- __`pdf.setsuppressoptionalinfo` (function)__
- __`pdf.setthreadmargin` (function)__
- __`pdf.settrailer` (function)__
- __`pdf.settrailerid` (function)__
- __`pdf.settypeonewidemode` (function)__
- __`pdf.setxformattributes` (function)__
- __`pdf.setxformmargin` (function)__
- __`pdf.setxformresources` (function)__
- __`pdf.xformname` (function)__

### pdfe

- __`pdfe.arraytotable` (function)__
- __`pdfe.close` (function)__
- __`pdfe.closestream` (function)__
- __`pdfe.dictionarytotable` (function)__
- __`pdfe.getarray` (function)__
- __`pdfe.getboolean` (function)__
- __`pdfe.getbox` (function)__
- __`pdfe.getcatalog` (function)__
- __`pdfe.getdictionary` (function)__
- __`pdfe.getfromarray` (function)__
- __`pdfe.getfromdictionary` (function)__
- __`pdfe.getfromreference` (function)__
- __`pdfe.getfromstream` (function)__
- __`pdfe.getinfo` (function)__
- __`pdfe.getinteger` (function)__
- __`pdfe.getmemoryusage` (function)__
- __`pdfe.getname` (function)__
- __`pdfe.getnofobjects` (function)__
- __`pdfe.getnofpages` (function)__
- __`pdfe.getnumber` (function)__
- __`pdfe.getpage` (function)__
- __`pdfe.getpages` (function)__
- __`pdfe.getsize` (function)__
- __`pdfe.getstatus` (function)__
- __`pdfe.getstream` (function)__
- __`pdfe.getstring` (function)__
- __`pdfe.gettrailer` (function)__
- __`pdfe.getversion` (function)__
- __`pdfe.new` (function)__
- __`pdfe.open` (function)__
- __`pdfe.openstream` (function)__
- __`pdfe.pagestotable` (function)__
- __`pdfe.readfromstream` (function)__
- __`pdfe.readwholestream` (function)__
- __`pdfe.type` (function)__
- __`pdfe.unencrypt` (function)__

### pdfscanner

- __`pdfscanner.scan` (function)__

### set

- __`set.contains` (function)__
- __`set.create` (function)__
- __`set.tolist` (function)__
- __`set.tonumber` (function)__
- __`set.totable` (function)__

### sha2

- __`sha2.digest256` (function)__
- __`sha2.digest384` (function)__
- __`sha2.digest512` (function)__

### sio

- __`sio.read2dot14` (function)__
- __`sio.readbytes` (function)__
- __`sio.readbytetable` (function)__
- __`sio.readcardinal1` (function)__
- __`sio.readcardinal1le` (function)__
- __`sio.readcardinal2` (function)__
- __`sio.readcardinal2le` (function)__
- __`sio.readcardinal3` (function)__
- __`sio.readcardinal3le` (function)__
- __`sio.readcardinal4` (function)__
- __`sio.readcardinal4le` (function)__
- __`sio.readcardinaltable` (function)__
- __`sio.readfixed2` (function)__
- __`sio.readfixed4` (function)__
- __`sio.readinteger1` (function)__
- __`sio.readinteger1le` (function)__
- __`sio.readinteger2` (function)__
- __`sio.readinteger2le` (function)__
- __`sio.readinteger3` (function)__
- __`sio.readinteger3le` (function)__
- __`sio.readinteger4` (function)__
- __`sio.readinteger4le` (function)__
- __`sio.readintegertable` (function)__

### socket

- `socket.BLOCKSIZE` (number)
- `socket._DATAGRAMSIZE` (number)
- `socket._DEBUG` (boolean)
- `socket._SETSIZE` (number)
- `socket._SOCKETINVALID` (number)
- `socket._VERSION` (string)
- __`socket.__unload` (function)__
- __`socket.bind` (function)__
- __`socket.choose` (function)__
- __`socket.connect` (function)__
- __`socket.connect4` (function)__
- __`socket.connect6` (function)__
- *`socket.dns` (table)*
- *`socket.ftp` (table)*
- __`socket.gettime` (function)__
- *`socket.headers` (table)*
- *`socket.http` (table)*
- __`socket.newtry` (function)__
- __`socket.protect` (function)__
- __`socket.select` (function)__
- __`socket.sink` (function)__
- *`socket.sinkt` (table)*
- __`socket.skip` (function)__
- __`socket.sleep` (function)__
- *`socket.smtp` (table)*
- __`socket.source` (function)__
- *`socket.sourcet` (table)*
- __`socket.tcp` (function)__
- __`socket.tcp4` (function)__
- __`socket.tcp6` (function)__
- *`socket.tp` (table)*
- __`socket.try` (function)__
- __`socket.udp` (function)__
- __`socket.udp4` (function)__
- __`socket.udp6` (function)__
- *`socket.url` (table)*

### statistics

- __`statistics.benchmarktimer` (function)__
- __`statistics.currenttime` (function)__
- __`statistics.elapsed` (function)__
- __`statistics.elapsedindeed` (function)__
- __`statistics.elapsedseconds` (function)__
- __`statistics.elapsedtime` (function)__
- `statistics.enable` (boolean)
- __`statistics.formatruntime` (function)__
- __`statistics.hastiming` (function)__
- __`statistics.memused` (function)__
- __`statistics.register` (function)__
- __`statistics.resettiming` (function)__
- __`statistics.runtime` (function)__
- __`statistics.show` (function)__
- __`statistics.starttiming` (function)__
- __`statistics.stoptiming` (function)__
- `statistics.threshold` (number)
- __`statistics.timed` (function)__
- __`statistics.tracefunction` (function)__

### status

- __`status.list` (function)__
- __`status.resetmessages` (function)__
- __`status.setexitcode` (function)__

### string

- __`string.autodouble` (function)__
- __`string.autosingle` (function)__
- __`string.booleanstring` (function)__
- __`string.byte` (function)__
- __`string.bytepairs` (function)__
- __`string.bytes` (function)__
- __`string.bytetable` (function)__
- __`string.char` (function)__
- __`string.characterpairs` (function)__
- __`string.characters` (function)__
- __`string.checkedsplit` (function)__
- __`string.collapsespaces` (function)__
- __`string.containsws` (function)__
- __`string.count` (function)__
- __`string.dump` (function)__
- __`string.escapedpattern` (function)__
- __`string.escapedquotes` (function)__
- __`string.explode` (function)__
- __`string.find` (function)__
- __`string.format` (function)__
- __`string.formatter` (function)__
- *`string.formatters` (table)*
- __`string.fullstrip` (function)__
- __`string.gmatch` (function)__
- __`string.gsub` (function)__
- __`string.is_boolean` (function)__
- __`string.is_empty` (function)__
- __`string.itself` (function)__
- __`string.len` (function)__
- __`string.limit` (function)__
- __`string.longtostring` (function)__
- __`string.lower` (function)__
- __`string.match` (function)__
- __`string.nospaces` (function)__
- *`string.nspaces` (table)*
- __`string.optionalquoted` (function)__
- __`string.pack` (function)__
- __`string.packsize` (function)__
- __`string.quote` (function)__
- __`string.quoted` (function)__
- __`string.rep` (function)__
- __`string.replacenewlines` (function)__
- __`string.reverse` (function)__
- __`string.split` (function)__
- __`string.splitlines` (function)__
- __`string.splitup` (function)__
- __`string.strip` (function)__
- __`string.sub` (function)__
- __`string.texnewlines` (function)__
- __`string.tformat` (function)__
- __`string.toHEX` (function)__
- __`string.toboolean` (function)__
- __`string.tobytes` (function)__
- __`string.todec` (function)__
- __`string.todimen` (function)__
- __`string.tohex` (function)__
- __`string.topattern` (function)__
- __`string.totable` (function)__
- __`string.toutf` (function)__
- __`string.tracedchar` (function)__
- *`string.tracedchars` (table)*
- __`string.unescapedquotes` (function)__
- __`string.unpack` (function)__
- __`string.unquote` (function)__
- __`string.unquoted` (function)__
- __`string.upper` (function)__
- __`string.utfcharacter` (function)__
- __`string.utfcharacters` (function)__
- __`string.utflength` (function)__
- __`string.utfpadd` (function)__
- __`string.utfpadding` (function)__
- __`string.utfvalue` (function)__
- __`string.utfvalues` (function)__
- __`string.valid` (function)__
- __`string.wordsplitter` (function)__

### table

- __`table.allkeys` (function)__
- __`table.append` (function)__
- __`table.are_equal` (function)__
- __`table.collapsed` (function)__
- __`table.collapsedhash` (function)__
- __`table.combine` (function)__
- __`table.compact` (function)__
- __`table.concat` (function)__
- __`table.contains` (function)__
- __`table.copy` (function)__
- __`table.count` (function)__
- __`table.derive` (function)__
- __`table.deserialize` (function)__
- __`table.drop` (function)__
- __`table.fastcopy` (function)__
- __`table.fastserialize` (function)__
- __`table.filtered` (function)__
- __`table.flattened` (function)__
- __`table.fromhash` (function)__
- __`table.getmetatablekey` (function)__
- __`table.getn` (function)__
- __`table.has_one_entry` (function)__
- __`table.hashed` (function)__
- __`table.identical` (function)__
- __`table.imerge` (function)__
- __`table.imerged` (function)__
- __`table.insert` (function)__
- __`table.is_empty` (function)__
- __`table.is_simple_table` (function)__
- __`table.keys` (function)__
- __`table.load` (function)__
- __`table.loweredkeys` (function)__
- __`table.makeweak` (function)__
- __`table.merge` (function)__
- __`table.merged` (function)__
- __`table.mirrored` (function)__
- __`table.move` (function)__
- __`table.ordered` (function)__
- __`table.orderedhash` (function)__
- __`table.pack` (function)__
- __`table.prepend` (function)__
- __`table.print` (function)__
- __`table.remove` (function)__
- __`table.reverse` (function)__
- __`table.reverse_hash` (function)__
- __`table.reversed` (function)__
- __`table.save` (function)__
- __`table.sequenced` (function)__
- __`table.serialize` (function)__
- __`table.setmetatablecall` (function)__
- __`table.setmetatableindex` (function)__
- __`table.setmetatableindices` (function)__
- __`table.setmetatablekey` (function)__
- __`table.setmetatablenewindex` (function)__
- __`table.sort` (function)__
- __`table.sorted` (function)__
- __`table.sortedhash` (function)__
- __`table.sortedhashkeys` (function)__
- __`table.sortedhashonly` (function)__
- __`table.sortedindexonly` (function)__
- __`table.sortedkeys` (function)__
- __`table.sortedpairs` (function)__
- __`table.sparse` (function)__
- __`table.strip` (function)__
- __`table.sub` (function)__
- __`table.swapped` (function)__
- __`table.tocsv` (function)__
- __`table.tofile` (function)__
- __`table.tohandle` (function)__
- __`table.tohash` (function)__
- __`table.toxml` (function)__
- __`table.twowaymapper` (function)__
- __`table.unique` (function)__
- __`table.unnest` (function)__
- __`table.unpack` (function)__
- __`table.values` (function)__

### tex

- *`tex.attribute` (table)*
- __`tex.badness` (function)__
- *`tex.box` (table)*
- *`tex.catcode` (table)*
- *`tex.count` (table)*
- __`tex.cprint` (function)__
- __`tex.definefont` (function)__
- *`tex.delcode` (table)*
- *`tex.dimen` (table)*
- __`tex.enableprimitives` (function)__
- __`tex.error` (function)__
- __`tex.extraprimitives` (function)__
- __`tex.finish` (function)__
- __`tex.fontidentifier` (function)__
- __`tex.fontname` (function)__
- __`tex.force_synctex_line` (function)__
- __`tex.force_synctex_tag` (function)__
- __`tex.forcehmode` (function)__
- __`tex.get` (function)__
- __`tex.get_synctex_line` (function)__
- __`tex.get_synctex_mode` (function)__
- __`tex.get_synctex_tag` (function)__
- __`tex.getattribute` (function)__
- __`tex.getbox` (function)__
- __`tex.getboxresourcebox` (function)__
- __`tex.getboxresourcedimensions` (function)__
- __`tex.getcatcode` (function)__
- __`tex.getcount` (function)__
- __`tex.getdelcode` (function)__
- __`tex.getdelcodes` (function)__
- __`tex.getdimen` (function)__
- __`tex.getfontoffamily` (function)__
- __`tex.getglue` (function)__
- __`tex.getlccode` (function)__
- __`tex.getlist` (function)__
- __`tex.getlocallevel` (function)__
- __`tex.getmark` (function)__
- __`tex.getmath` (function)__
- __`tex.getmathcode` (function)__
- __`tex.getmathcodes` (function)__
- __`tex.getmodevalues` (function)__
- __`tex.getmuglue` (function)__
- __`tex.getmuskip` (function)__
- __`tex.getnest` (function)__
- __`tex.getpagestate` (function)__
- __`tex.getsfcode` (function)__
- __`tex.getskip` (function)__
- __`tex.gettoks` (function)__
- __`tex.getuccode` (function)__
- *`tex.glue` (table)*
- __`tex.hashtokens` (function)__
- __`tex.init_rand` (function)__
- __`tex.isattribute` (function)__
- __`tex.isbox` (function)__
- __`tex.iscount` (function)__
- __`tex.isdimen` (function)__
- __`tex.isglue` (function)__
- __`tex.ismuglue` (function)__
- __`tex.ismuskip` (function)__
- __`tex.isskip` (function)__
- __`tex.istoks` (function)__
- *`tex.lccode` (table)*
- __`tex.linebreak` (function)__
- *`tex.lists` (table)*
- __`tex.lua_math_random` (function)__
- __`tex.lua_math_randomseed` (function)__
- *`tex.mathcode` (table)*
- *`tex.muglue` (table)*
- *`tex.muskip` (table)*
- *`tex.nest` (table)*
- __`tex.normal_rand` (function)__
- __`tex.number` (function)__
- __`tex.primitives` (function)__
- __`tex.print` (function)__
- __`tex.quittoks` (function)__
- __`tex.resetparagraph` (function)__
- __`tex.romannumeral` (function)__
- __`tex.round` (function)__
- __`tex.run` (function)__
- __`tex.runtoks` (function)__
- __`tex.saveboxresource` (function)__
- __`tex.scale` (function)__
- __`tex.scantoks` (function)__
- __`tex.set` (function)__
- __`tex.set_synctex_line` (function)__
- __`tex.set_synctex_mode` (function)__
- __`tex.set_synctex_no_files` (function)__
- __`tex.set_synctex_tag` (function)__
- __`tex.setattribute` (function)__
- __`tex.setbox` (function)__
- __`tex.setcatcode` (function)__
- __`tex.setcount` (function)__
- __`tex.setdelcode` (function)__
- __`tex.setdimen` (function)__
- __`tex.setglue` (function)__
- __`tex.setlccode` (function)__
- __`tex.setlist` (function)__
- __`tex.setmath` (function)__
- __`tex.setmathcode` (function)__
- __`tex.setmuglue` (function)__
- __`tex.setmuskip` (function)__
- __`tex.setnest` (function)__
- __`tex.setsfcode` (function)__
- __`tex.setskip` (function)__
- __`tex.settoks` (function)__
- __`tex.setuccode` (function)__
- *`tex.sfcode` (table)*
- __`tex.shipout` (function)__
- __`tex.show_context` (function)__
- *`tex.skip` (table)*
- __`tex.sp` (function)__
- __`tex.splitbox` (function)__
- __`tex.sprint` (function)__
- *`tex.toks` (table)*
- __`tex.tprint` (function)__
- __`tex.triggerbuildpage` (function)__
- *`tex.uccode` (table)*
- __`tex.uniform_rand` (function)__
- __`tex.uniformdeviate` (function)__
- __`tex.useboxresource` (function)__
- __`tex.write` (function)__

### texconfig

- `texconfig.kpse_init` (boolean)

### texio

- __`texio.closeinput` (function)__
- __`texio.reporter` (function)__
- __`texio.setescape` (function)__
- __`texio.write` (function)__
- __`texio.write_nl` (function)__

### token

- __`token.biggest_char` (function)__
- __`token.command_id` (function)__
- __`token.commands` (function)__
- __`token.create` (function)__
- __`token.expand` (function)__
- __`token.get_active` (function)__
- __`token.get_cmdname` (function)__
- __`token.get_command` (function)__
- __`token.get_csname` (function)__
- __`token.get_expandable` (function)__
- __`token.get_id` (function)__
- __`token.get_index` (function)__
- __`token.get_macro` (function)__
- __`token.get_meaning` (function)__
- __`token.get_mode` (function)__
- __`token.get_next` (function)__
- __`token.get_protected` (function)__
- __`token.get_tok` (function)__
- __`token.is_defined` (function)__
- __`token.is_token` (function)__
- __`token.new` (function)__
- __`token.put_next` (function)__
- __`token.scan_argument` (function)__
- __`token.scan_code` (function)__
- __`token.scan_csname` (function)__
- __`token.scan_dimen` (function)__
- __`token.scan_float` (function)__
- __`token.scan_glue` (function)__
- __`token.scan_int` (function)__
- __`token.scan_keyword` (function)__
- __`token.scan_keyword_cs` (function)__
- __`token.scan_list` (function)__
- __`token.scan_real` (function)__
- __`token.scan_string` (function)__
- __`token.scan_token` (function)__
- __`token.scan_toks` (function)__
- __`token.scan_word` (function)__
- __`token.set_char` (function)__
- __`token.set_lua` (function)__
- __`token.set_macro` (function)__
- __`token.type` (function)__

### trackers

- __`trackers.disable` (function)__
- __`trackers.enable` (function)__
- `trackers.name` (string)
- __`trackers.newline` (function)__
- __`trackers.register` (function)__

### unicode

- *`unicode.ascii` (table)*
- *`unicode.grapheme` (table)*
- *`unicode.latin1` (table)*
- *`unicode.utf8` (table)*

### url

- __`url.addscheme` (function)__
- __`url.barepath` (function)__
- __`url.construct` (function)__
- __`url.decode` (function)__
- __`url.encode` (function)__
- __`url.escape` (function)__
- __`url.filename` (function)__
- __`url.hashed` (function)__
- __`url.hasscheme` (function)__
- __`url.query` (function)__
- __`url.split` (function)__
- __`url.toquery` (function)__
- __`url.unescape` (function)__
- __`url.unescapeget` (function)__

### utf

- __`utf.byte` (function)__
- __`utf.char` (function)__
- __`utf.characters` (function)__
- __`utf.chrlen` (function)__
- __`utf.count` (function)__
- __`utf.filetype` (function)__
- __`utf.is_valid` (function)__
- __`utf.len` (function)__
- __`utf.length` (function)__
- __`utf.lower` (function)__
- __`utf.magic` (function)__
- __`utf.remapper` (function)__
- __`utf.replacer` (function)__
- __`utf.split` (function)__
- __`utf.splitlines` (function)__
- __`utf.sub` (function)__
- __`utf.subtituter` (function)__
- __`utf.tocodes` (function)__
- __`utf.toeight` (function)__
- __`utf.toentities` (function)__
- __`utf.totable` (function)__
- __`utf.toutf32string` (function)__
- __`utf.upper` (function)__
- __`utf.ustring` (function)__
- __`utf.utf16_to_utf8_be` (function)__
- __`utf.utf16_to_utf8_be_t` (function)__
- __`utf.utf16_to_utf8_le` (function)__
- __`utf.utf16_to_utf8_le_t` (function)__
- __`utf.utf16_to_utf8_t` (function)__
- __`utf.utf32_to_utf8_be` (function)__
- __`utf.utf32_to_utf8_be_t` (function)__
- __`utf.utf32_to_utf8_le` (function)__
- __`utf.utf32_to_utf8_le_t` (function)__
- __`utf.utf32_to_utf8_t` (function)__
- __`utf.utf8_to_utf16` (function)__
- __`utf.utf8_to_utf16_be` (function)__
- __`utf.utf8_to_utf16_le` (function)__
- __`utf.utf8_to_utf8_t` (function)__
- __`utf.values` (function)__
- __`utf.xstring` (function)__

### utf8

- __`utf8.char` (function)__
- `utf8.charpattern` (string)
- __`utf8.codepoint` (function)__
- __`utf8.codes` (function)__
- __`utf8.len` (function)__
- __`utf8.offset` (function)__

### utilities

- *`utilities.debugger` (table)*
- *`utilities.files` (table)*
- *`utilities.json` (table)*
- *`utilities.lua` (table)*
- *`utilities.parsers` (table)*
- *`utilities.stacker` (table)*
- *`utilities.storage` (table)*
- *`utilities.streams` (table)*
- *`utilities.strings` (table)*
- *`utilities.tables` (table)*
- *`utilities.templates` (table)*
- *`utilities.zipfiles` (table)*

### vf

- __`vf.char` (function)__
- __`vf.down` (function)__
- __`vf.fontid` (function)__
- __`vf.image` (function)__
- __`vf.node` (function)__
- __`vf.nop` (function)__
- __`vf.pdf` (function)__
- __`vf.pop` (function)__
- __`vf.push` (function)__
- __`vf.right` (function)__
- __`vf.rule` (function)__
- __`vf.special` (function)__

### xzip

- __`xzip.adler32` (function)__
- __`xzip.compress` (function)__
- __`xzip.compressobj` (function)__
- __`xzip.crc32` (function)__
- __`xzip.decompress` (function)__
- __`xzip.decompressobj` (function)__
- __`xzip.version` (function)__

### zip

- `zip._COPYRIGHT` (string)
- `zip._DESCRIPTION` (string)
- `zip._VERSION` (string)
- __`zip.close` (function)__
- __`zip.open` (function)__
- __`zip.openfile` (function)__
- __`zip.type` (function)__

### zlib

- __`zlib.adler32` (function)__
- __`zlib.compress` (function)__
- __`zlib.compressobj` (function)__
- __`zlib.crc32` (function)__
- __`zlib.decompress` (function)__
- __`zlib.decompressobj` (function)__
- __`zlib.version` (function)__

```lua
local function printf(s, ...) print(string.format(s, ...)) end

local function sort_keys(t)
    local keys = {}
    for k in pairs(t) do table.insert(keys, k) end
    table.sort(keys)
    return keys
end

local function print_lib_members(lib_name, lib)
    local member_names = sort_keys(lib)
    for _, member in ipairs(member_names) do
        local member_type = type(lib[member])
        if member_type == 'table' then
            printf('- *`%s.%s` (%s)*', lib_name, member, member_type)
        elseif member_type == 'function' then
            printf('- __`%s.%s` (%s)__', lib_name, member, member_type)
        else
            printf('- `%s.%s` (%s)', lib_name, member, member_type)
        end
    end
end

return function()
    local env = _ENV
    local lib_names = sort_keys(env)
    for _, lib_name in ipairs(lib_names) do
        local lib = env[lib_name]
        if type(lib) == 'table' then
            printf('\n### %s\n', lib_name)
            print_lib_members(lib_name, env[lib_name])
        end
    end
end
```
