---@meta
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

---
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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
node = {}

---
---Deep down in TEX a node has a number which is a numeric entry in a memory table. In fact, this
---model, where TEX manages memory is real fast and one of the reasons why plugging in callbacks
---that operate on nodes is quite fast too. Each node gets a number that is in fact an index in the
---memory table and that number often is reported when you print node related information. You
---go from userdata nodes and there numeric references and back with:
---
---```
---<integer> d = node.todirect(<node> n)
---<node> n = node.tonode(<integer> d)
---```
---
---The userdata model is rather robust as it is a virtual interface with some additional checking
---while the more direct access which uses the node numbers directly. However, even with userdata
---you can get into troubles when you free nodes that are no longer allocated or mess up lists. if
---you apply tostring to a node you see its internal (direct) number and id.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
node.direct = {}

---
---*LuaTeX* only understands 4 of the 16 direction specifiers of aleph: `TLT` (latin), `TRT` (arabic), `RTT` (cjk), `LTL` (mongolian). All other direction specifiers generate an error. In addition to a keyword driven model we also provide an integer driven one.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias DirectionSpecifier
---| "TLT" # latin
---| "TRT" # arabic
---| "RTT" # cjk
---| "LTL" # mongolian

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias NodeTypeName
---| 'hlist' # 0
---| 'vlist' # 1
---| 'rule' # 2
---| 'ins' # 3
---| 'mark' # 4
---| 'adjust' # 5
---| 'boundary' # 6
---| 'disc' # 7
---| 'whatsit' # 8
---| 'local_par' # 9
---| 'dir' # 10
---| 'math' # 11
---| 'glue' # 12
---| 'kern' # 13
---| 'penalty' # 14
---| 'unset' # 15
---| 'style' # 16
---| 'choice' # 17
---| 'noad' # 18
---| 'radical' # 19
---| 'fraction' # 20
---| 'accent' # 21
---| 'fence' # 22
---| 'math_char' # 23
---| 'sub_box' # 24
---| 'sub_mlist' # 25
---| 'math_text_char' # 26
---| 'delim' # 27
---| 'margin_kern' # 28
---| 'glyph' # 29
---| 'align_record' # 30
---| 'pseudo_file' # 31
---| 'pseudo_line' # 32
---| 'page_insert' # 33
---| 'split_insert' # 34
---| 'expr_stack' # 35
---| 'nested_list' # 36
---| 'span' # 37
---| 'attribute' # 38
---| 'glue_spec' # 39
---| 'attribute_list' # 40
---| 'temp' # 41
---| 'align_stack' # 42
---| 'movement_stack' # 43
---| 'if_stack' # 44
---| 'unhyphenated' # 45
---| 'hyphenated' # 46
---| 'delta' # 47
---| 'passive' # 48
---| 'shape' # 49

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias NodeTypeId
---| 0  # hlist
---| 1  # vlist
---| 2  # rule
---| 3  # ins
---| 4  # mark
---| 5  # adjust
---| 6  # boundary
---| 7  # disc
---| 8  # whatsit
---| 9  # local_par
---| 10 # dir
---| 11 # math
---| 12 # glue
---| 13 # kern
---| 14 # penalty
---| 15 # unset
---| 16 # style
---| 17 # choice
---| 18 # noad
---| 19 # radical
---| 20 # fraction
---| 21 # accent
---| 22 # fence
---| 23 # math_char
---| 24 # sub_box
---| 25 # sub_mlist
---| 26 # math_text_char
---| 27 # delim
---| 28 # margin_kern
---| 29 # glyph
---| 30 # align_record
---| 31 # pseudo_file
---| 32 # pseudo_line
---| 33 # page_insert
---| 34 # split_insert
---| 35 # expr_stack
---| 36 # nested_list
---| 37 # span
---| 38 # attribute
---| 39 # glue_spec
---| 40 # attribute_list
---| 41 # temp
---| 42 # align_stack
---| 43 # movement_stack
---| 44 # if_stack
---| 45 # unhyphenated
---| 46 # hyphenated
---| 47 # delta
---| 48 # passive
---| 49 # shape

---
---A number in the range `[0,4]` indicating the glue order.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlueOrder 0|1|2|3|4

---
---The calculated glue ratio.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlueSet number

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlueSign
---|0 # `normal`,
---|1 # `stretching`,
---|2 # `shrinking`

_N.Node = true

---
---A node that comprise actual typesetting commands. A few fields are
---present in all nodes regardless of their type, these are:
---
--- __Reference:__
---
---* Source code of the `LuaTeX` manual:  [luatex-nodes.tex#L49-L76](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L49-L76)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil # That prev field is always present, but only initialized on explicit request: when the function `node.slide()` is called, it will set up the `prev` fields to be a backwards pointer in the argument node list. By now most of *TeX*'s node processing makes sure that the `prev` nodes are valid but there can be exceptions, especially when the internal magic uses a leading `temp` nodes to temporarily store a state.
---@field id integer # the node’s type (id) number
---@field subtype integer # the node subtype identifier. The `subtype` is sometimes just a dummy entry because not all nodes actually use the `subtype`, but this way you can be sure that all nodes accept it as a valid field name, and that is often handy in node list traversal.
---@field head? Node
---@field attr Node # list of attributes. almost all nodes also have an `attr` field

_N.hlist = 0

---
---* Corresponding C source code: [texnodes.c#L633-L661](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L633-L661)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---* Corresponding C source code: [texnodes.c#L841-L851](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L841-L851)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class ListNode: Node
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

---
---A warning: never assign a node list to the `head` field unless you are sure
---its internal link structure is correct, otherwise an error may result.
---
---Note: the field name `head` and `list` are both valid. Sometimes it
---makes more sense to refer to a list by `head`, sometimes `list` makes
---more sense.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L78-L108](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L78-L108)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class HlistNode: ListNode
---@field subtype HlistNodeSubtype

_N.vlist = 1

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias VlistNodeSubtype
---|0 # unknown
---|4 # alignment
---|5 # cell

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class VlistNode: ListNode
---@field subtype VlistNodeSubtype

_N.rule = 2

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L119-L157](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L119-L157)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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

_N.ins = 3

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class InsNode: Node
---@field subtype number # the insertion class
---@field attr Node # list of attributes
---@field cost number # the penalty associated with this insert
---@field height number # height of the insert
---@field depth number # depth of the insert
---@field head Node # the first node of the body of this insert
---@field list Node # the first node of the body of this insert

_N.mark = 4

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MarkNode: Node
---@field subtype number # unused
---@field attr Node # list of attributes
---@field class number # the mark class
---@field mark table # a table representing a token list

_N.adjust = 5

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias AdjustNodeSubtype
---|0 # normal
---|1 # pre

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AdjustNode: Node
---@field subtype AdjustNodeSubtype
---@field attr Node # list of attributes
---@field head Node # adjusted material
---@field list Node # adjusted material

_N.disc = 7

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias DiscNodeSubtype
---|0 # discretionary
---|1 # explicit
---|2 # automatic
---|3 # regular
---|4 # first
---|5 # second

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class DiscNode: Node
---@field subtype DiscNodeSubtype
---@field attr Node # list of attributes
---@field pre Node # pointer to the pre-break text
---@field post Node # pointer to the post-break text
---@field replace Node # pointer to the no-break text
---@field penalty number # the penalty associated with the break, normally `hyphenpenalty` or `exhyphenpenalty`

_N.math = 11

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MathNodeSubtype
---|0 # beginmath
---|1 # endmath

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MathNode: Node
---@field subtype MathNodeSubtype
---@field attr Node # list of attributes
---@field surround number # width of the `mathsurround` kern

_N.glue_spec = 39

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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class GlueSpecNode: Node
---@field width          integer # the horizontal or vertical displacement
---@field stretch        integer # extra (positive) displacement or stretch amount
---@field stretch_order  integer # factor applied to stretch amount
---@field shrink         integer # extra (negative) displacement or shrink amount
---@field shrink_order   integer # factor applied to shrink amount

_N.glue = 12

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class GlueNode: Node
---@field subtype GlueNodeSubtype
---@field leader Node # pointer to a box or rule for leaders
---@field width integer # the horizontal or vertical displacement
---@field stretch integer # extra (positive) displacement or stretch amount
---@field stretch_order integer # factor applied to stretch amount
---@field shrink integer # extra (negative) displacement or shrink amount
---@field shrink_order integer # factor applied to shrink amount

