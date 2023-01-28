---% language=uk
---
---\startcomponent cld-summary
---
---\environment cld-environment
---
---\usemodule[s][characters-properties]
---
---\startchapter[title=A sort of summary]
---
---In this chapter we summarize the functionality provided by the `context`
---namespace. We repeat some of what has been explained in other chapter so that in
---fact you can start with this summary.
---
---If you have read this manual (or seen code) you know that you can access all the
---core commands using this namespace:
---
---```
---context.somecommand("some argument")
---context["somecommand"]("some argument")
---```
---
---These calls will eventually expand `\somecommand` with the given argument.
---This interface has been around form the start and has proven to be quite flexible
---and robust. In spite of what you might think, the `somecommand` is not
---really defined in the `context` namespace, but in its own one called `core`, accessible via `context.core`.
---
---Next we describe the commands that are naturally defined in the `context`
---namespace. Some have counterparts at the macro level (like `bgroup`) but
---many haven't (for instance `rule`). We tried not to polute the `context` namespace too much but although we could have put the helpers in a
---separate namespace it would make usage a bit more unnatural.
---
---\startsection[title=Access to commands]
---
---\startsummary[title={context(".. some text ..")}]
---
---The string is flushed as-is:
---
---```
---.. some text ..
---```
---
---\stopsummary
---
---\startsummary[title={context("format",...)}]
---
---The first string is a format specification according that is passed to the *Lua*
---function `format` in the `string` namespace. Following arguments are
---passed too.
---
---\stopsummary
---
---\startsummary[title={context(123,...)}]
---
---The numbers (and following numbers or strings) are flushed without any
---formatting.
---
---```
---123... (concatenated)
---```
---
---\stopsummary
---
---\startsummary[title={context(true)}]
---
---An explicit `endlinechar` is inserted, in *TeX* speak:
---
---```
---^^M
---```
---
---\stopsummary
---
---\startsummary[title={context(false,...)}]
---
---Strings and numbers are flushed surrounded by curly braces, an indexed table is
---flushed as option list, and a hashed table is flushed as parameter set.
---
---```
---multiple {...} or [...] etc
---```
---
---\stopsummary
---
---\startsummary[title={context(node)}]
---
---The node (or list of nodes) is injected at the spot. Keep in mind that you need
---to do the proper memory management yourself.
---
---\stopsummary
---
---\startsummary[title={context["command"] context.core["command"]}]
---
---The function that implements `\command`. The `core` table is where
---these functions realy live.
---
---\stopsummary
---
---\startsummary[title={context["command"](value,...)}]
---
---The value (string or number) is flushed as a curly braced (regular) argument.
---
---```
---\command {value}...
---```
---
---\stopsummary
---
---\startsummary[title={context["command"]({ value },...)}]
---
---The table is flushed as value set. This can be an identifier,
---a list of options, or a directive.
---
---```
---\command [value]...
---```
---
---\stopsummary
---
---\startsummary[title={context["command"]({ key = val },...)}]
---
---The table is flushed as key/value set.
---
---```
---\command [key={value}]...
---```
---
---\stopsummary
---
---\startsummary[title={context["command"](true)}]
---
---An explicit `endlinechar` is inserted.
---
---```
---\command ^^M
---```
---
---\stopsummary
---
---\startsummary[title={context["command"](node)}]
---
---The node(list) is injected at the spot. Keep in mind that you need to do the
---proper memory management yourself.
---
---```
---\command {node(list)}
---```
---
---\stopsummary
---
---\startsummary[title={context["command"](false,value)}]
---
---The value is flushed without encapsulating tokens.
---
---```
---\command value
---```
---
---\stopsummary
---
---\startsummary[title={context["command"]({ value }, { key = val }, val, false, val)}]
---
---The arguments are flushed accordingly their nature and the order can be any.
---
---```
---\command [value][key={value}]{value}value
---```
---
---\stopsummary
---
---\startsummary[title={context.direct(...)}]
---
---The arguments are interpreted the same as if `direct` was a command, but no
---`\direct` is injected in front. Braces are added:
---
---\startbuffer
---regular \expandafter \bold \ctxlua{context.direct("bold")} regular
---black \expandafter \color \ctxlua{context.direct({"red"})}{red} black
---black \expandafter \color \ctxlua{context.direct({"green"},"green")} black
---\stopbuffer
---
---\typebuffer
---
---The `\expandafter` makes sure that the `\bold` and `\color`
---macros see the following `{bold`}, `[red]`, and `[green]{green`}
---arguments.
---
---\startlines\getbuffer\stoplines
---
---\stopsummary
---
---\startsummary[title={context.delayed(...)}]
---
---The arguments are interpreted the same as in a `context` call, but instead
---of a direct flush, the arguments will be flushed in a next cycle.
---
---\stopsummary
---
---\startsummary[title={context.delayed["command"](...)}]
---
---The arguments are interpreted the same as in a `command` call, but instead
---of a direct flush, the command and arguments will be flushed in a next cycle.
---
---\stopsummary
---
---\startsummary[title={context.nested["command"]}]
---
---This command returns the command, including given arguments as a string. No
---flushing takes place.
---
---\stopsummary
---
---\startsummary[title={context.nested}]
---
---This command returns the arguments as a string and treats them the same as a
---regular `context` call.
---
---\stopsummary
---
---\startsummary[title={context.formatted["command"]([<regime>,]<format>,<arguments>)}]
---
---This command returns the command that will pass it's arguments to the string
---formatter. When the first argument is a number, then it is interpreted as a
---catcode regime.
---
---\stopsummary
---
---\startsummary[title={context.formatted([<regime>,]<format>,<arguments>)}]
---
---This command passes it's arguments to the string formatter. When the first
---argument is a number, then it is interpreted as a catcode regime.
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=\METAFUN]
---
---\startsummary[title={context.metafun.start()}]
---
---This starts a \METAFUN\ (or \METAPOST) graphic.
---
---\stopsummary
---
---\startsummary[title={context.metafun.stop()}]
---
---This finishes and flushes a \METAFUN\ (or \METAPOST) graphic.
---
---\stopsummary
---
---\startsummary[title={context.metafun("format",...)}]
---
---The argument is appended to the current graphic data but the string formatter is
---used on following arguments.
---
---\stopsummary
---
---\startsummary[title={context.metafun.delayed}]
---
---This namespace does the same as `context.delayed`: it wraps the code in such
---a way that it can be used in a function call.
---
---\stopsummary
---
---\startsection[title=Building blocks]
---
---\startsummary[title={context.bgroup() context.egroup()}]
---
---These are just `\bgroup` and `\egroup` equivalents and as these are
---in fact shortcuts to the curly braced we output these instead.
---
---\stopsummary
---
---\startsummary[title={context.space()}]
---
---This one directly maps onto `\space`.
---
---\stopsummary
---
---\startsummary[title={context.par()}]
---
---This one directly maps onto `\par`.
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=Basic Helpers]
---
---\startsummary[title={context.rule(wd,ht,dp,direction) context.rule(specification)}]
---
---A rule node is injected with the given properties. A specification is just a
---table with the four fields. The rule gets the current attributes.
---
---\stopsummary
---
---\startsummary[title={context.glyph(fontid,n) context.glyph(n)}]
---
---A glyph node is injected with the given font id. When no id is given, the current font
---is used. The glyph gets the current attributes.
---
---\stopsummary
---
---\startsummary[title={context.char(n) context.char(str)  context.char(tab)}]
---
---This will inject one or more copies of `\char` calls. You can pass a
---number, a string representing a number, or a table with numbers.
---
---\stopsummary
---
---\startsummary[title={context.utfchar(n) context.utfchar(str)}]
---
---This injects is *UTF-8* character (one or more bytes). You can pass a number
---or a string representing a numbers. You need to be aware of special
---characters in *TeX*, like `#`.
---
---\stopsummary
---
----------------------------------------------------------------


