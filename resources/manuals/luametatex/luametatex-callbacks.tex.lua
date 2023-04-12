---% language=us runpath=texruns:manuals/luametatex
---
---\environment luametatex-style
---
---\startcomponent luametatex-callbacks
---
---# *Lua* callbacks
---
---# Registering callbacks[library=callback]
---
---{\em The callbacks are a moving target. Don't bother me with questions about
---them. Some are new and/or experimental and therefore not yet documented. In
---*ConTeXt* we can easily adapt interfaces so changes in these have no real effect
---on users. Of course in due time all will be official and documented.}
---
---This library has functions that register, find and list callbacks. Callbacks are
---*Lua* functions that are called in well defined places. There are two kinds of
---callbacks: those that mix with existing functionality, and those that (when
---enabled) replace functionality. In most cases the second category is expected to
---behave similar to the built in functionality because in a next step specific data
---is expected. For instance, you can replace the hyphenation routine. The function
---gets a list that can be hyphenated (or not). The final list should be valid and
---is (normally) used for constructing a paragraph. Another function can replace the
---ligature builder and/or kern routine. Doing something else is possible but in
---the end might not give the user the expected outcome.
---
---The first thing you need to do is registering a callback:
---
---```
---id = callback.register(<string> callback_name, <function> func)
---id = callback.register(<string> callback_name, nil)
---id = callback.register(<string> callback_name, false)
---```
---
---Here the `callback_name` is a predefined callback name, see below. The
---function returns the internal `id` of the callback or `nil`, if the
---callback could not be registered.
---
---*LuaTeX* internalizes the callback function in such a way that it does not matter
---if you redefine a function accidentally.
---
---Callback assignments are always global. You can use the special value `nil`
---instead of a function for clearing the callback.
---
---For some minor speed gain, you can assign the boolean `false` to the
---non-file related callbacks, doing so will prevent *LuaTeX* from executing
---whatever it would execute by default (when no callback function is registered at
---all). Be warned: this may cause all sorts of grief unless you know `exactly` what you are doing!
---
---```
---<table> info =
---    callback.list()
---```
---
---The keys in the table are the known callback names, the value is a boolean where
---`true` means that the callback is currently set (active).
---
---```
---<function> f = callback.find(callback_name)
---```
---
---If the callback is not set, `find` returns `nil`. The `known`
---function can be used to check if a callback is supported.
---
---```
---if callback.known("foo") then ... end
---```
---
----------------------------------------------------------------


---
---\startsection[title={File related callbacks},reference=iocallback][library=callback]
---
---# `find_format_file` and `find_log_file`
---
---These callbacks are called as:
---
---```
---<string> actualname =
---    function (<string> askedname)
---```
---
---The `askedname` is a format file for reading (the format file for writing
---is always opened in the current directory) or a log file for writing.
---
----------------------------------------------------------------


---
---# `open_data_file`
---
---This callback function gets a filename passed:
---
---```
---<table> env = function (<string> filename)
---```
---
---The return value is either the boolean value false or a table with two functions.
---A mandate `reader` function fill be called once for each new line to be
---read, the optional `close` function will be called once *LuaTeX* is done
---with the file.
---
---*LuaTeX* never looks at the rest of the table, so you can use it to store your
---private per-file data. Both the callback functions will receive the table as
---their only argument.
---
---% No longer needed anyway.
---%
---% # `if_end_of_file`
---%
---% 
---%
---% This callback has no arguments and your function should return true or false. The
---% callback is triggered by `\ifeof`. It's up to the macro package to come up
---% with a reasonable implementation. By default the test is always true.
---%
---% ```
---% <boolean> eof =
---%     function ()
---% ```
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Data processing callbacks[library=callback]
---
---# `process_jobname`
---
---This callback allows you to change the jobname given by `jobname` in *TeX*
---and `tex.jobname` in Lua. It does not affect the internal job name or the
---name of the output or log files.
---
---```
---function(<string> jobname)
---    return <string> adjusted_jobname
---end
---```
---
---The only argument is the actual job name; you should not use `tex.jobname`
---inside this function or infinite recursion may occur. If you return `nil`,
---*LuaTeX* will pretend your callback never happened. This callback does not
---replace any internal code.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Node list processing callbacks[library=callback]
---
---The description of nodes and node lists is in \in{chapter}[nodes].
---
---# `contribute_filter`
---
---This callback is called when *LuaTeX* adds contents to list:
---
---```
---function(<string> extrainfo)
---end
---```
---
---The string reports the group code. From this you can deduce from
---what list you can give a treat.
---
--- value              explanation                                  
---
--- `pre_box`     interline material is being added            
--- `pre_adjust`  `vadjust` material is being added       
--- `box`         a typeset box is being added (always called) 
--- `adjust`      `vadjust` material is being added       
---
----------------------------------------------------------------


