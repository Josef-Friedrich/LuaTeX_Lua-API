---% language=uk
---
---\environment luatex-style
---
---\startcomponent luatex-callbacks
---
---# *Lua* callbacks
---
---# Registering callbacks[library=callback]
---
---This library has functions that register, find and list callbacks. Callbacks are
---*Lua* functions that are called in well defined places. There are two kind of
---callbacks: those that mix with existing functionality, and those that (when
---enabled) replace functionality. In mosty cases the second category is expected to
---behave similar to the built in functionality because in a next step specific
---data is expected. For instance, you can replace the hyphenation routine. The
---function gets a list that can be hyphenated (or not). The final list should be
---valid and is (normally) used for constructing a paragraph. Another function can
---replace the ligature builder and/or kerner. Doing something else is possible
---but in the end might not give the user the expected outcome.
---
---The first thing you need to do is registering a callback:
---
---```
---id, error =
---    callback.register(<string> callback_name, <function> func)
---id, error =
---    callback.register(<string> callback_name, nil)
---id, error =
---    callback.register(<string> callback_name, false)
---```
---
---Here the `callback_name` is a predefined callback name, see below. The
---function returns the internal `id` of the callback or `nil`, if the
---callback could not be registered. In the latter case, `error` contains an
---error message, otherwise it is `nil`.
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
---If the callback is not set, `find` returns `nil`.
---
----------------------------------------------------------------


