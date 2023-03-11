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
node = {}

---
---*LuaTeX* only understands 4 of the 16 direction specifiers of aleph: `TLT` (latin), `TRT` (arabic), `RTT` (cjk), `LTL` (mongolian). All other direction specifiers generate an error. In addition to a keyword driven model we also provide an integer driven one.
---@alias DirectionSpecifier
---| "TLT" # latin
---| "TRT" # arabic
---| "RTT" # cjk
---| "LTL" # mongolian

---
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
---@alias GlueOrder 0|1|2|3|4

---
---The calculated glue ratio.
---@alias GlueSet number

---
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
---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil # That prev field is always present, but only initialized on explicit request: when the function `node.slide()` is called, it will set up the `prev` fields to be a backwards pointer in the argument node list. By now most of *TeX*'s node processing makes sure that the `prev` nodes are valid but there can be exceptions, especially when the internal magic uses a leading `temp` nodes to temporarily store a state.
---@field id integer # the node’s type (id) number
---@field subtype integer # the node subtype identifier. The `subtype` is sometimes just a dummy entry because not all nodes actually use the `subtype`, but this way you can be sure that all nodes accept it as a valid field name, and that is often handy in node list traversal.
---@field head? Node
---@field attr Node # list of attributes. almost all nodes also have an `attr` field

_N.hlist = 0

---
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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L78-L108](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L78-L108)
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

---
---@alias VlistNodeSubtype
---|0 # unknown
---|4 # alignment
---|5 # cell

---
---@class VlistNode: Node

_N.rule = 2

---
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
---@class MarkNode: Node
---@field subtype number # unused
---@field attr Node # list of attributes
---@field class number # the mark class
---@field mark table # a table representing a token list

_N.adjust = 5

---
---@alias AdjustNodeSubtype
---|0 # normal
---|1 # pre

---
---@class AdjustNode: Node
---@field subtype AdjustNodeSubtype
---@field attr Node # list of attributes
---@field head Node # adjusted material
---@field list Node # adjusted material

_N.disc = 7

---
---@alias DiscNodeSubtype
---|0 # discretionary
---|1 # explicit
---|2 # automatic
---|3 # regular
---|4 # first
---|5 # second

---
---@class DiscNode: Node
---@field subtype DiscNodeSubtype
---@field attr Node # list of attributes
---@field pre Node # pointer to the pre-break text
---@field post Node # pointer to the post-break text
---@field replace Node # pointer to the no-break text
---@field penalty number # the penalty associated with the break, normally `hyphenpenalty` or `exhyphenpenalty`

_N.math = 11

---
---@alias MathNodeSubtype
---|0 # beginmath
---|1 # endmath

---
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

---
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

---
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

---
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
---@class PenaltyNode: Node
---@field subtype PenaltyNodeSubtype
---@field attr Node # list of attributes
---@field penalty number # the penalty value

_N.glyph = 29

---
---@alias GlyphNodeSubtype
---|1 # ligature
---|2 # ghost
---|3 # left
---|4 # right

---
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

---
---@alias BoundaryNodeSubtype
---|0 # cancel
---|1 # user
---|2 # protrusion
---|3 # word

---
---@class BoundaryNode: Node
---@field subtype BoundaryNodeSubtype
---@field attr Node # list of attributes
---@field value number # values 0--255 are reserved

_N.local_par = 9

---
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
---@class DirNode: Node
---@field attr Node # list of attributes
---@field dir string # the direction (but see below)
---@field level number # nesting level of this direction whatsit

_N.margin_kern = 28

---
---@alias MarginKernNodeSubtype
---|0 # left
---|1 # right

---
---@class MarginKernNode: Node
---@field subtype number # \showsubtypes{marginkern}
---@field attr Node # list of attributes
---@field width number # the advance of the kern
---@field glyph Node # the glyph to be used

_N.math_char = 23

---
---@class MathCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.math_text_char = 26

---
---@class MathTextCharNode: Node
---@field attr Node # list of attributes
---@field char number # the character index
---@field fam number # the family number

_N.sub_box = 24

---
---@class SubBoxNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.sub_mlist = 25

---
---@class SubMlistNode: Node
---@field attr Node # list of attributes
---@field head Node # list of nodes
---@field list Node # list of nodes

_N.delim = 27

