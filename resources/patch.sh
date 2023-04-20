#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
PROJECT_DIR="${LUA_HOME}/luatex_api_all"
LIBRARY="${PROJECT_DIR}/library"

_make_diff() {
  local ENGINE="$1"
  local PROJECT="$2"
  local FILENAME="$3"

  wget \
    --quiet \
    --output-document "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua_upstream.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  if [ "$?" -ne 0 ]; then
    echo "Error downloading file https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"
  fi

  diff --new-file --text --unified \
    "${LIBRARY}/${ENGINE}/${FILENAME}.lua_upstream.lua" \
    "${LIBRARY}/${ENGINE}/${FILENAME}.lua" > \
    "${PROJECT_DIR}/resources/patches/${ENGINE}/${FILENAME}_new.diff"
  # When diff finds a difference between the two files, its exit code is 1

  local DIFF_EXIT="$?"
  if [ "$DIFF_EXIT" -gt 1 ]; then
    echo "Diff error $DIFF_EXIT ${PROJECT_DIR}/resources/patches/${ENGINE}/${FILENAME}_new.diff"
  fi

  true # to make “make” happy
}

_patch() {
  local ENGINE="$1"
  local PROJECT="$2"
  local FILENAME="$3"
  wget \
    --quiet \
    --output-document "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua" \
    "https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"

  if [ "$?" -ne 0 ]; then
    echo "Error downloading file https://raw.githubusercontent.com/LuaCATS/${PROJECT}/main/library/${FILENAME}.lua"
  fi

  patch \
    "${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua" < \
    "${PROJECT_DIR}/resources/patches/${ENGINE}/${FILENAME}.diff"

  if [ "$?" -ne 0 ]; then
    echo "Error patching file ${PROJECT_DIR}/library/${ENGINE}/${FILENAME}.lua"
  fi
}

if [ "$1" = "diff" ]; then
  ACTION="_make_diff"
elif [ "$1" = "patch" ]; then
  ACTION="_patch"
else
  echo "Usage: $0 diff|patch"
  exit  1
fi

$ACTION luatex lpeg          lpeg
$ACTION luatex luafilesystem lfs
$ACTION luatex lzlib         zlib
$ACTION luatex md5           md5
$ACTION luatex luaharfbuzz   luaharfbuzz
$ACTION luatex luasocket     mbox
$ACTION luatex luasocket     mime
$ACTION luatex luasocket     socket
$ACTION luatex slnunicode    unicode
$ACTION luatex luazip        zip
