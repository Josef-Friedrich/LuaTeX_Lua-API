---@meta
---A helper table to better navigate through the documentation using the
---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n
_N = {}

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

---A number in the range `[0,4]` indicating the glue order.
---@alias GlueOrder 0|1|2|3|4

---The calculated glue ratio.
---@alias GlueSet number

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
---* Source code of the `LuaTeX` manual:  [luatex-nodes.tex#L49-L76](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L49-L76)
---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil # That prev field is always present, but only initialized on explicit request: when the function `node.slide()` is called, it will set up the `prev` fields to be a backwards pointer in the argument node list. By now most of *TeX*'s node processing makes sure that the `prev` nodes are valid but there can be exceptions, especially when the internal magic uses a leading `temp` nodes to temporarily store a state.
---@field id integer # the node’s type (id) number
---@field subtype integer # the node subtype identifier. The `subtype` is sometimes just a dummy entry because not all nodes actually use the `subtype`, but this way you can be sure that all nodes accept it as a valid field name, and that is often handy in node list traversal.
---@field head? Node
---@field attr Node # list of attributes. almost all nodes also have an `attr` field

_N.hlist = 0

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
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L78-L108](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L78-L108)
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

_N.vlist = 1

---@alias VlistNodeSubtype
---|0 # unknown
---|4 # alignment
---|5 # cell

---@class VlistNode: Node

_N.rule = 2

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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L119-L157](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L119-L157)
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

---@class InsNode: Node
---@field subtype number # the insertion class
---@field attr Node # list of attributes
---@field cost number # the penalty associated with this insert
---@field height number # height of the insert
---@field depth number # depth of the insert
---@field head Node # the first node of the body of this insert
---@field list Node # the first node of the body of this insert

_N.mark = 4

---@class MarkNode: Node
---@field subtype number # unused
---@field attr Node # list of attributes
---@field class number # the mark class
---@field mark table # a table representing a token list

_N.adjust = 5

---@alias AdjustNodeSubtype
---|0 # normal
---|1 # pre

---@class AdjustNode: Node
---@field subtype AdjustNodeSubtype
---@field attr Node # list of attributes
---@field head Node # adjusted material
---@field list Node # adjusted material

_N.disc = 7

---@alias DiscNodeSubtype
---|0 # discretionary
---|1 # explicit
---|2 # automatic
---|3 # regular
---|4 # first
---|5 # second

---@class DiscNode: Node
---@field subtype DiscNodeSubtype
---@field attr Node # list of attributes
---@field pre Node # pointer to the pre-break text
---@field post Node # pointer to the post-break text
---@field replace Node # pointer to the no-break text
---@field penalty number # the penalty associated with the break, normally `hyphenpenalty` or `exhyphenpenalty`

_N.math = 11

---@alias MathNodeSubtype
---|0 # beginmath
---|1 # endmath

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
---@class GlueSpecNode: Node
---@field width          integer # the horizontal or vertical displacement
---@field stretch        integer # extra (positive) displacement or stretch amount
---@field stretch_order  integer # factor applied to stretch amount
---@field shrink         integer # extra (negative) displacement or shrink amount
---@field shrink_order   integer # factor applied to shrink amount

_N.glue = 12

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
---@class GlueNode: Node
---@field subtype GlueNodeSubtype
---@field leader Node # pointer to a box or rule for leaders
---@field width integer # the horizontal or vertical displacement
---@field stretch integer # extra (positive) displacement or stretch amount
---@field stretch_order integer # factor applied to stretch amount
---@field shrink integer # extra (negative) displacement or shrink amount
---@field shrink_order integer # factor applied to shrink amount

_N.kern = 13

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
---@field kern integer # Fixed horizontal or vertical advance (in scaled points)

_N.penalty = 14

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

---@class PenaltyNode: Node
---@field subtype PenaltyNodeSubtype
---@field attr Node # list of attributes
---@field penalty number # the penalty value

_N.glyph = 29

---@alias GlyphNodeSubtype
---|1 # ligature
---|2 # ghost
---|3 # left
---|4 # right