---
---# File discovery callbacks[library=callback]
---
---The behaviour documented in this subsection is considered stable in the sense that
---there will not be backward-incompatible changes any more.
---
---# `find_read_file` and `find_write_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<number> id_number, <string> asked_name)
---```
---
---Arguments:
---
---\sym{id_number}
---
---This number is zero for the log or `input` files. For *TeX*'s `read`
---or `write` the number is incremented by one, so `\read0` becomes 1.
---
---\sym{asked_name}
---
---This is the user-supplied filename, as found by `input`, `openin`
---or `openout`.
---
---Return value:
---
---\sym{actual_name}
---
---This is the filename used. For the very first file that is read in by *TeX*, you
---have to make sure you return an `actual_name` that has an extension and
---that is suitable for use as `jobname`. If you don't, you will have to
---manually fix the name of the log file and output file after *LuaTeX* is finished,
---and an eventual format filename will become mangled. That is because these file
---names depend on the jobname.
---
---You have to return `nil` if the file cannot be found.
---
---# `find_font_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<string> asked_name)
---```
---
---The `asked_name` is an \OTF\ or \TFM\ font metrics file.
---
---Return `nil` if the file cannot be found.
---
---# `find_output_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<string> asked_name)
---```
---
---The `asked_name` is the *PDF* or \DVI\ file for writing.
---
---# `find_format_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<string> asked_name)
---```
---
---The `asked_name` is a format file for reading (the format file for writing
---is always opened in the current directory).
---
---# `find_vf_file`
---
---Like `find_font_file`, but for virtual fonts. This applies to both \ALEPH's
---\OVF\ files and traditional Knuthian \VF\ files.
---
---# `find_map_file`
---
---Like `find_font_file`, but for map files.
---
---# `find_enc_file`
---
---Like `find_font_file`, but for enc files.
---
---# `find_pk_file`
---
---Like `find_font_file`, but for pk bitmap files. This callback takes two
---arguments: `name` and `dpi`. In your callback you can decide to
---look for:
---
---```
---<base res>dpi/<fontname>.<actual res>pk
---```
---
---but other strategies are possible. It is up to you to find a “reasonable”
---bitmap file to go with that specification.
---
---# `find_data_file`
---
---Like `find_font_file`, but for embedded files (`\pdfobj file '...'`).
---
---# `find_opentype_file`
---
---Like `find_font_file`, but for *OpenType* font files.
---
---# `find_truetype_file` and `find_type1_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<string> asked_name)
---```
---
---The `asked_name` is a font file. This callback is called while *LuaTeX* is
---building its internal list of needed font files, so the actual timing may
---surprise you. Your return value is later fed back into the matching `read_file` callback.
---
---Strangely enough, `find_type1_file` is also used for *OpenType* (\OTF)
---fonts.
---
---# `find_image_file`
---
---Your callback function should have the following conventions:
---
---```
---<string> actual_name =
---    function (<string> asked_name)
---```
---
---The `asked_name` is an image file. Your return value is used to open a file
---from the hard disk, so make sure you return something that is considered the name
---of a valid file by your operating system.
---
----------------------------------------------------------------


---
---# File reading callbacks
---
---The behavior documented in this subsection is considered stable in the sense that
---there will not be backward-incompatible changes any more.
---
---# `open_read_file`
---
---Your callback function should have the following conventions:
---
---```
---<table> env =
---    function (<string> file_name)
---```
---
---Argument:
---
---\sym{file_name}
---
---The filename returned by a previous `find_read_file` or the return value of
---`kpse.find_file()` if there was no such callback defined.
---
---Return value:
---
---\sym{env}
---
---This is a table containing at least one required and one optional callback
---function for this file. The required field is `reader` and the associated
---function will be called once for each new line to be read, the optional one is
---`close` that will be called once when *LuaTeX* is done with the file.
---
---*LuaTeX* never looks at the rest of the table, so you can use it to store your
---private per-file data. Both the callback functions will receive the table as
---their only argument.
---
---# `reader`
---
---*LuaTeX* will run this function whenever it needs a new input line from the file.
---
---```
---function(<table> env)
---    return <string> line
---end
---```
---
---Your function should return either a string or `nil`. The value `nil`
---signals that the end of file has occurred, and will make *TeX* call the optional
---`close` function next.
---
---# `close`
---
---*LuaTeX* will run this optional function when it decides to close the file.
---
---```
---function(<table> env)
---end
---```
---
---Your function should not return any value.
---
---# General file readers
---
---There is a set of callbacks for the loading of binary data files. These all use
---the same interface:
---
---```
---function(<string> name)
---    return <boolean> success, <string> data, <number> data_size
---end
---```
---
---The `name` will normally be a full path name as it is returned by either
---one of the file discovery callbacks or the internal version of `kpse.find_file()`.
---
---\sym{success}
---
---Return `false` when a fatal error occurred (e.g.\ when the file cannot be
---found, after all).
---
---\sym{data}
---
---The bytes comprising the file.
---
---\sym{data_size}
---
---The length of the `data`, in bytes.
---
---Return an empty string and zero if the file was found but there was a
---reading problem.
---
---The list of functions is:
---
--- function   usage 
---
--- `read_font_file`      ofm or tfm files 
--- `read_vf_file`        virtual fonts 
--- `read_map_file`       map files 
--- `read_enc_file`       encoding files 
--- `read_pk_file`        pk bitmap files 
--- `read_data_file`      embedded files (as is possible with *PDF* objects) 
--- `read_truetype_file`  *TrueType* font files 
--- `read_type1_file`     \TYPEONE\ font files 
--- `read_opentype_file`  *OpenType* font files 
---
----------------------------------------------------------------


---
---# Data processing callbacks[library=callback]
---
---# `process_input_buffer`
---
---This callback allows you to change the contents of the line input buffer just
---before *LuaTeX* actually starts looking at it.
---
---```
---function(<string> buffer)
---    return <string> adjusted_buffer
---end
---```
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
---
---# `process_output_buffer`
---
---This callback allows you to change the contents of the line output buffer just
---before *LuaTeX* actually starts writing it to a file as the result of a `write` command. It is only called for output to an actual file (that is,
---excluding the log, the terminal, and so called `write` 18 calls).
---
---```
---function(<string> buffer)
---    return <string> adjusted_buffer
---end
---```
---
---If you return `nil`, *LuaTeX* will pretend like your callback never
---happened. You can gain a small amount of processing time from that. This callback
---does not replace any internal code.
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
---# `build_page_insert`
---
---This callback is called when the pagebuilder adds an insert. There is not much
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
---# `pre_linebreak_filter`
---
---This callback is called just before *LuaTeX* starts converting a list of nodes
---into a stack of `hbox`es, after the addition of `parfillskip`.
---
---```
---function(<node> head, <string> groupcode)
---    return true | false | <node> newhead
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
---represent a hbox. Failure to do so will result in a fatal error.
---
---Setting this callback to `false` is possible, but dangerous, because it is
---possible you will end up in an unfixable “deadcycles loop”.
---
---# `append_to_vlist_filter`
---
---This callback is called whenever *LuaTeX* adds a box to a vertical list:
---
---```
---function(<node> box, <string> locationcode, <number prevdepth>,
---    <boolean> mirrored)
---    return list, prevdepth
---end
---```
---
---It is ok to return nothing in which case you also need to flush the box or deal
---with it yourself. The prevdepth is also optional. Locations are `box`,
---`alignment`, `equation`, `equation_number` and `post_linebreak`. You can pass `nil` instead of a node.
---
---# `post_linebreak_filter`
---
---This callback is called just after *LuaTeX* has converted a list of nodes into a
---stack of `hbox`es.
---
---```
---function(<node> head, <string> groupcode)
---    return true | false | <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
---# `hpack_filter`
---
---This callback is called when *TeX* is ready to start boxing some horizontal mode
---material. Math items and line boxes are ignored at the moment.
---
---```
---function(<node> head, <string> groupcode, <number> size,
---         <string> packtype [, <string> direction] [, <node> attributelist])
---    return true | false | <node> newhead
---end
---```
---
---The `packtype` is either `additional` or `exactly`. If `additional`, then the `size` is a `\hbox spread ...` argument. If
---`exactly`, then the `size` is a `\hbox to ...`. In both cases,
---the number is in scaled points.
---
---The `direction` is either one of the three-letter direction specifier
---strings, or `nil`.
---
---This callback does not replace any internal code.
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
---        <number> maxdepth [, <string> direction] [, <node> attributelist]))
---    return true | false | <node> newhead
---end
---```
---
---This callback does not replace any internal code.
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
---# `vpack_quality`
---
---This callback can be used to intercept the overfull messages that can result from
---packing a vertical list (as happens in the page builder). The function takes a
---few arguments:
---
---```
---function(<string> incident, <number> detail, <node> head, <number> first,
---         <number> last)
---end
---```
---
---The incident is one of `overfull`, `underfull`, `loose` or
---`tight`. The detail is either the amount of overflow in case of `overfull`, or the badness otherwise. The head is the list that is constructed.
---
---# `process_rule`
---
---This is an experimental callback. It can be used with rules of subtype 4
---(user). The callback gets three arguments: the node, the width and the
---height. The callback can use `pdf.print` to write code to the *PDF*
---file but beware of not messing up the final result. No checking is done.
---
---# `pre_output_filter`
---
---This callback is called when *TeX* is ready to start boxing the box 255 for `output`.
---
---```
---function(<node> head, <string> groupcode, <number> size, <string> packtype,
---        <number> maxdepth [, <string> direction])
---    return true | false | <node> newhead
---end
---```
---
---This callback does not replace any internal code.
---
---# `hyphenate`
---
---```
---function(<node> head, <node> tail)
---end
---```
---
---No return values. This callback has to insert discretionary nodes in the node
---list it receives.
---
---Setting this callback to `false` will prevent the internal discretionary
---insertion pass.
---
---# `ligaturing`
---
---```
---function(<node> head, <node> tail)
---end
---```
---
---No return values. This callback has to apply ligaturing to the node list it
---receives.
---
---You don't have to worry about return values because the `head` node that is
---passed on to the callback is guaranteed not to be a glyph_node (if need be, a
---temporary node will be prepended), and therefore it cannot be affected by the
---mutations that take place. After the callback, the internal value of the “tail of the list” will be recalculated.
---
---The `next` of `head` is guaranteed to be non-nil.
---
---The `next` of `tail` is guaranteed to be nil, and therefore the
---second callback argument can often be ignored. It is provided for orthogonality,
---and because it can sometimes be handy when special processing has to take place.
---
---Setting this callback to `false` will prevent the internal ligature
---creation pass.
---
---You must not ruin the node list. For instance, the head normally is a local par node,
---and the tail a glue. Messing too much can push *LuaTeX* into panic mode.
---
---# `kerning`
---
---```
---function(<node> head, <node> tail)
---end
---```
---
---No return values. This callback has to apply kerning between the nodes in the
---node list it receives. See `ligaturing` for calling conventions.
---
---Setting this callback to `false` will prevent the internal kern insertion
---pass.
---
---You must not ruin the node list. For instance, the head normally is a local par node,
---and the tail a glue. Messing too much can push *LuaTeX* into panic mode.
---
---# `insert_local_par`
---
---Each paragraph starts with a local par node that keeps track of for instance
---the direction. You can hook a callback into the creator:
---
---```
---function(<node> local_par, <string> location)
---end
---```
---
---There is no return value and you should make sure that the node stays valid
---as otherwise *TeX* can get confused.
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
---# Information reporting callbacks[library=callback]
---
---# `pre_dump`
---
---```
---function()
---end
---```
---
---This function is called just before dumping to a format file starts. It does not
---replace any code and there are neither arguments nor return values.
---
---# `start_run`
---
---```
---function()
---end
---```
---
---This callback replaces the code that prints *LuaTeX*'s banner. Note that for
---successful use, this callback has to be set in the *Lua* initialization script,
---otherwise it will be seen only after the run has already started.
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
---# `start_page_number`
---
---```
---function()
---end
---```
---
---Replaces the code that prints the `[` and the page number at the begin of
---`shipout`. This callback will also override the printing of box information
---that normally takes place when `tracingoutput` is positive.
---
---# `stop_page_number`
---
---```
---function()
---end
---```
---
---Replaces the code that prints the `]` at the end of `shipout`.
---
---# `show_error_hook`
---
---```
---function()
---end
---```
---
---This callback is run from inside the *TeX* error function, and the idea is to
---allow you to do some extra reporting on top of what *TeX* already does (none of
---the normal actions are removed). You may find some of the values in the `status` table useful. This callback does not replace any internal code.
---
---# `show_error_message`
---
---```
---function()
---end
---```
---
---This callback replaces the code that prints the error message. The usual
---interaction after the message is not affected.
---
---# `show_ignored_error_message`
---
---```
---function()
---end
---```
---
---This callback replaces the code that prints the error message
---when `ignoreprimitiveerror` is enabled.
---As before, the usual
---interaction after the message is not affected.
---
---# `show_lua_error_hook`
---
---```
---function()
---end
---```
---
---This callback replaces the code that prints the extra *Lua* error message.
---
---# `start_file`
---
---```
---function(category,filename)
---end
---```
---
---This callback replaces the code that prints *LuaTeX*'s when a file is opened like
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
---# `stop_file`
---
---```
---function(category)
---end
---```
---
---This callback replaces the code that prints *LuaTeX*'s when a file is closed like
---the `)` for regular files.
---
---# `call_edit`
---
---```
---function(filename,linenumber)
---end
---```
---
---This callback replaces the call to an external editor when “E” is pressed
---in reply to an error message. Processing will end immediately after the callback
---returns control to the main program.
---
---# `finish_synctex`
---
---This callback can be used to wrap up alternative synctex methods. It kicks in
---after the normal synctex finalizer (that happens to remove the synctex files
---after a run when native synctex is not enabled).
---
---# `wrapup_run`
---
---This callback is called after the *PDF* and log files are closed. Use it at your own
---risk.
---
----------------------------------------------------------------


