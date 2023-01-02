---@meta

---The node library contains functions that facilitate dealing with (lists of) nodes and their values.
---They allow you to create, alter, copy, delete, and insert LuaTEX node objects, the core objects
---within the typesetter.
---
---LuaTEX nodes are represented in Lua as userdata with the metadata type `luatex.node.` The
---various parts within a node can be accessed using named fields.
---
---Each node has at least the three fields next, id, and subtype:
---
---* The next field returns the userdata object for the next node in a linked list of nodes, or nil,
---  if there is no next node.
---* The id indicates TEX’s ‘node type’. The field id has a numeric value for efficiency reasons,
---  but some of the library functions also accept a string value instead of id.
---* The subtype is another number. It often gives further information about a node of a particular
---  id, but it is most important when dealing with ‘whatsits’, because they are differentiated
---  solely based on their subtype.
---
---The other available fields depend on the id (and for ‘whatsits’, the subtype) of the node.
---
---Support for unset (alignment) nodes is partial: they can be queried and modified from Lua code,
---but not created.
---
---Nodes can be compared to each other, but: you are actually comparing indices into the node
---memory. This means that equality tests can only be trusted under very limited conditions. It will
---not work correctly in any situation where one of the two nodes has been freed and/or reallocated:
---in that case, there will be false positives.
---
---At the moment, memory management of nodes should still be done explicitly by the user. Nodes
---are not ‘seen’ by the Lua garbage collector, so you have to call the node freeing functions yourself
---when you are no longer in need of a node (list). Nodes form linked lists without reference
---counting, so you have to be careful that when control returns back to LuaTEX itself, you have
---not deleted nodes that are still referenced from a next pointer elsewhere, and that you did not
---create nodes that are referenced more than once. Normally the setters and getters handle this
---for you.
---
---There are statistics available with regards to the allocated node memory, which can be handy
---for tracing.
node = {}

---*LuaTeX* only understands 4 of the 16 direction specifiers of aleph: `TLT` (latin), `TRT` (arabic), `RTT` (cjk), `LTL` (mongolian). All other direction specifiers generate an error. In addition to a keyword driven model we also provide an integer driven one.
---@alias DirectionSpecifier
---| "TLT" # latin
---| "TRT" # arabic
---| "RTT" # cjk
---| "LTL" # mongolian

---@alias NodeType
---| "hlist"
---| "vlist"
---| "rule"
---| "ins"
---| "mark"
---| "adjust"
---| "boundary"
---| "disc"
---| "whatsit"
---| "local_par"
---| "dir"
---| "math"
---| "glue"
---| "kern"
---| "penalty"
---| "unset"
---| "style"
---| "choice"
---| "noad"
---| "radical"
---| "fraction
---| "accent"
---| "fence"
---| "math_char"
---| "sub_box"
---| "sub_mlist"
---| "math_text_char
---| "delim"
---| "margin_kern"
---| "glyph"
---| "align_record"
---| "pseudo_file"
---| "pseudo_line"
---| "page_insert"
---| "split_insert"
---| "expr_stack"
---| "nested_list"
---| "span
---| "attribute"
---| "glue_spec"
---| "attribute_list"
---| "temp"
---| "align_stack"
---| "movement_stack"
---| "if_stack"
---| "unhyphenated"
---| "hyphenated"
---| "delta"
---| "passive"
---| "shape"

---A number in the range `[0,4]` indicating the glue order.
---@alias GlueOrder 0|1|2|3|4

---The calculated glue ratio.
---@alias GlueSet number

---@alias GlueSign
---|0 # `normal`,
---|1 # `stretching`,
---|2 # `shrinking`

node.__t = {}
node.__t.Node = 'xxx'