---@class GlyphNode: Node
---@field subtype number # bit field
---@field attr Node # list of attributes
---@field char number # the character index in the font
---@field font number # the font identifier
---@field lang number # the language identifier
---@field left number # the frozen `\lefthyphenmnin` value
---@field right number # the frozen `\righthyphenmnin` value
---@field uchyph boolean # the frozen `uchyph` value
---@field components Node # pointer to ligature components
---@field xoffset number # a virtual displacement in horizontal direction
---@field yoffset number # a virtual displacement in vertical direction
---@field width number # the (original) width of the character
---@field height number # the (original) height of the character
---@field depth number # the (original) depth of the character
---@field expansion_factor number # the to be applied expansion_factor
---@field data number # a general purpose field for users (we had room for it)

_N.boundary = 6

---@alias BoundaryNodeSubtype
---|0 # cancel
---|1 # user
---|2 # protrusion
---|3 # word

---@class BoundaryNode: Node
---@field subtype BoundaryNodeSubtype
---@field attr Node # list of attributes
---@field value number # values 0--255 are reserved

_N.local_par = 9

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

---@class DirNode: Node
---@field attr Node # list of attributes
---@field dir string # the direction (but see below)
---@field level number # nesting level of this direction whatsit

_N.margin_kern = 28

---@alias MarginKernNodeSubtype
---|0 # left
---|1 # right

---@class MarginKernNode: Node
---@field subtype number # \showsubtypes{marginkern}
---@field attr Node # list of attributes
---@field width number # the advance of the kern
---@field glyph Node # the glyph to be used

_N.math_char = 23

---@class MathCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.math_text_char = 26

---@class MathTextCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.sub_box = 24

---@class SubBoxNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.sub_mlist = 25

---@class SubMlistNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.delim = 27

---@class DelimNode: Node
---@field attr Node # list of attributes
---@field small_char number # character index of base character
---@field small_fam number # family number of base character
---@field large_char number # character index of next larger character
---@field large_fam number # family number of next larger character

_N.noad = 18

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

---@class NoadNode: Node
---@field subtype NoadNodeSubtype
---@field attr Node # list of attributes
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field options number # bitset of rendering options

_N.accent = 21

---@alias AccentNodeSubtype
---|0 # bothflexible
---|1 # fixedtop
---|2 # fixedbottom
---|3 # fixedboth

---@class AccentNode: Node
---@field subtype AccentNodeSubtype
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field accent Node # top accent
---@field bot_accent Node # bottom accent
---@field fraction number # larger step criterium (divided by 1000)

_N.style = 16

---@class StyleNode: Node
---@field style string # contains the style

_N.choice = 17

---@class ChoiceNode: Node
---@field attr Node # list of attributes
---@field display Node # list of display size alternatives
---@field text Node # list of text size alternatives
---@field script Node # list of scriptsize alternatives
---@field scriptscript Node # list of scriptscriptsize alternatives

_N.radical = 19

---@alias RadicalNodeSubtype
---|0 # radical
---|1 # uradical
---|2 # uroot
---|3 # uunderdelimiter
---|4 # uoverdelimiter
---|5 # udelimiterunder
---|6 # udelimiterover

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

---@class FractionNode: Node

_N.fence = 22

---@alias FenceNodeSubtype
---|0 # unset
---|1 # left
---|2 # middle
---|3 # right
---|4 # no

---@class FenceNode: Node

_N.whatsit = 8

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

---Whatsit nodes come in many subtypes that you can ask for them by running
---`node.whatsits`.
---
---Some of them are generic and independent of the output mode and others are
---specific to the chosen backend: \DVI\ or \PDF. Here we discuss the generic
---font-end nodes nodes.
---
---Source: [luatex-nodes.tex#L781-L797](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L781-L797)
---@class WhatsitNode: Node

_N._whatsit.open = 0

_N._whatsit.write = 1

_N._whatsit.close = 2

_N._whatsit.user_defined = 8

---User-defined whatsit nodes can only be created and handled from *Lua* code. In
---effect, they are an extension to the extension mechanism. The *LuaTeX* engine
---will simply step over such whatsits without ever looking at the contents.
---
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L833-L864](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L833-L864)
---@class UserDefinedWhatsitNode: WhatsitNode
---@field user_id number # id number
---@field type 97|100|108|110|115|116 # The `type` can have one of six distinct values. The number is the ASCII value if the first character of the type name (so you can use string.byte("l") instead of `108`): 97 “a” list of attributes (a node list), 100 “d” a *Lua* number, 108 “l” a *Lua* value (table, number, boolean, etc), 110 “n” a node list, 115 “s” a *Lua* string, 116 “t” a *Lua* token list in *Lua* table form (a list of triplets).
---@field value number|Node|string|table

