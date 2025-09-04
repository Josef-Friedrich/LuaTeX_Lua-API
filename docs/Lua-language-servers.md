### Overview of the existing Lua language server

#### lua-language-server

The most popular language server, simply named
[lua-language-server](https://github.com/LuaLS/lua-language-server), was
created by a Chinese with the nickname
[*sumneko*](https://github.com/sumneko). In addition to the nickname,
*sumnekos* Github profile also shows 最萌小汐 in Chinese characters,
which means “The cutest Xiaoxi”[^google-translate] or “Xiao Shi, the
most adorable child in the world”[^deepl]. The [first
commit](https://github.com/LuaLS/lua-language-server/commit/3546129c29fbfd7211099a3fbee03a763915ab58)
in the Git repository was made on 7 September 2018. The
*lua-language-server* is written in Lua. In August 2025, the repository
on Gibhub has around 3,800 stars.

[^google-translate]: https://translate.google.de/?sl=zh-CN&tl=en&text=%E6%9C%80%E8%90%8C%E5%B0%8F%E6%B1%90%20&op=translate
[^deepl]: https://www.deepl.com/en/translator#zh/en-gb/%E6%9C%80%E8%90%8C%E5%B0%8F%E6%B1%90

### EmmyLua Analyzer Rust

A promising language server that is not written in Lua but in Rust is
the [EmmyLua Analyzer
Rust](https://github.com/EmmyLuaLs/emmylua-analyzer-rust). This server
was written by [CppCXY](https://github.com/CppCXY), the developer with
the most commits after sumneko. The new server is advertised in
[several](https://github.com/LuaLS/lua-language-server/issues/2910)
[issues](https://github.com/LuaLS/lua-language-server/issues/3017) in
the sumnekos *lua-language-server* Github repository.
