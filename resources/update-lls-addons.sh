#! /bin/sh

LUA_HOME="${HOME}/repos/lua"

ROOT="${LUA_HOME}/lls_addons"
cd "${ROOT}"

git checkout main
git pull
git submodule init
git submodule update
git branch upgrade
git checkout upgrade

ADDONS="\
lpeg
luasocket
luazip
lzlib
md5
slnunicode
tex-lualatex
tex-luatex\
"

_update() {
  local ADDON_ROOT="${ROOT}/addons/$1/module"
  cd "${ADDON_ROOT}"
  git checkout main
  git pull
  $HOME/.cargo/bin/stylua "${ADDON_ROOT}/library"
}

for ADDON in $ADDONS; do
  _update $ADDON
done
