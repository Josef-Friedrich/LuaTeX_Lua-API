#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_make_diff() {
  local PROJECT="$1"
  local SRC="$2"
  local DEST="$3"

  wget \
    -O "${PROJECT_DIR}/library/luatex/${DEST}.lua_upstream.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${SRC}.lua"

  diff -Naur \
    "${LIBRARY}/luatex/${DEST}.lua_upstream.lua" \
    "${LIBRARY}/luatex/${DEST}.lua" > \
    "${PROJECT_DIR}/resources/patches/${DEST}_new.diff"
}

_make_diff lpeg lpeg lpeg
_make_diff luafilesystem lfs lfs
_make_diff lzlib lzlib zlib
_make_diff md5 md5 md5
_make_diff luaharfbuzz luaharfbuzz luaharfbuzz
_make_diff luasocket mbox mbox
_make_diff luasocket mime mime
_make_diff luasocket socket socket
_make_diff slnunicode unicode unicode
_make_diff luazip zip zip
