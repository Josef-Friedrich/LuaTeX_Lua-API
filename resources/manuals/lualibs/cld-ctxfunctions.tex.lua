---% language=uk
---
---\startcomponent cld-ctxfunctions
---
---\environment cld-environment
---
---# The *Lua* interface code
---
---# Introduction
---
---There is a lot of *Lua* code in \MKIV. Much is not exposed and a lot of what is
---exposed is not meant to be used directly at the *Lua* end. But there is also
---functionality and data that can be accessed without side effects.
---
---In the following sections a subset of the built in functionality is discussed.
---There are often more functions alongside those presented but they might change or
---disappear. So, if you use undocumented features, be sure to tag them somehow in
---your source code so that you can check them out when there is an update. Best
---would be to have more functionality defined local so that it is sort of hidden
---but that would be unpractical as for instance functions are often used in other
---modules and or have to be available at the *TeX* end.
---
---It might be tempting to add your own functions to namespaces created by *ConTeXt*
---or maybe overload some existing ones. Don't do this. First of all, there is no
---guarantee that your code will not interfere, nor that it overloads future
---functionality. Just use your own namespace. Also, future versions of *ConTeXt*
---might have a couple of protection mechanisms built in. Without doubt the
---following sections will be extended as soon as interfaces become more stable.
---
----------------------------------------------------------------


