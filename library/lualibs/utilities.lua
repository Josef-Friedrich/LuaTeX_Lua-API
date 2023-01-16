---@meta
utilities = {}

---https://github.com/latex3/lualibs/blob/main/lualibs-util-deb.lua
utilities.debugger = {}

function utilities.debugger.disable() end
function utilities.debugger.enable() end
function utilities.debugger.savestats(filename, threshold) end
function utilities.debugger.showstats(printer, threshold) end
function utilities.debugger.showtraceback(rep) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-fil.lua
utilities.files = {}

function utilities.files.close(f) end
function utilities.files.getposition() end
function utilities.files.getsize(f) end
function utilities.files.look(f, n, chars) end
function utilities.files.open(filename, zb) end
function utilities.files.read2dot14() end
function utilities.files.readbyte() end
function utilities.files.readbytes() end
function utilities.files.readbytetable() end
function utilities.files.readcardinal() end
function utilities.files.readcardinal1() end
function utilities.files.readcardinal2() end
function utilities.files.readcardinal2le(f) end
function utilities.files.readcardinal3() end
function utilities.files.readcardinal3le(f) end
function utilities.files.readcardinal4() end
function utilities.files.readcardinal4le(f) end
function utilities.files.readcardinaltable() end
function utilities.files.readchar(f) end
function utilities.files.readfixed2() end
function utilities.files.readfixed4() end
function utilities.files.readinteger() end
function utilities.files.readinteger1() end
function utilities.files.readinteger2() end
function utilities.files.readinteger2le(f) end
function utilities.files.readinteger3() end
function utilities.files.readinteger3le(f) end
function utilities.files.readinteger4() end
function utilities.files.readinteger4le(f) end
function utilities.files.readintegertable() end
function utilities.files.readsignedbyte() end
function utilities.files.readstring(f, n) end
function utilities.files.setposition() end
function utilities.files.size(f) end
function utilities.files.skip(f, n) end
function utilities.files.skiplong(f, n) end
function utilities.files.skipposition() end
function utilities.files.skipshort(f, n) end
function utilities.files.writebyte(f, b) end
function utilities.files.writecardinal2(f, n) end
function utilities.files.writecardinal4(f, n) end
function utilities.files.writestring(f, s) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-jsn.lua
utilities.json = {}

function utilities.json.load(filename) end
function utilities.json.tojson(value) end
function utilities.json.tolua(str) end
function utilities.json.tostring(value, pretty) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-lua.lua
utilities.lua = {}

function utilities.lua.checkmemory(previous, threshold, trace) end
function utilities.lua.compile(luafile, lucfile, cleanup, strip, fallback) end
function utilities.lua.loadedluacode(fullname, forcestrip, name, macros) end
function utilities.lua.loadstring(code, name) end
function utilities.lua.loadstripped() end
function utilities.lua.registerfinalizer(f) end
function utilities.lua.strippedloadstring(code, name, forcestrip) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-prs.lua
utilities.parsers = {}

function utilities.parsers.add_settings_to_array(t, str) end
function utilities.parsers.arguments_to_table(str) end
function utilities.parsers.array_to_string(a, separator) end
function utilities.parsers.csvsplitter(specification) end
function utilities.parsers.getparameters(self, class, parentclass, settings) end
function utilities.parsers.groupedsplitat(symbol, withaction) end
function utilities.parsers.hash_to_string(h, separator, yes, no, strict, omit) end
function utilities.parsers.iterator(str, separator) end
function utilities.parsers.keq_to_hash(str) end
function utilities.parsers.listitem(str) end
function utilities.parsers.make_settings_to_hash_pattern(set, how) end
function utilities.parsers.mergehashes(hash, list) end
function utilities.parsers.options_to_array(str) end
function utilities.parsers.options_to_hash(str, target) end
function utilities.parsers.process_stripped_settings(str, action) end
function utilities.parsers.rfc4180splitter(specification) end
function utilities.parsers.runtime(time) end
function utilities.parsers.settings_to_array(str, strict) end
function utilities.parsers.settings_to_array_obey_fences(str) end
function utilities.parsers.settings_to_array_with_repeat(str, expand) end
function utilities.parsers.settings_to_hash(str, existing) end
function utilities.parsers.settings_to_hash_colon_too(str) end
function utilities.parsers.settings_to_hash_strict(str, existing) end
function utilities.parsers.settings_to_hash_tolerant(str, existing) end
function utilities.parsers.settings_to_numbers(str) end
function utilities.parsers.settings_to_set(str) end
function utilities.parsers.simple_hash_to_string(h, separator) end
function utilities.parsers.splitmethod(str, default) end
function utilities.parsers.splitthousands(str) end
function utilities.parsers.stepper(str, n, action) end
function utilities.parsers.stripped_settings_to_array(str) end
function utilities.parsers.totime(str) end
function utilities.parsers.unittotex(str, textmode) end
function utilities.parsers.unittoxml(str) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-sac.lua
utilities.streams = {}