---
---Return the
---effective width of a glue node.
---
---* Corresponding C source code: [lnodelib.c#L8473-L8503](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8473-L8503)
---
---@param glue Node
---@param parent HlistNode|VlistNode
---@param round? boolean # When you pass true as third argument the value will be rounded.
---
---@return number|integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.effective_glue(glue, parent, round) end

---
---Return the
---effective width of a glue node.
---
---* Corresponding C source code: [lnodelib.c#L8505-L8533](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8505-L8533)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param parent HlistNode|VlistNode
---@param round? boolean # When you pass true as third argument the value will be rounded.
---
---@return number|integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.effective_glue(d, parent, round) end

_N.kern = 13

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias KernNodeSubtype
---|0 # fontkern
---|1 # userkern
---|2 # accentkern
---|3 # italiccorrection

---
---The `kern` command creates such nodes but for instance the font and math
---machinery can also add them.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class KernNode: Node
---@field subtype KernNodeSubtype
---@field kern integer # Fixed horizontal or vertical advance (in scaled points)

_N.penalty = 14

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PenaltyNode: Node
---@field subtype PenaltyNodeSubtype
---@field attr Node # list of attributes
---@field penalty number # the penalty value

_N.glyph = 29

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias GlyphNodeSubtype
---|1 # ligature
---|2 # ghost
---|3 # left
---|4 # right

---
---* Corresponding C source code: [texnodes.c#L801-L816](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L801-L816)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class GlyphNode: Node
---@field subtype GlyphNodeSubtype # A bit field
---@field attr Node # A list of attributes
---@field char number # The character index in the font
---@field font number # The font identifier
---@field lang number # The language identifier
---@field left number # The frozen `\lefthyphenmnin` value
---@field right number # The frozen `\righthyphenmnin` value
---@field uchyph boolean # The frozen `uchyph` value
---@field components Node # A Pointer to ligature components
---@field xoffset number # A virtual displacement in horizontal direction
---@field yoffset number # A virtual displacement in vertical direction
---@field width number # The (original) width of the character
---@field height number # The (original) height of the character
---@field depth number # The (original) depth of the character
---@field expansion_factor number # The to be applied expansion factor
---@field data number # A general purpose field for users (we had room for it)

---
---Return `true` when a glyph or disc node references that font.
---
---* Corresponding C source code: [lnodelib.c#L7639-L7655](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7639-L7655)
---
---@param n Node
---@param font integer
---
---@return boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.uses_font(n, font) end

---
---Return `true` when a glyph or disc node references that font.
---
---* Corresponding C source code: [lnodelib.c#L7621-L7637](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7621-L7637)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param font integer
---
---@return boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.uses_font(d, font) end

_N.boundary = 6

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias BoundaryNodeSubtype
---|0 # cancel
---|1 # user
---|2 # protrusion
---|3 # word

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class BoundaryNode: Node
---@field subtype BoundaryNodeSubtype
---@field attr Node # list of attributes
---@field value number # values 0--255 are reserved

_N.local_par = 9

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class LocalParNode: Node
---@field attr Node # list of attributes
---@field pen_inter number # local interline penalty (from `localinterlinepenalty`)
---@field pen_broken number # local broken penalty (from `localbrokenpenalty`)
---@field dir string # the direction of this par. see \in [dirnodes]
---@field box_left Node # the `localleftbox`
---@field box_left_width number # width of the `localleftbox`
---@field box_right Node # the `localrightbox`
---@field box_right_width number # width of the `localrightbox`

_N.dir = 10

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class DirNode: Node
---@field attr Node # list of attributes
---@field dir string # the direction (but see below)
---@field level number # nesting level of this direction whatsit

_N.margin_kern = 28

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias MarginKernNodeSubtype
---|0 # left
---|1 # right

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MarginKernNode: Node
---@field subtype number # \showsubtypes{marginkern}
---@field attr Node # list of attributes
---@field width number # the advance of the kern
---@field glyph Node # the glyph to be used

_N.math_char = 23

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MathCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.math_text_char = 26

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MathTextCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.sub_box = 24

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class SubBoxNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.sub_mlist = 25

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class SubMlistNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.delim = 27

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class DelimNode: Node
---@field attr Node # list of attributes
---@field small_char number # character index of base character
---@field small_fam number # family number of base character
---@field large_char number # character index of next larger character
---@field large_fam number # family number of next larger character

_N.noad = 18

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
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

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class NoadNode: Node
---@field subtype NoadNodeSubtype
---@field attr Node # list of attributes
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field options number # bitset of rendering options

_N.accent = 21

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias AccentNodeSubtype
---|0 # bothflexible
---|1 # fixedtop
---|2 # fixedbottom
---|3 # fixedboth

---
---* Corresponding C source code: [texnodes.c#L714-L723](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L714-L723)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AccentNode: Node
---@field attr Node # list of attributes
---@field subtype AccentNodeSubtype
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field accent Node # top accent
---@field bot_accent Node # bottom accent
---@field top_accent Node # top_accent
---@field overlay_accent Node # overlay_accent
---@field fraction number # larger step criterium (divided by 1000)

_N.style = 16

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class StyleNode: Node
---@field style string # contains the style

_N.choice = 17

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class ChoiceNode: Node
---@field attr Node # list of attributes
---@field display Node # list of display size alternatives
---@field text Node # list of text size alternatives
---@field script Node # list of scriptsize alternatives
---@field scriptscript Node # list of scriptscriptsize alternatives

_N.radical = 19

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias RadicalNodeSubtype
---|0 # radical
---|1 # uradical
---|2 # uroot
---|3 # uunderdelimiter
---|4 # uoverdelimiter
---|5 # udelimiterunder
---|6 # udelimiterover

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class RadicalNode: Node
---@field subtype RadicalNodeSubtype
---@field attr Node # list of attributes
---@field nucleus KernNode # base
---@field sub KernNode # subscript
---@field sup KernNode # superscript
---@field left DelimNode
---@field degree KernNode # only set by `Uroot`
---@field width number # required width
---@field options number # bitset of rendering options

_N.fraction = 20

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FractionNode: Node

_N.fence = 22

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias FenceNodeSubtype
---|0 # unset
---|1 # left
---|2 # middle
---|3 # right
---|4 # no

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class FenceNode: Node

_N.whatsit = 8

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias WhatsitTypeId
---| 0  # open
---| 1  # write
---| 2  # close
---| 3  # special
---| 6  # save_pos
---| 7  # late_lua
---| 8  # user_defined
---| 16 # pdf_literal
---| 17 # pdf_refobj
---| 18 # pdf_annot
---| 19 # pdf_start_link
---| 20 # pdf_end_link
---| 21 # pdf_dest
---| 22 # pdf_action
---| 23 # pdf_thread
---| 24 # pdf_start_thread
---| 25 # pdf_end_thread
---| 26 # pdf_thread_data
---| 27 # pdf_link_data
---| 28 # pdf_colorstack
---| 29 # pdf_setmatrix
---| 30 # pdf_save
---| 31 # pdf_restore
---| 32 # pdf_link_state

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias WhatsitTypeName
---| 'open' # 0
---| 'write' # 1
---| 'close' # 2
---| 'special' # 3
---| 'save_pos' # 6
---| 'late_lua' # 7
---| 'user_defined' # 8
---| 'pdf_literal' # 16
---| 'pdf_refobj' # 17
---| 'pdf_annot' # 18
---| 'pdf_start_link' # 19
---| 'pdf_end_link' # 20
---| 'pdf_dest' # 21
---| 'pdf_action' # 22
---| 'pdf_thread' # 23
---| 'pdf_start_thread' # 24
---| 'pdf_end_thread' # 25
---| 'pdf_thread_data' # 26
---| 'pdf_link_data' # 27
---| 'pdf_colorstack' # 28
---| 'pdf_setmatrix' # 29
---| 'pdf_save' # 30
---| 'pdf_restore' # 31
---| 'pdf_link_state' # 32

_N._whatsit = {}

---
---Whatsit nodes come in many subtypes that you can ask for them by running
---`node.whatsits`.
---
---Some of them are generic and independent of the output mode and others are
---specific to the chosen backend: *DVI* or \PDF. Here we discuss the generic
---font-end nodes nodes.
---
---Source: [luatex-nodes.tex#L781-L797](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L781-L797)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class WhatsitNode: Node

_N._whatsit.open = 0

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class OpenWhatsitNode: Node
---@field attr Node # list of attributes
---@field stream integer # *TeX*'s stream id number
---@field name string # file name
---@field ext string # file extension
---@field area string # file area (this may become obsolete)

_N._whatsit.write = 1

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class WriteWhatsitNode: Node
---@field attr Node # list of attributes
---@field stream number # *TeX*'s stream id number
---@field data table # a table representing the token list to be written

_N._whatsit.close = 2

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class CloseWhatsitNode: Node
---@field attr Node # list of attributes
---@field stream number # *TeX*'s stream id number

_N._whatsit.user_defined = 8

---
---User-defined whatsit nodes can only be created and handled from *Lua* code. In
---effect, they are an extension to the extension mechanism. The *LuaTeX* engine
---will simply step over such whatsits without ever looking at the contents.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L833-L864](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L833-L864)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class UserDefinedWhatsitNode: WhatsitNode
---@field user_id number # id number
---@field type 97|100|108|110|115|116 # The `type` can have one of six distinct values. The number is the ASCII value if the first character of the type name (so you can use string.byte("l") instead of `108`): 97 “a” list of attributes (a node list), 100 “d” a *Lua* number, 108 “l” a *Lua* value (table, number, boolean, etc), 110 “n” a node list, 115 “s” a *Lua* string, 116 “t” a *Lua* token list in *Lua* table form (a list of triplets).
---@field value number|Node|string|table

_N._whatsit.save_pos = 6

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class SavePosWhatsitNode: WhatsitNode
---@field attr Node # list of attributes

_N._whatsit.late_lua = 7

---
---The difference between `data` and `string` is that on assignment, the
---`data` field is converted to a token list, cf. use as `latelua`. The
---`string` version is treated as a literal string.
---
---When a function is used, it gets called with as first argument the node that triggers
---the call.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class LateLuaWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field data string # or function  the to be written information stored as *Lua* value
---@field token string # the to be written information stored as token list
---@field name string # the name to use for *Lua* error reporting

_N._whatsit.special = 3

---
---There is only one DVI backend whatsit, and it just flushes its content to the
---output file.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class SpecialWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field data string # the `special` information

_N._whatsit.pdf_literal = 16

---
---* Corresponding C source code: [texnodes.c#L1082-L1088](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1082-L1088)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PdfLiteralModes
---|0 `origin`
---|1 `page`
---|2 `direct`
---|3 `raw`
---|4 `text`
---|5 `font`
---|6 `special`

---
---The higher the number, the less checking and the more you can run into trouble.
---Especially the `raw` variant can produce bad *PDF* so you can best check
---what you generate.
---
---* Corresponding C source code: [texnodes.c#L1148-L1151](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1148-L1151)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfLiteralWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field mode PdfLiteralModes # the “mode” setting of this literal
---@field data string # the to be written information stored as *Lua* string
---@field token string # the to be written information stored as token list

_N._whatsit.pdf_refobj = 17

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfRefobjWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field objnum number # the referenced *PDF* object number

_N._whatsit.pdf_annot = 18

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfAnnotWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field objnum number # the referenced *PDF* object number
---@field data string # the annotation data

_N._whatsit.pdf_start_link = 19

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfStartLinkWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field objnum number # the referenced *PDF* object number
---@field link_attr table # the link attribute token list
---@field action Node # the action to perform

_N._whatsit.pdf_end_link = 20

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfEndLinkWhatsitNode: WhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_dest = 21

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfDestWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is the `dest_id` a string value?
---@field dest_id number # the destination id string the destination name
---@field dest_type number # type of destination
---@field xyz_zoom number # the zoom factor (times 1000)
---@field objnum number # the *PDF* object number; for structure references the *PDF* object number of the linked structure element

_N._whatsit.pdf_action = 22
_N._8_6_7_pdf_action = 142

---
---* Corresponding C source code: [texnodes.c#L1090-L1093](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1090-L1093)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PdfActionTypes
---|0 'page'
---|1 'goto'
---|2 'thread'
---|3 'user'

---
---* Corresponding C source code: [texnodes.c#L1095-L1097](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1095-L1097)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@alias PdfWindowTypes
---|0 'notset'
---|1 'new'
---|2 'nonew'

---
---* Corresponding C source code: [texnodes.c#L1104-L1111](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1104-L1111)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfActionWhatsitNode: WhatsitNode
---@field action_type PdfActionTypes # the kind of action involved
---@field named_id number # are `dest_id` and `struct_id` string values?
---@field action_id number|string # token list reference or string
---@field file string # the target filename
---@field new_window PdfWindowTypes # the window state of the target
---@field struct_id nil|number|string # `nil`: the action does not reference a structure; `number`: id of the referenced structure; `string`: name of the referenced structure destination
---@field data string # the name of the destination

_N._whatsit.pdf_thread = 23

---
------* Corresponding C source code: [texnodes.c#L1185-L1192](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1185-L1192)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfThreadWhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is `tread_id` a string value?
---@field tread_id number # the thread id  string  the thread name
---@field thread_attr number # extra thread information

_N._whatsit.pdf_start_thread = 24

---
---* Corresponding C source code: [texnodes.c#L1176-L1183](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1176-L1183)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfStartThreadWhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is `tread_id` a string value?
---@field tread_id number # the thread id  string  the thread name
---@field thread_attr number # extra thread information

_N._whatsit.pdf_end_thread = 25

---
---* Corresponding C source code: [texnodes.c#L1145-L1146](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/tex/texnodes.c#L1145-L1146)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfEndThreadWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_colorstack = 28

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
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [pdftex-t.tex#L3954-L3980](https://github.com/tex-mirror/pdftex/blob/6fb2352aa70a23ad3830f1434613170be3f3cd74/doc/manual/pdftex-t.tex#L3954-L3980)
---Source: [luatex-nodes.tex#L1097-L1107](https://github.com/TeX-Live/luatex/blob/e1cb50f34dc1451c9c5319dc953305b52a7a96fd/manual/luatex-nodes.tex#L1097-L1107)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfColorstackWhatsitNode: WhatsitNode
---@field stack integer # The colorstack id number.
---@field command integer # The command to execute. ⟨stack action⟩ → set (0) | push (1) | pop (2) | current (3) [texnodes.c#L3523-L3545](https://github.com/TeX-Live/luatex/blob/6472bd794fea67de09f01e1a89e9b12141be7474/source/texk/web2c/luatexdir/tex/texnodes.c#L3523-L3545)
---@field data string # General text that is placed on top of the stack, for example `1 0 0 rg 1 0 0 RG`. `rg` only colors filled outlines while the stroke color is set with `RG`. From the [PDF Reference, fourth edition](https://opensource.adobe.com/dc-acrobat-sdk-docs/pdfstandards/pdfreference1.5_v6.pdf), 4.5.7 Color Operators Page 251: `gray G`: Set the stroking color space to DeviceGray. `gray` is a number between 0.0 (black) and 1.0 (white). `gray g`: Same as `G`, but for nonstroking operations. `r g b RG`: Set the stroking color space to DeviceRGB. Each operand must be a number between 0.0 (minimum intensity) and 1.0 (maximum intensity). `r g b rg`: same as `RG`, but for nonstroking operations. `c m y k K`: Set the stroking color space to DeviceCMYK. Each operand must be a number between 0.0 (zero concentration) and 1.0 (maximum concentration). `c m y k k`: Same as `K`, but for nonstroking operations.

_N._whatsit.pdf_setmatrix = 29

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfSetmatrixWhatsitNode
---@field attr Node # list of attributes
---@field data string # data

_N._whatsit.pdf_save = 30

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfSaveWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_restore = 31

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PdfRestoreWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_thread_data = 26

_N._whatsit.pdf_link_data = 27

_N._whatsit.pdf_link_state = 32

_N.unset = 15

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class UnsetNode: Node

_N.align_record = 30

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AlignRecordNode: Node

_N.pseudo_file = 31

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PseudoFileNode: Node

_N.pseudo_line = 32

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PseudoLineNode: Node

_N.page_insert = 33

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PageInsertNode: Node

_N.split_insert = 34

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Split_InsertNode: Node

_N.expr_stack = 35

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class ExprStackNode: Node

_N.nested_list = 36

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class Nested_ListNode: Node

_N.span = 37

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class SpanNode: Node

_N.attribute = 38

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AttributeNode: Node

_N.attribute_list = 40

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AttributeListNode: Node

_N.temp = 41

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class TempNode: Node

_N.align_stack = 42

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class AlignStackNode: Node

_N.movement_stack = 43

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class MovementStackNode: Node

_N.if_stack = 44

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class IfStackNode: Node

_N.unhyphenated = 45

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class UnhyphenatedNode: Node

_N.hyphenated = 46

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class HyphenatedNode: Node

_N.delta = 47

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class DeltaNode: Node

_N.passive = 48

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class PassiveNode: Node

_N.shape = 49

---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
---@class ShapeNode: Node

_N._7_2_is_node = 145

---
---Return a number (the internal index of the node) if the argument is a userdata
---object of type `node` and `false` when no node is passed.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1199-L1211)
---* Corresponding C source code: [lnodelib.c#L8295-L8303](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8295-L8303)
---
---@param item any
---
---@return false|integer t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.is_node(item) end

---
---Return a number (the internal index of the node) if the argument is a userdata
---object of type `node` and `false` when no node is passed.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8326-L8343](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8326-L8343)
---
---@param item any
---
---@return false|integer t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.is_node(item) end

_N._7_3_types_whatsits = 145

---
---Return a table that maps node id numbers to node type strings, providing an
---overview of the possible top-level `id` types.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1218-L1224](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1218-L1224)
---* Corresponding C source code: [lnodelib.c#L3066-L3069](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3066-L3069)
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.types() end

---
---Provides a table of subtype mappings.
---
---TEX’s ‘whatsits’ all have the same id. The various subtypes are defined by their subtype fields.

---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1226-L1233](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1226-L1233)
---* Corresponding C source code: [lnodelib.c#L3073-L3076](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3073-L3076)
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.whatsits() end

_N._7_4_id = 145

---
---Convert a single type name to its internal numeric representation.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1235-L1244](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1235-L1244)
---* Corresponding C source code: [lnodelib.c#L470-L483](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L470-L483)
---
---@param type NodeTypeName
---
---@return NodeTypeId
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.id(type) end

_N._7_5_type_subtype = 145

---
---Convert an internal numeric node type representation to an external
---node type string.
---
---If the argument is a number, then the type function converts an
---internal numeric representation to an external string representation.
---Otherwise, it will return the string `node` if the object
---represents a node, and `nil` otherwise.
---
---```lua
---node.type(29) -- glyph
---node.type(node.new("glyph")) -- node
---node.type('xxx') -- nil
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1993-L2009](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1993-L2009)
---
---@param n NodeTypeId # The numeric node type id.
---
---@return NodeTypeName|'node'|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.type(n) end

---
---Convert a single `whatsit` name to its internal numeric representation (subtype).
---
---```lua
---node.subtype('pdf_literal') -- 16
---node.subtype('xxx') -- nil
---```
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1976-L1989](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1976-L1989)
---
---@param whatsit_type_name WhatsitTypeName
---
---@return WhatsitTypeId whatsit_type_id
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.subtype(whatsit_type_name) end

_N._7_6_fields = 146

---
---Return an array of valid field names for a particular type of
---node.
---
---If you want to get the valid fields for a “whatsit”, you have to
---supply the second argument also. In other cases, any given second argument will
---be silently ignored.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3080-L3115](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3080-L3115)
---
---@param id NodeTypeId
---@param subtype? number
---
---@return {[number]: string}
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.fields(id, subtype) end

_N._7_7_has_field = 146

---
---Return a boolean that is only `true` if `n` is actually a node, and it has the field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2993-L3000](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2993-L3000)
---
---@param n Node
---@param field string
---
---@return boolean t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.has_field(n, field) end

---
---Return a boolean that is only `true` if `d` is actually a node, and it has the field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3041-L3049](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3041-L3049)
---
---@param d integer
---@param field string
---
---@return boolean t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.has_field(d, field) end

_N._7_8_new = 146

---
---Create a new node.
---
---All its fields are initialized to
---either zero or `nil` except for `id` and `subtype`. Instead of
---numbers you can also use strings (names). If you create a new `whatsit` node
---the second argument is required. As with all node functions, this function
---creates a node at the *TeX* level.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1299-L1314](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1299-L1314)
---* Corresponding C source code: [lnodelib.c#L2055-L2060](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2055-L2060)
---
---@param id integer|NodeTypeName
---@param subtype? integer|string
---
---@return Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.new(id, subtype) end

---
---Create a new node.
---
---All its fields are initialized to
---either zero or `nil` except for `id` and `subtype`. Instead of
---numbers you can also use strings (names). If you create a new `whatsit` node
---the second argument is required. As with all node functions, this function
---creates a node at the *TeX* level.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1299-L1314](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1299-L1314)
---* Corresponding C source code: [lnodelib.c#L2064-L2069](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2064-L2069)
---
---@param id integer|NodeTypeName
---@param subtype? integer|string
---
---@return integer d
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.new(id, subtype) end

_N._7_9_free_flush_node_list = 146

---
---Free the *TeX* memory allocated for node `n`.
---
---Be careful: no checks are
---done on whether this node is still pointed to from a register or some `next` field: it is up to you to make sure that the internal data structures
---remain correct.
---
---The `free` function returns the next field of the freed node
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2073-L2090](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2073-L2090)
---
---@param n Node
---
---@return Node next
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.free(n) end

---
---Free the *TeX* memory allocated for the specified node.
---
---Be careful: no checks are
---done on whether this node is still pointed to from a register or some `next` field: it is up to you to make sure that the internal data structures
---remain correct.
---
---The `free` function returns the next field of the freed node
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2094-L2109](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2094-L2109)
---
---@param d integer
---
---@return integer next
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.free(d) end

---
---Free the *TeX* memory allocated for the specified node.
---and return nothing.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2113-L2122](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2113-L2122)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.flush_node(n) end

---
---Free the *TeX* memory allocated for the specified node.
---and return nothing.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2126-L2133](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2126-L2133)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.flush_node(d) end

---
---Free the *TeX* memory allocated for a list of nodes.
---
---Be
---careful: no checks are done on whether any of these nodes is still pointed to
---from a register or some `next` field: it is up to you to make sure that the
---internal data structures remain correct.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2137-L2146](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2137-L2146)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.flush_list(n) end

---
---Free the *TeX* memory allocated for a list of nodes.
---
---Be
---careful: no checks are done on whether any of these nodes is still pointed to
---from a register or some `next` field: it is up to you to make sure that the
---internal data structures remain correct.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2150-L2157](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2150-L2157)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.flush_list(d) end

_N._7_10_copy_copy_list = 147

---
---Create a deep copy of node `n`, including all nested lists as in the case
---of a `hlist` or `vlist` node. Only the `next` field is not copied.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2476-L2485](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2476-L2485)
---
---@param n Node
---
---@return Node m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.copy(n) end

---
---Create a deep copy of node `n`, including all nested lists as in the case
---of a `hlist` or `vlist` node. Only the `next` field is not copied.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2489-L2500](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2489-L2500)
---
---@param d integer
---
---@return integer e
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.copy(d) end

---
---Create a deep copy of the node list that starts at node `n`.
---
---If
---`m` is also given, the copy stops just before node `m`.
---
---Note that you cannot copy attribute lists this way. However, there is normally no
---need to copy attribute lists as when you do assignments to the `attr` field
---or make changes to specific attributes, the needed copying and freeing takes
---place automatically.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2440-L2452](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2440-L2452)
---
---@param n Node
---@param m? Node
---
---@return Node m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.copy_list(n, m) end

---
---Create a deep copy of the node list that starts at node `d`.
---
---If
---`e` is also given, the copy stops just before node `e`.
---
---Note that you cannot copy attribute lists this way. However, there is normally no
---need to copy attribute lists as when you do assignments to the `attr` field
---or make changes to specific attributes, the needed copying and freeing takes
---place automatically.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2456-L2472](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2456-L2472)
---
---@param d integer
---@param e? integer
---
---@return integer e
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.copy_list(d, e) end

_N._7_11_prev_next = 147

---
---Return the node preceding the given node, or `nil` if
---there is no such node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L379-L388](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L379-L388)
---
---@param n Node
---
---@return Node|nil m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.prev(n) end

---
---Return the node following the given node, or `nil` if
---there is no such node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L390-L399](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L390-L399)
---
---@param n Node
---
---@return Node|nil m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.next(n) end

_N._7_12_current_attr = 0

---
---Return the currently active list of attributes, if there is one.
---
---The intended usage of `current_attr` is as follows:
---
---```
---local x1 = node.new("glyph")
---x1.attr = node.current_attr()
---local x2 = node.new("glyph")
---x2.attr = node.current_attr()
---```
---
---or:
---
---```
---local x1 = node.new("glyph")
---local x2 = node.new("glyph")
---local ca = node.current_attr()
---x1.attr = ca
---x2.attr = ca
---```
---
---The attribute lists are ref counted and the assignment takes care of incrementing
---the refcount. You cannot expect the value `ca` to be valid any more when
---you assign attributes (using `tex.setattribute`) or when control has been
---passed back to *TeX*.
---
---Note: this function is somewhat experimental, and it returns the *actual*
---attribute list, not a copy thereof. Therefore, changing any of the attributes in
---the list will change these values for all nodes that have the current attribute
---list assigned to them.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6511-L6532](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6511-L6532)
---
---@return Node|nil m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.current_attr() end

---
---Return the currently active list of attributes, if there is one.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6511-L6532](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6511-L6532)
---
---@return integer|nil e
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.current_attr() end

_N._7_13_hpack = 0

---
---Create a new `hlist` by packaging the list that begins at node `n` into a horizontal box.
---
---With only a single argument, this box is created using
---the natural width of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `width` is the
---additional (`\hbox spread`) or exact (`\hbox to`) width to be used.
---The second return value is the badness of the generated box.
---
---Caveat: there can be unexpected side-effects to this function, like updating
---some of the `marks` and `\inserts`. Also note that the content of
---`h` is the original node list `n`: if you call `node.free(h)`
---you will also free the node list itself, unless you explicitly set the `list` field to `nil` beforehand. And in a similar way, calling `node.free(n)` will invalidate `h` as well!
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2576-L2619](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2576-L2619)
---
---@param n Node
---@param width? integer
---@param info? string
---@param dir? string
---
---@return Node n
---@return integer badness
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.hpack(n, width, info, dir) end

---
---Create a new `hlist` by packaging the list that begins at node `d` into a horizontal box.
---
---With only a single argument, this box is created using
---the natural width of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `width` is the
---additional (`\hbox spread`) or exact (`\hbox to`) width to be used.
---The second return value is the badness of the generated box.
---
---Caveat: there can be unexpected side-effects to this function, like updating
---some of the `marks` and `\inserts`. Also note that the content of
---`h` is the original node list `n`: if you call `node.free(h)`
---you will also free the node list itself, unless you explicitly set the `list` field to `nil` beforehand. And in a similar way, calling `node.free(n)` will invalidate `h` as well!
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2576-L2619](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2576-L2619)
---
---@param d integer
---@param width? integer
---@param info? string
---@param dir? string
---
---@return integer d
---@return integer badness
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.hpack(d, width, info, dir) end

_N._7_14_vpack = 0

---
---Create a new `vlist` by packaging the list that begins at node `n` into a vertical box.
---
---With only a single argument, this box is created using
---the natural height of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `w` is the
---
---The second return value is the badness of the generated box. See the description
---of `hpack` for a few memory allocation caveats.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2673-L2716](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2673-L2716)
---
---@param n Node
---@param width? integer
---@param info? string
---@param dir? string
---
---@return Node n
---@return integer badness
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.vpack(n, width, info, dir) end

---
---Create a new `vlist` by packaging the list that begins at node `n` into a vertical box.
---
---With only a single argument, this box is created using
---the natural height of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `w` is the
---
---The second return value is the badness of the generated box. See the description
---of `hpack` for a few memory allocation caveats.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2720-L2763](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2720-L2763)
---
---@param d integer
---@param width? integer
---@param info? string
---@param dir? string
---
---@return integer d
---@return integer badness
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.vpack(d, width, info, dir) end

_N._7_15_prepend_prevdepth = 0

---
---Add the interlinespace to a line keeping the baselineskip and lineskip into
---account.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8763-L8801](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8763-L8801)
---
---@param n Node # vlist or hlist
---@param prevdepth integer
---
---@return integer new_prevdepth
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.prepend_prevdepth(n, prevdepth) end

---
---Add the interlinespace to a line keeping the baselineskip and lineskip into
---account.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8803-L8840](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8803-L8840)
---
---@param d integer
---@param prevdepth integer
---
---@return integer new_prevdepth
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.prepend_prevdepth(d, prevdepth) end

_N._7_16_dimensions_rangedimensions = 149

---
---Calculate the natural in-line dimensions of the end of the node list starting
---at node `n`.
---
---The return values are scaled points.
---
---You need to keep in mind that this is one of the few places in *TeX* where floats
---are used, which means that you can get small differences in rounding when you
---compare the width reported by `hpack` with `dimensions`.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2767-L2812](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2767-L2812)
---
---@param n Node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.dimensions(n, dir) end

---
---Calculate the natural in-line dimensions of the end of the node list starting
---at node `n`.
---
---The return values are scaled points.
---
---You need to keep in mind that this is one of the few places in *TeX* where floats
---are used, which means that you can get small differences in rounding when you
---compare the width reported by `hpack` with `dimensions`.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2838-L2880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2838-L2880)
---
---@param d integer
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.dimensions(d, dir) end

---
---Calculate the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2767-L2812](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2767-L2812)
---
---@param n Node
---@param t Node # terminating node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.dimensions(n, t, dir) end

---
---Calculate the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2838-L2880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2838-L2880)
---
---@param d integer
---@param t integer # terminating node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.dimensions(d, t, dir) end

---
---Calculates the natural in-line dimensions of the end of the node list starting
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
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2838-L2880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2838-L2880)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param n Node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.dimensions(glue_set, glue_sign, glue_order, n, dir) end

---
---Calculates the natural in-line dimensions of the end of the node list starting
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
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2838-L2880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2838-L2880)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param d integer
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.dimensions(glue_set, glue_sign, glue_order, d, dir) end

---
---Calculate the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---This is an
---alternative format that starts with glue parameters as the first three arguments.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2767-L2812](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2767-L2812)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param d integer
---@param t integer # terminating node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.dimensions(glue_set, glue_sign, glue_order, d, t, dir) end

---
---Calculate the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---This is an
---alternative format that starts with glue parameters as the first three arguments.
---
---__Reference:__
---
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---* Corresponding C source code: [lnodelib.c#L2838-L2880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2838-L2880)
---
---@param glue_set integer
---@param glue_sign integer
---@param glue_order integer
---@param n Node
---@param t Node # terminating node
---@param dir? DirectionSpecifier
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.dimensions(glue_set, glue_sign, glue_order, n, t, dir) end

---
---Calculate the natural in-line dimensions of the node list `parent` starting
---at node `first` and terminating just before node `last`.
---
---This functions saves a few lookups in comparison to `node.dimensions()` and can be more convenient in some
---cases.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2814-L2834](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2814-L2834)
---
---@param parent Node
---@param first Node
---@param last? Node
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.rangedimensions(parent, first, last) end

---
---Calculate the natural in-line dimensions of the node list `parent` starting
---at node `first` and terminating just before node `last`.
---
---This functions saves a few lookups in comparison to `node.dimensions()` and can be more convenient in some
---cases.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2882-L2902](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2882-L2902)
---
---@param parent integer
---@param first integer
---@param last? integer
---
---@return integer width # scaled points
---@return integer height # scaled points
---@return integer depth # scaled points
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.rangedimensions(parent, first, last) end

_N._7_17_mlist_to_hlist = 0

---
---Run the internal `mlist` to `hlist` conversion, converting the math list in
---`n` into the horizontal list `h`.
---
---The interface is exactly the same
---as for the callback `mlist_to_hlist`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2906-L2918](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2906-L2918)
---
---@param n Node
---@param display_type string
---@param penalties boolean
---
---@return Node h
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.mlist_to_hlist(n, display_type, penalties) end

_N._7_18_slide = 0

---
---see _N._9_9

_N._7_19_tail = 152

---
---Return the last node of the node list that starts at `n`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3262-L3274](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3262-L3274)
---
---@param n Node
---
---@return Node m
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.tail(n) end

---
---Return the last node of the node list that starts at `d`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3278-L3289](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3278-L3289)
---
---@param d integer
---
---@return integer e
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.tail(d) end

_N._7_20_length_and_count = 0

---
---Return the number of nodes contained in the node list that starts at `n`.
---
---If `m` is also supplied it stops at `m` instead of at the end of the
---list. The node `m` is not counted.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4374-L4386](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4374-L4386)
---
---@param n Node
---@param m? Node
---
---@return integer i
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.length(n, m) end

---
---Return the number of nodes contained in the node list that starts at `d`.
---
---If `e` is also supplied it stops at `e` instead of at the end of the
---list. The node `d` is not counted.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4350-L4360](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4350-L4360)
---
---@param d integer
---@param e? Node
---
---@return integer i
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.length(d, e) end

---
---Return the number of nodes contained in the node list that starts at `n`
---that have a matching `id` field.
---
---If `m` is also supplied, counting
---stops at `m` instead of at the end of the list. The node `m` is not
---counted. This function also accept string `id`’s.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4388-L4401](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4388-L4401)
---
---@param id integer|string
---@param n Node
---@param m? Node
---
---@return integer i
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.count(id, n, m) end

---
---Return the number of nodes contained in the node list that starts at `d`
---that have a matching `id` field.
---
---If `e` is also supplied, counting
---stops at `e` instead of at the end of the list. The node `d` is not
---counted. This function also accept string `id`’s.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4362-L4369](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4362-L4369)
---
---@param id integer|string
---@param d integer
---@param e? Node
---
---@return integer i
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.count(id, d, e) end

_N._7_21_is_char_and_is_glyph = 0

---
---Signal if the glyph is already turned into a character reference
---or not by examining the subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3004-L3024](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3004-L3024)
---
---@param n Node
---@param font? integer
---
---@return boolean|integer|nil
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.is_char(n, font) end

---
---Signal if the glyph is already turned into a character reference
---or not by examining the subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L7572-L7592](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7572-L7592)
---
---@param d integer
---@param font? integer
---
---@return boolean|integer|nil
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.is_char(d, font) end

---
---Signal if the glyph is already turned into a character reference
---or not by examining the subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3026-L3037](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3026-L3037)
---
---@param n Node
---
---@return boolean|integer character
---@return integer font
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.is_glyph(n) end

---
---Signal if the glyph is already turned into a character reference
---or not by examining the subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L7594-L7605](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7594-L7605)
---
---@param n Node
---
---@return boolean|integer character
---@return integer font
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.is_glyph(n) end

_N._7_22_traverse = 0

---
---Return a *Lua* iterator that loops over the node list that starts at `n`.
---
---__Example:__
---
---```lua
---for n in node.traverse(head) do
---   ...
---end
---```
---
---It should be clear from the definition of the function `f` that even though
---it is possible to add or remove nodes from the node list while traversing, you
---have to take great care to make sure all the `next` (and `prev`)
---pointers remain valid.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4156-L4168](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4156-L4168)
---
---@param n Node
---
---@return fun(): t: Node, id: integer, subtype: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.traverse(n) end

---
---Return a *Lua* iterator that loops over the node list that starts at `d`.
---
---__Example:__
---
---```lua
---for d in node.traverse(head) do
---   ...
---end
---```
---
---It should be clear from the definition of the function `f` that even though
---it is possible to add or remove nodes from the node list while traversing, you
---have to take great care to make sure all the `next` (and `prev`)
---pointers remain valid.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3937-L3953](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3937-L3953)
---
---@param d integer
---
---@return fun(): t: integer, id: integer, subtype: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.traverse(d) end

_N._7_23_traverse_id = 0

---
---Return an iterator that loops over all the nodes in the list that starts at
---`n` that have a matching `id` field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4196-L4209](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4196-L4209)
---
---@param id integer
---@param n Node
---
---@return fun(): t: Node, subtype: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.traverse_id(id, n) end

---
---Return an iterator that loops over all the nodes in the list that starts at
---`d` that have a matching `id` field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3980-L3995](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3980-L3995)
---
---@param id integer
---@param d integer
---
---@return fun(): t: integer, subtype: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.traverse_id(id, d) end

_N._7_24_traverse_char_and_traverse_glyph = 0

---
---Loop over the `glyph` nodes in a list.
---
---Only nodes with a subtype less than 256 are seen.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4237-L4249](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4237-L4249)
---
---@param n Node
---
---@return fun(): n: Node, font: integer, char: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.traverse_char(n) end

---
---Loop over the `glyph` nodes in a list.
---
---Only nodes with a subtype less than 256 are seen.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4022-L4038](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4022-L4038)
---
---@param d integer
---
---@return fun(): d: integer, font: integer, char: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.traverse_char(d) end

---
---Loop over a list and return the list and
---filter all glyphs.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4277-L4289](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4277-L4289)
---
---@param n Node
---
---@return fun(): n: Node, font: integer, char: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.traverse_glyph(n) end

---
---Loop over a list and return the list and
---filter all glyphs.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4065-L4081](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4065-L4081)
---
---@param d integer
---
---@return fun(): d: integer, font: integer, char: integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.traverse_glyph(d) end

_N._7_25_traverse_list = 0

---
---Loop over the `hlist` and `vlist` nodes in a list.
---
---The four return values can save some time compared to fetching these fields.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4318-L4330](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4318-L4330)
---
---@param n Node
---
---@return fun(): n: Node, id: integer, subtype: integer, list: Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.traverse_list(n) end

---
---Loop over the `hlist` and `vlist` nodes in a list.
---
---The four return values can save some time compared to fetching these fields.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L4318-L4330](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L4318-L4330)
---
---@param d integer
---
---@return fun(): d: integer, id: integer, subtype: integer, list: Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.traverse_list(d) end

_N._7_26_has_glyph = 0

---
---Return the first `glyph` or `disc` node in the given list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6368-L6382](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6368-L6382)
---
---@param n Node
---
---@return Node|nil n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.has_glyph(n) end

---
---Return the first `glyph` or `disc` node in the given list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6368-L6382](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6368-L6382)
---
---@param d integer
---
---@return integer|nil d
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.has_glyph(d) end

_N._7_27_end_of_math = 0

---
---Look for and return the next `math` node following the start node `n`.
---
---If
---the given node is a math end node this helper returns that node, else it follows
---the list and returns the next math endnote. If no such node is found `nil` is
---returned.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3293-L3313](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3293-L3313)
---
---@param n Node
---
---@return Node|nil t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.end_of_math(n) end

---
---Look for and return the next `math` node following the start node `d`.
---
---If
---the given node is a math end node this helper returns that node, else it follows
---the list and returns the next math endnote. If no such node is found `nil` is
---returned.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3317-L3334](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3317-L3334)
---
---@param d integer
---
---@return integer|nil t
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.end_of_math(d) end

_N._7_28_remove = 153

---
---Remove the node `current` from the list following `head`.
---
---It is your responsibility to make sure it is really part of that list.
---The return values are the new `head` and `current` nodes. The
---returned `current` is the node following the `current` in the calling
---argument, and is only passed back as a convenience (or `nil`, if there is
---no such node). The returned `head` is more important, because if the
---function is called with `current` equal to `head`, it will be
---changed.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1775-L1791](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1775-L1791)
---* Corresponding C source code: [lnodelib.c#L2176-L2215](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2176-L2215)
---
---@param head Node
---@param current Node # A node following the list `head`.
---
---@return Node head # The new `head`
---@return Node|nil current # The node following the `current` in the calling
---argument.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.remove(head, current) end

---
---Remove the node `current` from the list following `head`.
---
---It is your responsibility to make sure it is really part of that list.
---The return values are the new `head` and `current` nodes. The
---returned `current` is the node following the `current` in the calling
---argument, and is only passed back as a convenience (or `nil`, if there is
---no such node). The returned `head` is more important, because if the
---function is called with `current` equal to `head`, it will be
---changed.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1775-L1791](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1775-L1791)
---* Corresponding C source code: [lnodelib.c#L2219-L2267](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2219-L2267)
---
---@param head integer
---@param current integer # A node following the list `head`.
---
---@return integer|nil head # The new `head`
---@return integer|nil current # The node following the `current` in the calling
---argument.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.remove(head, current) end

_N._7_29_insert_before = 153

---
---Insert the node `new` before `current` into the list
---following `head`.
---
---It is your responsibility to make sure that `current` is really part of that list. The return values are the (potentially
---mutated) `head` and the node `new`, set up to be part of the list
---(with correct `next` field). If `head` is initially `nil`, it
---will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1793-L1807](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1793-L1807)
---* Corresponding C source code: [lnodelib.c#L2271-L2315](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2271-L2315)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.insert_before(head, current, new) end

---
---Insert the node `new` before `current` into the list
---following `head`.
---
---It is your responsibility to make sure that `current` is really part of that list. The return values are the (potentially
---mutated) `head` and the node `new`, set up to be part of the list
---(with correct `next` field). If `head` is initially `nil`, it
---will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1793-L1807](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1793-L1807)
---* Corresponding C source code: [lnodelib.c#L2319-L2357](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2319-L2357)
---
---@param head integer
---@param current integer
---@param new integer
---
---@return integer head
---@return integer new
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.insert_before(head, current, new) end

_N._7_30_insert_after = 153

---
---Insert the node `new` after `current` into the list
---following `head`.
---
---It is your responsibility to make sure that `current` is really part of that list. The return values are the `head` and
---the node `new`, set up to be part of the list (with correct `next`
---field). If `head` is initially `nil`, it will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1809-L1822](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1809-L1822)
---* Corresponding C source code: [lnodelib.c#L2361-L2395](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2361-L2395)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.insert_after(head, current, new) end

---
---Insert the node `new` after `current` into the list
---following `head`.
---
---It is your responsibility to make sure that `current` is really part of that list. The return values are the `head` and
---the node `new`, set up to be part of the list (with correct `next`
---field). If `head` is initially `nil`, it will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1809-L1822](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1809-L1822)
---* Corresponding C source code: [lnodelib.c#L2399-L2430](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2399-L2430)
---
---@param head integer
---@param current integer
---@param new integer
---
---@return integer head
---@return integer new
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.insert_after(head, current, new) end

_N._7_31_first_glyph = 154

---
---Return the first node in the list starting at `n` that is a glyph node
---with a subtype indicating it is a glyph, or `nil`.
---
---If `m` is given,
---processing stops at (but including) that node, otherwise processing stops at the
---end of the list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6312-L6337](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6312-L6337)
---
---@param n Node
---@param m? Node
---
---@return Node|nil n
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.first_glyph(n, m) end

---
---Return the first node in the list starting at `d` that is a glyph node
---with a subtype indicating it is a glyph, or `nil`.
---
---If `e` is given,
---processing stops at (but including) that node, otherwise processing stops at the
---end of the list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6341-L6362](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6341-L6362)
---
---@param d integer
---@param e? integer
---
---@return integer|nil d
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.first_glyph(d, e) end

_N._7_32_ligaturing = 154

---
---Apply *TeX*-style ligaturing to the specified nodelist.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5945-L5984](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5945-L5984)
---
---@param head Node
---@param tail? Node
---
---@return Node head # the new head
---@return Node tail # the new tail (both `head` and `tail` can change into a new ligature)
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.ligaturing(head, tail) end

---
---Apply *TeX*-style ligaturing to the specified nodelist.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5986-L6017](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5986-L6017)
---
---@param head integer
---@param tail? integer
---
---@return integer head # the new head
---@return integer tail # the new tail (both `head` and `tail` can change into a new ligature)
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.ligaturing(head, tail) end

_N._7_33_kerning = 154

---
---Apply *TeX*-style kerning to the specified node list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6021-L6060](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6021-L6060)
---
---@param head Node
---@param tail? Node
---
---@return Node head  # the new head (can be an inserted kern node, because special kernings with word boundaries are possible).
---@return Node tail # the new tail (can be an inserted kern node, because special kernings with word boundaries are possible).
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.kerning(head, tail) end

---
---Apply *TeX*-style kerning to the specified node list.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6062-L6097](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6062-L6097)
---
---@param head integer
---@param tail? integer
---
---@return integer head  # the new head (can be an inserted kern node, because special kernings with word boundaries are possible).
---@return integer tail # the new tail (can be an inserted kern node, because special kernings with word boundaries are possible).
---@return boolean success
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.kerning(head, tail) end

_N._7_34_unprotect_glyphs = 155

---
---Convert from `characters` to `glyphs` during node
---processing by subtracting `256` from all glyph node subtypes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6217-L6223](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6217-L6223)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.unprotect_glyph(n) end

---
---Convert from `characters` to `glyphs` during node
---processing by subtracting `256` from the glyph node subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6272-L6278](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6272-L6278)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.unprotect_glyph(d) end

---
---Convert from `characters` to `glyphs` during node
---processing by subtracting `256` from the glyph node subtype.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6243-L6259](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6243-L6259)
---
---@param head Node
---@param tail? Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.unprotect_glyphs(head, tail) end

---
---Convert from `characters` to `glyphs` during node
---processing by subtracting `256` from all glyph node subtypes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6295-L6308](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6295-L6308)
---
---@param head integer
---@param tail? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.unprotect_glyphs(head, tail) end

_N._7_35_protect_glyphs = 155

---
---Add `256` to the `glyph` node subtype
---except that if the value is `1`, add only `255`.
---
---The special handling of `1` means
---that `characters` will become `glyphs` after subtraction of `256`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6209-L6215](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6209-L6215)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.protect_glyph(n) end

---
---Add `256` to the `glyph` node subtype
---except that if the value is `1`, add only `255`.
---
---The special handling of `1` means
---that `characters` will become `glyphs` after subtraction of `256`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6264-L6270](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6264-L6270)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.protect_glyph(d) end

---
---Add `256` to all `glyph` node subtypes in the node list starting at `head`,
---except that if the value is `1`, add only `255`.
---
---The special handling of `1` means
---that `characters` will become `glyphs` after subtraction of `256`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6225-L6241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6225-L6241)
---
---@param head Node
---@param tail? Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.protect_glyphs(head, tail) end

---
---Add `256` to all `glyph` node subtypes in the node list starting at `head`,
---except that if the value is `1`, add only `255`.
---
---The special handling of `1` means
---that `characters` will become `glyphs` after subtraction of `256`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6280-L6293](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6280-L6293)
---
---@param head integer
---@param tail? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.protect_glyphs(head, tail) end

_N._7_36_last_node = 155

---
---Pop the last node from *TeX*'s “current list”.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2556-L2563](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2556-L2563)
---
---@return Node|nil n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.last_node() end

---
---Pop the last node from *TeX*'s “current list”.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2567-L2572](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2567-L2572)
---
---@return integer|nil n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.last_node() end

_N._7_37_write = 155

---
---Append a node list to *TeX*'s “current list”.
---
---The
---node list is not deep-copied! There is no error checking either! You mignt need
---to enforce horizontal mode in order for this to work as expected.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2518-L2521), [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1913-L1923)
---* Corresponding C source code: [lnodelib.c#L2505-L2525](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2505-L2525)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.write(n) end

---
---Append a node list to *TeX*'s “current list”.
---
---The
---node list is not deep-copied! There is no error checking either! You mignt need
---to enforce horizontal mode in order for this to work as expected.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2518-L2521), [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1913-L1923)
---* Corresponding C source code: [lnodelib.c#L2529-L2552](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2529-L2552)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.write(d) end

_N._7_38_protrusion_skippable = 155

---
---Return `true` if, for the purpose of line boundary discovery when
---character protrusion is active, this node can be skipped.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6488-L6493](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6488-L6493)
---
---@param n Node
---
---@return boolean skippable
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.protrusion_skippable(n) end

---
---Return `true` if, for the purpose of line boundary discovery when
---character protrusion is active, this node can be skipped.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6497-L6506](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6497-L6506)
---
---@param d integer
---
---@return boolean skippable
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.protrusion_skippable(d) end

_N._8_glue = 155

_N._8_1_setglue = 155

---
---Set the five properties of a `glue` node in one go.
---
---Non-numeric values are
---equivalent to zero and reset a property.
---
---When you pass values, only arguments that are numbers are assigned so
---
---```
---node.setglue(n,655360,false,65536)
---```
---
---will only adapt the width and shrink.
---
---When a list node is passed, you set the glue, order and sign instead.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3862-L3883](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3862-L3883)
---
---@param n Node
---@param width integer|any
---@param stretch integer|any
---@param shrink integer|any
---@param stretch_order integer|any
---@param shrink_order integer|any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.setglue(n, width, stretch, shrink, stretch_order, shrink_order) end

---
---Set the five properties of a `glue` node in one go.
---
---Non-numeric values are
---equivalent to zero and reset a property.
---
---When you pass values, only arguments that are numbers are assigned so
---
---```
---node.direct.setglue(n,655360,false,65536)
---```
---
---will only adapt the width and shrink.
---
---When a list node is passed, you set the glue, order and sign instead.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3798-L3818](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3798-L3818)
---
---@param d integer
---@param width integer|any
---@param stretch integer|any
---@param shrink integer|any
---@param stretch_order integer|any
---@param shrink_order integer|any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setglue(d, width, stretch, shrink, stretch_order, shrink_order) end

_N._8_2_getglue = 155

---
---Return 5 values or nothing when no glue is passed.
---
---When the second argument is false, only the width is returned (this is consistent
---with `tex.get`).
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3840-L3860](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3840-L3860)
---
---@param n Node
---
---@return integer|number|nil width_or_glue_set # When a list node (`vlist` or `hlist`) is passed, than the glue set is returned.
---@return integer|nil stretch_or_glue_order # When a list node (`vlist` or `hlist`) is passed, than the glue order is returned.
---@return integer|nil shrink_or_glue_sign # When a list node (`vlist` or `hlist`) is passed, than the glue sign is returned.
---@return integer|nil stretch_order
---@return integer|nil shrink_order
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getglue(n) end

---
---Return 5 values or nothing when no glue is passed.
---
---When the second argument is false, only the width is returned (this is consistent
---with `tex.get`).
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3776-L3796](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3776-L3796)
---
---@param d integer
---
---@return integer|number|nil width_or_glue_set # When a list node (`vlist` or `hlist`) is passed, than the glue set is returned.
---@return integer|nil stretch_or_glue_order # When a list node (`vlist` or `hlist`) is passed, than the glue order is returned.
---@return integer|nil shrink_or_glue_sign # When a list node (`vlist` or `hlist`) is passed, than the glue sign is returned.
---@return integer|nil stretch_order
---@return integer|nil shrink_order
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getglue(d) end

_N._8_3_is_zero_glue = 156

---
---Return `true` when the width, stretch and shrink properties
---are zero.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3885-L3899](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3885-L3899)
---
---@param n Node
---
---@return boolean isglue
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.is_zero_glue(n) end

---
---Return `true` when the width, stretch and shrink properties
---are zero.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3820-L3834](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3820-L3834)
---
---@param d integer
---
---@return boolean isglue
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.is_zero_glue(d) end

_N._9_attribute_handling = 156
_N._9_1_attributes = 156
_N._9_2_attribute_list_nodes = 156
_N._9_3_attr_nodes = 157
_N._9_4_has_attribute = 157

---
---Test if a node has the attribute with number `id` set.
---
---If `value` is
---also supplied, also tests if the value matches `value`. It returns the value,
---or, if no match is found, `nil`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3339-L3353](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3339-L3353)
---
---@param n Node
---@param id integer
---@param value? integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.has_attribute(n, id, value) end

---
---Test if a node has the attribute with number `id` set.
---
---If `value` is
---also supplied, also tests if the value matches `value`. It returns the value,
---or, if no match is found, `nil`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3357-L3371](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3357-L3371)
---
---@param d integer
---@param id integer
---@param value? integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.has_attribute(d, id, value) end

_N._9_5_get_attribute = 157

---
---Test if a node has an attribute with number `id` set.
---
---It returns the
---value, or, if no match is found, `nil`. If no `id` is given then the
---zero attributes is assumed.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3375-L3406](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3375-L3406)
---
---@param n Node
---@param id integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.get_attribute(n, id) end

---
---Test if a node has an attribute with number `id` set.
---
---It returns the
---value, or, if no match is found, `nil`. If no `id` is given then the
---zero attributes is assumed.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3450-L3481](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3450-L3481)
---
---@param d integer
---@param id integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.get_attribute(d, id) end

_N._9_6_find_attribute = 157

---
---Find the first node that has attribute with number `id` set.
---
---It returns
---the value and the node if there is a match and otherwise nothing.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3408-L3443](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3408-L3443)
---
---@param n Node
---@param id integer
---
---@return integer|nil value
---@return Node|nil n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.find_attribute(n, id) end

---
---Find the first node that has attribute with number `id` set.
---
---It returns
---the value and the node if there is a match and otherwise nothing.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3503-L3538](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3503-L3538)
---
---@param d integer
---@param id integer
---
---@return integer|nil value
---@return Node|nil n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.find_attribute(d, id) end

_N._9_7_set_attribute = 157

---
---Set the attribute with number `id` to the value `value`.
---
---Duplicate
---assignments are ignored.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3563-L3578](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3563-L3578)
---
---@param n Node
---@param id integer
---@param value? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.set_attribute(n, id, value) end

---
---Set the attribute with number `id` to the value `value`.
---
---Duplicate
---assignments are ignored.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3483-L3501](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3483-L3501)
---
---@param d integer
---@param id integer
---@param value? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.set_attribute(d, id, value) end

_N._9_8_unset_attribute = 158

---
---Unset the attribute with the number `id`.
---
---If `value` is also supplied, it
---will only perform this operation if the value matches `value`. Missing
---attributes or attribute-value pairs are ignored.
---
---If the attribute was actually deleted, returns its old value. Otherwise, returns
---`nil`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3580-L3596](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3580-L3596)
---
---@param n Node
---@param id integer
---@param value? integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.unset_attribute(n, id, value) end

---
---Unset the attribute with the number `id`.
---
---If `value` is also supplied, it
---will only perform this operation if the value matches `value`. Missing
---attributes or attribute-value pairs are ignored.
---
---If the attribute was actually deleted, returns its old value. Otherwise, returns
---`nil`.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3540-L3558](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3540-L3558)
---
---@param n Node
---@param id integer
---@param value? integer
---
---@return integer|nil value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.unset_attribute(n, id, value) end

_N._9_9_slide = 158

---
---Return the found
---tail node and make sure that the node lists is double linked.
---
---After some callbacks automatic sliding takes place. This feature can be turned
---off with `node.fix_node_lists(false)` but you better make sure then that
---you don't mess up lists. In most cases *TeX* itself only uses `next`
---pointers but your other callbacks might expect proper `prev` pointers too.
---Future versions of *LuaTeX* can add more checking but this will not influence
---usage.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3226-L3241](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3226-L3241)
---
---@param n Node
---
---@return Node tail
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.slide(n) end

---
---Return the found
---tail node and make sure that the node lists is double linked.
---
---After some callbacks automatic sliding takes place. This feature can be turned
---off with `node.fix_node_lists(false)` but you better make sure then that
---you don't mess up lists. In most cases *TeX* itself only uses `next`
---pointers but your other callbacks might expect proper `prev` pointers too.
---Future versions of *LuaTeX* can add more checking but this will not influence
---usage.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3245-L3258](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3245-L3258)
---
---@param d integer
---
---@return integer tail
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.slide(d) end

_N._9_10_check_discretionaries = 158

---
---Check all `disc` nodes in the node list.
---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it’s ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8615-L8627](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8615-L8627)
---
---@param head Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.check_discretionaries(head) end

---
---Check all `disc` nodes in the node list.
---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it’s ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8550-L8562](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8550-L8562)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.check_discretionaries(d) end

---
---Check one `disc` node only and also check if the node is a `disc` node.
---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it’s ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8629-L8638](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8629-L8638)
---
---@param n Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.check_discretionary(n) end

---
---Check one `disc` node only and also check if the node is a `disc` node.
---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it’s ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8564-L8573](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8564-L8573)
---
---@param d integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.check_discretionary(d) end

_N._9_11_flatten_discretionaries = 158

---
---Remove the discretionaries in the list and inject the replace
---field when set.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8640-L8679](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8640-L8679)
---
---@param n Node
---
---@return Node head
---@return integer count
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.flatten_discretionaries(n) end

---
---Remove the discretionaries in the list and inject the replace
---field when set.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8575-L8613](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8575-L8613)
---
---@param d integer
---
---@return Node head
---@return integer count
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.flatten_discretionaries(d) end

_N._9_12_family_font = 158

---
---Return the font
---currently associated with the node.
---
---You can normally also access the font with the
---normal font field or getter because it will resolve the family automatically for
---noads.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L2922-L2932](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L2922-L2932)
---
---@param fam integer # family identifier
---
---@return integer id
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.family_font(fam) end

_N._10_two_access_models = 159

---
---Convert a userdata node into its numeric reference in the memory table.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6552-L6565](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6552-L6565)
---
---@param n Node
---
---@return integer d
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.todirect(n) end

---
---Convert numeric reference in the memory table of a node into a userdata node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6570-L6581](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6570-L6581)
---
---@param d integer
---
---@return Node n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.tonode(d) end

_N._10_two_access_models_page_2 = 160

---
---Set the next node of the current node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1767-L1778](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1767-L1778)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param next integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setnext(d, next) end

---
---Return the next node of the current node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1782-L1800](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1782-L1800)
---
---@param n Node
---
---@return Node|nil next
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getnext(n) end

---
---Return the next node of the current node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1756-L1765](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1756-L1765)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil next
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getnext(d) end

---
---Set the previous node of the current node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1816-L1827](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1816-L1827)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param prev integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setprev(d, prev) end

---
---Return the previous node of the current node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1831-L1846](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1831-L1846)
---
---@param n Node
---
---@return Node|nil prev
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getprev(n) end

---
---Return the previous node of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1805-L1814](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1805-L1814)
---
---@param n Node
---
---@return Node|nil prev
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getprev(n) end

---
---Set the previous and next pointers at once.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1864-L1880](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1864-L1880)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param prev integer
---@param next integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setboth(d, prev, next) end

---
---Return the previous and next pointer of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1884-L1902](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1884-L1902)
---
---@param n Node
---
---@return Node|nil prev
---@return Node|nil next
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getboth(n) end

---
---Return the previous and next pointer of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1851-L1862](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1851-L1862)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil next
---@return integer|nil prev
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getboth(d) end

---
---Return the `id` (type) of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L487-L496](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L487-L496)
---
---@param n Node
---
---@return integer id
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getid(n) end

---
---Return the `id` (type) of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L500-L517](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L500-L517)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer id
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getid(d) end

---
---Set the `subtype` of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L533-L540](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L533-L540)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param subtype integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setsubtype(d, subtype) end

---
---Return the `subtype` of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L544-L558](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L544-L558)
---
---@param n Node
---
---@return integer subtype
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getsubtype(n) end

---
---Return the `subtype` of a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L522-L531](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L522-L531)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer subtype
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getsubtype(d) end

---
---Set the font identifier on a `glyph` node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L621-L632](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L621-L632)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@param font integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setfont(d, font) end

---
---Return the font identifier of a `glyph`, `math_char`, `math_text_char` or `delim` node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L636-L654](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L636-L654)
---
---@param n Node
---
---@return integer|nil font
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getfont(n) end

---
---Return the font identifier of a `glyph`, `math_char`, `math_text_char` or `delim` node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L601-L619](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L601-L619)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil font
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getfont(d) end

---
---Set the character index (`char`) in the font on `glyph`, `math_char`, `math_text_char` or `delim` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L702-L717](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L702-L717)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param char integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setchar(d, char) end

---
---Return the character index (`char`) in the font of `glyph`, `math_char`, `math_text_char` or `delim` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L739-L758](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L739-L758)
---
---@param n Node
---
---@return integer|nil char
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getchar(n) end

---
---Return the character index (`char`) in the font of `glyph`, `math_char`, `math_text_char` or `delim` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L659-L678](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L659-L678)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil char
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getchar(d) end

---
---Set the `width`, `height` and `depth` fields of `hlist`, `vlist`, `rule` or `unset` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1307-L1346](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1307-L1346)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param width number # Rounded to an integer
---@param height number # Rounded to an integer
---@param depth number # Rounded to an integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setwhd(d, width, height, depth) end

---
---Return the `width`, `height` and `depth` of a list, rule or (unexpanded) `glyph` as well as `glue` (its spec is looked at) and `unset` node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1350-L1378](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1350-L1378)
---
---@param n Node
---@param get_ex boolean
---
---@return integer width
---@return integer height
---@return integer depth
---@return integer|nil ex # If the node is a `glyph` and `get_ex` is true
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getwhd(n, get_ex) end

---
---Return the `width`, `height` and `depth` of a list, rule or (unexpanded) `glyph` as well as `glue` (its spec is looked at) and `unset` node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1277-L1305](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1277-L1305)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param get_ex boolean
---
---@return integer width
---@return integer height
---@return integer depth
---@return integer|nil ex # If the node is a `glyph` and `get_ex` is true
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getwhd(d, get_ex) end

---
---Set the `pre`, `post`, `replace`, `subtype` and `penalty` on a `disc` node.
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1201-L1232](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1201-L1232)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param pre integer
---@param post? integer
---@param replace? integer
---@param subtype? integer
---@param penalty? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setdisc(d, pre, post, replace, subtype, penalty) end

---
---Return the `pre`, `post` and `replace` fields and optionally when true is passed also the tail fields.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1236-L1253](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1236-L1253)
---
---@param n Node
---@param get_tail? boolean
---
---@return Node pre
---@return Node post
---@return Node replace
---@return Node|nil pre_tail
---@return Node|nil post_tail
---@return Node|nil replace_tail
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getdisc(n, get_tail) end

---
---Return the `pre`, `post` and `replace` fields and optionally when true is passed also the tail fields.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1182-L1199](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1182-L1199)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param get_tail? boolean
---
---@return integer pre
---@return integer post
---@return integer replace
---@return integer|nil pre_tail
---@return integer|nil post_tail
---@return integer|nil replace_tail
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getdisc(d, get_tail) end

---
---Set child node lists to parent `hlist`, `vlist`, `sub_box`, `sub_mlist`, `ins`, or `adjust` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1404-L1436](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1404-L1436)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param list integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setlist(d, list) end

---
---Get child node lists of parent `hlist`, `vlist`, `sub_box`, `sub_mlist`, `ins`, or `adjust` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1440-L1458](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1440-L1458)
---
---@param n Node
---
---@return Node|nil list
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getlist(n) end

---
---Get child node lists of parent `hlist`, `vlist`, `sub_box`, `sub_mlist`, `ins`, or `adjust` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1382-L1402](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1382-L1402)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil list
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getlist(d) end

---
---Set the leaders to `glue` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1474-L1485](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1474-L1485)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param leader integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setleader(d, leader) end

---
---Get the leaders of `glue` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1489-L1501](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1489-L1501)
---
---@param n Node
---
---@return Node|nil leaders
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getleader(n) end

---
---Get the leaders of `glue` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1463-L1472](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1463-L1472)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil leaders
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getleader(d) end

---
---Set the value of a generic node field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L7348-L7364](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7348-L7364)
---
---@param n Node
---@param field string
---@param value any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.setfield(n, field, value) end

---
---Set the value of a generic node field.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L7660-L8188](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L7660-L8188)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param field string
---@param value any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setfield(d, field, value) end

---
---Get the value of a generic node field.
---
---Other field names are often shared so a specific getter makes no sense.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5189-L5207](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5189-L5207)
---
---@param n Node
---@param field string
---
---@return any|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getfield(n, field) end

---
---Get the value of a generic node field.
---
---Other field names are often shared so a specific getter makes no sense.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5402-L5891](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5402-L5891)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param field string
---
---@return any|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getfield(d, field) end

---
---Set the SyncTeX fields, a file number aka tag and a line
---number, for a glue, kern, hlist, vlist, rule and math nodes as well as glyph
---nodes (although this last one is not used in native SyncTeX).
---
---Of course you need to know what you're doing as no checking on sane values takes
---place. Also, the SyncTeX interpreter used in editors is rather peculiar and has
---some assumptions (heuristics).
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8683-L8719](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8683-L8719)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param tag integer
---@param line integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.set_synctex_fields(d, tag, line) end

---
---Query the SyncTeX fields, a file number aka tag and a line
---number, for a glue, kern, hlist, vlist, rule and math nodes as well as glyph
---nodes (although this last one is not used in native SyncTeX).
---
---Of course you need to know what you're doing as no checking on sane values takes
---place. Also, the SyncTeX interpreter used in editors is rather peculiar and has
---some assumptions (heuristics).
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8721-L8759](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8721-L8759)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer tag
---@return integer line
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.get_synctex_fields(d) end

---
---Set the attribute list on a node.
---
---When the second argument of setattributelist is
---`true` the current attribute list is assumed.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L828-L854](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L828-L854)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param attr_list integer|true
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setattributelist(d, attr_list) end

---
---Return the attribute list on a node.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L817-L826](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L817-L826)
---
---@param n Node
---
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getattributelist(n) end

---
---Return the node list of the given box.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8224-L8236](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8224-L8236)
---
---@param box integer
---
---@return integer|nil node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getbox(box) end

---
---Set the field `components` (ligature components) on `glyph` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L774-L785](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L774-L785)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param components integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setcomponents(d, components) end

---
---Return the field `components` (ligature components) of `glyph` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L763-L772](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L763-L772)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getcomponents(d) end

---
---Set the `data` field on `glyph`, `boundary`, `user_defined`, `pdf_literal`, `pdf_late_literal`, `late_lua`, `pdf_setmatrix`, `special`, `late_special` and `write` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1716-L1751](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1716-L1751)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setdata(d) end

---
---Return the `data` field off `glyph`, `boundary`, `user_defined`, `pdf_literal`, `pdf_late_literal`, `late_lua`, `pdf_setmatrix`, `special`, `late_special` and `write` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1678-L1714](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1678-L1714)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return any|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getdata(d) end

---
---Set the direction of `dir`, `hlist`, `vlist`, `rule` and `local_par` nodes as a string.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1093-L1109](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1093-L1109)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param dir DirectionSpecifier
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setdir(d, dir) end

---
---Get the direction  of `dir`, `hlist`, `vlist`, `rule` and `local_par` nodes as a string.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1047-L1067](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1047-L1067)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return DirectionSpecifier
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getdir(d) end

---
---Set the direction of `dir`, `hlist`, `vlist`, `rule` and `local_par` nodes as an integer.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1111-L1134](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1111-L1134)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param dir integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setdirection(d, dir) end

---
---Get the direction of `dir`, `hlist`, `vlist`, `rule` and `local_par` nodes as an integer.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#LL1070-L1092](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#LL1070-L1092)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getdirection(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L580-L596](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L580-L596)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setexpansion(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L563-L578](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L563-L578)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getexpansion(d) end

---
---Set the the family number of `math_char`, `math_text_char`, `delim`, `fraction_noad`, `simple_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L719-L735](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L719-L735)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param fam integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setfam(d, fam) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L680-L700](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L680-L700)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getfam(d) end

---
---Set the width on `hlist`, `vlist`, `rule`, `glue`, `glue_spec`, `math`, `kern`, `margin_kern`, `ins`, `unset`, `fraction_noad` or `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3641-L3657](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3641-L3657)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param width number # Rounded to an integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setwidth(d, width) end

---
---Get the width of `hlist`, `vlist`, `rule`, `glyph`, `glue`, `glue_spec`, `math`, `kern`, `margin_kern`, `ins` and `unset` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3607-L3639](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3607-L3639)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer width
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getwidth(d) end

---
---Set the height on `hlist`, `vlist`, `rule`, `unset` and `fence_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3681-L3697](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3681-L3697)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setheight(d) end

---
---Return the height off `hlist`, `vlist`, `rule`,  `glyph`, `unset`, `ins` and `fence` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3659-L3679](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3659-L3679)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getheight(d) end

---
---Set the depth on `hlist`, `vlist`, `rule`, `unset` and `fence` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3721-L3737](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3721-L3737)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param depth number
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setdepth(d, depth) end

---
---Return the depth of `hlist`, `vlist`, `rule`, `glyph`, `unset`, `ins` and `fence` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3699-L3719](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3699-L3719)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getdepth(d) end

---
---Set the kerning on `kern` (kern), `margin_kern` (width) and `math` (surround) nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1019-L1042](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1019-L1042)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param kern integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setkern(d, kern) end

---
---Return the kerning of `kern` (kern), `margin_kern` (width) and `math` (surround) nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L995-L1017](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L995-L1017)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@return integer|nil kern
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getkern(d) end

---
---Set the `lang` (the language identifier) field on `glyph` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L801-L812](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L801-L812)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param lang integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setlang(d, lang) end

---
---Return the `lang` (the language identifier) field of `glyph` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L790-L799](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L790-L799)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil lang
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getlang(d) end

---
---Set the `nucleus` (base) field an `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L916-L930](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L916-L930)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param nucleus integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setnucleus(d, nucleus) end

---
---Return the `nucleus` (base) field of `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L902-L914](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L902-L914)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil nucleus
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getnucleus(d) end

---
---Set offsets on `glyph` (`xoffset`: a virtual displacement in horizontal direction and
---`yoffset`: a virtual displacement in vertical direction) and `rule` (`left`: shift at the left end (also subtracted from width) and `right`: subtracted from width) nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1156-L1177](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1156-L1177)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param a integer # `xoffset` or `left`
---@param b integer # `yoffset` or `right`
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setoffsets(d, a, b) end

---
---Set the `penalty` field on `glyph` and `rule` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1139-L1154](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1139-L1154)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil a # `xoffset` or `left`
---@return integer|nil b # `yoffset` or `right`
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getoffsets(d) end

---
---Set the `penalty` field on `penalty` and `disc` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L876-L896](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L876-L896)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setpenalty(d) end

---
---Return the `penalty` field of `penalty` and `disc` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L858-L874](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L858-L874)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil penalty
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getpenalty(d) end

