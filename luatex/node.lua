---@meta

--- https://github.com/TeX-Live/luatex/blob/trunk/manual/luatex-nodes.tex

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

--https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L49

---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil
---@field id number # the node’s type (id) number
---@field subtype number # the node subtype identifier
---@field head? Node

---@class WhatsitNode: Node
---@field type number
---@field user_id number
---@field value number

---@class ColorstackWhatsitNode: WhatsitNode
---@field stack number
---@field data string

---@class HlistNode: Node
---@field head Node
---@field glue_set number
---@field glue_sign number
---@field glue_order number
---@field width number

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
---Source: [luatex-nodes.tex#L1913-L1923](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1913-L1923)
---
---@param n Node
function node.write(n) end