---
---@class DelimNode: Node
---@field attr Node # list of attributes
---@field small_char number # character index of base character
---@field small_fam number # family number of base character
---@field large_char number # character index of next larger character
---@field large_fam number # family number of next larger character

_N.noad = 18

---
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
---@class NoadNode: Node
---@field subtype NoadNodeSubtype
---@field attr Node # list of attributes
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field options number # bitset of rendering options

_N.accent = 21

---
---@alias AccentNodeSubtype
---|0 # bothflexible
---|1 # fixedtop
---|2 # fixedbottom
---|3 # fixedboth

---
---@class AccentNode: Node
---@field subtype AccentNodeSubtype
---@field nucleus Node # base
---@field sub Node # subscript
---@field sup Node # superscript
---@field accent Node # top accent
---@field bot_accent Node # bottom accent
---@field fraction number # larger step criterium (divided by 1000)

_N.style = 16

---
---@class StyleNode: Node
---@field style string # contains the style

_N.choice = 17

---
---@class ChoiceNode: Node
---@field attr Node # list of attributes
---@field display Node # list of display size alternatives
---@field text Node # list of text size alternatives
---@field script Node # list of scriptsize alternatives
---@field scriptscript Node # list of scriptscriptsize alternatives

_N.radical = 19

---
---@alias RadicalNodeSubtype
---|0 # radical
---|1 # uradical
---|2 # uroot
---|3 # uunderdelimiter
---|4 # uoverdelimiter
---|5 # udelimiterunder
---|6 # udelimiterover

---
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
---@class FractionNode: Node

_N.fence = 22

---
---@alias FenceNodeSubtype
---|0 # unset
---|1 # left
---|2 # middle
---|3 # right
---|4 # no

---
---@class FenceNode: Node

_N.whatsit = 8

