# LuaTeX Lua API

Type definitions for the Lua API of `LuaTeX` and related projects.

![](resources/screencasts/node.new.gif)

[LuaTeX](http://luatex.org) has a very large [Lua](https://www.lua.org)
API. This project tries to make this API accessible in the text editor
of your choice. This is made possible by the
[lua-language-server](https://github.com/LuaLS/lua-language-server) - a
server that implements the [Language Server Protocol
(LSP)](https://en.wikipedia.org/wiki/Language_Server_Protocol) for the
`Lua` language. Features such as code completion, syntax highlighting
and marking of warnings and errors, should therefore not only be
possible in [Visual Studio Code](https://code.visualstudio.com), but in
a [large number of
editors](https://langserver.org/#implementations-client) that support
the `LSP`.

## Subprojects

* [lualatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/lualatex)
* [lualibs](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/lualibs)
* [luametatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/luametatex)
* [luaotfload](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/luaotfload)
* [luatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/luatex)

## Distribution ...

## via CTAN

![](resources/images/Screenshot_CTAN.png)

The type definitions are published on
[CTAN](https://www.ctan.org/pkg/luatex-type-definitions) as a single
file to avoid cluttering the CTAN directory with many individual Lua
files. Since this one file is just under 1.5 MB in size, a configuration
must be made so that the language server can load the file. The
following configuration example sets the preload file size to a maximum
of 5000 kB.

```json
{
    "Lua.workspace.preloadFileSize": 5000,
}
```

There are several ways to include type definitions in a project.
The easiest way is to copy the file into the project folder.
Or you can use the configuration `Lua.workspace.library`:

```json
{
    "Lua.workspace.library": ["/path/to/luatex-type-definitions.lua"]
}
```

### via Visual Studio Code Extension

![](resources/images/Screenshot_VSCode-extension.png)

* [Visual Studio Code LuaTeX Extension](https://github.com/Josef-Friedrich/vscode_LuaTeX_Lua-API)
  ← [library](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library)

### via LuaCATS git respositories

![](resources/images/Screenshot_LuaCATS.png)

[LuaCATS](https://github.com/LuaCATS) is a [Github](https://github.com)
organisation and stands for *“Lua Comment And Type System”*. This
organization provides a place for community projects to live. These
projects are [addons](https://luals.github.io/wiki/addons) for popular
libraries/frameworks.
The repositories in this organization are used by
[LLS-Addons](https://github.com/LuaLS/LLS-Addons), a repository that is used by the [addon
manager](https://luals.github.io/wiki/addons/#addon-manager) of the [VS
Code
extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
for the [Lua Language Server]([lls](https://github.com/LuaLS/lua-language-server)).

#### All related LuaCATS repositories

This repositories in LuaCATS are related to this project:

* [lmathx](https://github.com/LuaCATS/lmathx)
* [lpeg](https://github.com/LuaCATS/lpeg)
* [luafilesystem](https://github.com/LuaCATS/luafilesystem)
* [luaharfbuzz](https://github.com/LuaCATS/luaharfbuzz)
* [luasocket](https://github.com/LuaCATS/luasocket)
* [luazip](https://github.com/LuaCATS/luazip)
* [lzlib](https://github.com/LuaCATS/lzlib)
* [md5](https://github.com/LuaCATS/md5)
* [slnunicode](https://github.com/LuaCATS/slnunicode)
* [tex-lualatex](https://github.com/LuaCATS/tex-lualatex)
* [tex-lualibs](https://github.com/LuaCATS/tex-lualibs)
* [tex-luametatex](https://github.com/LuaCATS/tex-luametatex)
* [tex-luatex](https://github.com/LuaCATS/tex-luatex)

#### Upstream LuaCATS repositories

The following repositories are *upstream* projects. This means: The type
definitions are developed in a LuaCATS repository and *pulled* in by
this project.

* [LuaCATS: lmathx](https://github.com/LuaCATS/lmathx)
  → [library/luametatex/lmathx.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luametatex/lmathx.lua)
* [LuaCATS: lpeg](https://github.com/LuaCATS/lpeg)
  → [library/luatex/lpeg.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/lpeg.lua)
* [LuaCATS: luaharfbuzz](https://github.com/LuaCATS/luaharfbuzz)
  → [library/luatex/luaharfbuzz.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/luaharfbuzz.lua)
* [LuaCATS: luasocket](https://github.com/LuaCATS/luasocket)
  → [library/luatex/socket.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/socket.lua)
  → [library/luatex/mime.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/mime.lua)
* [LuaCATS: luazip](https://github.com/LuaCATS/luazip)
  → [library/luatex/zip.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/zip.lua)
* [LuaCATS: lzlib](https://github.com/LuaCATS/lzlib)
  → [library/luatex/zlib.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/zlib.lua)
* [LuaCATS: md5](https://github.com/LuaCATS/md5)
  → [library/luatex/md5.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/md5.lua)
* [LuaCATS: slnunicode](https://github.com/LuaCATS/slnunicode)
  → [library/luatex/unicode.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/unicode.lua)

#### Subprojects (push) detached from this repository

The following repositories are *downstream* projects. This means: The
type definitions are developed in this project. They are then *pushed*
into a LuaCATS repository.

* [LuaCATS: tex-lualatex](https://github.com/LuaCATS/tex-lualatex)
  ← [library/lualatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/lualatex)
* [LuaCATS: tex-luatex](https://github.com/LuaCATS/tex-luatex)
  ← [library/luatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/luatex)
* [LuaCATS: tex-lualibs](https://github.com/LuaCATS/tex-lualibs)
  ← [library/lualibs](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/lualibs)
* [LuaCATS: tex-luametatex](https://github.com/LuaCATS/tex-luametatex)
  ← [library/luametatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/library/luametatex)

## Directory structure of the repository

In the subfolder `library` are files named after the global libraries
they document. For example, the `library/tex.lua` file contains the
documentation for the `tex` library. These *Lua* files don’t contain
real *Lua* code. They consist only of function bodies and empty
tables. The main focus is in the docstrings.

The API documentation is written in a [well documented annotation
format](https://luals.github.io/wiki/annotations).
This format is based on the [EmmyLua](https://emmylua.github.io)
format. Unfortunately, the *Lua* community has not yet been able to
agree on a standarized annotation format. Many *Lua* project are
documented in the [LDoc](https://github.com/lunarmodules/LDoc) format.
However, the differences between these formats are marginal.

### Directory `library`

The actual definitions are located in the directory `library`. This
directory is divided into further subdirectories. In the folder `luatex`
you will find the definitions that the engine *LuaTeX* provides. The
folder `lualibs` documents the extension library of the same name. If
you use `lualatex`, you may be interested in the folder of the same
name.

### Directory `resources`

The folder `resources` contains *TeX* manuals and *HTML* online
documentation  converted into *Lua* docstrings.

### Directory `examples`

The `example` folder contains *TeX* and *Lua* files for demonstrating
and testing the documented Lua API.

## Current version

2025/07/24 v0.2.0

## License

Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
------------------------------------------------------------------------

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 2 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details.

You should have received a copy of the GNU General Public License along
with this program. If not, see <https://www.gnu.org/licenses/>.

## Installation / Setup for Visual Studio Code

Install [Visual Studio Code](https://code.visualstudio.com/) and the
[lua-language-server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).


```
git clone https://github.com/Josef-Friedrich/LuaTeX_Lua-API.git
```

`.vscode/settings.json`:

```json
{
"Lua.workspace.library": [
    "<repo>/library"
  ]
}
```

## How to contribute

The preferred method of contributing to the project is via Github pull
requests. You can also email patches to josef@friedrich.rocks.
It is ok if you only document the data types of the input parameters.

Use imperative mood for the first line: https://peps.python.org/pep-0257/

`Please contribute!` messages

Default message:

```lua
---😱 [Types](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/library/luatex/pdf.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/pulls)
```

No documentation at all:

```lua
---
---Warning! Undocumented code!<p>
---TODO: Please contribute
---https://github.com/Josef-Friedrich/LuaTeX_Lua-API#how-to-contribute
```

### Minimal example of `tex.sp()`

```lua
---
---@param s string
function tex.sp(s) end
```

### Less minimal example of `tex.sp()`

```lua
---
---@param s string
---
---@return integer
function tex.sp(s) end
```

Or if you have more time you can also expand the documentation to this
level:

### Prime example of `tex.sp()`

```lua
---@meta

tex = {}

---
---Convert a string `s` that represents an explicit
---dimension into an integer number of scaled points.
---
---For parsing the string, the same scanning and conversion rules are used that
---*LuaTeX* would use if it was scanning a dimension specifier in its *TeX*-like
---input language (this includes generating errors for bad values), expect for the
---following:
---
---* only explicit values are allowed, control sequences are not handled
---* infinite dimension units (`fil...`) are forbidden
---* `mu` units do not generate an error (but may not be useful either)
---
---__Example:__
---
---```lua
---local scaled_points = tex.sp('1cm')
---print(scaled_points) -- 1864679
---```
---
---__Reference:__
---
---* `LuaTeX` manual: 10.3.15.5 `sp` page 204
---* Source file of the `LuaTeX` manual: [luatex-tex.tex#L1386-L1413](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-tex.tex#L1386-L1413)
---
---@param s string # A string to convert into scaled points.
---
---@return integer # The dimension in the scaled points format.
function tex.sp(s) end
```

The docstring above is rendered as follows in Visual Studio Code:

![](resources/images/tex.sp.png)

The description text can be or was taken from the official [LuaTeX
reference manual](https://github.com/TeX-Live/luatex/tree/trunk/manual).
In the project folder
[resources/manuals/luatex](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/tree/main/resources/manuals/luatex)
you will find slightly edited `Lua` versions of the `LuaTeX` manual
sources.

1.  [Preamble](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/01_preamble.tex.lua)
2.  [Basic TEX enhancements](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/02_enhancements.tex.lua)
3.  [Modifications](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/03_modifications.tex.lua)
4.  [Using LUATEX](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/04_lua.tex.lua)
5.  [Languages, characters, fonts and glyphs](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/05_languages.tex.lua)
6.  [Font structure](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/06_fonts.tex.lua)
7.  [Math](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/07_math.tex.lua)
8.  [Nodes](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/08_nodes.tex.lua)
9.  [LUA callbacks](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/09_callbacks.tex.lua)
10. [The TEX related libraries](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/10_tex.tex.lua)
11. [The graphic libraries](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/11_graphics.tex.lua)
12. [The fontloader](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/12_fontloader.tex.lua)
13. [The HarfBuzz libraries](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/13_harfbuzz.tex.lua)
14. [The backend libraries](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/luatex/14_backend.tex.lua)

This quick hacked and very ugly Python script
[resources/manuals/convert-tex-to-lua-docstrings.py](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/manuals/convert-tex-to-lua-docstrings.py)
was used to convert the source files.

### Navigation table `_N`

Some Lua files contain a table named `_N`. `_N` stands for `navigation`.
With the help of this table and the outline view of the editor, it is
easier to navigate through the documentation. The name is inspired by
the global Lua table `_G`. Many parts of the documentation, such as the
definition of the various `Node` classes, are not shown in the outline.
If the API documentation is published, the `_N` table can be commented
out.

### Documentation of function overloading

`LuaTeX` makes extensive use of function overloading. The following
example is taken from the `LuaTeX` manual:

```
<number> w, <number> h, <number> d =
  node.dimensions(<node> n)
<number> w, <number> h, <number> d =
  node.dimensions(<node> n, <string> dir)
<number> w, <number> h, <number> d =
  node.dimensions(<node> n, <node> t)
<number> w, <number> h, <number> d =
  node.dimensions(<node> n, <node> t, <string> dir)
<number> w, <number> h, <number> d =
  node.dimensions(<number> glue_set, <number> glue_sign, <number> glue_order, <node> n)
<number> w, <number> h, <number> d =
  node.dimensions(<number> glue_set, <number> glue_sign, <number> glue_order, <node> n, <string> dir)
<number> w, <number> h, <number> d =
  node.dimensions(<number> glue_set, <number> glue_sign, <number> glue_order, <node> n, <node> t)
<number> w, <number> h, <number> d =
  node.dimensions(<number> glue_set, <number> glue_sign, <number> glue_order, <node> n, <node> t, <string> dir)
```

This can easily be done by documenting the function with the same name
but different signatures multiple times.

[Issue for further improvement of the function loading](https://github.com/sumneko/lua-language-server/issues/1456)

Function overloading in `tex.sp()`

![](resources/images/tex.sp_overload.png)

### Documentation of nodes

A node (object) can be described by the `@class` annotation and provided
with some documentation about its attributes using `@field`. There is a base class `Node` for all node type classes.

```lua
---
---A node that comprise actual typesetting commands. A few fields are
---present in all nodes regardless of their type, these are:
---
---@class Node
---@field next Node|nil # the next node in a list, or nil
---@field prev Node|nil # That prev field is always present, but only initialized on explicit request ...
```

The `KernNode` class for example inherits from `Node` and represents
a kern node.

```lua
---
---The `kern` command creates such nodes but for instance the font and math
---machinery can also add them.
---
---@class KernNode: Node
---@field subtype KernNodeSubtype
---@field kern integer # Fixed horizontal or vertical advance (in scaled points)
```

```lua
---@alias KernNodeSubtype
---|0 # fontkern
---|1 # userkern
---|2 # accentkern
---|3 # italiccorrection
```

The `@cast` annotation forces a unspecific node to a distinct node type.

```lua
while n do
  if n.id == node.id('kern') then
    ---@cast n KernNode
    print(n.kern)
  end
  n = n.next
end
```

Use `--[[@as <node type>]]` to force a node type onto an expression.

```lua
local kern = node.new('kern') --[[@as KernNode]]
```

![](resources/images/cast.png)


### Documentation of callback functions

How a callback function is documented is shown using the
`pre_linebreak_filter` as an example.

#### @alias `PreLinebreakFilterGroupCode`

```lua
---
---The string called `groupcode` identifies the nodelist's context within
---*TeX*'s processing. The range of possibilities is given in the table below, but
---not all of those can actually appear in `pre_linebreak_filter`, some are
---for the `hpack_filter` and `vpack_filter` callbacks that will be
---explained in the next two paragraphs.
---@alias PreLinebreakFilterGroupCode
---|'' # main vertical list
---|'hbox' # hbox` in horizontal mode
---|'adjusted_hbox' #hbox` in vertical mode
---|'vbox' # vbox`
---|'vtop' # vtop' #
---|'align' # halign` or `valign`
---|'disc' # discretionaries
---|'insert' # packaging an insert
---|'vcenter' # vcenter`
---|'local_box' # localleftbox` or `localrightbox`
---|'split_off' # top of a `vsplit`
---|'split_keep' # remainder of a `vsplit`
---|'align_set' # alignment cell
---|'fin_row' # alignment row
```

#### @alias `NodeCallbackReturn`


```lua
---
---As for all the callbacks that deal with nodes, the return value can be one of
---three things:
---
---* boolean `true` signals successful processing
---* `<node>` signals that the “head” node should be replaced by the
---  returned node
---* boolean `false` signals that the “head” node list should be
---  ignored and flushed from memory
---@alias NodeCallbackReturn true|false|Node
```

#### @alias `PreLinebreakFilter`

```lua
---
---# `pre_linebreak_filter` callback
---
---This callback is called just before *LuaTeX* starts converting a list of nodes
---into a stack of `hbox`es, after the addition of `parfillskip`.
---
---```lua
------@type PreLinebreakFilter
---function(head, groupcode)
---  --- true|false|node
---  return true
---end
---```
---
---This callback does not replace any internal code.
---@alias PreLinebreakFilter fun(head: Node, groupcode: PreLinebreakFilterGroupCode): NodeCallbackReturn
```

Annotation your custom callback function with `@type`.

```lua
---@type PreLinebreakFilter
local function visit_nodes(head, group)
  return true
end

luatexbase.add_to_callback('pre_linebreak_filter', visit_nodes, 'visit nodes')
```

![](resources/images/PreLinebreakFilter.png)

Quick info `node.id(type)`

![](resources/images/node.id.png)

Type error in `node.id(type)`

![](https://raw.githubusercontent.com/Josef-Friedrich/LuaTeX_Lua-API/main/resources/images/node.id_wrong-type.png)

`node.id(type)` type definition

![](https://raw.githubusercontent.com/Josef-Friedrich/LuaTeX_Lua-API/main/resources/images/node.id_definition.png)

Quick info `node.write(n)`

![](https://raw.githubusercontent.com/Josef-Friedrich/LuaTeX_Lua-API/main/resources/images/node.write.png)

Documentation for the field `data` of the `pdf_colorstack` node:

![](https://raw.githubusercontent.com/Josef-Friedrich/LuaTeX_Lua-API/main/resources/images/PdfColorstockWhatsitNode.data.png)

## Documentation

* [LuaTeX Repo](https://gitlab.lisn.upsaclay.fr/texlive/luatex/) [LuaTeX Mirror](https://github.com/TeX-Live/luatex)
* [pdfTeX Mirror](https://github.com/tex-mirror/pdftex)

## Howtos

* [Custom libraries](https://github.com/sumneko/lua-language-server/wiki/Libraries#custom)
* [@meta annotation](https://github.com/sumneko/lua-language-server/wiki/Annotations#meta)

## Other type definition / stub repos:

* [Template of the Lua interface itself](https://github.com/sumneko/lua-language-server/tree/master/meta/template)
* [In the lua-language-server included 3rd party libraries](https://github.com/sumneko/lua-language-server/tree/master/meta/3rd)
* [FiveM Lua Stubs](https://github.com/jamie-34254/fivem_lua_stubs)


## References

```lua
---
---__Reference:__
---
---* Corresponding C source code: [ltexlib.c#L1430-L1436](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/source/texk/web2c/luatexdir/lua/ltexlib.c#L1430-L1436)
---* Source file of the `LuaTeX` manual: [luatex-nodes.tex#L1199-L1211](https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/f52b099f3e01d53dc03b315e1909245c3d5418d3/manual/luatex-nodes.tex#L1199-L1211)
---* Corresponding plain TeX control sequence: [\sfcode](https://www.tug.org/utilities/plain/cseq.html#sfcode-rp)
---* Victor Eijkhout. “TeX by Topic” (1991, 2007) [page 185](http://mirrors.ctan.org/info/texbytopic/TeXbyTopic.pdf)
---* Donald Ervin Knuth. “The TexBook” (1984): page 76. Also: 76, 271, 285, 363, 433. [TeX-Source](https://ctan.org/tex-archive/systems/knuth/dist/tex/texbook.tex) [PDF](https://visualmatheditor.equatheque.net/doc/texbook.pdf)
---David Bausum. “TeX Reference Manual” (2002) [](https://www.tug.org/utilities/plain/cseq.html)
```

```lua
---
---__Reference:__
---
---* Source file of the `LuaTeX` manual: []()
---
```

## Global namespaces

The Makefile provides targets for printing the global namespace
available on the specific engines. The Makefile uses some Lua functions
to output all functions and tables of the global namespace that can be
found in
[utils.lua](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/utils.lua).

To print the [LuaTeX global
namespace](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/namespaces/luatex.md):

```
make namespace_luatex
```

To print the [LuaMetaTeX global namespace](https://github.com/Josef-Friedrich/LuaTeX_Lua-API/blob/main/resources/namespaces/luametatex_luaonly.md):

```
make namespace_luametatex
```