_N._whatsit.save_pos = 6

_N._whatsit.late_lua = 7

_N._whatsit.special = 3

_N._whatsit.pdf_literal = 16

_N._whatsit.pdf_refobj = 17

_N._whatsit.pdf_annot = 18

_N._whatsit.pdf_start_link = 19

_N._whatsit.pdf_end_link = 20

_N._whatsit.pdf_dest = 21

_N._whatsit.pdf_action = 22

_N._whatsit.pdf_thread = 23

---@class PdfThreadWhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is `tread_id` a string value?
---@field tread_id number # the thread id  string  the thread name
---@field thread_attr number # extra thread information

_N._whatsit.pdf_start_thread = 24

---@class PdfStartThreadWhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is `tread_id` a string value?
---@field tread_id number # the thread id  string  the thread name
---@field thread_attr number # extra thread information

_N._whatsit.pdf_end_thread = 25

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
---@class PdfColorstackWhatsitNode: WhatsitNode
---@field stack integer # The colorstack id number.
---@field command integer # The command to execute. ⟨stack action⟩ → set (0) | push (1) | pop (2) | current (3) [texnodes.c#L3523-L3545](https://github.com/TeX-Live/luatex/blob/6472bd794fea67de09f01e1a89e9b12141be7474/source/texk/web2c/luatexdir/tex/texnodes.c#L3523-L3545)
---@field data string # General text that is placed on top of the stack, for example `1 0 0 rg 1 0 0 RG`. `rg` only colors filled outlines while the stroke color is set with `RG`. From the [PDF Reference, fourth edition](https://opensource.adobe.com/dc-acrobat-sdk-docs/pdfstandards/pdfreference1.5_v6.pdf), 4.5.7 Color Operators Page 251: `gray G`: Set the stroking color space to DeviceGray. `gray` is a number between 0.0 (black) and 1.0 (white). `gray g`: Same as `G`, but for nonstroking operations. `r g b RG`: Set the stroking color space to DeviceRGB. Each operand must be a number between 0.0 (minimum intensity) and 1.0 (maximum intensity). `r g b rg`: same as `RG`, but for nonstroking operations. `c m y k K`: Set the stroking color space to DeviceCMYK. Each operand must be a number between 0.0 (zero concentration) and 1.0 (maximum concentration). `c m y k k`: Same as `K`, but for nonstroking operations.

_N._whatsit.pdf_setmatrix = 29

---@class PdfSetmatrixWhatsitNode
---@field attr Node # list of attributes
---@field data string # data

_N._whatsit.pdf_save = 30

---@class PdfSaveWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_restore = 31

---@class PdfRestoreWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_thread_data = 26

_N._whatsit.pdf_link_data = 27

_N._whatsit.pdf_link_state = 32

_N.unset = 15

---@class UnsetNode: Node

_N.align_record = 30

---@class AlignRecordNode: Node

_N.pseudo_file = 31

---@class PseudoFileNode: Node

_N.pseudo_line = 32

---@class PseudoLineNode: Node

_N.page_insert = 33

---@class PageInsertNode: Node

_N.split_insert = 34

---@class Split_InsertNode: Node

_N.expr_stack = 35

---@class ExprStackNode: Node

_N.nested_list = 36

---@class Nested_ListNode: Node

_N.span = 37

---@class SpanNode: Node

_N.attribute = 38

---@class AttributeNode: Node

_N.attribute_list = 40

---@class AttributeListNode: Node