---
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
---specific to the chosen backend: \DVI\ or \PDF. Here we discuss the generic
---font-end nodes nodes.
---
---Source: [luatex-nodes.tex#L781-L797](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L781-L797)
---@class WhatsitNode: Node

_N._whatsit.open = 0

---
---@class OpenWhatsitNode: Node
---@field attr Node # list of attributes
---@field stream integer # *TeX*'s stream id number
---@field name string # file name
---@field ext string # file extension
---@field area string # file area (this may become obsolete)

_N._whatsit.write = 1

---
---@class WriteWhatsitNode: Node
---@field attr Node # list of attributes
---@field stream number # *TeX*'s stream id number
---@field data table # a table representing the token list to be written

_N._whatsit.close = 2

---
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
---@class UserDefinedWhatsitNode: WhatsitNode
---@field user_id number # id number
---@field type 97|100|108|110|115|116 # The `type` can have one of six distinct values. The number is the ASCII value if the first character of the type name (so you can use string.byte("l") instead of `108`): 97 “a” list of attributes (a node list), 100 “d” a *Lua* number, 108 “l” a *Lua* value (table, number, boolean, etc), 110 “n” a node list, 115 “s” a *Lua* string, 116 “t” a *Lua* token list in *Lua* table form (a list of triplets).
---@field value number|Node|string|table

_N._whatsit.save_pos = 6

---
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
---@class SpecialWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field data string # the `special` information

_N._whatsit.pdf_literal = 16

---
---Possible mode values are:
---
--- value  keyword
---
--- 0      `origin`
--- 1      `page`
--- 2      `direct`
--- 3      `raw`
--- 4      `text`
---
---The higher the number, the less checking and the more you can run into trouble.
---Especially the `raw` variant can produce bad *PDF* so you can best check
---what you generate.
---@class PdfLiteralWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field mode number # the “mode” setting of this literal
---@field data string # the to be written information stored as *Lua* string
---@field token string # the to be written information stored as token list

_N._whatsit.pdf_refobj = 17

---
---@class PdfRefobjWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field objnum number # the referenced *PDF* object number

_N._whatsit.pdf_annot = 18

---
---@class PdfAnnotWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field objnum number # the referenced *PDF* object number
---@field data string # the annotation data

_N._whatsit.pdf_start_link = 19

---
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
---@class PdfEndLinkWhatsitNode: WhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_dest = 21

---
---@class PdfDestWhatsitNode: WhatsitNode
---@field attr Node # list of attributes
---@field width number # the width (not used in calculations)
---@field height number # the height (not used in calculations)
---@field depth number # the depth (not used in calculations)
---@field named_id number # is the `dest_id` a string value?
---@field dest_id number # the destination id  string    the destination name
---@field dest_type number # type of destination
---@field xyz_zoom number # the zoom factor (times 1000)
---@field objnum number # the *PDF* object number; for structure references the *PDF* object number of the linked structure element

_N._whatsit.pdf_action = 22

---
---@class PdfActionWhatsitNode: WhatsitNode
---@field action_type number # the kind of action involved
---@field action_id number # or string  token list reference or string
---@field named_id number # are `dest_id` and `struct_id string  values?
---@field file string # the target filename
---@field new_window number # the window state of the target
---@field data string # the name of the destination
---@field struct_id nil # the action does not reference a structure
---@field destination number|string id of the referenced structure or name of the referenced structure destination

_N._whatsit.pdf_thread = 23

---
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

---
---@class PdfSetmatrixWhatsitNode
---@field attr Node # list of attributes
---@field data string # data

_N._whatsit.pdf_save = 30

---
---@class PdfSaveWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_restore = 31

---
---@class PdfRestoreWhatsitNode
---@field attr Node # list of attributes

_N._whatsit.pdf_thread_data = 26

_N._whatsit.pdf_link_data = 27

_N._whatsit.pdf_link_state = 32

_N.unset = 15

---
---@class UnsetNode: Node

_N.align_record = 30

---
---@class AlignRecordNode: Node

_N.pseudo_file = 31

---
---@class PseudoFileNode: Node

_N.pseudo_line = 32

---
---@class PseudoLineNode: Node

_N.page_insert = 33

---
---@class PageInsertNode: Node

_N.split_insert = 34

---
---@class Split_InsertNode: Node

_N.expr_stack = 35

---
---@class ExprStackNode: Node

_N.nested_list = 36

---
---@class Nested_ListNode: Node

_N.span = 37

---
---@class SpanNode: Node

_N.attribute = 38

---
---@class AttributeNode: Node

_N.attribute_list = 40

---
---@class AttributeListNode: Node

_N.temp = 41

---
---@class TempNode: Node

_N.align_stack = 42

---
---@class AlignStackNode: Node

_N.movement_stack = 43

---
---@class MovementStackNode: Node

_N.if_stack = 44

---
---@class IfStackNode: Node

_N.unhyphenated = 45

---
---@class UnhyphenatedNode: Node

_N.hyphenated = 46

---
---@class HyphenatedNode: Node

_N.delta = 47

---
---@class DeltaNode: Node

_N.passive = 48

---
---@class PassiveNode: Node

_N.shape = 49

---
---@class ShapeNode: Node

_N._7_2_is_node = 145

---
---This function returns a number (the internal index of the node) if the argument is a userdata
---object of type <node> and false when no node is passed.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1199-L1211)
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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1218-L1224](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1218-L1224)
---
---@return table
function node.types() end

---
---TEX’s ‘whatsits’ all have the same id. The various subtypes are defined by their subtype fields.
---The function is much like types, except that it provides an array of subtype mappings.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1226-L1233](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1226-L1233)
---
---@return table
function node.whatsits() end

_N._7_4_id = 145

---
---Convert a single type name to its internal numeric representation.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1235-L1244](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1235-L1244)
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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1299-L1314](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1299-L1314)
---
---@param id integer|NodeTypeName
---@param subtype? integer|string
---
---@return Node
function node.new(id, subtype) end

_N._7_9_free_flush_node_list = 146

---
---The next one the node `n` from *TeX*'s memory. Be careful: no checks are
---done on whether this node is still pointed to from a register or some `next` field: it is up to you to make sure that the internal data structures
---remain correct.
---
---```
---<node> next =
---    node.free(<node> n)
---flush_node(<node> n)
---```
---
---The `free` function returns the next field of the freed node
---
---@param n Node
---@return Node next
function node.free(n) end

---
---while the
---`flush_node` alternative returns nothing.
---@param n Node
function node.flush_node(n) end

---
---A list starting with node `n` can be flushed from *TeX*'s memory too. Be
---careful: no checks are done on whether any of these nodes is still pointed to
---from a register or some `next` field: it is up to you to make sure that the
---internal data structures remain correct.
---@param n Node
function node.flush_list(n) end

_N._7_10_copy_copy_list = 147

---
---This creates a deep copy of node `n`, including all nested lists as in the case
---of a hlist or vlist node. Only the `next` field is not copied.
---@param n Node
---@return Node m
function node.copy(n) end

