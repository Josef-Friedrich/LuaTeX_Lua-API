#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_patch() {
  local PROJECT="$1"
  local FILENAME="$2"
  wget \
    -O "${PROJECT_DIR}/library/luatex/${FILENAME}.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  patch \
    "${PROJECT_DIR}/library/luatex/${FILENAME}.lua" < \
    "${PROJECT_DIR}/resources/patches/${FILENAME}.diff"
}

_patch lpeg lpeg lpeg
_patch luafilesystem lfs lfs
_patch lzlib lzlib zlib
_patch md5 md5 md5
_patch luaharfbuzz luaharfbuzz luaharfbuzz
_patch luasocket mbox mbox
_patch luasocket mime mime
_patch luasocket socket socket
_patch slnunicode unicode unicode
_patch luazip zip zip