---
---# `buildpage_filter`
---
---This callback is called whenever *LuaTeX* is ready to move stuff to the main
---vertical list. You can use this callback to do specialized manipulation of the
---page building stage like imposition or column balancing.
---
---```
---function(<string> extrainfo)
---end
---```
---
---The string `extrainfo` gives some additional information about what *TeX*'s
---state is with respect to the “current page”. The possible values for the
---`buildpage_filter` callback are:
---
--- value                   explanation                             
---
--- `alignment`        a (partial) alignment is being added    
--- `after_output`     an output routine has just finished     
--- `new_graf`         the beginning of a new paragraph        
--- `vmode_par`        `par` was found in vertical mode   
--- `hmode_par`        `par` was found in horizontal mode 
--- `insert`           an insert is added                      
--- `penalty`          a penalty (in vertical mode)            
--- `before_display`   immediately before a display starts     
--- `after_display`    a display is finished                   
--- `end`              *LuaTeX* is terminating (it's all over) 
---
----------------------------------------------------------------


---
---# `build_page_insert`
---
---This callback is called when the page builder adds an insert. There is not much
---control over this mechanism but this callback permits some last minute
---manipulations of the spacing before an insert, something that might be handy when
---for instance multiple inserts (types) are appended in a row.
---
---```
---function(<number> n, <number> i)
---    return <number> register
---end
---```
---
---with
---
--- value     explanation             
---
--- `n`  the insert class        
--- `i`  the order of the insert 
---
---The return value is a number indicating the skip register to use for the
---prepended spacing. This permits for instance a different top space (when `i` equals one) and intermediate space (when `i` is larger than one). Of
---course you can mess with the insert box but you need to make sure that *LuaTeX*
---is happy afterwards.
---
----------------------------------------------------------------


---
---# `pre_linebreak_filter`
---
---This callback is called just before *LuaTeX* starts converting a list of nodes
---into a stack of `hbox`es, after the addition of `parfillskip`.
---
---```
---function(<node> head, <string> groupcode)
---    return <node> newhead
---end
---```
---
---The string called `groupcode` identifies the nodelist's context within
---*TeX*'s processing. The range of possibilities is given in the table below, but
---not all of those can actually appear in `pre_linebreak_filter`, some are
---for the `hpack_filter` and `vpack_filter` callbacks that will be
---explained in the next two paragraphs.
---
--- value                 explanation                                 
---
--- `<empty>`        main vertical list                          
--- `hbox`           `hbox` in horizontal mode              
--- `adjusted_hbox`  `hbox` in vertical mode                
--- `vbox`           `vbox`                                 
--- `vtop`           `vtop`                                 
--- `align`          `halign` or `valign`              
--- `disc`           discretionaries                             
--- `insert`         packaging an insert                         
--- `vcenter`        `vcenter`                              
--- `local_box`      `localleftbox` or `localrightbox` 
--- `split_off`      top of a `vsplit`                      
--- `split_keep`     remainder of a `vsplit`                
--- `align_set`      alignment cell                              
--- `fin_row`        alignment row                               
---
---As for all the callbacks that deal with nodes, the return value can be one of
---three things:
---
---* boolean `true` signals successful processing
---
---* `<node>` signals that the “head” node should be replaced by the
---    returned node
---
---* boolean `false` signals that the “head” node list should be
---    ignored and flushed from memory
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `linebreak_filter`
---
---This callback replaces *LuaTeX*'s line breaking algorithm.
---
---```
---function(<node> head, <boolean> is_display)
---    return <node> newhead
---end
---```
---
---The returned node is the head of the list that will be added to the main vertical
---list, the boolean argument is true if this paragraph is interrupted by a
---following math display.
---
---If you return something that is not a `<node>`, *LuaTeX* will apply the
---internal linebreak algorithm on the list that starts at `<head>`.
---Otherwise, the `<node>` you return is supposed to be the head of a list of
---nodes that are all allowed in vertical mode, and at least one of those has to
---represent an `hbox`. Failure to do so will result in a fatal error.
---
---Setting this callback to `false` is possible, but dangerous, because it is
---possible you will end up in an unfixable “deadcycles loop”.
---
----------------------------------------------------------------


---
---# `append_to_vlist_filter`
---
---This callback is called whenever *LuaTeX* adds a box to a vertical list (the
---`mirrored` argument is obsolete):
---
---```
---function(<node> box, <string> locationcode, <number> prevdepth)
---    return list [, prevdepth [, checkdepth ] ]
---end
---```
---
---It is ok to return nothing or `nil` in which case you also need to flush
---the box or deal with it yourself. The prevdepth is also optional. Locations are
---`box`, `alignment`, `equation`, `equation_number` and
---`post_linebreak`. When the third argument returned is `true` the
---normal prevdepth correction will be applied, based on the first node.
---
----------------------------------------------------------------


---
---# `post_linebreak_filter`
---
---This callback is called just after *LuaTeX* has converted a list of nodes into a
---stack of `hbox`es.
---
---```
---function(<node> head, <string> groupcode)
---    return <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `glyph_run`
---
---When set this callback is triggered when *TeX* normally handles the ligaturing
---and kerning. In *LuaTeX* you use the `hpack_filter` and `per_linebreak_filter` callbacks for that (where each passes different
---arguments). This callback doesn't get triggered when there are no glyphs (in
---*LuaTeX* this optimization is controlled by a a variable).
---
---```
---function(<node> head, <string> groupcode, <number> direction])
---    return <node> newhead
---end
---```
---
---The traditional *TeX* font processing is bypassed so you need to take care of that
---with the helpers. (For the moment we keep the ligaturing and kerning callbacks but
---they are kind of obsolete.)
---
----------------------------------------------------------------


---
---# `hpack_filter`
---
---This callback is called when *TeX* is ready to start boxing some horizontal mode
---material. Math items and line boxes are ignored at the moment.
---
---```
---function(<node> head, <string> groupcode, <number> size,
---         <string> packtype [, <number> direction] [, <node> attributelist])
---    return <node> newhead
---end
---```
---
---The `packtype` is either `additional` or `exactly`. If `additional`, then the `size` is a `\hbox spread ...` argument. If
---`exactly`, then the `size` is a `\hbox to ...`. In both cases,
---the number is in scaled points.
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `vpack_filter`
---
---This callback is called when *TeX* is ready to start boxing some vertical mode
---material. Math displays are ignored at the moment.
---
---This function is very similar to the `hpack_filter`. Besides the fact
---that it is called at different moments, there is an extra variable that matches
---*TeX*'s `maxdepth` setting.
---
---```
---function(<node> head, <string> groupcode, <number> size, <string> packtype,
---        <number> maxdepth [, <number> direction] [, <node> attributelist]))
---    return <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `packed_vbox_filter`
---
---After the `vpack_filter` callback (see previous section) is triggered the
---box get packed and after that this callback can be configured to kick in.
---
---```
---function(<node> head, <string> groupcode)
---    return <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `alignment_filter`
---
---This is an experimental callback that when set is called several times during the
---construction of an alignment. The context values are available in `tex.getalignmentcontextvalues()`.
---
---```
---function(<node> head, <string> context, <node> attributes, <node> preamble)
---    -- no return values
---end
---```
---
---There are no sanity checks so if a user messes up the passed node lists the results
---can be unpredictable and, as with other node related callbacks, crash the engine.
---
----------------------------------------------------------------


---
---# `localbox_filter`
---
---Local boxes are a somewhat tricky and error prone feature so use this callback
---with care because the paragraph is easily messed up. A line can have a left,
---right and middle box where the middle one has no width. The callback gets quite
---some parameters passed:
---
---```
---function(<node> linebox, <node> leftbox, <node> rightbox, <node> middlebox,
---    <number> linenumber,
---    <number> leftskip, <number> rightskip, <number> lefthang, <number> righthang,
---    <number> indentation, <number> parinitleftskip, <number> parinitrightskip,
---    <number> parfillleftskip, <number> parfillrightskip,
---    <number> overshoot)
---    -- no return values
---end
---```
---
---This is an experimental callback that will be tested in different *ConTeXt*
---mechanisms before it will be declared stable.
---
----------------------------------------------------------------


---
---# `process_rule`
---
---This is an experimental callback. It can be used with rules of subtype 4
---(user). The callback gets three arguments: the node, the width and the
---height. The callback can use `pdf.print` to write code to the *PDF*
---file but beware of not messing up the final result. No checking is done.
---
----------------------------------------------------------------


---
---# `pre_output_filter`
---
---This callback is called when *TeX* is ready to start boxing the box 255 for `output`.
---
---```
---function(<node> head, <string> groupcode, <number> size, <string> packtype,
---        <number> maxdepth [, <number> direction])
---    return <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
----------------------------------------------------------------


