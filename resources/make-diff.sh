#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_make_diff() {
  local ENGINE="$1"
  local PROJECT="$2"
  local SRC="$3"
  local DEST="$4"

  wget \
    -O "${PROJECT_DIR}/library/${ENGINE}/${DEST}.lua_upstream.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${SRC}.lua"

  diff -Naur \
    "${LIBRARY}/${ENGINE}/${DEST}.lua_upstream.lua" \
    "${LIBRARY}/${ENGINE}/${DEST}.lua" > \
    "${PROJECT_DIR}/resources/patches/${ENGINE}/${DEST}_new.diff"
}

_make_diff luatex lpeg          lpeg        lpeg
_make_diff luatex luafilesystem lfs         lfs
_make_diff luatex lzlib         zlib        zlib
_make_diff luatex md5           md5         md5
_make_diff luatex luaharfbuzz   luaharfbuzz luaharfbuzz
_make_diff luatex luasocket     mbox        mbox
_make_diff luatex luasocket     mime        mime
_make_diff luatex luasocket     socket      socket
_make_diff luatex slnunicode    unicode     unicode
_make_diff luatex luazip        zip         zip