_N.temp = 41

---@class TempNode: Node

_N.align_stack = 42

---@class AlignStackNode: Node

_N.movement_stack = 43

---@class MovementStackNode: Node

_N.if_stack = 44

---@class IfStackNode: Node

_N.unhyphenated = 45

---@class UnhyphenatedNode: Node

_N.hyphenated = 46

---@class HyphenatedNode: Node

_N.delta = 47

---@class DeltaNode: Node

_N.passive = 48

---@class PassiveNode: Node

_N.shape = 49

---@class ShapeNode: Node

_N._7_2_is_node = 145

---
---This function returns a number (the internal index of the node) if the argument is a userdata
---object of type <node> and false when no node is passed.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1199-L1211)
---
---@param item any
---
---@return boolean|integer t
function node.is_node(item) end

_N._7_3_types_whatsits = 145

---
---This function returns an array that maps node id numbers to node type strings, providing an
---overview of the possible top-level `id` types.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1218-L1224](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1218-L1224)
---
---@return table
function node.types() end

---
---TEX’s ‘whatsits’ all have the same id. The various subtypes are defined by their subtype fields.
---The function is much like types, except that it provides an array of subtype mappings.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1226-L1233](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1226-L1233)
---
---@return table
function node.whatsits() end

_N._7_4_id = 145

---
---Convert a single type name to its internal numeric representation.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1235-L1244](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1235-L1244)
---
---@param type NodeTypeName
---
---@return NodeTypeId
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
---@param n NodeTypeId # The numeric node type id.
---
---@return NodeTypeName|'node'|nil
function node.type(n) end

---
---Convert a single whatsit name to its internal numeric representation (subtype).
---
---```lua
---node.subtype('pdf_literal') -- 16
---node.subtype('xxx') -- nil
---```
---
---@param whatsit_type_name WhatsitTypeName
---
---@return WhatsitTypeId whatsit_type_id
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
---@param id NodeTypeId
---@param subtype? number
---
---@return {[number]: string}
function node.fields(id, subtype) end

_N._7_7_has_field = 146

function node.has_field() end

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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1299-L1314](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1299-L1314)
---
---@param id integer|NodeTypeName
---@param subtype? integer|string
---
---@return Node
function node.new(id, subtype) end

_N._7_9_free_flush_node_list = 146

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.free() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.flush_node() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.flush_list() end

_N._7_10_copy_copy_list = 147

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.copy() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.copy_list() end

_N._7_11_prev_next = 147

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.prev() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.next() end

_N._7_16_dimensions_rangedimensions = 149

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

_N._7_19_tail = 152

---
---Returns the last node of the node list that starts at `n`.
---
---@param n Node
---
---@return Node m
function node.tail(n) end

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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1775-L1791](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1775-L1791)
---
---@param head Node
---@param current Node # A node following the list `head`.
---
---@return Node head # The new `head`
---@return Node|nil current # The node following the `current` in the calling
---argument.
function node.remove(head, current) end

_N._7_29_insert_before = 153

---
---This function inserts the node `new` before `current` into the list
---following `head`. It is your responsibility to make sure that `current` is really part of that list. The return values are the (potentially
---mutated) `head` and the node `new`, set up to be part of the list
---(with correct `next` field). If `head` is initially `nil`, it
---will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1793-L1807](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1793-L1807)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
function node.insert_before(head, current, new) end

_N._7_30_insert_after = 153

---
---This function inserts the node `new` after `current` into the list
---following `head`. It is your responsibility to make sure that `current` is really part of that list. The return values are the `head` and
---the node `new`, set up to be part of the list (with correct `next`
---field). If `head` is initially `nil`, it will become `new`.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1809-L1822](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1809-L1822)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
function node.insert_after(head, current, new) end

_N._7_37_write = 155

---
---This function that will append a node list to *TeX*'s “current list”. The
---node list is not deep-copied! There is no error checking either! You mignt need
---to enforce horizontal mode in order for this to work as expected.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L2518-L2521), [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1913-L1923)
---
---@param n Node
function node.write(n) end