---
---# `hyphenate`
---
---This callback is supposed to insert discretionary nodes in the node list it
---receives.
---
---```
---function(<node> head, <node> tail)
---    -- no return values
---end
---```
---
---Setting this callback to `false` will prevent the internal discretionary
---insertion pass.
---
----------------------------------------------------------------


---
---# `ligaturing`
---
---This callback, which expects no return values, has to apply ligaturing to the
---node list it receives.
---
---```
---function(<node> head, <node> tail)
---    -- no return values
---end
---```
---
---You don't have to worry about return values because the `head` node that is
---passed on to the callback is guaranteed not to be a glyph_node (if need be, a
---temporary node will be prepended), and therefore it cannot be affected by the
---mutations that take place. After the callback, the internal value of the “tail of the list” will be recalculated.
---
---The `next` of `head` is guaranteed to be non-nil. The `next` of
---`tail` is guaranteed to be nil, and therefore the second callback argument
---can often be ignored. It is provided for orthogonality, and because it can
---sometimes be handy when special processing has to take place.
---
---Setting this callback to `false` will prevent the internal ligature
---creation pass. You must not ruin the node list. For instance, the head normally
---is a local par node, and the tail a glue. Messing too much can push *LuaTeX* into
---panic mode.
---
----------------------------------------------------------------