---
---A deep copy of the node list that starts at `n` can be created too. If
---`m` is also given, the copy stops just before node `m`.
---
---Note that you cannot copy attribute lists this way. However, there is normally no
---need to copy attribute lists as when you do assignments to the `attr` field
---or make changes to specific attributes, the needed copying and freeing takes
---place automatically.
---@param n Node
---@param m? Node
---@return Node m
function node.copy_list(n, m) end

_N._7_11_prev_next = 147

---
---These returns the node preceding the given node, or `nil` if
---there is no such node.
---@param n Node
---@return Node m
function node.prev(n) end

---
---These returns the node following the given node, or `nil` if
---there is no such node.
---@param n Node
---@return Node m
function node.next(n) end

_N._7_12_current_attr = 0

---
---This returns the currently active list of attributes, if there is one.
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
---Note: this function is somewhat experimental, and it returns the {\it actual}
---attribute list, not a copy thereof. Therefore, changing any of the attributes in
---the list will change these values for all nodes that have the current attribute
---list assigned to them.
---
---@return Node m
function node.current_attr() end

_N._7_13_hpack = 0

---
---This function creates a new hlist by packaging the list that begins at node `n` into a horizontal box. With only a single argument, this box is created using
---the natural width of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `w` is the
---additional (`\hbox spread`) or exact (`\hbox to`) width to be used.
---The second return value is the badness of the generated box.
---
---Caveat: there can be unexpected side-effects to this function, like updating
---some of the `marks` and `\inserts`. Also note that the content of
---`h` is the original node list `n`: if you call `node.free(h)`
---you will also free the node list itself, unless you explicitly set the `list` field to `nil` beforehand. And in a similar way, calling `node.free(n)` will invalidate `h` as well!
---
---@param n Node
---@param w? integer
---@param info? string
---@param dir? string
---
---@return Node n
---@return integer b
function node.hpack(n, w, info, dir) end

_N._7_14_vpack = 0

---
---This function creates a new vlist by packaging the list that begins at node `n` into a vertical box. With only a single argument, this box is created using
---the natural height of its components. In the three argument form, `info`
---must be either `additional` or `exactly`, and `w` is the
---
---The second return value is the badness of the generated box. See the description
---of `hpack` for a few memory allocation caveats.
---
---@param n Node
---@param w? integer
---@param info? string
---@param dir? string
---
---@return Node n
---@return integer b
function node.vpack(n, w, info, dir) end

_N._7_15_prepend_prevdepth = 0

---
---This function is somewhat special in the sense that it is an experimental helper
---that adds the interlinespace to a line keeping the baselineskip and lineskip into
---account.
---
---@param n Node
---@param prevdepth integer
function node.prepend_prevdepth(n, prevdepth) end

_N._7_16_dimensions_rangedimensions = 149

---
---This function calculates the natural in-line dimensions of the end of the node list starting
---at node `n`. The return values are scaled points.
---
---You need to keep in mind that this is one of the few places in *TeX* where floats
---are used, which means that you can get small differences in rounding when you
---compare the width reported by `hpack` with `dimensions`.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
---
---@param n Node
---@param dir? DirectionSpecifier
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.dimensions(n, dir) end

---
---This function calculates the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
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
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
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