---
---Set the `shift` (a displacement perpendicular to the character progression direction) field on `vlist` and `hlist` nodes.
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3756-L3770](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3756-L3770)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param shift integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setshift(d, shift) end

---
---Return the `shift` (a displacement perpendicular to the character progression direction) field off `vlist` and `hlist` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3742-L3754](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3742-L3754)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil shift
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getshift(d) end

---
---Set the `sub` (subscript) field on `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L946-L960](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L946-L960)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param sub integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setsub(d, sub) end

---
---Return the `sub` (subscript) field of `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L932-L944](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L932-L944)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil sub
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getsub(d) end

---
---Set the `sup` (superscript) field on `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L976-L990](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L976-L990)
---
---@param d integer # The index number of the node in the memory table for direct access.
---@param sup number
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setsup(d, sup) end

---
---Return the `sup` (superscript) field of `simple_noad`, `accent_noad` and `radical_noad` nodes.
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L962-L974](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L962-L974)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|nil sup
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getsup(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8307-L8322](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8307-L8322)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return integer|false
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.is_direct(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1912-L1957](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1912-L1957)
---
---@param d integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setlink(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L1959-L1972](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L1959-L1972)
---
---@param l integer # The index number of the node in the memory table for direct access.
---@param r integer # The index number of the node in the memory table for direct access.
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setsplit(l, r) end

_N._11_properties = 164

---
---Assign values to the properties table.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [lnodelib.c#L8397-L8410](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8397-L8410)
---* Corresponding C source code: [lnodelib.c#L8403-L8416](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8403-L8416)
---
---@param n Node
---@param value any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.setproperty(n, value) end

---
---Assign values to the properties table.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [lnodelib.c#L8397-L8410](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8397-L8410)
---* Corresponding C source code: [lnodelib.c#L8418-L8431](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8418-L8431)
---
---@param d integer # The index number of the node in the memory table for direct access.---@param value any
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.setproperty(d, value) end

---
---Each node also can have a properties table and you can get properties using the `getproperty` function.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2520-L2523](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2520-L2523)
---* Corresponding C source code: [lnodelib.c#L8379-L8389](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8379-L8389)
---
---@param node Node
---
---@return any value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.getproperty(node) end

---
---Each node also can have a properties table and you can get properties using the `getproperty` function.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2520-L2523](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2520-L2523)
---* Corresponding C source code: [lnodelib.c#L8391-L8401](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8391-L8401)
---
---@param d integer
---
---@return any value
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.getproperty(d) end

---
---Managing properties in the node (de)allocator functions is disabled by default and is enabled by:
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8351-L8360](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8351-L8360)
---
---@param enable boolean
---@param use_metatable? boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.set_properties_mode(enable, use_metatable) end

---
---Managing properties in the node (de)allocator functions is disabled by default and is enabled by:
---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8351-L8360](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8351-L8360)
---
---@param enable boolean
---@param use_metatable? boolean
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.set_properties_mode(enable, use_metatable) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8364-L8375](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8364-L8375)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.flush_properties_table() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8364-L8375](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8364-L8375)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.flush_properties_table() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8439-L8443](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8439-L8443)
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.get_properties_table() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8433-L8437](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8433-L8437)
---
---@return table
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.get_properties_table() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L366-L374](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L366-L374)
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.fix_node_lists() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6104-L6122](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6104-L6122)
---
---@param n Node
---@param m? Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.hyphenating(n, m) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6124-L6142](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6124-L6142)
---
---@param d integer
---@param e? integer
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.hyphenating(d, e) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L8842-L8868](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8842-L8868)
---
---@param fnt integer
---@param chr integer
---@param size integer
---@param overlap? integer
---@param horizontal? boolean
---@param attlist? Node
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.make_extensible(fnt, chr, size, overlap, horizontal, attlist) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3153-L3222](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3153-L3222)
---
---@param subtype string|integer
---
---@return string[]
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.subtypes(subtype) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5913-L5918](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5913-L5918)
---
---@param n Node
---@return string # For example `<node    nil <    234 >    nil : glyph 0>`
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.tostring(n) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L5922-L5931](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L5922-L5931)
---@param d integer # The index number of the node in the memory table for direct access.
---
---@return string # For example `<direct    nil <    234 >    nil : glyph 0>`
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.tostring(d) end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6471-L6476](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6471-L6476)
---
---@return Node n
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.usedlist() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L6480-L6484](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L6480-L6484)
---
---@return integer d
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.direct.usedlist() end

---
---__Reference:__
---
---* Corresponding C source code: [lnodelib.c#L3117-L3151](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L3117-L3151)
---
---@param type 'dir'|'direction'|'glue'|'pdf_literal'|'pdf_action'|'pdf_window'|'color_stack'|'pagestate'
---
---@return string[]
---
---[Type definition and documentation](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/node.lua) incomplete or incorrect? [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
function node.values(type) end