---
---# `kerning`
---
---This callback has to apply kerning between the nodes in the node list it
---receives. See `ligaturing` for calling conventions.
---
---```
---function(<node> head, <node> tail)
---    -- no return values
---end
---```
---
---Setting this callback to `false` will prevent the internal kern insertion
---pass. You must not ruin the node list. For instance, the head normally is a local
---par node, and the tail a glue. Messing too much can push *LuaTeX* into panic
---mode.
---
----------------------------------------------------------------


---
---# `append_line_filter`
---
---Every time a line is added this callback is triggered, when set. migrated
---material and adjusts also qualify as such and the detail relates to the adjust
---index.
---
---```
---function(<node> head, <node> tail, <string> context, <number> detail)
---    return <node> newhead
---end
---```
---
---A list of possible context values can be queried with `tex.getappendlinecontextvalues()`.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Paragraph callbacks
---
---# `insert_par`
---
---Each paragraph starts with a local par node that keeps track of for instance
---the direction. You can hook a callback into the creator:
---
---```
---function(<node> par, <string> location)
---    -- no return values
---end
---```
---
---There is no return value and you should make sure that the node stays valid
---as otherwise *TeX* can get confused.
---
----------------------------------------------------------------


---
---# `begin_paragraph`
---
---{\em todo}
---
----------------------------------------------------------------


---
---# `paragraph_context`
---
---{\em todo}
---
----------------------------------------------------------------


