#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_patch() {
  local ENGINE="$1"
  local PROJECT="$2"
  local FILENAME="$3"
  wget \
    -O "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  patch \
    "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua" < \
    "${PROJECT_DIR}/resources/patches/${ENGINE}/${FILENAME}.diff"
}

_patch luatex lpeg          lpeg
_patch luatex luafilesystem lfs
_patch luatex lzlib         zlib
_patch luatex md5           md5
_patch luatex luaharfbuzz   luaharfbuzz
_patch luatex luasocket     mbox
_patch luatex luasocket     mime
_patch luatex luasocket     socket
_patch luatex slnunicode    unicode
_patch luatex luazip        zip
