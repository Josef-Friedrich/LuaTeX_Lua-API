#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_make_diff() {
  local ENGINE="$1"
  local PROJECT="$2"
  local FILENAME="$3"

  wget \
    -O "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua_upstream.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  diff -Naur \
    "${LIBRARY}/${ENGINE}/${FILENAME}.lua_upstream.lua" \
    "${LIBRARY}/${ENGINE}/${FILENAME}.lua" > \
    "${PROJECT_DIR}/resources/patches/${ENGINE}/${FILENAME}_new.diff"
}

_make_diff luatex lpeg          lpeg
_make_diff luatex luafilesystem lfs
_make_diff luatex lzlib         zlib
_make_diff luatex md5           md5
_make_diff luatex luaharfbuzz   luaharfbuzz
_make_diff luatex luasocket     mbox
_make_diff luatex luasocket     mime
_make_diff luatex luasocket     socket
_make_diff luatex slnunicode    unicode
_make_diff luatex luazip        zip
