# LuaTeX Lua API

Type definitions / Stubs for the Lua interface of LuaTeX and related Lua modules.

Install [Visual Studio Code](https://code.visualstudio.com/) and the
[lua-language-server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

[LuaTeX reference manual sources](https://github.com/TeX-Live/luatex/tree/trunk/manual)

```
git clone https://github.com/Josef-Friedrich/LuaTeX_Lua-API.git
```

`.vscode/settings.json`:

```json
{
"Lua.workspace.library": [
    "<repo>/src"
  ]
}
```

Quick info `node.id(type)`

![](resources/images/node.id.png)

Type error in `node.id(type)`

![](resources/images/node.id_wrong-type.png)

`node.id(type)` type definition

![](resources/images/node.id_definition.png)

Quick info `node.write(n)`

![](resources/images/node.write.png)

Signature overloads in `tex.sp()`

![](resources/images/tex.sp.png)

Documentation for the field `data` of the `pdf_colorstack` node:

![](resources/images/PdfColorstockWhatsitNode.data.png)

## Documentation

* [LuaTeX Mirror](https://github.com/TeX-Live/luatex)
* [pdfTeX Mirror](https://github.com/tex-mirror/pdftex)

## Howtos

* [Custom libraries](https://github.com/sumneko/lua-language-server/wiki/Libraries#custom)
* [@meta annotation](https://github.com/sumneko/lua-language-server/wiki/Annotations#meta)

## Other type definition / stub repos:

* [Template of the Lua interface itself](https://github.com/sumneko/lua-language-server/tree/master/meta/template)
* [In the lua-language-server included 3rd party libraries](https://github.com/sumneko/lua-language-server/tree/master/meta/3rd)
* [FiveM Lua Stubs](https://github.com/jamie-34254/fivem_lua_stubs)


```lua
------
---Source: [luatex-nodes.tex#L1199-L1211](https://github.com/TeX-Live/luatex/blob/3f14129c06359e1a06dd2f305c8334a2964149d3/manual/luatex-nodes.tex#L1199-L1211)
---
```

```lua
------
---Source: []()
---
```