---
---# Math related callbacks
---
---# `mlist_to_hlist`
---
---This callback replaces *LuaTeX*'s math list to node list conversion algorithm.
---
---```
---function(<node> head, <string> display_type, <boolean> need_penalties)
---    return <node> newhead
---end
---```
---
---The returned node is the head of the list that will be added to the vertical or
---horizontal list, the string argument is either “text” or “display”
---depending on the current math mode, the boolean argument is `true` if
---penalties have to be inserted in this list, `false` otherwise.
---
---Setting this callback to `false` is bad, it will almost certainly result in
---an endless loop.
---
----------------------------------------------------------------


---
---# `math_rule`
---
---{\em todo}
---
----------------------------------------------------------------


---
---# `make_extensible`
---
---{\em todo}
---
----------------------------------------------------------------


---
---# `register_extensible`
---
---{\em todo}
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Information reporting callbacks[library=callback]
---
---# `pre_dump`
---
---```
---function()
---    -- no return values
---end
---```
---
---This function is called just before dumping to a format file starts. It does not
---replace any code and there are neither arguments nor return values.
---
----------------------------------------------------------------


---
---# `start_run`
---
---```
---function()
---    -- no return values
---end
---```
---
---This callback replaces the code that prints *LuaTeX*'s banner. Note that for
---successful use, this callback has to be set in the *Lua* initialization script,
---otherwise it will be seen only after the run has already started.
---
----------------------------------------------------------------


---
---# `stop_run`
---
---```
---function()
---end
---```
---
---This callback replaces the code that prints *LuaTeX*'s statistics and “output written to” messages. The engine can still do housekeeping and therefore
---you should not rely on this hook for postprocessing the *PDF* or log file.
---
----------------------------------------------------------------


---
---# `intercept_tex_error`, `intercept_lua_error`
---
---```
---function()
---    -- no return values
---end
---```
---
---This callback is run from inside the *TeX* error function, and the idea is to
---allow you to do some extra reporting on top of what *TeX* already does (none of
---the normal actions are removed). You may find some of the values in the `status` table useful. The *TeX* related callback gets two arguments: the current
---processing mode and a boolean indicating if there was a runaway.
---
----------------------------------------------------------------


---
---# `show_error_message` and `show_warning_message`
---
---```
---function()
---    -- no return values
---end
---```
---
---These callback replaces the code that prints the error message. The usual
---interaction after the message is not affected.
---
----------------------------------------------------------------


---
---# `start_file`
---
---```
---function(category,filename)
---    -- no return values
---end
---```
---
---This callback replaces the code that *LuaTeX* prints when a file is opened like
---`(filename` for regular files. The category is a number:
---
--- value   meaning 
---
--- 1  a normal data file, like a *TeX* source 
--- 2  a font map coupling font names to resources 
--- 3  an image file (`png`, `pdf`, etc) 
--- 4  an embedded font subset 
--- 5  a fully embedded font 
---
----------------------------------------------------------------


---
---# `stop_file`
---
---```
---function(category)
---    -- no return values
---end
---```
---
---This callback replaces the code that *LuaTeX* prints when a file is closed like
---the `)` for regular files.
---
----------------------------------------------------------------


---
---# `wrapup_run`
---
---This callback is called after the *PDF* and log files are closed. Use it at your own
---risk.
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---# Font-related callbacks[library=callback]
---
---# `define_font`
---
---```
---function(<string> name, <number> size)
---    return <number> id
---end
---```
---
---The string `name` is the filename part of the font specification, as given
---by the user.
---
---The number `size` is a bit special:
---
---* If it is positive, it specifies an “at size” in scaled points.
---
---* If it is negative, its absolute value represents a “scaled” setting
---    relative to the design size of the font.
---
---The font can be defined with `font.define` which returns a font identifier
---that can be returned in the callback. So, contrary to *LuaTeX*, in *Lua*METATEX\
---we only accept a number.
---
---The internal structure of the `font` table that is passed to `font.define` is explained in \in {chapter} [fonts]. That table is saved
---internally, so you can put extra fields in the table for your later *Lua* code to
---use. In alternative, `retval` can be a previously defined fontid. This is
---useful if a previous definition can be reused instead of creating a whole new
---font structure.
---
---Setting this callback to `false` is pointless as it will prevent font
---loading completely but will nevertheless generate errors.
---
----------------------------------------------------------------


