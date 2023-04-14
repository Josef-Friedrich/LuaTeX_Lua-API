#! /bin/sh

LUA_HOME="${HOME}/repos/lua"

PROJECT_DIR="${LUA_HOME}/luatex_api_all"

LIBRARY="${PROJECT_DIR}/library"

# diff -Naur
_fetch() {
  local PROJECT="$1"
  local FILENAME="$2"
  wget \
    -O "${PROJECT_DIR}/library/luatex/${FILENAME}.lua_upstream.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  patch \
    "${PROJECT_DIR}/library/luatex/${FILENAME}.lua" < \
    "${PROJECT_DIR}/resources/patches/${FILENAME}.diff"
}

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
    "${PROJECT_DIR}/resources/patches/${DEST}.diff"
}

_make_diff lpeg lpeg lpeg
_make_diff md5 md5 md5
_make_diff lzlib lzlib zlib