---
---# Registers
---
---This is a table that hosts a couple of functions. The following `new`
---ones are available:
---
---```
---local n = newdimen (name)
---local n = newskip  (name)
---local n = newcount (name)
---local n = newmuskip(name)
---local n = newtoks  (name)
---local n = newbox   (name)
---```
---
---These define a register with name `name` at the *Lua* end and `\name`
---at the *TeX* end. The registers' number is returned. The next function is like
---`\chardef`: it defines `\name` with value `n`.
---
---```
---local n = newchar(name,n)
---```
---
---It's not likely that you will use any of these commands, if only because when
---you're operating from the *Lua* end using *Lua* variables is more convenient.
---
----------------------------------------------------------------


---
---\startsection[title=Catcodes]
---
---Normally we operate under the so called `context` catcode regime. This
---means that content gets piped to *TeX* using the same meanings for characters as
---you normally use in *ConTeXt*. So, a ``` starts math. In \in {table}
---[tab:catcodes] we show the catcode regimes.
---
---\startplacetable[location=page,title={Catcode regimes},reference=tab:catcodes]
---    \showcharactercatcodes
---\stopplacetable
---
---\startsummary[title={context.catcodes}]
---
---The `context.catcodes` tables contains the internal numbers of the
---catcode tables used. The next table shows the names that can be used.
---
--- name      mnemonic  *TeX* command 
--- context   ctx       ctxcatcodes   
--- protect   prt       prtcatcodes   
--- plain     tex       texcatcodes   
--- text      txt       txtcatcodes   
--- verbatim  vrb       vrbcatcodes   
---
---\stopsummary
---
---\startsummary[title={context.newindexer(catcodeindex)}]
---
---This function defines a new indexer. You can think of the context command itself
---as an indexer. There are two (extra) predefined indexers:
---
---```
---context.verbatim = context.newindexer(context.catcodes.verbatim)
---context.puretext = context.newindexer(context.catcodes.text)
---```
---
---\stopsummary
---
---\startsummary[title={context.pushcatcodes(n) context.popcatcodes()}]
---
---These commands switch to another catcode regime and back. They have to be used
---in pairs. Only the regimes atthe *Lua* end are set.
---
---\stopsummary
---
---\startsummary[title={context.unprotect() context.protect()}]
---
---These commands switch to the protected regime and back. They have to be used in
---pairs. Beware: contrary to what its name suggests, the `unprotect` enables
---the protected regime. These functions also issue an `\unprotect` and `\protect` equivalent at the *TeX* end.
---
---\stopsummary
---
---\startsummary[title={context.verbatim context.puretext}]
---
---The differences between these are subtle:
---
---\startbuffer
---\startluacode
---    context.verbatim.bold("Why do we use ` for math?") context.par()
---    context.verbatim.bold("Why do we use { as start?") context.par()
---    context.verbatim.bold("Why do we use } as end?")   context.par()
---    context.puretext.bold("Why do we use {\\bi `} at all?")
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---Verbatim makes all characters letters while pure text leaves the backslash and
---curly braces special.
---
---\startpacked \getbuffer \stoppacked
---
---\stopsummary
---
---\startsummary[title={context.protected}]
---
---The protected namespace is only used for commands that are in the *ConTeXt*
---private namespace.
---
---\stopsummary
---
---\startsummary[title={context.escaped(str) context.escape(str)}]
---
---The first command pipes the escaped string to *TeX*, while the second one just
---returns an unescaped string. The characters `# ` % \ \ { `} are escaped.
---
---\stopsummary
---
---\startsummary[title={context.startcollecting() context.stopcollecting()}]
---
---These two commands will turn flushing to *TeX* into collecting. This can be handy
---when you want to interface commands that grab arguments using delimiters and as
---such they are used deep down in some table related interfacing. You probably
---don't need them.
---
---\stopsummary
---
----------------------------------------------------------------


---
---# Templates
---
---In addition to the regular template mechanism (part of the utilities) there is a
---dedicated template feature in the `context` namespace. An example demonstrates
---its working:
---
---\startbuffer
---\startluacode
---  local MyTable = [[
---    \bTABLE
---      \bTR
---         \bTD \bf %one_first% \eTD
---         \bTD %[one_second]% \eTD
---      \eTR
---      \bTR
---        \bTD \bf %two_first% \eTD
---        \bTD %[two_second]% \eTD
---      \eTR
---    \eTABLE
---  ]]
---
---  context.templates[MyTable] {
---    one_first  = "one",
---    two_first  = "two",
---    one_second = "just one `",
---    two_second = "just two `",
---  }
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---This renders:
---
---\startlinecorrection
---    \getbuffer
---\stoplinecorrection
---
---You can also use more complex tables. Watch the space before and after the keys:
---
---\startbuffer
---\startluacode
---  local MyOtherTable = [[
---    \bTABLE
---      \bTR
---        \bTD \bf % ['one']['first'] % \eTD
---        \bTD %[ ['one']['second'] ]% \eTD
---      \eTR
---      \bTR
---        \bTD \bf % ['two']['first'] % \eTD
---        \bTD %[ ['two']['second'] ]% \eTD
---      \eTR
---    \eTABLE
---  ]]
---
---  local data = {
---    one = { first = "one", second = "only 1`" },
---    two = { first = "two", second = "only 2`" },
---  }
---
---  context.templates[MyOtherTable](data)
---
---  context.templates(MyOtherTable,data)
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---We get:
---
---\startlinecorrection
---    \getbuffer
---\stoplinecorrection
---
----------------------------------------------------------------