---
---This function calculates the natural in-line dimensions of the node list starting
---at node `n` and terminating just before node `t`.
---
---This is an
---alternative format that starts with glue parameters as the first three arguments.
------
---[Source: luatex-nodes.tex#L1490-L1546](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1490-L1546)
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
---The second alternative saves a few lookups and can be more convenient in some
---cases:
---
---@param parent Node
---@param first Node
---@param last? Node
---
---@return integer w # scaled points
---@return integer h # scaled points
---@return integer d # scaled points
function node.rangedimensions(parent, first, last) end

_N._7_17_mlist_to_hlist = 0

---
---This runs the internal mlist to hlist conversion, converting the math list in
---`n` into the horizontal list `h`. The interface is exactly the same
---as for the callback `mlist_to_hlist`.
---
---@param n Node
---@param display_type string
---@param penalties boolean
---
---@return Node h
function node.mlist_to_hlist(n, display_type, penalties) end

_N._7_18_slide = 0

---
---see _N._9_9

_N._7_19_tail = 152

---
---Returns the last node of the node list that starts at `n`.
---
---@param n Node
---
---@return Node m
function node.tail(n) end

_N._7_20_length_and_count = 0

---
---Returns the number of nodes contained in the node list that starts at `n`.
---If `m` is also supplied it stops at `m` instead of at the end of the
---list. The node `m` is not counted.
---
---@param n Node
---@param m? Node
---
---@return integer i
function node.length(n, m) end

---
---Returns the number of nodes contained in the node list that starts at `n`
---that have a matching `id` field. If `m` is also supplied, counting
---stops at `m` instead of at the end of the list. The node `m` is not
---counted. This function also accept string `id`'s.
---
---@param id integer
---@param n Node
---@param m? Node
---
---@return integer i
function node.count(id, n, m) end

_N._7_21_is_char_and_is_glyph = 0

---
---The subtype of a glyph node signals if the glyph is already turned into a character reference
---or not.
---@param n Node
---@return boolean b
function node.is_char(n) end

---
---The subtype of a glyph node signals if the glyph is already turned into a character reference
---or not.
---
---@param n Node
---
---@return boolean b
function node.is_glyph(n) end

_N._7_22_traverse = 0

---
---```
---<node> t, id, subtype =
---    node.traverse(<node> n)
---```
---
---This is a *Lua* iterator that loops over the node list that starts at `n`.
---Typically code looks like this:
---
---```lua
---for n in node.traverse(head) do
---   ...
---end
---```
---
---is functionally equivalent to:
---
---```lua
---do
---  local n
---  local function f (head,var)
---    local t
---    if var == nil then
---       t = head
---    else
---       t = var.next
---    end
---    return t
---  end
---  while true do
---    n = f (head, n)
---    if n == nil then break end
---    ...
---  end
---end
---```
---
---It should be clear from the definition of the function `f` that even though
---it is possible to add or remove nodes from the node list while traversing, you
---have to take great care to make sure all the `next` (and `prev`)
---pointers remain valid.
---
---If the above is unclear to you, see the section “For Statement” in the
---*Lua* Reference Manual.
---
---@param n Node
---
---@return Node t
---@return integer id
---@return integer subtype
function node.traverse(n) end

---

_N._7_23_traverse_id = 0

---
---```
---<node> t, subtype =
---    node.traverse_id(<number> id, <node> n)
---```
---
---This is an iterator that loops over all the nodes in the list that starts at
---`n` that have a matching `id` field.
---
---See the previous section for details. The change is in the local function `f`, which now does an extra while loop checking against the upvalue `id`:
---
---```
--- local function f(head,var)
---   local t
---   if var == nil then
---      t = head
---   else
---      t = var.next
---   end
---   while not t.id == id do
---      t = t.next
---   end
---   return t
--- end
---```
---
---@param id integer
---@param n Node
---
---@return Node t
---@return integer subtype
function node.traverse_id(id, n) end

_N._7_24_traverse_char_and_traverse_glyph = 0

---
---The `traverse_char` iterator loops over the `glyph` nodes in a list.
---Only nodes with a subtype less than 256 are seen.
---
---@param n Node
---
---@return Node n
---@return integer font
---@return integer char
function node.traverse_char(n) end

---
---The `traverse_glyph` iterator loops over a list and returns the list and
---filters all glyphs:
---
---@param n Node
---
---@return Node n
---@return integer font
---@return integer char
function node.traverse_glyph(n) end

_N._7_25_traverse_list = 0

---
---This iterator loops over the `hlist` and `vlist` nodes in a list.
---
---The four return values can save some time compared to fetching these fields but
---in practice you seldom need them all. So consider it a (side effect of
---experimental) convenience.
---
---@param n Node
---
---@return Node n
---@return integer id
---@return integer subtype
---@return Node list
function node.traverse_list(n) end

_N._7_26_has_glyph = 0

---
---This function returns the first glyph or disc node in the given list.
---
---@param n Node
---
---@return Node n
function node.has_glyph(n) end

_N._7_27_end_of_math = 0

---
---Looks for and returns the next `math_node` following the `start`. If
---the given node is a math end node this helper returns that node, else it follows
---the list and returns the next math endnote. If no such node is found nil is
---returned.
---
---@param n Node
---
---@return Node t
function node.end_of_math(n) end

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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1793-L1807](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1793-L1807)
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
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L1809-L1822](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1809-L1822)
---
---@param head Node
---@param current Node
---@param new Node
---
---@return Node head
---@return Node new
function node.insert_after(head, current, new) end

