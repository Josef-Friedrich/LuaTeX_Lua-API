#! /bin/sh

LUA_HOME="${HOME}/repos/lua"

ROOT="${LUA_HOME}/lls_addons"

rm -rf "${ROOT}"

git clone --recurse-submodules git@github.com:Josef-Friedrich/LLS-Addons.git "${ROOT}"

cd "${ROOT}"

git branch update
git checkout update

ADDONS="\
lmathx
lpeg
luasocket
luazip
lzlib
md5
slnunicode
tex-lualatex
tex-lualibs
tex-luametatex
tex-luatex\
"

_update() {
  local ADDON_ROOT="${ROOT}/addons/$1/module"
  echo "
${ADDON_ROOT}"
  cd "${ADDON_ROOT}"
  git checkout main
  git pull
  $HOME/.cargo/bin/stylua "${ADDON_ROOT}/library"
}

for ADDON in $ADDONS; do
  _update $ADDON
done