_N._10_two_access_models = 159

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getboth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getdisc() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getfield() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getfont() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getid() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getleader() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getnext() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getprev() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getsubtype() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.getwhd() end

node.direct = {}

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.check_discretionaries() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.check_discretionary() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.copy() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.copy_list() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.count() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.current_attr() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.dimensions() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.effective_glue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.end_of_math() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.find_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.first_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.flatten_discretionaries() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.flush_list() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.flush_node() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.flush_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.free() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.get_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.get_synctex_fields() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getattributelist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getboth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getbox() end

---
---@param node_id integer
---
---@return integer
function node.direct.getchar(node_id) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getcomponents() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getdata() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getdepth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getdir() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getdirection() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getdisc() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getexpansion() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getfam() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getfield() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getfont() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getheight() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getid() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getkern() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getlang() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getleader() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getnext() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getnucleus() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getoffsets() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getpenalty() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getprev() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getproperty() end

---
---@return table
function node.direct.get_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getshift() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getsub() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getsubtype() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getsup() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getwhd() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.getwidth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.has_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.has_field() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.has_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.hpack() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.hyphenating() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.insert_after() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.insert_before() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.is_char() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.is_direct() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.is_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.is_node() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.is_zero_glue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.kerning() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.last_node() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.length() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.ligaturing() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.new() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.prepend_prevdepth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.protect_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.protect_glyphs() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.protrusion_skippable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.rangedimensions() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.remove() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.set_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.set_properties_mode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.set_synctex_fields() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setattributelist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setboth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setbox() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setchar() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setcomponents() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setdata() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setdepth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setdir() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setdirection() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setdisc() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setexpansion() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setfam() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setfield() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setfont() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setheight() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setkern() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setlang() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setleader() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setlink() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setnext() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setnucleus() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setoffsets() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setpenalty() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setprev() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setproperty() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setshift() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setsplit() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setsub() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setsubtype() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setsup() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setwhd() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.setwidth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.slide() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.tail() end

---
---@param n Node
---
---@return integer d
function node.direct.todirect(n) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.tonode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.tostring() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.traverse() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.traverse_char() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.traverse_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.traverse_id() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.traverse_list() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.unprotect_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.unprotect_glyphs() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.unset_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.usedlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.uses_font() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.vpack() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.direct.write() end

_N._11_properties = 164

---
---Each node also can have a properties table and you can assign values to this table using the
---`setproperty` function
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [lnodelib.c#L8397-L8410](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/luatexdir/lua/lnodelib.c#L8397-L8410)
---
---@param node Node
---@param value any
function node.setproperty(node, value) end

---
---Each node also can have a properties table and you can get properties using the `getproperty` function.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L2518-L2521), [lnodelib.c#L8373-L8383](https://github.com/TeX-Live/luatex/blob/3c57eed035fa9cd6a27ed615374ab648f350326a/source/texk/web2c/luatexdir/lua/lnodelib.c#L8373-L8383)
---
---@param node Node
---
---@return any value
function node.getproperty(node) end

------------------------------------------------------------------------
---Undocumented functions listed in alphabetical order
---
---Document them by sliding them up and place them in the order of the
---official documentation
------------------------------------------------------------------------

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.check_discretionaries() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.check_discretionary() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.count() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.current_attr() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.dimensions() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.effective_glue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.end_of_math() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.family_font() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.find_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.first_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.fix_node_lists() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.flatten_discretionaries() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.flush_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.get_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.get_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.has_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.has_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.hpack() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.hyphenating() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.is_char() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.is_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.is_zero_glue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.kerning() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.last_node() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.length() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.ligaturing() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.make_extensible() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.mlist_to_hlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.prepend_prevdepth() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.protect_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.protect_glyphs() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.protrusion_skippable() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.rangedimensions() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.set_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.set_properties_mode() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.setfield() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.setglue() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.slide() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.subtypes() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.tostring() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.traverse() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.traverse_char() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.traverse_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.traverse_id() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.traverse_list() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.unprotect_glyph() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.unprotect_glyphs() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.unset_attribute() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.usedlist() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.uses_font() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.values() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.vpack() end