_N._7_31_first_glyph = 154

---
---Returns the first node in the list starting at `n` that is a glyph node
---with a subtype indicating it is a glyph, or `nil`. If `m` is given,
---processing stops at (but including) that node, otherwise processing stops at the
---end of the list.
---
---@param n Node
---@param m? Node
---
---@return Node n
function node.first_glyph(n, m) end

_N._7_32_ligaturing = 154

---
---Apply *TeX*-style ligaturing to the specified nodelist. The tail node `m` is
---optional. The two returned nodes `h` and `t` are the new head and
---tail (both `n` and `m` can change into a new ligature).
---
---@param n Node
---@param m? Node
---
---@return Node h
---@return Node t
---@return boolean success
function node.ligaturing(n, m) end

_N._7_33_kerning = 154

---
---Apply *TeX*-style kerning to the specified node list. The tail node `m` is
---optional. The two returned nodes `h` and `t` are the head and tail
---(either one of these can be an inserted kern node, because special kernings with
---word boundaries are possible).
---
---@param n Node
---@param m? Node
---
---@return Node h
---@return Node t
---@return boolean success
function node.kerning(n, m) end

_N._7_34_unprotect_glyphs = 155

---
---Subtracts 256 from all glyph node subtypes. This and the next function are
---helpers to convert from `characters` to `glyphs` during node
---processing. The second argument is optional and indicates the end of a range.
---@param n Node
function node.unprotect_glyph(n) end

---
---Subtracts 256 from all glyph node subtypes. This and the next function are
---helpers to convert from `characters` to `glyphs` during node
---processing. The second argument is optional and indicates the end of a range.
---
---@param n Node
---@param m? Node
function node.unprotect_glyphs(n, m) end

_N._7_35_protect_glyphs = 155

---
---Adds 256 to all glyph node subtypes in the node list starting at `n`,
---except that if the value is 1, it adds only 255. The special handling of 1 means
---that `characters` will become `glyphs` after subtraction of 256. A
---single character can be marked by the singular call. The second argument is
---optional and indicates the end of a range.
---
---@param n Node
function node.protect_glyph(n) end

---
---
---Adds 256 to all glyph node subtypes in the node list starting at `n`,
---except that if the value is 1, it adds only 255. The special handling of 1 means
---that `characters` will become `glyphs` after subtraction of 256. A
---single character can be marked by the singular call. The second argument is
---optional and indicates the end of a range.
---
---@param n Node
---@param m? Node
function node.protect_glyphs(n, m) end

_N._7_36_last_node = 155

---
---This function pops the last node from *TeX*'s “current list”. It returns
---that node, or `nil` if the current list is empty.
---
---@return Node n
function node.last_node() end

_N._7_37_write = 155

---
---This function that will append a node list to *TeX*'s “current list”. The
---node list is not deep-copied! There is no error checking either! You mignt need
---to enforce horizontal mode in order for this to work as expected.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2518-L2521), [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1913-L1923)
---
---@param n Node
function node.write(n) end

_N._7_38_protrusion_skippable = 155

---
---Returns `true` if, for the purpose of line boundary discovery when
---character protrusion is active, this node can be skipped.
---
---@param n Node
---
---@return boolean skippable
function node.protrusion_skippable(n) end

_N._8_glue = 155

_N._8_1_setglue = 155

---
---You can set the five properties of a glue in one go. Non-numeric values are
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
---@param n Node
---@param width integer|any
---@param stretch integer|any
---@param shrink integer|any
---@param stretch_order integer|any
---@param shrink_order integer|any
function node.setglue(n, width, stretch, shrink, stretch_order, shrink_order) end

_N._8_2_getglue = 155

---
---The next call will return 5 values or nothing when no glue is passed.
---
---When the second argument is false, only the width is returned (this is consistent
---with `tex.get`).
---
---When a list node is passed, you get back the glue that is set, the order of that
---glue and the sign.
---
---
---@param n Node
---
---@return integer|nil width
---@return integer|nil stretch
---@return integer|nil shrink
---@return integer|nil stretch_order
---@return integer|nil shrink_order
function node.getglue(n) end

_N._8_3_is_zero_glue = 156

---
---This function returns `true` when the width, stretch and shrink properties
---are zero.
---
---@param n Node
---
---@return boolean isglue
function node.is_zero_glue(n) end

