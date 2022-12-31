# luatex-lua-library

Type definitions / Stubs for the Lua interface of LuaTeX

Install [Visual Studio Code](https://code.visualstudio.com/) and the
[lua-language-server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

[LuaTeX reference manual sources](https://github.com/TeX-Live/luatex/tree/trunk/manual)

```
git clone https://github.com/Josef-Friedrich/luatex-lua-library.git
```

`.vscode/settings.json`:

```json
{
"Lua.workspace.library": [
    // https://github.com/Josef-Friedrich/luatex-lua-library
    "/path/to/the/lualatex-lua-library/repo"
  ]
}
```

## Howtos

* [Custom libraries](https://github.com/sumneko/lua-language-server/wiki/Libraries#custom)
* [@meta annotation](https://github.com/sumneko/lua-language-server/wiki/Annotations#meta)

## Other type definition / stub repos:

* [Template of the Lua interface itself](https://github.com/sumneko/lua-language-server/tree/master/meta/template)
* [In the lua-language-server included 3rd party libraries](https://github.com/sumneko/lua-language-server/tree/master/meta/3rd)
* [FiveM Lua Stubs](https://github.com/jamie-34254/fivem_lua_stubs)