---
---# *PDF* related callbacks[library=callback]
---
---# `finish_pdffile`
---
---```
---function()
---end
---```
---
---This callback is called when all document pages are already written to the *PDF*
---file and *LuaTeX* is about to finalize the output document structure. Its
---intended use is final update of *PDF* dictionaries such as `/Catalog` or
---`/Info`. The callback does not replace any code. There are neither
---arguments nor return values.
---
---# `finish_pdfpage`
---
---```
---function(shippingout)
---end
---```
---
---This callback is called after the *PDF* page stream has been assembled and before
---the page object gets finalized.
---
---# `page_order_index`
---
---This is one that experts can use to juggle the page tree, a data structure
---that determines the order in a *PDF* file:
---
---```
---function(pagenumber)
---  return pagenumber
---end
---```
---
---Say that we have 12 pages, then we can do this:
---
---```
---callback.register("page_order_index",function(page)
---        if page ==  1 then return 12
---    elseif page ==  2 then return 11
---    elseif page == 11 then return  2
---    elseif page == 12 then return  1
---    else                   return page
---    end
---end)
---```
---
---This will swap the first two and last two pages. You need to know the number of
---pages which is a side effect of the implementation. When you mess things up
---\unknown\ don't complain.
---
---# `process_pdf_image_content`
---
---When a page from a *PDF* file is embedded its page stream as well as related
---objects are copied to the target file. However, it can be that the page stream
---has operators that assume additional resources, for instance marked text. You can
---decide to filter that for which *LuaTeX* provides a callback. Here is a simple
---demonstration of use:
---
---```
---pdf.setrecompress(1)
---
---callback.register("process_pdf_image_content",function(s)
---    print(s)
---    return s
---end)
---```
---
---You need to explicitly enable recompression because otherwise the content stream
---gets just passed on in its original compressed form.
---
----------------------------------------------------------------