---
---# `missing_character` and `process_character`
---
---This callback is triggered when a character node is created and the font doesn't
---have the requested character.
---
---```
---function(<node> glyph, <number> font, <number> character)
---    -- no return value
---end
---```
---
---The `process_character` callback is experimental and gets called when a
---glyph node is created and the callback field in a character is set.
---
---```
---function(<number> font, <number> character)
---    -- no return value
---end
---```
---
----------------------------------------------------------------


---
----------------------------------------------------------------


---
---\startsection[title=Reporting]
---
---# `show_whatsit`
---
---Because we only have a generic whatsit it is up to the macro package to provide
---details when tracing them.
---
---```
---function(<node> whatsit, <number> indentation,
---    <number> tracinglevel, <number> currentlevel, <number> inputlevel)
---    -- no return value
---end
---```
---
---The indentation tells how many periods are to be typeset if you want to be
---compatible with the rest of tracing. The tracinglevels indicates if the current
---level and\|/or input level are shown cf. `tracinglevels`. Of course one
---is free to show whatever in whatever way suits the whatsit best.
---
----------------------------------------------------------------


---
---# `get_attribute`
---
---Because attributes are abstract pairs of indices and values the reported
---properties makes not much sense and are very macro package (and user) dependent.
---This callback permits more verbose reporting by the engine when tracing is
---enabled.
---
---```
---function(<number> index, <number> value)
---    return <string>, <string>
---end
---```
---
----------------------------------------------------------------


---
---# `get_noad_class`
---
---We have built-in math classes but there can also be user defined ones. This
---callback can be used to report more meaningful strings instead of numbers when
---tracing.
---
---```
---function(<number> class)
---    return <string>
---end
---```
---
----------------------------------------------------------------


---
---# `trace_memory`
---
---When the engine starts all kind of memory is pre-allocated> depending on the
---configuration more gets allocated when a category runs out of memory. The
---*Lua*METATEX\ engine is more dynamic than *LuaTeX*. If this callback is set it will
---get called as follows:
---
---```
---function(<string> category, <boolean> success)
---    -- no return value
---end
---```
---
---The boolean indicates if the allocation has been successful. One can best quit
---the run when this one is `false`, if the engine doesn't already do that.
---
----------------------------------------------------------------


---
---# `hpack_quality`
---
---This callback can be used to intercept the overfull messages that can result from
---packing a horizontal list (as happens in the par builder). The function takes a
---few arguments:
---
---```
---function(<string> incident, <number> detail, <node> head, <number> first,
---         <number> last)
---    return <node> whatever
---end
---```
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed
---(when protrusion or expansion is enabled, this is an intermediate list).
---Optionally you can return a node, for instance an overfull rule indicator. That
---node will be appended to the list (just like *TeX*'s own rule would).
---
----------------------------------------------------------------


---
---# `vpack_quality`
---
---This callback can be used to intercept the overfull messages that can result from
---packing a vertical list (as happens in the page builder). The function takes a
---few arguments:
---
---```
---function(<string> incident, <number> detail, <node> head, <number> first,
---    <number> last)
---end
---```
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed.
---
----------------------------------------------------------------


---
---# `show_lua_call`
---
---This one can be used to help reporting definitions that relate to *Lua* calls to
---be more meaningful when tracing.
---
---```
---function(<string> name, <number> index)
---    return <string>
---end
---```
---
----------------------------------------------------------------


---
---# `handle_overload`
---
---This is one of the few callbacks that is aimed at *ConTeXt*: it relates to overload
---protection of macros and other variables.
---
---```
---function(<boolean> error, <number> overload, <string> csname, <number> flags)
---    -- no return values
---end
---```
---
---The overload is determined by:
--- immutable  permanent  primitive  frozen  instance 
---
--- 1  warning  \star      \star      \star                       
--- 2  error    \star      \star      \star                       
--- 3  warning  \star      \star      \star      \star            
--- 4  error    \star      \star      \star      \star            
--- 5  warning  \star      \star      \star      \star   \star    
--- 6  error    \star      \star      \star      \star   \star    
---
---This relates to the optional prefixed that can be used when defining and setting
---quantities and is therefore also a bit of a playground. All macros and aliases in
---*ConTeXt* are classified this way.
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---