---% language=uk
---
---\environment luatex-style
---
---\startcomponent luatex-backend
---
---\startchapter[reference=backend,title={The backend libraries}]
---
---\startsection[title={The `pdf` library}][library=pdf]
---
---\topicindex{backend}
---\topicindex{\PDF}
---
---This library contains variables and functions that are related to the \PDF\
---backend. You can find more details about the expected values to setters in \in
---{section} [backendprimitives].
---
---\startsubsection[title={`mapfile`, `mapline`}]
---
---\topicindex{map files}
---\topicindex{files+map}
---
---```
---pdf.mapfile(<string> map file)
---pdf.mapline(<string> map line)
---```
---
---These two functions can be used to replace primitives \orm {pdfmapfile} and
---\orm {pdfmapline} inherited from \PDFTEX. They expect a string as only
---parameter and have no return value. The first character in a map line can be
---`-`, `+` or `=` which means as much as remove, add or replace
---this line. They are not state setters but act immediately.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][catalog|info|names|trailer]`}]
---
---\topicindex{\PDF+trailer}
---\topicindex{\PDF+catalog}
---\topicindex{\PDF+info}
---
---\libindex{setcatalog} \libindex{getcatalog}
---\libindex{setinfo}    \libindex{getinfo}
---\libindex{setnames}   \libindex{getnames}
---\libindex{settrailer} \libindex{gettrailer}
---
---These functions complement the corresponding \PDF\ backend token lists dealing
---with metadata. The value types are strings and they are written to the \PDF\
---file directly after the token registers set at the *TeX* end are written.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][pageattributes|pageresources|pagesattributes]`}]
---
---\libindex{setpageattributes}  \libindex{getpageattributes}
---\libindex{setpageresources}   \libindex{getpageresources}
---\libindex{setpagesattributes} \libindex{getpagesattributes}
---
---\topicindex{\PDF+page attributes}
---\topicindex{\PDF+page resources}
---
---These functions complement the corresponding \PDF\ backend token lists dealing
---with page resources. The variables have no interaction with the corresponding \PDF\
---backend token register. They are written to the \PDF\ file directly after the
---token registers set at the *TeX* end are written.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][xformattributes|xformresources]`}]
---
---\libindex{setxformattributes} \libindex{getxformattributes}
---\libindex{setxformresources}  \libindex{getxformresources}
---
---\topicindex{\PDF+xform attributes}
---\topicindex{\PDF+xform resources}
---
---These functions complement the corresponding \PDF\ backend token lists dealing
---with reuseable boxes and images. The variables have no interaction with the
---corresponding \PDF\ backend token register. They are written to the \PDF\
---file directly after the token registers set at the *TeX* end are written.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][major|minor]version`}]
---
---\topicindex{\PDF+version}
---
---\libindex{getmajorversion} \libindex{setmajorversion}
---\libindex{getminorversion} \libindex{setminorversion}
---
---You can set both the major and minor version of the output. The major version is
---normally 1 but when set to 2 some data will not be written to the file in order
---to comply with the standard. What minor version you set depends on what \PDF\
---features you use. This is out of control of *LuaTeX*.
---
---One can set the major version number to 2 but we cannot guarantee that the engine
---adapts itself correctly, because there is no public and free specification that
---we know of. Also, user constructed annotations are not checked and just passed
---to the file. On the other hand, the \PDF\ that the engine generated is rather
---simple and not that version depending.
---
---\stopsubsection
---
---\startsubsection[title={`getcreationdate`}]
---
---\topicindex{\PDF+date}
---
---\libindex{getcreationdate}
---
---This function returns a string with the date in the format that ends up in the
---\PDF\ file, in this case it's: {\tttf \cldcontext{pdf.getcreationdate()}}.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]inclusionerrorlevel` and `[set|get]ignoreunknownimages`}]
---
---\topicindex{\PDF+options}
---
---\libindex{getinclusionerrorlevel} \libindex{setinclusionerrorlevel}
---\libindex{getignoreunknownimages} \libindex{setignoreunknownimages}
---
---These variable control how error in included image are treated. They are modeled
---after the \PDFTEX\ equivalents.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]suppressoptionalinfo`, `[set|get]trailerid`,
---`[set|get]omitcidset` and `[set|get]omitinfodict`}]
---
---\topicindex{\PDF+options}
---\topicindex{\PDF+trailer}
---
---\libindex{getsuppressoptionalinfo} \libindex{setsuppressoptionalinfo}
---\libindex{gettrailerid}            \libindex{settrailerid}
---\libindex{getomitcidset}           \libindex{setomitcidset}
---\libindex{getomitcharset}          \libindex{setomitcharset}
---\libindex{getomitinfodict}         \libindex{setomitinfodict}
---
---The optional info bitset (a number) determines what kind of info gets flushed.
---By default we flush all. See \in {section} [sec:pdfextensions] for more details.
---
---You can set your own trailer id. This has to be string containing valid \PDF\
---array content with checksums.
---
---The cidset, charset and info flags (numbers) disables inclusion of a so called
---`CIDSet` and `CharSet` entries, which can be handy when aiming at
---some of the many \PDF\ substandards.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][obj|]compresslevel` and `[set|get]recompress`}]
---
---\topicindex{\PDF+compression}
---
---\libindex{getcompresslevel}    \libindex{setcompresslevel}
---\libindex{getobjcompresslevel} \libindex{setobjcompresslevel}
---\libindex{getrecompress}       \libindex{setrecompress}
---
---These functions set the level stream compression. When object compression is
---enabled multiple objects will be packed in a compressed stream which saves space.
---The minimum values are 0, the maxima are 9.
---
---When recompression is to 1 compressed objects will be decompressed and when
---compresslevel is larger than zero they will then be recompressed. This is mostly
---a debugging feature and should not be relied upon.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]gentounicode`}]
---
---\topicindex{\PDF+unicode}
---
---\libindex{getgentounicode} \libindex{setgentounicode}
---
---This flag enables tounicode generation (like in \PDFTEX). Normally the values are
---provided by the font loader.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]decimaldigits`}]
---
---\topicindex{\PDF+precision}
---
---\libindex{getdecimaldigits} \libindex{setdecimaldigits}
---
---These two functions set the accuracy of floats written to the \PDF file. You can
---set any value but the backend will not go below 3 and above 6.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]pkresolution`}]
---
---\topicindex{\PDF+resolution}
---
---\libindex{getpkresolution} \libindex{setpkresolution}
---
---These setter takes two arguments: the resolution and an optional zero or one that
---indicates if this is a fixed one. The getter returns these two values.
---
---\stopsubsection
---
---\startsubsection[title={`getlast[obj|link|annot]` and `getretval`}]
---
---\topicindex{\PDF+objects}
---\topicindex{\PDF+annotations}
---
---\libindex{getlastobj}   \libindex{setlastobj}
---\libindex{getlastlink}  \libindex{setlastlink}
---\libindex{getlastannot} \libindex{setlastannot}
---\libindex{getretval}
---
---These status variables are similar to the ones traditionally used in the backend
---interface at the *TeX* end.
---
---\stopsubsection
---
---\startsubsection[title={`getmaxobjnum` and `getobjtype`, `getfontname`,
---`getfontobjnum`, `getfontsize`, `getxformname`}]
---
---\libindex{getmaxobjnum}
---\libindex{getobjtype}
---\libindex{getfontname}
---\libindex{getfontobjnum}
---\libindex{getfontsize}
---\libindex{getxformname}
---
---These introspective helpers are mostly used when you construct \PDF\ objects
---yourself and need for instance information about a (to be) embedded font.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]origin`}]
---
---\topicindex{\PDF+positioning}
---
---\libindex{setorigin} \libindex{getorigin}
---
---This one is used to set the horizonal and/or vertical offset, a traditional
---backend property.
---
---```
---pdf.setorigin() -- sets both to 0pt
---pdf.setorigin(tex.sp("1in")) -- sets both to 1in
---pdf.setorigin(tex.sp("1in"),tex.sp("1in"))
---```
---
---The counterpart of this function returns two values.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get]imageresolution`}]
---
---\topicindex{\PDF+resolution}
---
---\libindex{setimageresolution} \libindex{getimageresolution}
---
---These two functions relate to the imageresolution that is used when the image
---itself doesn't provide a non-zero x or y resolution.
---
---\stopsubsection
---
---\startsubsection[title={`[set|get][link|dest|thread|xform]margin`}]
---
---\topicindex{\PDF+margins}
---
---\libindex{getlinkmargin}   \libindex{setlinkmargin}
---\libindex{getdestmargin}   \libindex{setdestmargin}
---\libindex{getthreadmargin} \libindex{setthreadmargin}
---\libindex{getxformmargin}  \libindex{setxformmargin}
---\libindex{getmarginmargin} \libindex{setmarginmargin}
---
---These functions can be used to set and retrieve the margins that are added to the
---natural bounding boxes of the respective objects.
---
---\stopsubsection
---
---\startsubsection[title={`get[pos|hpos|vpos]`}]
---
---\topicindex{\PDF+positions}
---
---\libindex{getpos}
---\libindex{gethpos}
---\libindex{getvpos}
---
---These functions get current location on the output page, measured from its lower
---left corner. The values return scaled points as units.
---
---```
---local h, v = pdf.getpos()
---```
---
---\stopsubsection
---
---\startsubsection[title={`[has|get]matrix`}]
---
---\topicindex{\PDF+matrix}
---
---\libindex{getmatrix} \libindex{hasmatrix}
---
---The current matrix transformation is available via the `getmatrix` command,
---which returns 6 values: `sx`, `rx`, `ry`, `sy`, `tx`, and `ty`. The `hasmatrix` function returns `true` when a
---matrix is applied.
---
---```
---if pdf.hasmatrix() then
---    local sx, rx, ry, sy, tx, ty = pdf.getmatrix()
---    -- do something useful or not
---end
---```
---
---\stopsubsection
---
---\startsubsection[title={`print`}]
---
---\topicindex{\PDF+print to}
---
---\libindex{print}
---
---You can print a string to the \PDF\ document from within a `latelua` call.
---This function is not to be used inside `directlua` unless you know {\it
---exactly} what you are doing.
---
---```
---pdf.print(<string> s)
---pdf.print(<string> type, <string> s)
---```
---
---The optional parameter can be used to mimic the behavior of \PDF\ literals: the
---`type` is `direct` or `page`.
---
---\stopsubsection
---
---\startsubsection[title={`immediateobj`}]
---
---\topicindex{\PDF+objects}
---
---\libindex{immediateobj}
---
---This function creates a \PDF\ object and immediately writes it to the \PDF\ file.
---It is modelled after \PDFTEX's `immediate` \orm {pdfobj} primitives. All
---function variants return the object number of the newly generated object.
---
---```
---<number> n =
---    pdf.immediateobj(<string> objtext)
---<number> n =
---    pdf.immediateobj("file", <string> filename)
---<number> n =
---    pdf.immediateobj("stream", <string> streamtext, <string> attrtext)
---<number> n =
---    pdf.immediateobj("streamfile", <string> filename, <string> attrtext)
---```
---
---The first version puts the `objtext` raw into an object. Only the object
---wrapper is automatically generated, but any internal structure (like `<<
--->>` dictionary markers) needs to be provided by the user. The second version with
---keyword `file` as first argument puts the contents of the file with name
---`filename` raw into the object. The third version with keyword `stream` creates a stream object and puts the `streamtext` raw into the
---stream. The stream length is automatically calculated. The optional `attrtext` goes into the dictionary of that object. The fourth version with
---keyword `streamfile` does the same as the third one, it just reads the
---stream data raw from a file.
---
---An optional first argument can be given to make the function use a previously
---reserved \PDF\ object.
---
---```
---<number> n =
---    pdf.immediateobj(<integer> n, <string> objtext)
---<number> n =
---    pdf.immediateobj(<integer> n, "file", <string> filename)
---<number> n =
---    pdf.immediateobj(<integer> n, "stream", <string> streamtext, <string> attrtext)
---<number> n =
---    pdf.immediateobj(<integer> n, "streamfile", <string> filename, <string> attrtext)
---```
---
---\stopsubsection
---
---\startsubsection[title={`obj`}]
---
---\topicindex{\PDF+objects}
---
---\libindex{obj}
---
---This function creates a \PDF\ object, which is written to the \PDF\ file only
---when referenced, e.g., by `refobj()`.
---
---All function variants return the object number of the newly generated object, and
---there are two separate calling modes. The first mode is modelled after \PDFTEX's
---\orm {pdfobj} primitive.
---
---```
---<number> n =
---    pdf.obj(<string> objtext)
---<number> n =
---    pdf.obj("file", <string> filename)
---<number> n =
---    pdf.obj("stream", <string> streamtext, <string> attrtext)
---<number> n =
---    pdf.obj("streamfile", <string> filename, <string> attrtext)
---```
---
---An optional first argument can be given to make the function use a previously
---reserved \PDF\ object.
---
---```
---<number> n =
---    pdf.obj(<integer> n, <string> objtext)
---<number> n =
---    pdf.obj(<integer> n, "file", <string> filename)
---<number> n =
---    pdf.obj(<integer> n, "stream", <string> streamtext, <string> attrtext)
---<number> n =
---    pdf.obj(<integer> n, "streamfile", <string> filename, <string> attrtext)
---```
---
---The second mode accepts a single argument table with key--value pairs.
---
---```
---<number> n = pdf.obj {
---    type           = <string>,
---    immediate      = <boolean>,
---    objnum         = <number>,
---    attr           = <string>,
---    compresslevel  = <number>,
---    objcompression = <boolean>,
---    file           = <string>,
---    string         = <string>,
---    nolength       = <boolean>,
---}
---```
---
---The `type` field can have the values `raw` and `stream`, this
---field is required, the others are optional (within constraints). When `nolength` is set, there will be no `/Length` entry added to the
---dictionary.
---
---Note: this mode makes `obj` look more flexible than it actually is: the
---constraints from the separate parameter version still apply, so for example you
---can't have both `string` and `file` at the same time.
---
---\stopsubsection
---
---\startsubsection[title={`refobj`}]
---
---\topicindex{\PDF+objects}
---
---\libindex{refobj}
---
---This function, the *Lua* version of the \orm {pdfrefobj} primitive, references an
---object by its object number, so that the object will be written to the \PDF\ file.
---
---```
---pdf.refobj(<integer> n)
---```
---
---This function works in both the `directlua` and `latelua` environment.
---Inside `directlua` a new whatsit node “pdf_refobj” is created, which
---will be marked for flushing during page output and the object is then written
---directly after the page, when also the resources objects are written to the \PDF\
---file. Inside `latelua` the object will be marked for flushing.
---
---This function has no return values.
---
---\stopsubsection
---
---\startsubsection[title={`reserveobj`}]
---
---\topicindex{\PDF+objects}
---
---\libindex{reserveobj}
---
---This function creates an empty \PDF\ object and returns its number.
---
---```
---<number> n = pdf.reserveobj()
---<number> n = pdf.reserveobj("annot")
---```
---
---\stopsubsection
---
---\startsubsection[title={`getpageref`}]
---
---\topicindex{\PDF+pages}
---
---\libindex{getpageref}
---
---The object number of a page can be fetched with this function. This can be a
---forward reference so when you ask for a future page, you do get a number back.
---
---```
---<number> n = pdf.getpageref(123)
---```
---
---\stopsubsection
---
---\startsubsection[title={`registerannot`}]
---
---\topicindex{\PDF+annotations}
---
---\libindex{registerannot}
---
---This function adds an object number to the `/Annots` array for the current
---page without doing anything else. This function can only be used from within
---`latelua`.
---
---```
---pdf.registerannot (<number> objnum)
---```
---
---\stopsubsection
---
---\startsubsection[title={`newcolorstack`}]
---
---\topicindex{\PDF+color stack}
---
---\libindex{newcolorstack}
---
---This function allocates a new color stack and returns it's id. The arguments
---are the same as for the similar backend extension primitive.
---
---```
---pdf.newcolorstack("0 g","page",true) -- page|direct|origin
---```
---
---\stopsubsection
---
---\startsubsection[title={`setfontattributes`}]
---
---\topicindex{\PDF+fonts}
---
---\libindex{setfontattributes}
---
---This function will force some additional code into the font resource. It can for
---instance be used to add a custom `ToUnicode` vector to a bitmap file.
---
---```
---pdf.setfontattributes(<number> font id, <string> pdf code)
---```
---
---\stopsubsection
---
---\stopsection
---
---\startsection[title={The `pdfe` library}][library=pdfe]
---
---\startsubsection[title={Introduction}]
---
---\topicindex{\PDF+objects}
---
---\topicindex{\PDF+analyze}
---\topicindex{\PDF+`pdfe`}
---
---The `pdfe` library replaces the `epdf` library and provides an
---interface to \PDF\ files. It uses the same code as is used for \PDF\ image
---inclusion. The `pplib` library by Paweł Jackowski replaces the `poppler` (derived from `xpdf`) library.
---
---A \PDF\ file is basically a tree of objects and one descends into the tree via
---dictionaries (key/value) and arrays (index/value). There are a few topmost
---dictionaries that start at root that are accessed more directly.
---
---Although everything in \PDF\ is basically an object we only wrap a few in so
---called userdata *Lua* objects.
---
---\starttabulate
---\BC \PDF          \BC *Lua* 
--- null           nil 
--- boolean        boolean 
--- integer        integer 
--- float          number 
--- name           string 
--- string         string 
--- array          array userdatum 
--- dictionary     dictionary userdatum 
--- stream         stream userdatum (with related dictionary) 
--- reference      reference userdatum 
---\stoptabulate
---
---The regular getters return these *Lua* data types but one can also get more
---detailed information.
---
---\stopsubsection
---
---\startsubsection[title={`open`, `new`, `getstatus`, `close`, `unencrypt`}]
---
---\libindex {open}
---\libindex {new}
---\libindex {new}
---\libindex {getstatus}
---\libindex {close}
---\libindex {unencrypt}
---
---A document is loaded from a file or string
---
---```
---<pdfe document> = pdfe.open(filename)
---<pdfe document> = pdfe.new(somestring,somelength)
---```
---
---Such a document is closed with:
---
---```
---pdfe.close(<pdfe document>)
---```
---
---You can check if a document opened well by:
---
---```
---pdfe.getstatus(<pdfe document>)
---```
---
---The returned codes are:
---
---\starttabulate[|c|l|]
---\DB value       \BC explanation 
---\TB
--- `-2`   the document failed to open 
--- `-1`   the document is (still) protected 
--- `0`    the document is not encrypted 
--- `2`    the document has been unencrypted 
---\LL
---\stoptabulate
---
---An encrypted document can be unencrypted by the next command where instead of
---either password you can give `nil`:
---
---```
---pdfe.unencrypt(<pdfe document>,userpassword,ownerpassword)
---```
---
---\stopsubsection
---
---\startsubsection[title={`getsize`, `getversion`, `getnofobjects`, `getnofpages`, `getmemoryusage`}]
---
---\libindex {getsize}
---\libindex {getversion}
---\libindex {getnofobjects}
---\libindex {getnofpages}
---\libindex {getmemoryusage}
---
---A successfully opened document can provide some information:
---
---```
---bytes = getsize(<pdfe document>)
---major, minor = getversion(<pdfe document>)
---n = getnofobjects(<pdfe document>)
---n = getnofpages(<pdfe document>)
---bytes, waste  = getmemoryusage(<pdfe document>)
---```
---
---\stopsubsection
---
---\startsubsection[title={`get[catalog|trailer|info]`}]
---
---\libindex {getcatalog}
---\libindex {gettrailer}
---\libindex {getinfo}
---
---For accessing the document structure you start with the so called catalog, a
---dictionary:
---
---```
---<pdfe dictionary> = pdfe.getcatalog(<pdfe document>)
---```
---
---The other two root dictionaries are accessed with:
---
---```
---<pdfe dictionary> = pdfe.gettrailer(<pdfe document>)
---<pdfe dictionary> = pdfe.getinfo(<pdfe document>)
---```
---
---\stopsubsection
---
---\startsubsection[title={`getpage`, `getbox`}]
---
---\libindex {getpage}
---\libindex {getbox}
---
---A specific page can conveniently be reached with the next command, which
---returns a dictionary. The first argument is to be a page dictionary.
---
---```
---<pdfe dictionary> = pdfe.getpage(<pdfe document>,pagenumber)
---```
---
---Another convenience command gives you the (bounding) box of a (normally page)
---which can be inherited from the document itself. An example of a valid box name
---is `MediaBox`.
---
---```
---pages = pdfe.getbox(<pdfe dictionary>,boxname)
---```
---
---\stopsubsection
---
---\startsubsection[title={`get[string|integer|number|boolean|name]`, `type`}]
---
---\libindex {getstring}
---\libindex {getinteger}
---\libindex {getnumber}
---\libindex {getboolean}
---\libindex {getname}
---\libindex {type}
---
---Common values in dictionaries and arrays are strings, integers, floats, booleans
---and names (which are also strings) and these are also normal *Lua* objects:
---
---```
---s = getstring (<pdfe array|dictionary>,index|key)
---i = getinteger(<pdfe array|dictionary>,index|key)
---n = getnumber (<pdfe array|dictionary>,index|key)
---b = getboolean(<pdfe array|dictionary>,index|key)
---n = getname   (<pdfe array|dictionary>,index|key)
---s = type      (<pdfe array|dictionary|document|reference|stream)
---```
---
---The `type` returns a string describing the type of the object,
---i.e. "pdfe.array", "pdfe.dictionary", "pdfe",
---"pdfe.reference", "pdfe.stream".
---
---The `getstring` function has two extra variants:
---
---```
---s, h = getstring (<pdfe array|dictionary>,index|key,false)
---s    = getstring (<pdfe array|dictionary>,index|key,true)
---```
---
---The first call returns the original string plus a boolean indicating if the
---string is hex encoded. The second call returns the unencoded string.
---
---\stopsubsection
---
---\startsubsection[title={`get[from][dictionary|array|stream]`}]
---
---\libindex {getdictionary} \libindex {getfromdictionary}
---\libindex {getarray}      \libindex {getfromarray}
---\libindex {getstream}     \libindex {getfromstream}
---
---Normally you will use an index in an array and key in a dictionary but dictionaries
---also accept an index. The size of an array or dictionary is available with the
---usual `#` operator.
---
---```
---<pdfe dictionary>   = getdictionary(<pdfe array|dictionary>,index|key)
---<pdfe array>        = getarray     (<pdfe array|dictionary>,index|key)
---<pdfe stream>,
---<pdfe dictionary>   = getstream    (<pdfe array|dictionary>,index|key)
---```
---
---These commands return dictionaries, arrays and streams, which are dictionaries
---with a blob of data attached.
---
---Before we come to an alternative access mode, we mention that the objects provide
---access in a different way too, for instance this is valid:
---
---```
---print(pdfe.open("foo.pdf").Catalog.Type)
---```
---
---At the topmost level there are `Catalog`, `Info`, `Trailer`
---and `Pages`, so this is also okay:
---
---```
---print(pdfe.open("foo.pdf").Pages[1])
---```
---
---\stopsubsection
---
---\startsubsection[title={`[open|close|readfrom|whole|]stream`}]
---
---\libindex {openstream}
---\libindex {closestream}
---\libindex {readfromstream}
---\libindex {readfromwholestream}
---
---Streams are sort of special. When your index or key hits a stream you get back a
---stream object and dictionary object. The dictionary you can access in the usual
---way and for the stream there are the following methods:
---
---```
---okay   = openstream(<pdfe stream>,[decode])
---         closestream(<pdfe stream>)
---str, n = readfromstream(<pdfe stream>)
---str, n = readwholestream(<pdfe stream>,[decode])
---```
---
---You either read in chunks, or you ask for the whole. When reading in chunks, you
---need to open and close the stream yourself. The `n` value indicates the
---length read. The `decode` parameter controls if the stream data gets
---uncompressed.
---
---As with dictionaries, you can access fields in a stream dictionary in the usual
---*Lua* way too. You get the content when you “call” the stream. You can
---pass a boolean that indicates if the stream has to be decompressed.
---
---% pdfe.objectcodes      = objectcodes
---% pdfe.stringcodes      = stringcodes
---% pdfe.encryptioncodes  = encryptioncodes
---
---\stopsubsection
---
---\startsubsection[title={`getfrom[dictionary|array]`}]
---
---\libindex {getfromdictionary}
---\libindex {getfromarray}
---
---In addition to the interface described before, there is also a bit lower level
---interface available.
---
---```
---key, type, value, detail = getfromdictionary(<pdfe dictionary>,index)
---type, value, detail = getfromarray(<pdfe array>,index)
---```
---
---\starttabulate[|c|l|l|l|]
---\DB type       \BC meaning    \BC value            \BC detail 
--- `0`   none        nil               
--- `1`   null        nil               
--- `2`   boolean     1 or 0            
--- `3`   integer     integer           
--- `4`   number      float             
--- `5`   name        string            
--- `6`   string      string            hex 
--- `7`   array       arrayobject       size 
--- `8`   dictionary  dictionaryobject  size 
--- `9`   stream      streamobject      dictionary size 
--- `10`  reference   integer           
---\LL
---\stoptabulate
---
---A `hex` string is (in the \PDF\ file) surrounded by `<>` while plain
---strings are bounded by `<>`.
---
---\stopsubsection
---
---\startsubsection[title={`[dictionary|array]totable`}]
---
---\libindex {dictionarytotable}
---\libindex {arraytotable}
---
---All entries in a dictionary or table can be fetched with the following commands
---where the return values are a hashed or indexed table.
---
---```
---hash = dictionarytotable(<pdfe dictionary>)
---list = arraytotable(<pdfe array>)
---```
---
---You can get a list of pages with:
---
---```
---{ { <pdfe dictionary>, size, objnum }, ... } = pagestotable(<pdfe document>)
---```
---
---\stopsubsection
---
---\startsubsection[title={`getfromreference`}]
---
---\libindex {getfromreference}
---
---Because you can have unresolved references, a reference object can be resolved
---with:
---
---```
---type, <pdfe dictionary|array|stream>, detail = getfromreference(<pdfe reference>)
---```
---
---So, as second value you get back a new `pdfe` userdata object that you can
---query.
---
---\stopsubsection
---
---\stopsection
---
---\startsection[title={Memory streams}][library=pdfe]
---
---\topicindex{\PDF+memory streams}
---
---\libindex {new}
---
---The `pdfe.new` that takes three arguments:
---
---\starttabulate
---\DB value           \BC explanation      
---\TB
--- `stream`   this is a (in low level *Lua* speak) light userdata
---                        object, i.e.\ a pointer to a sequence of bytes 
--- `length`   this is the length of the stream in bytes (the stream can
---                        have embedded zeros) 
--- `name`     optional, this is a unique identifier that is used for
---                        hashing the stream, so that multiple doesn't use more
---                        memory 
---\LL
---\stoptabulate
---
---The third argument is optional. When it is not given the function will return an
---`pdfe` document object as with a regular file, otherwise it will return a
---filename that can be used elsewhere (e.g.\ in the image library) to reference the
---stream as pseudo file.
---
---Instead of a light userdata stream (which is actually fragile but handy when you
---come from a library) you can also pass a *Lua* string, in which case the given
---length is (at most) the string length.
---
---The function returns an `pdfe` object and a string. The string can be used in
---the `img` library instead of a filename. You need to prevent garbage
---collection of the object when you use it as image (for instance by storing it
---somewhere).
---
---Both the memory stream and it's use in the image library is experimental and can
---change. In case you wonder where this can be used: when you use the swiglib
---library for `graphicmagick`, it can return such a userdata object. This
---permits conversion in memory and passing the result directly to the backend. This
---might save some runtime in one-pass workflows. This feature is currently not
---meant for production and we might come up with a better implementation.
---
---\stopsection
---
---\startsection[title={The `pdfscanner` library}][library=pdfscanner]
---
---\topicindex{\PDF+scanner}
---
---\libindex {scan}
---
---The `pdfscanner` library allows interpretation of \PDF\ content streams and
---`/ToUnicode` (cmap) streams. You can get those streams from the `pdfe` library, as explained in an earlier section. There is only a single
---top-level function in this library:
---
---```
---pdfscanner.scan (<pdfe stream>, <table> operatortable, <table> info)
---pdfscanner.scan (<pdfe array>, <table> operatortable, <table> info)
---pdfscanner.scan (<string>, <table> operatortable, <table> info)
---```
---
---The first argument should be a *Lua* string or a stream or array onject coming
---from the `pdfe` library. The second argument, `operatortable`, should
---be a *Lua* table where the keys are \PDF\ operator name strings and the values
---are *Lua* functions (defined by you) that are used to process those operators.
---The functions are called whenever the scanner finds one of these \PDF\ operators
---in the content stream(s). The functions are called with two arguments: the `scanner` object itself, and the `info` table that was passed are the third
---argument to `pdfscanner.scan`.
---
---Internally, `pdfscanner.scan` loops over the \PDF\ operators in the
---stream(s), collecting operands on an internal stack until it finds a \PDF\
---operator. If that \PDF\ operator's name exists in `operatortable`, then the
---associated function is executed. After the function has run (or when there is no
---function to execute) the internal operand stack is cleared in preparation for the
---next operator, and processing continues.
---
---The `scanner` argument to the processing functions is needed because it
---offers various methods to get the actual operands from the internal operand
---stack.
---
---A simple example of processing a \PDF's document stream could look like this:
---
---```
---local operatortable = { }
---
---operatortable.Do = function(scanner,info)
---    local resources = info.resources
---    if resources then
---        local val     = scanner:pop()
---        local name    = val[2]
---        local xobject = resources.XObject
---        print(info.space .. "Uses XObject " .. name)
---        local resources = xobject.Resources
---        if resources then
---            local newinfo =  {
---                space     = info.space .. "  ",
---                resources = resources,
---            }
---            pdfscanner.scan(entry, operatortable, newinfo)
---        end
---    end
---end
---
---local function Analyze(filename)
---    local doc = pdfe.open(filename)
---    if doc then
---        local pages = doc.Pages
---        for i=1,#pages do
---            local page = pages[i]
---            local info = {
---              space     = "  " ,
---              resources = page.Resources,
---            }
---            print("Page " .. i)
---         -- pdfscanner.scan(page.Contents,operatortable,info)
---            pdfscanner.scan(page.Contents(),operatortable,info)
---        end
---    end
---end
---
---Analyze("foo.pdf")
---```
---
---This example iterates over all the actual content in the \PDF, and prints out the
---found `XObject` names. While the code demonstrates quite some of the `pdfe` functions, let's focus on the type `pdfscanner` specific code
---instead.
---
---From the bottom up, the following line runs the scanner with the \PDF\ page's
---top-level content given in the first argument.
---
---The third argument, `info`, contains two entries: `space` is used to
---indent the printed output, and `resources` is needed so that embedded `XForms` can find their own content.
---
---The second argument, `operatortable` defines a processing function for a
---single \PDF\ operator, `Do`.
---
---The function `Do` prints the name of the current `XObject`, and then
---starts a new scanner for that object's content stream, under the condition that
---the `XObject` is in fact a `/Form`. That nested scanner is called
---with new `info` argument with an updated `space` value so that the
---indentation of the output nicely nests, and with a new `resources` field
---to help the next iteration down to properly process any other, embedded `XObject`s.
---
---Of course, this is not a very useful example in practice, but for the purpose of
---demonstrating `pdfscanner`, it is just long enough. It makes use of only
---one `scanner` method: `scanner:pop()`. That function pops the top
---operand of the internal stack, and returns a *Lua* table where the object at index
---one is a string representing the type of the operand, and object two is its
---value.
---
---The list of possible operand types and associated *Lua* value types is:
---
---\starttabulate[|l|l|]
---\DB types           \BC type      
---\TB
--- `integer`   <number>  
--- `real`      <number>  
--- `boolean`   <boolean> 
--- `name`      <string>  
--- `operator`  <string>  
--- `string`    <string>  
--- `array`     <table>   
--- `dict`      <table>   
---\LL
---\stoptabulate
---
---In case of `integer` or `real`, the value is always a *Lua* (floating
---point) number. In case of `name`, the leading slash is always stripped.
---
---In case of `string`, please bear in mind that \PDF\ actually supports
---different types of strings (with different encodings) in different parts of the
---\PDF\ document, so you may need to reencode some of the results; `pdfscanner`
---always outputs the byte stream without reencoding anything. `pdfscanner`
---does not differentiate between literal strings and hexadecimal strings (the
---hexadecimal values are decoded), and it treats the stream data for inline images
---as a string that is the single operand for `EI`.
---
---In case of `array`, the table content is a list of `pop` return
---values and in case of `dict`, the table keys are \PDF\ name strings and the
---values are `pop` return values.
---
---\libindex{pop}
---\libindex{popnumber}
---\libindex{popname}
---\libindex{popstring}
---\libindex{poparray}
---\libindex{popdictionary}
---\libindex{popboolean}
---\libindex{done}
---
---There are a few more methods defined that you can ask `scanner`:
---
---\starttabulate[|l|p|]
---\DB method               \BC explanation 
---\TB
--- `pop`            see above 
--- `popnumber`      return only the value of a `real` or `integer` 
--- `popname`        return only the value of a `name` 
--- `popstring`      return only the value of a `string` 
--- `poparray`       return only the value of a `array` 
--- `popdictionary`  return only the value of a `dict` 
--- `popboolean`     return only the value of a `boolean` 
--- `done`           abort further processing of this `scan()` call 
---\LL
---\stoptabulate
---
---The `pop*` are convenience functions, and come in handy when you know the
---type of the operands beforehand (which you usually do, in \PDF). For example, the
---`Do` function could have used `local name = scanner:popname()`
---instead, because the single operand to the `Do` operator is always a \PDF\
---name object.
---
---The `done` function allows you to abort processing of a stream once you
---have learned everything you want to learn. This comes in handy while parsing
---`/ToUnicode`, because there usually is trailing garbage that you are not
---interested in. Without `done`, processing only ends at the end of the
---stream, possibly wasting \CPU\ cycles.
---
---{\em We keep the older names `popNumber`, `popName`, `popString`, `popArray`, `popDict` and `popBool` around.}
---
---\stopsection
---
---\stopchapter
---
---\stopcomponent
---