---
---# Management
---
---\startsummary[title={context.functions}]
---
---This is private table that hosts managament of functions. You'd better leave this
---one alone!
---
---\stopsummary
---
---\startsummary[title={context.nodes}]
---
---Normally you will just use `context(<somenode>)` to flush a node and this
---private table is more for internal use.
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=String handlers]
---
---These two functions implement handlers that split a given string into lines and
---do something with it. We stick to showing their call. They are used for special
---purpose flushing, like flushing content to *TeX* in commands discussed here. The
---\XML\ subsystem also used a couple of dedicated handlers.
---
---```
---local foo = newtexthandler {
---    content    = function(s) ... end,
---    endofline  = function(s) ... end,
---    emptyline  = function(s) ... end,
---    simpleline = function(s) ... end,
---}
---
---local foo = newverbosehandler {
---    line    = function(s) ... end,
---    space   = function(s) ... end,
---    content = function(s) ... end,
---    before  = function() ... end,
---    after   = function() ... end,
---}
---```
---
---\startsummary[title={context.printlines(str)}]
---
---The low level `tex.print` function pipes its content to *TeX* and thereby
---terminates at at `\r` (cariage return, \ASCII\ 13), although it depends on
---the way catcodes and line endings are set up. In fact, a line ending in *TeX* is
---not really one, as it gets replaced by a space. Only several lines in succession
---indicate a new paragraph.
---
---\startbuffer
---\startluacode
---    tex.print("line 1\n line 2\r line 3")
---\stopluacode
---\stopbuffer
---
---\typebuffer
---
---This renders only two lines:
---
---\getbuffer
---
---\startbuffer
---\startluacode
---    context("line 1\n line 2\r line 3")
---\stopluacode
---\stopbuffer
---
---However, the `context` command gives all three lines:
---
---\typebuffer
---
---Like:
---
---\getbuffer
---
---The `context.printlines` command is a direct way to print a string in a way
---similar to reading from a file. So,
---
---```
---tex.print(io.loaddata(resolvers.findfile("tufte")))
---```
---
---Gives one line, while:
---
---```
---context.printlines(io.loaddata(resolvers.findfile("tufte")))
---```
---
---gives them all, as does:
---
---```
---context(io.loaddata(resolvers.findfile("tufte")))
---```
---
---as does a na\"ive:
---
---```
---tex.print((string.gsub(io.loaddata(resolvers.findfile("tufte")),"\r","\n")))
---```
---
---But, because successive lines need to become paragraph separators as bit more
---work is needed and that is what `printlines` and `context` do for
---you. However, a more convenient alternative is presented next.
---
---\stopsummary
---
---\startsummary[title={context.loadfile(name)}]
---
---This function locates and loads the file with the given name. The leading and
---trailing spaces are stripped.
---
---\stopsummary
---
---\startsummary[title={context.runfile(name)}]
---
---This function locates and processes the file with the given name. The assumption
---is that it is a valid *Lua* file! When no suffix is given, the suffix `cld`
---(*ConTeXt* *Lua* document) is used.
---
---\stopsummary
---
---\startsummary[title={context.viafile(data[,tag])}]
---
---The `data` is saved to a (pseudo) file with the optional name `tag`
---and read in again from that file. This is a robust way to make sure that the data
---gets processed like any other data read from file. It permits all kind of
---juggling with catcodes, verbatim and alike.
---
---\stopsummary
---
----------------------------------------------------------------


