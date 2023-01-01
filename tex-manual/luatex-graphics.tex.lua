---% language=uk
---
---% mp solve_path
---
---\environment luatex-style
---
---\startcomponent luatex-graphics
---
---\startchapter[reference=graphics,title={The graphic libraries}]
---
---\startsection[title={The `img` library}][library=img]
---
---\topicindex {images}
---\topicindex {images+library}
---\topicindex {graphics}
---
---The `img` library can be used as an alternative to \orm {pdfximage} and
---\orm {pdfrefximage}, and the associated “satellite” commands like `\pdfximagebbox`. Image objects can also be used within virtual fonts via the
---`image` command listed in \in {section} [virtualfonts].
---
---\subsection{`new`}
---
---\libindex{new}
---
---```
---<image> var = img.new()
---<image> var = img.new(<table> image_spec)
---```
---
---This function creates a userdata object of type “image”. The `image_spec` argument is optional. If it is given, it must be a table, and that
---table must contain a `filename` key. A number of other keys can also be
---useful, these are explained below.
---
---You can either say
---
---```
---a = img.new()
---```
---
---followed by
---
---```
---a.filename = "foo.png"
---```
---
---or you can put the file name (and some or all of the other keys) into a table
---directly, like so:
---
---```
---a = img.new({filename='foo.pdf', page=1})
---```
---
---The generated `<image>` userdata object allows access to a set of
---user-specified values as well as a set of values that are normally filled in
---and updated automatically by *LuaTeX* itself. Some of those are derived from the
---actual image file, others are updated to reflect the \PDF\ output status of the
---object.
---
---There is one required user-specified field: the file name (`filename`). It
---can optionally be augmented by the requested image dimensions (`width`,
---`depth`, `height`), user-specified image attributes (`attr`),
---the requested \PDF\ page identifier (`page`), the requested boundingbox
---(`pagebox`) for \PDF\ inclusion, the requested color space object (`colorspace`).
---
---The function `img.new` does not access the actual image file, it just
---creates the `<image>` userdata object and initializes some memory
---structures. The `<image>` object and its internal structures are
---automatically garbage collected.
---
---Once the image is scanned, all the values in the `<image>` except `width`, `height` and `depth`, become frozen, and you cannot change
---them any more.
---
---You can use `pdf.setignoreunknownimages(1)` (or at the *TeX* end the `pdfvariable` `ignoreunknownimages`) to get around a quit when no known
---image type is found (based on name or preamble). Beware: this will not catch
---invalid images and we cannot guarantee side effects. A zero dimension image is
---still included when requested. No special flags are set. A proper workflow will
---not rely in such a catch but make sure that images are valid.
---
---\subsection{`fields`}
---
---\libindex{fields}
---
---```
---<table> keys = img.fields()
---```
---
---This function returns a list of all the possible `image_spec` keys, both
---user-supplied and automatic ones.
---
---\starttabulate[|l|l|p|]
---\DB field name             \BC type     \BC description \NC \NR
---\TB
---\NC \type{attr}            \NC string   \NC the image attributes for *LuaTeX* \NC \NR
---\NC \type{bbox}            \NC table    \NC table with 4 boundingbox dimensions `llx`, `lly`, `urx` and `ury` overruling the `pagebox` entry \NC \NR
---\NC \type{colordepth}      \NC number   \NC the number of bits used by the color space \NC \NR
---\NC \type{colorspace}      \NC number   \NC the color space object number \NC \NR
---\NC \type{depth}           \NC number   \NC the image depth for *LuaTeX* \NC \NR
---\NC \type{filename}        \NC string   \NC the image file name \NC \NR
---\NC \type{filepath}        \NC string   \NC the full (expanded) file name of the image\NC \NR
---\NC \type{height}          \NC number   \NC the image height for *LuaTeX* \NC \NR
---\NC \type{imagetype}       \NC string   \NC one of `pdf`, `png`, `jpg`,
---                                            `jp2` or `jbig2` \NC \NR
---\NC \type{index}           \NC number   \NC the \PDF\ image name suffix \NC \NR
---\NC \type{objnum}          \NC number   \NC the \PDF\ image object number \NC \NR
---\NC \type{page}            \NC number   \NC the identifier for the requested image page \NC \NR
---\NC \type{pagebox}         \NC string   \NC the requested bounding box, one of
---                                            `none`, `media`, `crop`,
---                                            `bleed`, `trim`, `art` \NC \NR
---\NC \type{pages}           \NC number   \NC the total number of available pages \NC \NR
---\NC \type{rotation}        \NC number   \NC the image rotation from included \PDF\ file,
---                                            in multiples of 90 deg. \NC \NR
---\NC \type{stream}          \NC string   \NC the raw stream data for an `/Xobject`
---                                            `/Form` object\NC \NR
---\NC \type{transform}       \NC number   \NC the image transform, integer number 0..7 \NC \NR
---\NC \type{orientation}     \NC number   \NC the (jpeg) image orientation, integer number 1..8
---                                            (0 for unset) \NC \NR
---\NC \type{width}           \NC number   \NC the image width for *LuaTeX* \NC \NR
---\NC \type{xres}            \NC number   \NC the horizontal natural image resolution
---                                            (in \DPI) \NC \NR
---\NC \type{xsize}           \NC number   \NC the natural image width \NC \NR
---\NC \type{yres}            \NC number   \NC the vertical natural image resolution
---                                            (in \DPI) \NC \NR
---\NC \type{ysize}           \NC number   \NC the natural image height \NC \NR
---\NC \type{visiblefilename} \NC string   \NC when set, this name will find its way in the
---                                            \PDF\ file as `PTEX` specification; when
---                                            an empty string is assigned nothing is written
---                                            to file; otherwise the natural filename is
---                                            taken \NC \NR
---\NC \type{userpassword}   \NC string   \NC  the userpassword needed for opening a \PDF\ file \NC \NR
---\NC \type{ownerpassword}  \NC string   \NC  the ownerpassword needed for opening a \PDF\ file \NC \NR
---\NC \type{keepopen}       \NC boolean  \NC  keep the \PDF\ file open \NC \NR
---\NC \type{nobbox}         \NC boolean  \NC  don't add a boundingbox specification for streams \NC \NR
---\NC \type{nolength}       \NC boolean  \NC  don't add length key nor compress for streams \NC \NR
---\NC \type{nosize}         \NC boolean  \NC  don't add size fields for streams \NC \NR
---\LL
---\stoptabulate
---
---A running (undefined) dimension in `width`, `height`, or `depth` is represented as `nil` in *Lua*, so if you want to load an image at
---its “natural” size, you do not have to specify any of those three fields.
---
---The `stream` parameter allows to fabricate an `/XObject` `/Form` object from a string giving the stream contents, e.g., for a filled
---rectangle:
---
---```
---a.stream = "0 0 20 10 re f"
---```
---
---When writing the image, an `/Xobject` `/Form` object is created, like
---with embedded \PDF\ file writing. The object is written out only once. The `stream` key requires that also the `bbox` table is given. The `stream` key conflicts with the `filename` key. The `transform` key
---works as usual also with `stream`.
---
---The `bbox` key needs a table with four boundingbox values, e.g.:
---
---```
---a.bbox = { "30bp", 0, "225bp", "200bp" }
---```
---
---This replaces and overrules any given `pagebox` value; with given `bbox` the box dimensions coming with an embedded \PDF\ file are ignored. The
---`xsize` and `ysize` dimensions are set accordingly, when the image is
---scaled. The `bbox` parameter is ignored for non-\PDF\ images.
---
---The `transform` allows to mirror and rotate the image in steps of 90 deg.
---The default value `0` gives an unmirrored, unrotated image. Values `1-3` give
---counterclockwise rotation by `90`, `180`, or `270` degrees, whereas with values
---`4-7` the image is first mirrored and then rotated counterclockwise by `90`,
---`180`, or `270` degrees. The `transform` operation gives the same visual
---result as if you would externally preprocess the image by a graphics tool and
---then use it by *LuaTeX*. If a \PDF\ file to be embedded already contains a `/Rotate` specification, the rotation result is the combination of the `/Rotate` rotation followed by the `transform` operation.
---
---\subsection{`scan`}
---
---\libindex{scan}
---
---```
---<image> var = img.scan(<image> var)
---<image> var = img.scan(<table> image_spec)
---```
---
---When you say `img.scan(a)` for a new image, the file is scanned, and
---variables such as `xsize`, `ysize`, image `type`, number of
---`pages`, and the resolution are extracted. Each of the `width`, `height`, `depth` fields are set up according to the image dimensions, if
---they were not given an explicit value already. An image file will never be
---scanned more than once for a given image variable. With all subsequent `img.scan(a)` calls only the dimensions are again set up (if they have been
---changed by the user in the meantime).
---
---For ease of use, you can do right-away a
---
---```
---<image> a = img.scan { filename = "foo.png" }
---```
---
---without a prior `img.new`.
---
---Nothing is written yet at this point, so you can do `a=img.scan`, retrieve
---the available info like image width and height, and then throw away `a`
---again by saying `a=nil`. In that case no image object will be reserved in
---the PDF, and the used memory will be cleaned up automatically.
---
---\subsection{`copy`}
---
---\libindex{copy}
---
---```
---<image> var = img.copy(<image> var)
---<image> var = img.copy(<table> image_spec)
---```
---
---If you say `a = b`, then both variables point to the same `<image>`
---object. if you want to write out an image with different sizes, you can do
---`b = img.copy(a)`.
---
---Afterwards, `a` and `b` still reference the same actual image
---dictionary, but the dimensions for `b` can now be changed from their
---initial values that were just copies from `a`.
---
---\subsection{`write`, `immediatewrite`, `immediatewriteobject`}
---
---\topicindex {images+injection}
---\topicindex {images+immediate}
---\topicindex {images+object}
---
---\libindex{write}
---\libindex{immediatewrite}
---\libindex{immediatewriteobject}
---
---```
---<image> var = img.write(<image> var)
---<image> var = img.write(<table> image_spec)
---```
---
---By `img.write(a)` a \PDF\ object number is allocated, and a rule node of
---subtype `image` is generated and put into the output list. By this the
---image `a` is placed into the page stream, and the image file is written out
---into an image stream object after the shipping of the current page is finished.
---
---Again you can do a terse call like
---
---```
---img.write { filename = "foo.png" }
---```
---
---The `<image>` variable is returned in case you want it for later
---processing. You can also write an object.
---
---By `img.immediatewrite(a)` a \PDF\ object number is allocated, and the
---image file for image `a` is written out immediately into the \PDF\ file as
---an image stream object (like with `immediate`\orm {pdfximage}). The object
---number of the image stream dictionary is then available by the `objnum`
---key. No `pdf_refximage` whatsit node is generated. You will need an
---`img.write(a)` or `img.node(a)` call to let the image appear on the
---page, or reference it by another trick; else you will have a dangling image
---object in the \PDF\ file.
---
---```
---<image> var = img.immediatewrite(<image> var)
---<image> var = img.immediatewrite(<table> image_spec)
---```
---
---Also here you can do a terse call like
---
---```
---a = img.immediatewrite { filename = "foo.png" }
---```
---
---The `<image>` variable is returned and you will most likely need it.
---
---The next function is kind of special as it copies an object from a (\PDF) image
---file. This features is experimental and might disappear.
---
---```
---<integer> objnum = img.immediatewriteobject(<image> var, <integer> objnum)
---<integer> objnum = img.immediatewriteobject(<table> image_spec, <integer> objnum)
---```
---
---\subsection{`node`}
---
---\libindex{node}
---
---```
---<node> n = img.node(<image> var)
---<node> n = img.node(<table> image_spec)
---```
---
---This function allocates a \PDF\ object number and returns a whatsit node of
---subtype `pdf_refximage`, filled with the image parameters `width`,
---`height`, `depth`, and `objnum`. Also here you can do a terse
---call like:
---
---```
---n = img.node ({ filename = "foo.png" })
---```
---
---This example outputs an image:
---
---```
---node.write(img.node{filename="foo.png"})
---```
---
---\subsection{`types`}
---
---\topicindex {images+types}
---
---\libindex{types}
---
---```
---<table> types = img.types()
---```
---
---This function returns a list with the supported image file type names, currently
---these are `pdf`, `png`, `jpg`, `jp2` (JPEG 2000), and
---`jbig2`.
---
---\subsection{`boxes`}
---
---\libindex{boxes}
---
---```
---<table> boxes = img.boxes()
---```
---
---This function returns a list with the supported \PDF\ page box names, currently
---these are `media`, `crop`, `bleed`, `trim`, and `art`, all in lowercase.
---
---The \PDF\ file is kept open after its properties are determined. After inclusion,
---which happens when the page that references the image is flushed, the file is
---closed. This means that when you have thousands of images on one page, your
---operating system might decide to abort the run. When you include more than one
---page from a \PDF\ file you can set the `keepopen` flag when you allocate an
---image object, or pass the `keepopen` directive when you refer to the image
---with `useimageresource`. This only makes sense when you embed many pages.
---An `immediate` applied to `saveimageresource` will also force a
---close after inclusion.
---
---```
---\immediate\useimageresource{foo.pdf}%
---          \saveimageresource         \lastsavedimageresourceindex % closed
---          \useimageresource{foo.pdf}%
---          \saveimageresource         \lastsavedimageresourceindex % kept open
---          \useimageresource{foo.pdf}%
---          \saveimageresource keepopen\lastsavedimageresourceindex % kept open
---
---\directlua{img.write(img.scan{ file = "foo.pdf" })}                  % closed
---\directlua{img.write(img.scan{ file = "foo.pdf", keepopen = true })} % kept open
---```
---
---\stopsection
---
---\startsection[title={The `mplib` library}][library=mplib]
---
---\topicindex {\METAPOST}
---\topicindex {\METAPOST+mplib}
---\topicindex {images+mplib}
---\topicindex {images+\METAPOST}
---
---\libindex{version}
---
---The \MP\ library interface registers itself in the table `mplib`. It is
---based on \MPLIB\ version \ctxlua {context(mplib.version())}.
---
---\subsection{`new`}
---
---\libindex{new}
---
---To create a new \METAPOST\ instance, call
---
---```
---<mpinstance> mp = mplib.new({...})
---```
---
---This creates the `mp` instance object. The argument hash can have a number
---of different fields, as follows:
---
---\starttabulate[|l|l|pl|pl|]
---\DB name               \BC type     \BC description              \BC default           \NC \NR
---\TB
---\NC \type{error_line}  \NC number   \NC error line width         \NC 79                \NC \NR
---\NC \type{print_line}  \NC number   \NC line length in ps output \NC 100               \NC \NR
---\NC \type{random_seed} \NC number   \NC the initial random seed  \NC variable          \NC \NR
---\NC \type{math_mode}   \NC string   \NC the number system to use:
---                                        `scaled`,
---                                        `double` or
---                                      % `binary` or
---                                        `decimal`          \NC `scaled`    \NC \NR
---\NC \type{interaction} \NC string   \NC the interaction mode:
---                                        `batch`,
---                                        `nonstop`,
---                                        `scroll` or
---                                        `errorstop`        \NC `errorstop` \NC \NR
---\NC \type{job_name}    \NC string   \NC `--jobname`        \NC `mpout`     \NC \NR
---\NC \type{find_file}   \NC function \NC a function to find files \NC only local files  \NC \NR
---\LL
---\stoptabulate
---
---The binary mode is no longer available in the *LuaTeX* version of \MPLIB. It
---offers no real advantage and brings a ton of extra libraries with platform
---specific properties that we can now avoid. We might introduce a high resolution
---scaled variant at some point but only when it pays of performance wise.
---
---The `find_file` function should be of this form:
---
---```
---<string> found = finder (<string> name, <string> mode, <string> type)
---```
---
---with:
---
---\starttabulate[|l|p|]
---\DB name        \BC the requested file \NC \NR
---\TB
---\NC \type{mode} \NC the file mode: `r` or `w` \NC \NR
---\NC \type{type} \NC the kind of file, one of: `mp`, `tfm`, `map`,
---                    `pfb`, `enc` \NC \NR
---\LL
---\stoptabulate
---
---Return either the full path name of the found file, or `nil` if the file
---cannot be found.
---
---Note that the new version of \MPLIB\ no longer uses binary mem files, so the way
---to preload a set of macros is simply to start off with an `input` command
---in the first `execute` call.
---
---When you are processing a snippet of text starting with `btex` and
---ending with either `etex` or `verbatimtex`, the \METAPOST\
---`texscriptmode` parameter controls how spaces and newlines get honoured.
---The default value is 1. Possible values are:
---
---\starttabulate[|l|p|]
---\DB name      \BC meaning \NC \NR
---\TB
---\NC `0` \NC no newlines \NC \NR
---\NC `1` \NC newlines in `verbatimtex` \NC \NR
---\NC `2` \NC newlines in `verbatimtex` and `etex` \NC \NR
---\NC `3` \NC no leading and trailing strip in `verbatimtex` \NC \NR
---\NC `4` \NC no leading and trailing strip in `verbatimtex` and `btex` \NC \NR
---\LL
---\stoptabulate
---
---That way the *Lua* handler (assigned to `make_text`) can do what it likes.
---An `etex` has to be followed by a space or `;` or be at the end of a
---line and preceded by a space or at the beginning of a line.
---
---\subsection{`statistics`}
---
---\libindex{statistics}
---
---You can request statistics with:
---
---```
---<table> stats = mp:statistics()
---```
---
---This function returns the vital statistics for an \MPLIB\ instance. There are
---four fields, giving the maximum number of used items in each of four allocated
---object classes:
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{main_memory} \NC number \NC memory size \NC \NR
---\NC \type{hash_size}   \NC number \NC hash size\NC \NR
---\NC \type{param_size}  \NC number \NC simultaneous macro parameters\NC \NR
---\NC \type{max_in_open} \NC number \NC input file nesting levels\NC \NR
---\LL
---\stoptabulate
---
---Note that in the new version of \MPLIB, this is informational only. The objects
---are all allocated dynamically, so there is no chance of running out of space
---unless the available system memory is exhausted.
---
---\subsection{`execute`}
---
---\libindex{execute}
---
---You can ask the \METAPOST\ interpreter to run a chunk of code by calling
---
---```
---<table> rettable = execute(mp,"metapost code")
---```
---
---for various bits of \METAPOST\ language input. Be sure to check the `rettable.status` (see below) because when a fatal \METAPOST\ error occurs the
---\MPLIB\ instance will become unusable thereafter.
---
---Generally speaking, it is best to keep your chunks small, but beware that all
---chunks have to obey proper syntax, like each of them is a small file. For
---instance, you cannot split a single statement over multiple chunks.
---
---In contrast with the normal stand alone `mpost` command, there is
---\notabene {no} implied “input” at the start of the first chunk.
---
---\subsection{`finish`}
---
---\libindex{finish}
---
---```
---<table> rettable = finish(mp)
---```
---
---If for some reason you want to stop using an \MPLIB\ instance while processing is
---not yet actually done, you can call \type{finish}. Eventually, used memory
---will be freed and open files will be closed by the *Lua* garbage collector, but
---an explicit \type{finish} is the only way to capture the final part of the
---output streams.
---
---\subsection{Result table}
---
---\libindex {fields}
---
---The return value of `execute` and `finish` is a table with a
---few possible keys (only `status` is always guaranteed to be present).
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{log}    \NC string \NC output to the “log” stream \NC \NR
---\NC \type{term}   \NC string \NC output to the “term” stream \NC \NR
---\NC \type{error}  \NC string \NC output to the “error” stream
---                                 (only used for “out of memory”) \NC \NR
---\NC \type{status} \NC number \NC the return value:
---                                 `0` = good,
---                                 `1` = warning,
---                                 `2` = errors,
---                                 `3` = fatal error \NC \NR
---\NC \type{fig}    \NC table  \NC an array of generated figures (if any) \NC \NR
---\LL
---\stoptabulate
---
---When `status` equals 3, you should stop using this \MPLIB\ instance
---immediately, it is no longer capable of processing input.
---
---If it is present, each of the entries in the `fig` array is a userdata
---representing a figure object, and each of those has a number of object methods
---you can call:
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{boundingbox}  \NC function \NC returns the bounding box, as an array of 4
---                                         values \NC \NR
---\NC \type{postscript}   \NC function \NC returns a string that is the ps output of the
---                                         `fig`. this function accepts two optional
---                                         integer arguments for specifying the values of
---                                         `prologues` (first argument) and `procset` (second argument) \NC \NR
---\NC \type{svg}          \NC function \NC returns a string that is the svg output of the
---                                         `fig`. This function accepts an optional
---                                         integer argument for specifying the value of
---                                         `prologues` \NC \NR
---\NC \type{objects}      \NC function \NC returns the actual array of graphic objects in
---                                         this `fig` \NC \NR
---\NC \type{copy_objects} \NC function \NC returns a deep copy of the array of graphic
---                                         objects in this `fig` \NC \NR
---\NC \type{filename}     \NC function \NC the filename this `fig`'s \POSTSCRIPT\
---                                         output would have written to in stand alone
---                                         mode \NC \NR
---\NC \type{width}        \NC function \NC the `fontcharwd` value \NC \NR
---\NC \type{height}       \NC function \NC the `fontcharht` value \NC \NR
---\NC \type{depth}        \NC function \NC the `fontchardp` value \NC \NR
---\NC \type{italcorr}     \NC function \NC the `fontcharit` value \NC \NR
---\NC \type{charcode}     \NC function \NC the (rounded) `charcode` value \NC \NR
---\LL
---\stoptabulate
---
---Note: you can call `fig:objects()` only once for any one `fig`
---object!
---
---When the boundingbox represents a “negated rectangle”, i.e.\ when the
---first set of coordinates is larger than the second set, the picture is empty.
---
---Graphical objects come in various types that each has a different list of
---accessible values. The types are: `fill`, `outline`, `text`,
---`start_clip`, `stop_clip`, `start_bounds`, `stop_bounds`,
---`special`.
---
---There is a helper function (`mplib.fields(obj)`) to get the list of
---accessible values for a particular object, but you can just as easily use the
---tables given below.
---
---All graphical objects have a field `type` that gives the object type as a
---string value; it is not explicit mentioned in the following tables. In the
---following, `number`s are \POSTSCRIPT\ points represented as a floating
---point number, unless stated otherwise. Field values that are of type `table` are explained in the next section.
---
---\subsubsection{fill}
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{path}       \NC table  \NC the list of knots \NC \NR
---\NC \type{htap}       \NC table  \NC the list of knots for the reversed trajectory \NC \NR
---\NC \type{pen}        \NC table  \NC knots of the pen \NC \NR
---\NC \type{color}      \NC table  \NC the object's color \NC \NR
---\NC \type{linejoin}   \NC number \NC line join style (bare number)\NC \NR
---\NC \type{miterlimit} \NC number \NC miterlimit\NC \NR
---\NC \type{prescript}  \NC string \NC the prescript text \NC \NR
---\NC \type{postscript} \NC string \NC the postscript text \NC \NR
---\LL
---\stoptabulate
---
---The entries `htap` and `pen` are optional.
---
---\subsubsection{outline}
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{path}       \NC table  \NC the list of knots \NC \NR
---\NC \type{pen}        \NC table  \NC knots of the pen \NC \NR
---\NC \type{color}      \NC table  \NC the object's color \NC \NR
---\NC \type{linejoin}   \NC number \NC line join style (bare number) \NC \NR
---\NC \type{miterlimit} \NC number \NC miterlimit \NC \NR
---\NC \type{linecap}    \NC number \NC line cap style (bare number) \NC \NR
---\NC \type{dash}       \NC table  \NC representation of a dash list \NC \NR
---\NC \type{prescript}  \NC string \NC the prescript text \NC \NR
---\NC \type{postscript} \NC string \NC the postscript text \NC \NR
---\LL
---\stoptabulate
---
---The entry `dash` is optional.
---
---\subsubsection{text}
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{text}       \NC string \NC the text \NC \NR
---\NC \type{font}       \NC string \NC font tfm name \NC \NR
---\NC \type{dsize}      \NC number \NC font size \NC \NR
---\NC \type{color}      \NC table  \NC the object's color \NC \NR
---\NC \type{width}      \NC number \NC \NC \NR
---\NC \type{height}     \NC number \NC \NC \NR
---\NC \type{depth}      \NC number \NC \NC \NR
---\NC \type{transform}  \NC table  \NC a text transformation \NC \NR
---\NC \type{prescript}  \NC string \NC the prescript text \NC \NR
---\NC \type{postscript} \NC string \NC the postscript text \NC \NR
---\LL
---\stoptabulate
---
---\subsubsection{special}
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{prescript} \NC string \NC special text \NC \NR
---\LL
---\stoptabulate
---
---\subsubsection{start_bounds, start_clip}
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{path} \NC table \NC the list of knots \NC \NR
---\LL
---\stoptabulate
---
---\subsubsection{stop_bounds, stop_clip}
---
---Here are no fields available.
---
---\subsection{Subsidiary table formats}
---
---\subsubsection{Paths and pens}
---
---Paths and pens (that are really just a special type of paths as far as \MPLIB\ is
---concerned) are represented by an array where each entry is a table that
---represents a knot.
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{left_type}  \NC string \NC when present: endpoint, but usually absent \NC \NR
---\NC \type{right_type} \NC string \NC like `left_type` \NC \NR
---\NC \type{x_coord}    \NC number \NC X coordinate of this knot \NC \NR
---\NC \type{y_coord}    \NC number \NC Y coordinate of this knot \NC \NR
---\NC \type{left_x}     \NC number \NC X coordinate of the precontrol point of this knot \NC \NR
---\NC \type{left_y}     \NC number \NC Y coordinate of the precontrol point of this knot \NC \NR
---\NC \type{right_x}    \NC number \NC X coordinate of the postcontrol point of this knot \NC \NR
---\NC \type{right_y}    \NC number \NC Y coordinate of the postcontrol point of this knot \NC \NR
---\LL
---\stoptabulate
---
---There is one special case: pens that are (possibly transformed) ellipses have an
---extra string-valued key `type` with value `elliptical` besides the
---array part containing the knot list.
---
---\subsubsection{Colors}
---
---A color is an integer array with 0, 1, 3 or 4 values:
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{0} \NC marking only \NC no values                                                     \NC \NR
---\NC \type{1} \NC greyscale    \NC one value in the range `(0,1)`, “black” is `0`         \NC \NR
---\NC \type{3} \NC \RGB         \NC three values in the range `(0,1)`, “black” is `0,0,0`  \NC \NR
---\NC \type{4} \NC \CMYK        \NC four values in the range `(0,1)`, “black” is `0,0,0,1` \NC \NR
---\LL
---\stoptabulate
---
---If the color model of the internal object was `uninitialized`, then it was
---initialized to the values representing “black” in the colorspace `defaultcolormodel` that was in effect at the time of the `shipout`.
---
---\subsubsection{Transforms}
---
---Each transform is a six-item array.
---
---\starttabulate[|l|l|p|]
---\DB index  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{1} \NC number \NC represents x  \NC \NR
---\NC \type{2} \NC number \NC represents y  \NC \NR
---\NC \type{3} \NC number \NC represents xx \NC \NR
---\NC \type{4} \NC number \NC represents yx \NC \NR
---\NC \type{5} \NC number \NC represents xy \NC \NR
---\NC \type{6} \NC number \NC represents yy \NC \NR
---\LL
---\stoptabulate
---
---Note that the translation (index 1 and 2) comes first. This differs from the
---ordering in \POSTSCRIPT, where the translation comes last.
---
---\subsubsection{Dashes}
---
---Each `dash` is two-item hash, using the same model as \POSTSCRIPT\ for the
---representation of the dashlist. `dashes` is an array of “on” and
---“off”, values, and `offset` is the phase of the pattern.
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{dashes} \NC hash   \NC an array of on-off numbers \NC \NR
---\NC \type{offset} \NC number \NC the starting offset value  \NC \NR
---\LL
---\stoptabulate
---
---\subsection{Pens and `pen_info`}
---
---\libindex{pen_info}
---
---There is helper function (`pen_info(obj)`) that returns a table containing
---a bunch of vital characteristics of the used pen (all values are floats):
---
---\starttabulate[|l|l|p|]
---\DB field  \BC type \BC explanation \NC \NR
---\TB
---\NC \type{width} \NC number \NC width of the pen \NC \NR
---\NC \type{sx}    \NC number \NC `x` scale        \NC \NR
---\NC \type{rx}    \NC number \NC `xy` multiplier  \NC \NR
---\NC \type{ry}    \NC number \NC `yx` multiplier  \NC \NR
---\NC \type{sy}    \NC number \NC `y` scale        \NC \NR
---\NC \type{tx}    \NC number \NC `x` offset       \NC \NR
---\NC \type{ty}    \NC number \NC `y` offset       \NC \NR
---\LL
---\stoptabulate
---
---\subsection{Character size information}
---
---These functions find the size of a glyph in a defined font. The `fontname`
---is the same name as the argument to `infont`; the `char` is a glyph
---id in the range 0 to 255; the returned `w` is in AFM units.
---
---\subsubsection{`char_width`}
---
---\libindex{char_width}
---
---```
---<number> w = char_width(mp,<string> fontname, <number> char)
---```
---
---\subsubsection{`char_height`}
---
---\libindex{char_height}
---
---```
---<number> w = char_height(mp,<string> fontname, <number> char)
---```
---
---\subsubsection{`char_depth`}
---
---\libindex{char_depth}
---
---```
---<number> w = char_depth(mp,<string> fontname, <number> char)
---```
---
---\subsubsection{`get_[boolean|numeric|string|path]`}
---
---\libindex{get_boolean}
---\libindex{get_numeric}
---\libindex{get_path}
---\libindex{get_string}
---
---When a script call brings you from the \METAPOST\ run (temporarily) back to
---*Lua* you can access variables, but only if they are known (so for instance
---anonymous capsules like loop variables are not accessible).
---
---```
---<boolean> w = get_boolean(mp,<string> name)
---<number>  n = get_numeric(mp,<string> name)
---<string>  s = get_string (mp,<string> name)
---<table>   p = get_path   (mp,<string> name)
---```
---
---The path is returned a a table with subtables that have six numbers: the
---coordinates of the point, pre- and postcontrol. A `cycle` fields indicates
---if a path is cyclic.
---
---\stopsection
---
---\stopchapter
---