function utilities.streams.close() end
function utilities.streams.getposition(f) end
function utilities.streams.getsize(f) end
function utilities.streams.getstring(f) end
function utilities.streams.look(f, n, chars) end
function utilities.streams.open(filename, zerobased) end
function utilities.streams.openstring(f, zerobased) end
function utilities.streams.read2dot14(f) end
function utilities.streams.readbyte(f) end
function utilities.streams.readbytes(f, n) end
function utilities.streams.readbytetable(f, n) end
function utilities.streams.readcardinal(f) end
function utilities.streams.readcardinal1(f) end
function utilities.streams.readcardinal2(f) end
function utilities.streams.readcardinal2le(f) end
function utilities.streams.readcardinal3(f) end
function utilities.streams.readcardinal3le(f) end
function utilities.streams.readcardinal4(f) end
function utilities.streams.readcardinal4le(f) end
function utilities.streams.readcardinaltable(f, n, b) end
function utilities.streams.readchar(f) end
function utilities.streams.readcstring(f) end
function utilities.streams.readfixed2(f) end
function utilities.streams.readfixed4(f) end
function utilities.streams.readinteger(f) end
function utilities.streams.readinteger1(f) end
function utilities.streams.readinteger2(f) end
function utilities.streams.readinteger2le(f) end
function utilities.streams.readinteger3(f) end
function utilities.streams.readinteger3le(f) end
function utilities.streams.readinteger4(f) end
function utilities.streams.readinteger4le(f) end
function utilities.streams.readintegertable(f, n, b) end
function utilities.streams.readsignedbyte(f) end
function utilities.streams.readstring(f, n) end
function utilities.streams.setposition(f, i) end
function utilities.streams.size(f) end
function utilities.streams.skip(f, n) end
function utilities.streams.skipbytes(f, n) end
function utilities.streams.skiplong(f, n) end
function utilities.streams.skipshort(f, n) end
function utilities.streams.tocardinal1() end
function utilities.streams.tocardinal1le() end
function utilities.streams.tocardinal2(n) end
function utilities.streams.tocardinal2le(n) end
function utilities.streams.tocardinal3(n) end
function utilities.streams.tocardinal3le(n) end
function utilities.streams.tocardinal4(n) end
function utilities.streams.tocardinal4le(n) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-sta.lua
utilities.stacker = {}

function utilities.stacker.new(name) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-sto.lua
utilities.storage = {}

function utilities.storage.allocate(t) end
function utilities.storage.checked(t) end
function utilities.storage.mark(t) end
function utilities.storage.marked(t) end
function utilities.storage.setinitializer(data, initialize) end
function utilities.storage.sparse(t) end

---https://github.com/latex3/lualibs/blob/main/lualibs-util-str.lua
utilities.strings = {}

function utilities.strings.collapse(str) end
function utilities.strings.collapsecrlf(str) end
function utilities.strings.newcollector() end
function utilities.strings.newrepeater(str, offset) end
function utilities.strings.nice(str) end
function utilities.strings.striplines(str, how) end
function utilities.strings.striplong(str, how) end
function utilities.strings.tabtospace(str, tab) end

-- https://github.com/latex3/lualibs/blob/main/lualibs-util-tpl.lua
utilities.templates = {}

function utilities.templates.load(filename, mapping, how, recurse) end
function utilities.templates.replace(str, mapping, how, recurse) end
function utilities.templates.replacer(str, how, recurse) end
function utilities.templates.resolve(t, mapping, how, recurse) end