---
---# Characters
---
---% not discussed:
---%
---% characters.filters.utf.addgrapheme()
---% characters.filters.utf.collapse()
---% characters.getrange()
---% characters.bidi[]
---% tex.uprint()
---% utf.string()
---% characters.flush()
---
---There are quite some data tables defined but the largest is the character
---database. You can consult this table any time you want but you're not supposed to
---add or change its content if only because changes will be overwritten when you
---update *ConTeXt*. Future versions may carry more information. The table can be
---accessed using an unicode number. A relative simple entry looks as follows:
---
---\ShowLuaExampleTableHex{characters.data[0x00C1]}
---
---Much of this is rather common information but some of it is specific for use with
---*ConTeXt*. Some characters have even more information, for instance those that
---deal with mathematics:
---
---\ShowLuaExampleTableHex{characters.data[0x2190]}
---
---Not all characters have a real entry. For instance most \CJK\ characters are
---virtual and share the same data:
---
---\ShowLuaExampleTableHex{characters.data[0x3456]}
---
---You can also access the table using *UTF-8* characters:
---
---\ShowLuaExampleTable{characters.data["ä"]}
---
---A more verbose string access is also supported:
---
---\ShowLuaExampleTableHex{characters.data["U+0070"]}
---
---Another (less usefull) table contains information about ranges in this character
---table. You can access this table using rather verbose names, or you can use
---collapsed lowercase variants.
---
---\ShowLuaExampleTableHex{characters.blocks["CJK Compatibility Ideographs"]}
---
---\ShowLuaExampleTableHex{characters.blocks["hebrew"]}
---
---\ShowLuaExampleTableHex{characters.blocks["combiningdiacriticalmarks"]}
---
---Some fields can be accessed using functions. This can be handy when you need that
---information for tracing purposes or overviews. There is some overhead in the
---function call, but you get some extra testing for free. You can use characters as
---well as numbers as index.
---
---\ShowLuaExampleString{characters.contextname("ä")}
---\ShowLuaExampleString{characters.adobename(228)}
---\ShowLuaExampleString{characters.description("ä")}
---
---The category is normally a two character tag, but you can also ask for a more
---verbose variant:
---
---\ShowLuaExampleString{characters.category(228)}
---\ShowLuaExampleString{characters.category(228,true)}
---
---The more verbose category tags are available in a table:
---
---\ShowLuaExampleString{characters.categorytags["lu"]}
---
---There are several fields in a character entry that help us to remap a character.
---The `lccode` indicates the lowercase code point and the `uccode` to
---the uppercase code point. The `shcode` refers to one or more characters
---that have a similar shape.
---
---\ShowLuaExampleString{characters.shape ("ä")}
---\ShowLuaExampleString{characters.uccode("ä")}
---\ShowLuaExampleString{characters.lccode("ä")}
---
---\ShowLuaExampleString{characters.shape (100)}
---\ShowLuaExampleString{characters.uccode(100)}
---\ShowLuaExampleString{characters.lccode(100)}
---
---You can use these function or access these fields directly in an
---entry, but we also provide a few virtual tables that avoid
---accessing the whole entry. This method is rather efficient.
---
---\ShowLuaExampleString{characters.lccodes["ä"]}
---\ShowLuaExampleString{characters.uccodes["ä"]}
---\ShowLuaExampleString{characters.shcodes["ä"]}
---\ShowLuaExampleString{characters.lcchars["ä"]}
---\ShowLuaExampleString{characters.ucchars["ä"]}
---\ShowLuaExampleString{characters.shchars["ä"]}
---
---As with other tables, you can use a number instead of an *UTF-8* character. Watch
---how we get a table for multiple shape codes but a string for multiple shape
---characters.
---
---\ShowLuaExampleString{characters.lcchars[0x00C6]}
---\ShowLuaExampleString{characters.ucchars[0x00C6]}
---\ShowLuaExampleString{characters.shchars[0x00C6]}
---\ShowLuaExampleTable {characters.shcodes[0x00C6]}
---
---These codes are used when we manipulate strings. Although there
---are `upper` and `lower` functions in the `string` namespace, the following ones are the real ones to be
---used in critical situations.
---
---\ShowLuaExampleString{characters.lower("ÀÁÂÃÄÅàáâãäå")}
---\ShowLuaExampleString{characters.upper("ÀÁÂÃÄÅàáâãäå")}
---\ShowLuaExampleString{characters.shaped("ÀÁÂÃÄÅàáâãäå")}
---
---A rather special one is the following:
---
---\ShowLuaExampleString{characters.lettered("Only 123 letters + count!")}
---
---With the second argument is true, spaces are kept and collapsed. Leading and
---trailing spaces are stripped.
---
---\ShowLuaExampleString{characters.lettered("Only 123 letters + count!",true)}
---
---Access to tables can happen by number or by string, although there are some
---limitations when it gets too confusing. Take for instance the number `8`
---and string `"8"`: if we would interpret the string as number we could never
---access the entry for the character eight. However, using more verbose hexadecimal
---strings works okay. The remappers are also available as functions:
---
---\ShowLuaExampleString{characters.tonumber("a")}
---\ShowLuaExampleString{characters.fromnumber(100)}
---\ShowLuaExampleString{characters.fromnumber(0x0100)}
---\ShowLuaExampleString{characters.fromnumber("0x0100")}
---\ShowLuaExampleString{characters.fromnumber("U+0100")}
---
---In addition to the already mentioned category information you can also use a more
---direct table approach:
---
---\ShowLuaExampleString{characters.categories["ä"]}
---\ShowLuaExampleString{characters.categories[100]}
---
---In a similar fashion you can test if a given character is in a specific category.
---This can save a lot of tests.
---
---\ShowLuaExampleBoolean{characters.is_character[characters.categories[67]]}
---\ShowLuaExampleBoolean{characters.is_character[67]}
---\ShowLuaExampleBoolean{characters.is_character[characters.data[67].category]}
---\ShowLuaExampleBoolean{characters.is_letter[characters.data[67].category]}
---\ShowLuaExampleBoolean{characters.is_command[characters.data[67].category]}
---
---Another virtual table is the one that provides access to special information, for
---instance about how a composed character is made up of components.
---
---\ShowLuaExampleString{characters.specialchars["ä"]}
---\ShowLuaExampleString{characters.specialchars[100]}
---
---The outcome is often similar to output that uses the shapecode information.
---
---Although not all the code deep down in *ConTeXt* is meant for use at the user
---level, it sometimes can eb tempting to use data and helpers that are available as
---part of the general housekeeping. The next table was used when looking into
---sorting Korean. For practical reasons we limit the table to ten entries;
---otherwise we would have ended up with hundreds of pages.
---
---\startbuffer
---\startluacode
---local data = characters.data
---local map  = characters.hangul.remapped
---
---local first, last = characters.getrange("hangulsyllables")
---
---last = first + 9 -- for now
---
---context.start()
---
---context.definedfont { "file:unbatang" }
---
---context.starttabulate { "|T||T||T||T||T|" }
---for unicode = first, last do
---    local character = data[unicode]
---    local specials = character.specials
---    if specials then
---        context.NC()
---        context.formatted("%04V",unicode)
---        context.NC()
---        context.formatted("%c",unicode)
---        for i=2,4 do local chr = specials[i] if chr then chr = map[chr] or chr context.NC() context.formatted("%04V",chr) context.NC() context.formatted("%c",chr) else context.NC() context.NC() end
---        end
---        context.NC()
---        context(character.description)
---        context.NC()
---        context.NR()
---    end
---end
---context.stoptabulate()
---
---context.stop()
---\stopluacode
---\stopbuffer
---
---\getbuffer \typebuffer
---
----------------------------------------------------------------