---
---# Font-related callbacks[library=callback]
---
---# `define_font`
---
---```
---function(<string> name, <number> size, <number> id)
---    return <table> font | <number> id
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
---    relative to the designsize of the font.
---
---The `id` is the internal number assigned to the font.
---
---The internal structure of the `font` table that is to be returned is
---explained in \in {chapter} [fonts]. That table is saved internally, so you can
---put extra fields in the table for your later *Lua* code to use. In alternative,
---`retval` can be a previously defined fontid. This is useful if a previous
---definition can be reused instead of creating a whole new font structure.
---
---Setting this callback to `false` is pointless as it will prevent font
---loading completely but will nevertheless generate errors.
---
---# `glyph_not_found` and `glyph_info`
---
---The `glyph_not_found` callback, when set, kicks in when the backend cannot
---insert a glyph. When no callback is defined a message is written to the log.
---
---```
---function(<number> id, <number> char)
---    -- do something with font id and char code
---end
---```
---
---The `glyph_info` callback can be set to report a useful representation of a
---glyph.
---
---```
---function(<node> g)
---    -- return a string or nil
---end
---```
---
---When `nil` is returned the character code is printed, otherwise the
---returned string is used. By default the *UTF-8* representation is shown which is
---not always that useful, especially when there is no real representation. Keep in
---mind that setting this callback can change the log in an incompatible way.
---
---# `provide_charproc_data`
---
---The `provide_charproc_data` callback is triggered when the backend is
---writing out a user-defined Type 3 font:
---
---```
---function(<number> mode, <number> id, <number> char)
---    if mode == 1 then
---        -- preroll
---        return
---    elseif mode == 2 then
---        -- write out the glyph contents
---        return <number> stream, <number> width
---    elseif mode == 3 then
---        -- the overall font scale
---        return <number> scale
---    end
---end
---```
---
---To make a user-defined Type 3 font, you need to set `encodingbytes = 0`
---and `psname = "none"` at the top-level when defining the font. From the
---`glyph_not_found` callback, you should return the overall font scale
---(conventionally 0.001) in mode 3, and the index of a *PDF* stream (where the
---first operator is either `d0` or `d1`) and the width of the glyph
---(in sp's) in mode 2. You can generally ignore mode 1.
---
----------------------------------------------------------------


---
---\stopchapter
---
---\stopcomponent
---