---
---These are the nodes that comprise actual typesetting commands. A few fields are
---present in all nodes regardless of their type, these are:
------
---Source: [luatex-nodes.tex#L49-L76](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L49-L76)
---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil # That prev field is always present, but only initialized on explicit request: when the function `node.slide()` is called, it will set up the `prev` fields to be a backwards pointer in the argument node list. By now most of *TeX*'s node processing makes sure that the `prev` nodes are valid but there can be exceptions, especially when the internal magic uses a leading `temp` nodes to temporarily store a state.
---@field id integer # the node’s type (id) number
---@field subtype integer # the node subtype identifier. The `subtype` is sometimes just a dummy entry because not all nodes actually use the `subtype`, but this way you can be sure that all nodes accept it as a valid field name, and that is often handy in node list traversal.
---@field head? Node
---@field attr Node # list of attributes. almost all nodes also have an `attr` field

node.__t.hlist = 0

---@alias HlistNodeSubtype
---|0 # unknown
---|1 # line
---|2 # box
---|3 # indent
---|4 # alignment
---|5 # cell
---|6 # equation
---|7 # equationnumber
---|8 # math
---|9 # mathchar
---|10 # hextensible
---|11 # vextensible
---|12 # hdelimiter
---|13 # vdelimiter
---|14 # overdelimiter
---|15 # underdelimiter
---|16 # numerator
---|17 # denominator
---|18 # limits
---|19 # fraction
---|20 # nucleus
---|21 # sup
---|22 # sub
---|23 # degree
---|24 # scripts
---|25 # over
---|26 # under
---|27 # accent
---|28 # radical

---
---A warning: never assign a node list to the `head` field unless you are sure
---its internal link structure is correct, otherwise an error may result.
---
---Note: the field name `head` and `list` are both valid. Sometimes it
---makes more sense to refer to a list by `head`, sometimes `list` makes
---more sense.
------
---Source: [luatex-nodes.tex#L78-L108](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L78-L108)
---@class HlistNode: Node
---@field subtype HlistNodeSubtype
---@field width number # the width of the box
---@field height number # the height of the box
---@field depth number # the depth of the box
---@field shift number # a displacement perpendicular to the character progression direction
---@field glue_order GlueOrder
---@field glue_set GlueSet
---@field glue_sign GlueSign
---@field head Node # the first node of the body of this list
---@field list Node # the first node of the body of this list
---@field dir DirectionSpecifier

node.__t.vlist = 1

---@alias VlistNodeSubtype
---|0 # unknown
---|4 # alignment
---|5 # cell

node.__t.rule = 2

---@alias RuleNodeSubtype
---|0 # normal
---|1 # box
---|2 # image
---|3 # empty
---|4 # user
---|5 # over
---|6 # under,
---|7 # fraction
---|8 # radical
---|9 # outline

---
---Contrary to traditional *TeX*, *LuaTeX* has more `rule` subtypes because we
---also use rules to store reuseable objects and images. User nodes are invisible
---and can be intercepted by a callback.
---
---The `left` and `right` keys are somewhat special (and experimental).
---When rules are auto adapting to the surrounding box width you can enforce a shift
---to the right by setting `left`. The value is also subtracted from the width
---which can be a value set by the engine itself and is not entirely under user
---control. The `right` is also subtracted from the width. It all happens in
---the backend so these are not affecting the calculations in the frontend (actually
---the auto settings also happen in the backend). For a vertical rule `left`
---affects the height and `right` affects the depth. There is no matching
---interface at the *TeX* end (although we can have more keywords for rules it would
---complicate matters and introduce a speed penalty.) However, you can just
---construct a rule node with *Lua* and write it to the *TeX* input. The `outline` subtype is just a convenient variant and the `transform` field
---specifies the width of the outline.
------
---Source: [luatex-nodes.tex#L119-L157](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L119-L157)
---@class RuleNode: Node
---@field subtype RuleNodeSubtype
---@field width integer # the width of the rule where the special value −1073741824 is used for ‘running’ glue dimensions
---@field height integer # the height of the rule (can be negative)
---@field depth integer # the depth of the rule (can be negative)
---@field left integer # shift at the left end (also subtracted from width)
---@field right integer # (subtracted from width)
---@field dir DirectionSpecifier the direction of this rule
---@field index integer # an optional index that can be referred too
---@field transform integer # an private variable (also used to specify outline width)

node.__t.ins = 3

node.__t.mark = 4

node.__t.adjust = 5

---@alias AdjustNodeSubtype
---|0 # normal
---|1 # pre

node.__t.disc = 7

---@alias DiscNodeSubtype
---|0 # discretionary
---|1 # explicit
---|2 # automatic
---|3 # regular
---|4 # first
---|5 # second

node.__t.math = 11

---@alias MathNodeSubtype
---|0 # beginmath
---|1 # endmath

node.__t.glue_spec = 39

---
---Skips are about the only type of data objects in traditional *TeX* that are not a
---simple value. They are inserted when *TeX* sees a space in the text flow but also
---by `hskip` and `vskip`. The structure that represents the glue
---components of a skip is called a `glue_spec`.
---
---The effective width of some glue subtypes depends on the stretch or shrink needed
---to make the encapsulating box fit its dimensions. For instance, in a paragraph
---lines normally have glue representing spaces and these stretch or shrink to make
---the content fit in the available space. The `effective_glue` function that
---takes a glue node and a parent (hlist or vlist) returns the effective width of
---that glue item. When you pass `true` as third argument the value will be
---rounded.
---
---A `glue_spec` node is a special kind of node that is used for storing a set
---of glue values in registers. Originally they were also used to store properties
---of glue nodes (using a system of reference counts) but we now keep these
---properties in the glue nodes themselves, which gives a cleaner interface to *Lua*.
---
---The indirect spec approach was in fact an optimization in the original *TeX*
---code. First of all it can save quite some memory because all these spaces that
---become glue now share the same specification (only the reference count is
---incremented), and zero testing is also a bit faster because only the pointer has
---to be checked (this is no longer true for engines that implement for instance
---protrusion where we really need to ensure that zero is zero when we test for
---bounds). Another side effect is that glue specifications are read-only, so in
---the end copies need to be made when they are used from *Lua* (each assignment to
---a field can result in a new copy). So in the end the advantages of sharing are
---not that high (and nowadays memory is less an issue, also given that a glue node
---is only a few memory words larger than a spec).
---
---In addition there are the `width`, `stretch` `stretch_order`,
---`shrink`, and `shrink_order` fields. Note that we use the key `width` in both horizontal and vertical glue. This suits the *TeX* internals well
---so we decided to stick to that naming.
---@class GlueSpecNode: Node
---@field width          integer #  the horizontal or vertical displacement
---@field stretch        integer #  extra (positive) displacement or stretch amount
---@field stretch_order  integer #  factor applied to stretch amount
---@field shrink         integer #  extra (negative) displacement or shrink amount
---@field shrink_order   integer #  factor applied to shrink amount

node.__t.glue = 12

---@alias GlueNodeSubtype
---|0 # userskip
---|1 # lineskip
---|2 # baselineskip
---|3 # parskip
---|4 # abovedisplayskip
---|5 # belowdisplayskip
---|6 # abovedisplayshortskip
---|7 # belowdisplayshortskip
---|8 # leftskip
---|9 # rightskip
---|10 # topskip
---|11 # splittopskip
---|12 # tabskip
---|13 # spaceskip
---|14 # xspaceskip
---|15 # parfillskip
---|16 # mathskip
---|17 # thinmuskip
---|18 # medmuskip
---|19 # thickmuskip
---|98 # conditionalmathskip
---|99 # muglue
---|100 # leaders
---|101 # cleaders
---|102 # xleaders
---|103 # gleaders

---
---A regular word space also results in a `spaceskip` subtype (this used to be
---a `userskip` with subtype zero).
---@class GlueNode: Node
---@field subtype  GlueNodeSubtype
---@field leader   Node #    pointer to a box or rule for leaders

node.__t.kern = 13

---@alias KernNodeSubtype
---|0 # fontkern
---|1 # userkern
---|2 # accentkern
---|3 # italiccorrection

---
---The `kern` command creates such nodes but for instance the font and math
---machinery can also add them.
---
---@class KernNode: Node
---@field subtype KernNodeSubtype
---@field kern integer # fixed horizontal or vertical advance

node.__t.penalty = 14

---@alias PenaltyNodeSubtype
---|0 # userpenalty
---|1 # linebreakpenalty
---|2 # linepenalty
---|3 # wordpenalty
---|4 # finalpenalty
---|5 # noadpenalty
---|6 # beforedisplaypenalty
---|7 # afterdisplaypenalty
---|8 # equationnumberpenalty

node.__t.glyph = 29

---@alias GlyphNodeSubtype
---|1 # ligature
---|2 # ghost
---|3 # left
---|4 # right

node.__t.boundary = 6

---@alias BoundaryNodeSubtype
---|0 # cancel
---|1 # user
---|2 # protrusion
---|3 # word

node.__t.local_par = 9

node.__t.dir = 10

node.__t.margin_kern = 28

---@alias MarginKernNodeSubtype
---|0 # left
---|1 # right

node.__t.math_char = 23

node.__t.math_text_char = 26

node.__t.sub_box = 24

node.__t.sub_mlist = 25

node.__t.delim = 27

node.__t.noad = 18

---@alias NoadNodeSubtype
---|0 # ord
---|1 # opdisplaylimits
---|2 # oplimits
---|3 # opnolimits
---|4 # bin
---|5 # rel
---|6 # open
---|7 # close
---|8 # punct
---|9 # inner
---|10 # under
---|11 # over
---|12 # vcenter

node.__t.accent = 21

---@alias AccentNodeSubtype
---|0 # bothflexible
---|1 # fixedtop
---|2 # fixedbottom
---|3 # fixedboth

node.__t.style = 16

node.__t.choice = 17

node.__t.radical = 19

---@alias RadicalNodeSubtype
---|0 # radical
---|1 # uradical
---|2 # uroot
---|3 # uunderdelimiter
---|4 # uoverdelimiter
---|5 # udelimiterunder
---|6 # udelimiterover

node.__t.fraction = 20

node.__t.fence = 22

---@alias FenceNodeSubtype
---|0 # unset
---|1 # left
---|2 # middle
---|3 # right
---|4 # no

node.__t.whatsit = 8

node.__t.__whatsit = {}

---Whatsit nodes come in many subtypes that you can ask for them by running
---`node.whatsits`.
---
---Some of them are generic and independent of the output mode and others are
---specific to the chosen backend: \DVI\ or \PDF. Here we discuss the generic
---font-end nodes nodes.
---
---Source: [luatex-nodes.tex#L781-L797](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L781-L797)
---@class WhatsitNode: Node

node.__t.__whatsit.open = 0

node.__t.__whatsit.write = 1

node.__t.__whatsit.close = 2

node.__t.__whatsit.user_defined = 8

---User-defined whatsit nodes can only be created and handled from *Lua* code. In
---effect, they are an extension to the extension mechanism. The *LuaTeX* engine
---will simply step over such whatsits without ever looking at the contents.
---
------
---Source: [luatex-nodes.tex#L833-L864](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L833-L864)
---@class UserDefinedWhatsitNode: WhatsitNode
---@field user_id number # id number
---@field type 97|100|108|110|115|116 # The `type` can have one of six distinct values. The number is the ASCII value if the first character of the type name (so you can use string.byte("l") instead of `108`): 97 “a” list of attributes (a node list), 100 “d” a *Lua* number, 108 “l” a *Lua* value (table, number, boolean, etc), 110 “n” a node list, 115 “s” a *Lua* string, 116 “t” a *Lua* token list in *Lua* table form (a list of triplets).
---@field value number|Node|string|table

node.__t.__whatsit.save_pos = 6

node.__t.__whatsit.late_lua = 7

node.__t.__whatsit.special = 3

node.__t.__whatsit.pdf_literal = 16

node.__t.__whatsit.pdf_refobj = 17

node.__t.__whatsit.pdf_annot = 18

node.__t.__whatsit.pdf_start_link = 19

node.__t.__whatsit.pdf_end_link = 20

node.__t.__whatsit.pdf_dest = 21

node.__t.__whatsit.pdf_action = 22

node.__t.__whatsit.pdf_thread = 23

node.__t.__whatsit.pdf_start_thread = 24

node.__t.__whatsit.pdf_end_thread = 25

node.__t.__whatsit.pdf_thread_data = 26

node.__t.__whatsit.pdf_colorstack = 28

---
---From the pdfTeX manual:
---
---`\pdfcolorstack ⟨stack number⟩ ⟨stack action⟩ ⟨general text⟩`
---
---The command operates on the stack of a given number. If ⟨stack action⟩ is `push` keyword, the
---new value provided as ⟨general text⟩ is inserted into the top of the graphic stack and becomes
---the current stack value. If followed by `pop`, the top value is removed from the stack and the
---new top value becomes the current. `set` keyword replaces the current value with ⟨general text⟩
---without changing the stack size. `current` keyword instructs just to use the current stack value
---without modifying the stack at all.
------
---Source: [pdftex-t.tex#L3954-L3980](https://github.com/tex-mirror/pdftex/blob/6fb2352aa70a23ad3830f1434613170be3f3cd74/doc/manual/pdftex-t.tex#L3954-L3980)
---Source: [luatex-nodes.tex#L1097-L1107](https://github.com/TeX-Live/luatex/blob/e1cb50f34dc1451c9c5319dc953305b52a7a96fd/manual/luatex-nodes.tex#L1097-L1107)
---
---@class PdfColorstackWhatsitNode: WhatsitNode
---@field stack integer # The colorstack id number.
---@field command integer # The command to execute. ⟨stack action⟩ → set (0) | push (1) | pop (2) | current (3) [texnodes.c#L3523-L3545](https://github.com/TeX-Live/luatex/blob/6472bd794fea67de09f01e1a89e9b12141be7474/source/texk/web2c/luatexdir/tex/texnodes.c#L3523-L3545)
---@field data string # General text that is placed on top of the stack, for example `1 0 0 rg 1 0 0 RG`. `rg` only colors filled outlines while the stroke color is set with `RG`. From the [PDF Reference, fourth edition](https://opensource.adobe.com/dc-acrobat-sdk-docs/pdfstandards/pdfreference1.5_v6.pdf), 4.5.7 Color Operators Page 251: `gray G`: Set the stroking color space to DeviceGray. `gray` is a number between 0.0 (black) and 1.0 (white). `gray g`: Same as `G`, but for nonstroking operations. `r g b RG`: Set the stroking color space to DeviceRGB. Each operand must be a number between 0.0 (minimum intensity) and 1.0 (maximum intensity). `r g b rg`: same as `RG`, but for nonstroking operations. `c m y k K`: Set the stroking color space to DeviceCMYK. Each operand must be a number between 0.0 (zero concentration) and 1.0 (maximum concentration). `c m y k k`: Same as `K`, but for nonstroking operations.

node.__t.__whatsit.pdf_setmatrix = 29

node.__t.__whatsit.pdf_save = 30

node.__t.__whatsit.pdf_restore = 31

node.__t.__whatsit.pdf_link_state = 32

node.__t.__whatsit.pdf_link_data = 27

node.__t.unset = 15
node.__t.align_record = 30
node.__t.pseudo_file = 31
node.__t.pseudo_line = 32
node.__t.page_insert = 33
node.__t.split_insert = 34
node.__t.expr_stack = 35
node.__t.nested_list = 36
node.__t.span = 37
node.__t.attribute = 38
node.__t.attribute_list = 40
node.__t.temp = 41
node.__t.align_stack = 42
node.__t.movement_stack = 43
node.__t.if_stack = 44
node.__t.unhyphenated = 45
node.__t.hyphenated = 46
node.__t.delta = 47
node.__t.passive = 48
node.__t.shape = 49

---
---This function returns a number (the internal index of the node) if the argument is a userdata
---object of type <node> and false when no node is passed.
------
---Source: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1199-L1211)
---
---@param item any
---
---@return boolean|integer t
function node.is_node(item) end

---
---This function returns an array that maps node id numbers to node type strings, providing an
---overview of the possible top-level `id` types.
------
---Source: [luatex-nodes.tex#L1218-L1224](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1218-L1224)
---
---@return table
function node.types() end

---
---TEX’s ‘whatsits’ all have the same id. The various subtypes are defined by their subtype fields.
---The function is much like types, except that it provides an array of subtype mappings.
------
---Source: [luatex-nodes.tex#L1226-L1233](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1226-L1233)
---
---@return table
function node.whatsits() end

---
---This converts a single type name to its internal numeric representation.
------
---Source: [luatex-nodes.tex#L1235-L1244](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1235-L1244)
---
---@param type NodeType
---
---@return integer
function node.id(type) end

---
---The `new` function creates a new node. All its fields are initialized to
---either zero or `nil` except for `id` and `subtype`. Instead of
---numbers you can also use strings (names). If you create a new `whatsit` node
---the second argument is required. As with all node functions, this function
---creates a node at the *TeX* level.
------
---Source: [luatex-nodes.tex#L1299-L1314](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1299-L1314)
---
---@param id integer|NodeType
---@param subtype? integer|string
---
---@return Node
function node.new(id, subtype) end

---
---This function calculates the natural in-line dimensions of the end of the node list starting
---at node `n`. The return values are scaled points.
---
---You need to keep in mind that this is one of the few places in *TeX* where floats
---are used, which means that you can get small differences in rounding when you
---compare the width reported by `hpack` with `dimensions`.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1490-L1546)
---
---@param n Node
---@param dir? DirectionSpecifier
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.dimensions(n, dir) end

---This function calculates the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1490-L1546)
---
---@param n Node
---@param t Node # terminating node
---@param dir? DirectionSpecifier
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.dimensions(n, t, dir) end

---
---This function calculates the natural in-line dimensions of the end of the node list starting
---at node `n`.
---
---This is an
---alternative format that starts with glue parameters as the first three arguments.
---
---This calling method takes glue settings into account and is especially useful for
---finding the actual width of a sublist of nodes that are already boxed, for
---example in code like this, which prints the width of the space in between the
---`a` and `b` as it would be if `\box0` was used as-is:
---
---```
---\setbox0 = \hbox to 20pt {a b}
---
---\directlua{print (node.dimensions(
---    tex.box[0].glue_set,
---    tex.box[0].glue_sign,
---    tex.box[0].glue_order,
---    tex.box[0].head.next,
---    node.tail(tex.box[0].head)
---)) }
---```
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1490-L1546)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param n Node
---@param dir? DirectionSpecifier
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.dimensions(glue_set, glue_sign, glue_order, n, dir) end

---This function calculates the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---This is an
---alternative format that starts with glue parameters as the first three arguments.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1490-L1546)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param n Node
---@param t Node # terminating node
---@param dir? DirectionSpecifier
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.dimensions(glue_set, glue_sign, glue_order, n, t, dir) end

---
---This function removes the node `current` from the list following `head`. It is your responsibility to make sure it is really part of that list.
---The return values are the new `head` and `current` nodes. The
---returned `current` is the node following the `current` in the calling
---argument, and is only passed back as a convenience (or `nil`, if there is
---no such node). The returned `head` is more important, because if the
---function is called with `current` equal to `head`, it will be
---changed.
------
---Source: [luatex-nodes.tex#L1775-L1791](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1775-L1791)
---
---@param head Node
---@param current Node
---
---@return Node head
---@return Node current
function node.remove(head, current) end

---
---This function inserts the node `new` before `current` into the list
---following `head`. It is your responsibility to make sure that `current` is really part of that list. The return values are the (potentially
---mutated) `head` and the node `new`, set up to be part of the list
---(with correct `next` field). If `head` is initially `nil`, it
---will become `new`.
------
---Source: [luatex-nodes.tex#L1793-L1807](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1793-L1807)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
function node.insert_before(head, current, new) end

---
---This function inserts the node `new` after `current` into the list
---following `head`. It is your responsibility to make sure that `current` is really part of that list. The return values are the `head` and
---the node `new`, set up to be part of the list (with correct `next`
---field). If `head` is initially `nil`, it will become `new`.
------
---Source: [luatex-nodes.tex#L1809-L1822](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1809-L1822)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
function node.insert_after(head, current, new) end

---
---This function that will append a node list to *TeX*'s “current list”. The
---node list is not deep-copied! There is no error checking either! You mignt need
---to enforce horizontal mode in order for this to work as expected.
------
---Source: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L2518-L2521), [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1913-L1923)
---
---@param n Node
function node.write(n) end

---
---Each node also can have a properties table and you can get properties using the `getproperty` function.
------
---Source: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L2518-L2521), [lnodelib.c#L8373-L8383](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/luatexdir/lua/lnodelib.c#L8373-L8383)
---
---@param node Node
---
---@return any value
function node.getproperty(node) end

---
---Each node also can have a properties table and you can assign values to this table using the
---`setproperty` function
------
---Source: [lnodelib.c#L8397-L8410](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/luatexdir/lua/lnodelib.c#L8397-L8410)
---
---@param node Node
---@param value any
function node.setproperty(node, value) end