_N._9_attribute_handling = 156
_N._9_1_attributes = 156
_N._9_2_attribute_list_nodes = 156
_N._9_3_attr_nodes = 157
_N._9_4_has_attribute = 157

---
---Tests if a node has the attribute with number `id` set. If `val` is
---also supplied, also tests if the value matches `val`. It returns the value,
---or, if no match is found, `nil`.
---
---@param n Node
---@param id integer
---@param val? integer
---
---@return integer v
function node.has_attribute(n, id, val) end

_N._9_5_get_attribute = 157

---
---
---Tests if a node has an attribute with number `id` set. It returns the
---value, or, if no match is found, `nil`. If no `id` is given then the
---zero attributes is assumed.
---
---@param n Node
---@param id integer
---
---@return integer v
function node.get_attribute(n, id) end

_N._9_6_find_attribute = 157

---
---Finds the first node that has attribute with number `id` set. It returns
---the value and the node if there is a match and otherwise nothing.
---
---@param n Node
---@param id integer
---
---@return integer v
---@return Node n
function node.find_attribute(n, id) end

_N._9_7_set_attribute = 157

---
---Sets the attribute with number `id` to the value `val`. Duplicate
---assignments are ignored.
---
---@param n Node
---@param id integer
---@param val? integer
function node.set_attribute(n, id, val) end

_N._9_8_unset_attribute = 158

---
---Unsets the attribute with number `id`. If `val` is also supplied, it
---will only perform this operation if the value matches `val`. Missing
---attributes or attribute-value pairs are ignored.
---
---If the attribute was actually deleted, returns its old value. Otherwise, returns
---`nil`.
---
---@param n Node
---@param id integer
---@param val? integer
---
---@return integer v
function node.unset_attribute(n, id, val) end

_N._9_9_slide = 158

---
---This helper makes sure that the node lists is double linked and returns the found
---tail node.
---
---After some callbacks automatic sliding takes place. This feature can be turned
---off with `node.fix_node_lists(false)` but you better make sure then that
---you don't mess up lists. In most cases *TeX* itself only uses `next`
---pointers but your other callbacks might expect proper `prev` pointers too.
---Future versions of *LuaTeX* can add more checking but this will not influence
---usage.
---
---@param n Node
---
---@return Node tail
function node.slide(n) end

_N._9_10_check_discretionaries = 158

---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it's ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in. You can call this function to check the list for
---issues with disc nodes.
---
---The plural variant runs over all disc nodes in a list, the singular variant
---checks one node only (it also checks if the node is a disc node).
---
---@param head Node
function node.check_discretionaries(head) end

---
---When you fool around with disc nodes you need to be aware of the fact that they
---have a special internal data structure. As long as you reassign the fields when
---you have extended the lists it's ok because then the tail pointers get updated,
---but when you add to list without reassigning you might end up in trouble when
---the linebreak routine kicks in. You can call this function to check the list for
---issues with disc nodes.
---
---@param n Node
function node.check_discretionary(n) end

_N._9_11_flatten_discretionaries = 158

---
---This function will remove the discretionaries in the list and inject the replace
---field when set.
---
---@param n Node
---
---@return Node head
---@return integer count
function node.flatten_discretionaries(n) end

_N._9_12_family_font = 158

---
---When you pass a proper family identifier the next helper will return the font
---currently associated with it. You can normally also access the font with the
---normal font field or getter because it will resolve the family automatically for
---noads.
---
---@param fam integer
---
---@return integer id
function node.family_font(fam) end

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
---* Source code of the `LuaTeX` manual: [lnodelib.c#L8397-L8410](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8397-L8410)
---
---@param node Node
---@param value any
function node.setproperty(node, value) end

---
---Each node also can have a properties table and you can get properties using the `getproperty` function.
---
---__Reference:__
---
---* Source code of the `LuaTeX` manual: [luatex-nodes.tex#L2518-L2521](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L2518-L2521), [lnodelib.c#L8373-L8383](https://github.com/TeX-Live/luatex/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/lnodelib.c#L8373-L8383)
---
---@param node Node
---
---@return any value
function node.getproperty(node) end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.set_properties_mode() end

---
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
function node.fix_node_lists() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.flush_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.get_properties_table() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.hyphenating() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.make_extensible() end

---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
function node.setfield() end

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