---
---# Fonts
---
---% not discussed (as not too relevant for users):
---%
---% cache cache_version
---% nomath
---% units units_per_em
---% direction embedding encodingbytes
---% boundarychar boundarychar_label
---% has_italic has_math
---% tounicode sub
---% colorscheme (will probably become a hash)
---% language script
---% spacer
---% MathConstants and a few split_names
---%
---% tables.baselines
---
---There is a lot of code that deals with fonts but most is considered to be a black
---box. When a font is defined, its data is collected and turned into a form that
---*TeX* likes. We keep most of that data available at the *Lua* end so that we can
---later use it when needed. In this chapter we discuss some of the possibilities.
---More details can be found in the font manual(s) so we don't aim for completeness
---here.
---
---A font instance is identified by its id, which is a number where zero is reserved
---for the so called `nullfont`. The current font id can be requested by the
---following function.
---
---\ShowLuaExampleString{fonts.currentid()}
---
---The `fonts.current()` call returns the table with data related to the
---current id. You can access the data related to any id as follows:
---
---```
---local tfmdata = fonts.identifiers[number]
---```
---
---Not all entries in the table make sense for the user as some are just meant to
---drive the font initialization at the *TeX* end or the backend. The next table
---lists the most important ones. Some of the tables are just shortcuts to en entry
---in one of the `shared` subtables.
---
---@field ascender number # the height of a line conforming the font 
---@field descender number # the depth of a line conforming the font 
---@field italicangle number # the angle of the italic shapes (if present) 
---@field designsize number # the design size of the font (if known) 
---\ML
---@field size number # the size in scaled points if the font instance 
---@field factor number # the multiplication factor for unscaled dimensions 
---@field hfactor number # the horizontal multiplication factor 
---@field vfactor number # the vertical multiplication factor 
---@field extend number # the horizontal scaling to be used by the backend 
---@field slant number # the slanting to be applied by the backend 
---\ML
---@field characters table # the scaled character (glyph) information (tfm) 
---@field descriptions table # the original unscaled glyph information (otf, afm, tfm) 
---@field indices table # the mapping from unicode slot to glyph index 
---@field unicodes table # the mapoing from glyph names to unicode 
---@field marks table # a hash table with glyphs that are marks as entry 
---@field parameters table # the font parameters as *TeX* likes them 
---@field mathconstants table # the *OpenType* math parameters 
---@field mathparameters`  table   a reference to the `MathConstants table # 
---@field shared table # a table with information shared between instances 
---@field unique table # a table with information unique for this instance 
---@field unscaled table # the unscaled (intermediate) table 
---@field goodies table # the *ConTeXt* specific extra font information 
---@field fonts table # the table with references to other fonts 
---@field cidinfo table # a table with special information for the backend 
---\ML
---@field filename string # the full path of the loaded font 
---@field fontname string # the font name as specified in the font (limited in size) 
---@field fullname string # the complete font name as specified in the font 
---@field name string # the (short) name of the font 
---@field psname string # the (unique) name of the font as used by the backend 
---\ML
---@field hash string # the hash that makes this instance unique 
---@field id number # the id (number) that *TeX* will use for this instance 
---\ML
---@field type string # an idicator if the font is `virtual` or `real` 
---@field format string # a qualification for this font, e.g.\ `opentype` 
---@field mode string # the *ConTeXt* processing mode, `node` or `base` 
---\ML
---
---The `parameters` table contains variables that are used by *TeX* itself.
---You can use numbers as index and these are equivalent to the so called `\fontdimen` variables. More convenient is is to access by name:
---
--- `slant`         the slant per point (seldom used) 
--- `space`         the interword space 
--- `spacestretch`  the interword stretch 
--- `spaceshrink`   the interword shrink 
--- `xheight`       the x-height (not per se the heigth of an x) 
--- `quad`          the so called em-width (often the width of an emdash)
--- `extraspace`    additional space added in specific situations 
---
---The math parameters are rather special and explained in the *LuaTeX* manual.
---Quite certainly you never have to touch these parameters at the *Lua* end.
---
---En entry in the `characters` table describes a character if we have entries
---within the *Unicode* range. There can be entries in the private area but these
---are normally variants of a shape or special math glyphs.
---
--- `name`              the name of the character 
--- `index`             the index in the raw font table 
--- `height`            the scaled height of the character 
--- `depth`             the scaled depth of the character 
--- `width`             the scaled height of the character 
--- `tounicode`         a *UTF-8*16 string representing the conversion back to unicode 
--- `expansion_factor`  a multiplication factor for (horizontal) font expansion 
--- `left_protruding`   a multiplication factor for left side protrusion 
--- `right_protruding`  a multiplication factor for right side protrusion 
--- `italic`            the italic correction 
--- `next`              a pointer to the next character in a math size chain 
--- `vert_variants`     a pointer to vertical variants conforming *OpenType* math 
--- `horiz_variants`    a pointer to horizontal variants conforming *OpenType* math 
--- `top_accent`        information with regards to math top accents 
--- `mathkern`          a table describing stepwise math kerning (following the shape) 
--- `kerns`             a table with intercharacter kerning dimensions 
--- `ligatures`         a (nested) table describing ligatures that start with this character 
--- `commands`          a table with commands that drive the backend code for a virtual shape 
---
---Not all entries are present for each character. Also, in so called `node`
---mode, the `ligatures` and `kerns` tables are empty because in that
---case they are dealt with at the *Lua* end and not by *TeX*.
---
---% \startluacode
---% local tfmdata = fonts.current()
---% context.starttabulate{ "|l|pl|" }
---%     for k, v in table.sortedhash(tfmdata) do
---%         local tv = type(v)
---%         if tv == "string" or tv == "number" or tv == "boolean" then
---%             context.NC()
---%             string.tocontext(k)
---%             context.NC()
---%             string.tocontext(tostring(v))
---%             context.NC()
---%             context.NR()
---%         end
---%     end
---% context.stoptabulate()
---% \stopluacode
---
---% \ShowLuaExampleTable{table.sortedkeys(fonts.current())}
---
---Say that you run into a glyph node and want to access the data related to that
---glyph. Given that variable `n` points to the node, the most verbose way of
---doing that is:
---
---```
---local g = fonts.identifiers[n.id].characters[n.char]
---```
---
---Given the speed of *LuaTeX* this is quite fast. Another method is the following:
---
---```
---local g = fonts.characters[n.id][n.char]
---```
---
---For some applications you might want faster access to critical
---parameters, like:
---
---```
---local quad    = fonts.quads   [n.id][n.char]
---local xheight = fonts.xheights[n.id][n.char]
---```
---
---but that only makes sense when you don't access more than one such variable at
---the same time.
---
---Among the shared tables is the feature specification:
---
---\ShowLuaExampleTable{fonts.current().shared.features}
---
---As features are a prominent property of *OpenType* fonts, there are a few
---datatables that can be used to get their meaning.
---
---\ShowLuaExampleString{fonts.handlers.otf.tables.features['liga']}
---\ShowLuaExampleString{fonts.handlers.otf.tables.languages['nld']}
---\ShowLuaExampleString{fonts.handlers.otf.tables.scripts['arab']}
---
---There is a rather extensive font database built in but discussing its interface
---does not make much sense. Most usage happens automatically when you use the `name:` and `spec:` methods of defining fonts and the `mtx-fonts`
---script is built on top of it.
---
---\ctxlua{fonts.names.load()} % could be metatable driven
---
---\ShowLuaExampleTable{table.sortedkeys(fonts.names.data)}
---
---You can load the database (if it's not yet loaded) with:
---
---```
---names.load(reload,verbose)
---```
---
---When the first argument is true, the database will be rebuild. The second
---arguments controls verbosity.
---
---Defining a font normally happens at the *TeX* end but you can also do it in *Lua*.
---
---```
---local id, fontdata = fonts.definers.define {
---    lookup = "file",             -- use the filename (file spec name)
---    name   = "pagella-regular",  -- in this case the filename
---    size   = 10*65535,           -- scaled points
---    global = false,              -- define the font globally
---    cs     = "MyFont",           -- associate the name \MyFont
---    method = "featureset",       -- featureset or virtual (* or @)
---    sub    = nil,                -- no subfont specifier
---    detail = "whatever",         -- the featureset (or whatever method applies)
---}
---```
---
---In this case the `detail` variable defines what featureset has to be
---applied. You can define such sets at the *Lua* end too:
---
---```
---fonts.definers.specifiers.presetcontext (
---    "whatever",
---    "default",
---    {
---        mode = "node",
---        dlig = "yes",
---    }
---)
---```
---
---The first argument is the name of the featureset. The second argument can be an
---empty string or a reference to an existing featureset that will be taken as
---starting point. The final argument is the featureset. This can be a table or a
---string with a comma separated list of key/value pairs.
---
----------------------------------------------------------------


---
---# Nodes
---
---Nodes are the building blocks that make a document reality. Nodes are linked into
---lists and at various moments in the typesetting process you can manipulate them.
---Deep down in *ConTeXt* we use quite some *Lua* magic to manipulate lists of
---nodes. Therefore it is no surprise that we have some tracing available. Take the
---following box.
---
---\startbuffer
---\setbox0\hbox{It's in \hbox{\bf all} those nodes.}
---\stopbuffer
---
---\typebuffer \getbuffer
---
---This box contains characters and glue between the words. The box is already
---constructed. There can also be kerns between characters, but of course only if
---the font provides such a feature. Let's inspect this box:
---
---\ShowLuaExampleString{nodes.toutf(tex.box[0])}
---\ShowLuaExampleString{nodes.toutf(tex.box[0].list)}
---
---This tracer returns the text and spacing and recurses into nested lists. The next
---tracer does not do this and marks non glyph nodes as `[-]`:
---
---\ShowLuaExampleString{nodes.listtoutf(tex.box[0])}
---\ShowLuaExampleString{nodes.listtoutf(tex.box[0].list)}
---
---A more verbose tracer is the next one. It does show a bit more detailed
---information about the glyphs nodes.
---
---\ShowLuaExampleString{nodes.tosequence(tex.box[0])}
---\ShowLuaExampleString{nodes.tosequence(tex.box[0].list)}
---
---The fourth tracer does not show that detail and collapses sequences of similar
---node types.
---
---\ShowLuaExampleString{nodes.idstostring(tex.box[0])}
---\ShowLuaExampleString{nodes.idstostring(tex.box[0].list)}
---
---The number of nodes in a list is identified with the `countall` function.
---Nested nodes are counted too.
---
---\ShowLuaExampleString{nodes.countall(tex.box[0])}
---\ShowLuaExampleString{nodes.countall(tex.box[0].list)}
---
---There are a lot of helpers in the `nodes` namespace. In fact, we map all the
---helpers provided by the engine itself under `nodes` too. These are described
---in the *LuaTeX* manual. There are for instance functions to check node types and
---node id's:
---
---```
---local str = node.type(1)
---local num = node.id("vlist")
---```
---
---These are basic *LuaTeX* functions. In addition to those we also provide a few more
---helpers as well as
---mapping tables. There are two tables that map node id's to strings and backwards:
---
---\starttabulate
--- `nodes.nodecodes`     regular nodes, some fo them are sort of private to the engine 
--- `nodes.noadcodes`     math nodes that later on are converted into regular nodes  
---
---Nodes can have subtypes. Again we have tables that map the subtype numbers onto
---meaningfull names and reverse.
---
---\starttabulate
--- `nodes.listcodes`     subtypes of `hlist` and `vlist` nodes 
--- `nodes.kerncodes`     subtypes of `kern` nodes 
--- `nodes.gluecodes`     subtypes of `glue` nodes (skips) 
--- `nodes.glyphcodes`    subtypes of `glyph` nodes, the subtype can change 
--- `nodes.mathcodes`     math specific subtypes 
--- `nodes.fillcodes`     these are not really subtypes but indicate the strength of the filler 
--- `nodes.whatsitcodes`  subtypes of a rather large group of extension nodes 
---
---Some of the names of types and subtypes have underscores but you can omit them
---when you use these tables. You can use tables like this as follows:
---
---```
---local glyph_code = nodes.nodecodes.glyph
---local kern_code  = nodes.nodecodes.kern
---local glue_code  = nodes.nodecodes.glue
---
---for n in nodes.traverse(list) do
---    local id == n.id
---    if id == glyph_code then
---        ...
---    elseif id == kern_code then
---        ...
---    elseif id == glue_code then
---        ...
---    else
---        ...
---    end
---end
---```
---
---You only need to use such temporary variables in time critical code. In spite of
---what you might think, lists are not that long and given the speed of *Lua* (and
---successive optimizations in *LuaTeX*) looping over a paragraphs is rather fast.
---
---Nodes are created using `node.new`. If you study the *ConTeXt* code you
---will notice that there are quite some functions in the `nodes.pool`
---namespace, like:
---
---```
---local g = nodes.pool.glyph(fnt,chr)
---```
---
---Of course you need to make sure that the font id is valid and that the referred
---glyph in in the font. You can use the allocators but don't mess with the code in
---the `pool` namespace as this might interfere with its usage all over
---*ConTeXt*.
---
---The `nodes` namespace provides a couple of helpers and some of them are
---similar to ones provided in the `node` namespace. This has practical as
---well as historic reasons. For instance some were prototypes functions that were
---later built in.
---
---```
---local head, current      = nodes.before (head, current, new)
---local head, current      = nodes.after  (head, current, new)
---local head, current      = nodes.delete (head, current)
---local head, current      = nodes.replace(head, current, new)
---local head, current, old = nodes.remove (head, current)
---```
---
---Another category deals with attributes:
---
---```
---nodes.setattribute      (head, attribute, value)
---nodes.unsetattribute    (head, attribute)
---nodes.setunsetattribute (head, attribute, value)
---nodes.setattributes     (head, attribute, value)
---nodes.unsetattributes   (head, attribute)
---nodes.setunsetattributes(head, attribute, value)
---nodes.hasattribute      (head, attribute, value)
---```
---
---% context(typesetters.hpack("Hello World!"))
---% context(typesetters.hpack("Hello World!",1,100*1024*10))
---
---% nodes.firstchar
---% nodes.firstcharinbox
---
---% maybe node-tst
---% tasks and so
---% number.points (to numbers)
---
----------------------------------------------------------------


---
---% # Core
---%     {\em todo}
---% \stopsection
---
---# Resolvers
---
---All \IO\ is handled by functions in the `resolvers` namespace. Most of the
---code that you find in the `data-*.lua` files is of litle relevance for
---users, especially at the *Lua* end, so we won't discuss it here in great detail.
---
---The resolver code is modelled after the \KPSE\ library that itself implements the
---*TeX* Directory Structure in combination with a configuration file. However, we
---go a bit beyond this structure, for instance in integrating support for other
---resources that file systems. We also have our own configuration file. But
---important is that we still support a similar logic too so that regular
---configurations are dealt with.
---
---During a run *LuaTeX* needs files of a different kind: source files, font files,
---images, etc. In practice you will probably only deal with source files. The most
---fundamental function is `findfile`. The first argument is the filename to
---be found. A second optional argument indicates the file type.
---
---The following table relates so called formats to suffixes and variables in the
---configuration file.
---
---\startluacode
---context.starttabulate { "|lp|lp|l|" }
---context.NC() context.bold("variable")
---context.NC() context.bold("format")
---context.NC() context.bold("suffix")
---context.NC() context.NR()
---context.ML()
---for k, v in table.sortedpairs(resolvers.relations.core) do
---    local names = v.names
---    local variable = v.variable
---    local suffixes = v.suffixes
---    context.NC()
---    if variable then
---        context.type(variable)
---    end
---    context.NC()
---    if names then
---        for i=1,#names do context.type(names[i]) context.par()
---        end
---    end
---    context.NC()
---    if suffixes then
---        context.type(table.concat(suffixes, " "))
---    end
---    context.NC()
---    context.NR()
---end
---context.stoptabulate()
---\stopluacode
---
---There are a couple of more formats but these are not that relevant in the
---perspective of *ConTeXt*.
---
---When a lookup takes place, spaces are ignored and formats are normalized to
---lowercase.
---
---\ShowLuaExampleString{file.strip(resolvers.findfile("context.tex"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("context.mkiv"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("context"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("data-res.lua"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold.otf"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold","otf"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold","opentype"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold","opentypefonts"),"tex/")}
---\ShowLuaExampleString{file.strip(resolvers.findfile("lmsans10-bold","opentype fonts"),"tex/")}
---
---The plural variant of this function returns one or more matches.
---
---\ShowLuaExampleTable{resolvers.findfiles("texmfcnf.lua","cnf")}
---\ShowLuaExampleTable{resolvers.findfiles("context.tex","")}
---
---% table.print(resolvers.instance.environment)
---% table.print(resolvers.instance.variables)
---% table.print(resolvers.instance.expansions)
---%
---% resolvers.expandbraces
---% resolvers.expandpath
---% resolvers.expandvar
---% resolvers.showpath
---% resolvers.var_value
---%
---% resolvers.getenv
---% resolvers.variable()
---% resolvers.expansion()
---% resolvers.is_variable
---% resolvers.is_expansion
---%
---% resolvers.unexpandedpathlist(str)
---% resolvers.unexpandedpath(str)
---% resolvers.cleanpathlist
---% resolvers.expandpath
---% resolvers.expandedpath
---% resolvers.expandedpathlistfromvariable
---% resolvers.expandpathfromvariable
---% resolvers.expandbraces
---%
---% resolvers.findpath
---% resolvers.findgivenfiles
---% resolvers.findgivenfile
---% resolvers.findwildcardfiles
---% resolvers.findwildcardfile
---% resolvers.showpath
---
---% data-tre as example
---% schemes (data-she)
---% caching (containers)
---% findbinfile  (open|load)
---% variables / environment
---% findtexfile opentexfile loadtexfile
---% file://
---
---% supp
---
----------------------------------------------------------------


---
---# Mathematics (math)
---    {\em todo}
----------------------------------------------------------------


---
---# Graphics (grph)
---    {\em is a separate chapter}
----------------------------------------------------------------


---
---# Languages (lang)
---    {\em todo}
----------------------------------------------------------------


---
---# MetaPost (mlib)
---    {\em todo}
----------------------------------------------------------------


---
---# Lua\TeX\ (luat)
---    {\em todo}
----------------------------------------------------------------


---
---# Tracing (trac)
---    {\em todo}
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---