---
---# Helpers
---
---\startsummary[title={context.tocontext(variable)}]
---
---For documentation or tracing it can be handy to serialize a variable. The `tocontext` function does this:
---
---```
---context.tocontext(true)
---context.tocontext(123)
---context.tocontext("foo")
---context.tocontext(tonumber)
---context.tocontext(nil)
---context.tocontext({ "foo", "bar" },true)
---context.tocontext({ this = { foo , "bar" } },true)
---```
---
---Beware, `tocontext` is also a table that you can assign to, but that might
---spoil serialization. This property makes it possible to extend the serializer.
---
---\stopsummary
---
---\startsummary[title={context.tobuffer(name,str[,catcodes])}]
---
---With this function you can put content in a buffer, optionally under a catcode
---regime.
---
---\stopsummary
---
---\startsummary[title={context.tolines(str[,true])}]
---
---This function splits the string in lines and flushes them one by one. When the
---second argument is `true` leading and trailing spaces are stripped. Each
---flushed line always gets one space appended.
---
---\stopsummary
---
---\startsummary[title={context.fprint([regime,]fmt,...),tex.fprint([regime,]fmt,...)}]
---
---The `tex.fprint` is just there to complement the other flushers in the
---`tex` namespace and therefore we also have it in the `context`
---namespace.
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=Tracing]
---
---\startsummary[title={context.settracing(true or false))}]
---
---You can trace the *TeX* code that is generated at the *TeX* end with:
---
---```
---\enabletrackers[context.trace]
---```
---
---The *Lua* function sets the tracing from the *Lua* end. As the `context`
---command is used a lot in the core, you can expect some more tracing that the code
---that you're currently checking.
---
---\stopsummary
---
---\startsummary[title={context.pushlogger(fnc) context.poplogger() context.getlogger()}]
---
---You can provide your own logger if needed. The pushed function receives one string
---argument. The getter returns three functions:
---
---```
---local flush, writer, flushdirect = context.getlogger()
---```
---
---The `flush` function is similar to `tex.sprint` and appends its
---arguments, while `flushdirect` treats each argument as a line and behaves
---like `tex.print`. The `flush` function adds braces and paranthesis
---around its arguments, apartt from the first one, which is considered to be a
---command. Examples are:
---
---```
---flush("one",2,"three") -- catcode, strings|numbers
---writer("\\color",{"red"},"this is red")
---```
---
---and:
---
---```
---flush(context.catcodes.verbatim,"one",2,"three")
---writer(context.catcodes.verbatim,"\\color",{"red"},"this is red")
---```
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=States]
---
---There are several ways to implement alternative code paths in *ConTeXt* but modes
---and conditionals are used mostly. There area few helpers for that.
---
---\startsummary[title={context.conditionals context.setconditional(name,value)}]
---
---Conditionals are used to keep a state. You can set their value using the setter,
---but their effect is not immediate but part of the current sequence of commands
---which is delegated to *TeX*. However, you can easily keep track of your state
---at the *Lua* end with an extra boolean. So, after
---
---```
---if context.conditionals.whatever then
---    context.setconditional("dothis",false)
---else
---    context.setconditional("dothat",true)
---end
---```
---
---the value of `dothis` and `dothat` conditions are not yet set in
---*Lua*.
---
---\stopsummary
---
---\startsummary[title={context.modes context.setmode(name,value)}]
---
---As with conditionals, you can (re)set the modes in *Lua* but their values
---get changes as part of the command sequence which is delayed till after the
---*Lua* call.
---
---\stopsummary
---
---\startsummary[title={context.systemmodes context.setsystemmode(name,value)}]
---
---The same applies as for regular modes.
---
---\stopsummary
---
---\startsummary[title={context.trialtypesetting()}]
---
---This function returns `true` if we're in trial typesetting mode (used when
---for instance prerolling a table).
---
---\stopsummary
---
----------------------------------------------------------------


---
---\startsection[title=Steps]
---
---The stepper permits stepwise processing of *ConTeXt* code: after a step contyrol
---gets delegated to *ConTeXt* and afterwards back to *Lua*. There main limitation of
---this mechanism is that it cannot exceed the number of input levels.
---
---\startsummary[title={context.stepwise() context.step([str])}]
---
---Usage is as follows:
---
---```
---context.stepwise (function()
---    ...
---    context.step(...)
---    ...
---    context.step(...)
---    ...
---    context.stepwise (function()
---        ...
---        context.step(...)
---        ...
---    context.step(...)
---    ...
---    end)
---    ...
---    context.step(...)
---    ...
---    context.step(...)
---    ...
---end)
---```
---
---\stopsummary
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---