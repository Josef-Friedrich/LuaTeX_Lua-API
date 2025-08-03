#! /bin/sh

LUA_HOME="${HOME}/repos/lua"
ROOT="${LUA_HOME}/lls_addons"

rm -rf "${ROOT}"

git clone --recurse-submodules  git@github.com:Josef-Friedrich/LLS-Addons.git "${ROOT}"

cd "${ROOT}"

# https://stackoverflow.com/a/7244456
git remote add upstream git@github.com:LuaLS/LLS-Addons.git
git fetch upstream
git checkout main
git rebase upstream/main
git push -u origin main

UPDATE_BRANCH="update_$(date +%F)"

git push -d origin update_2025-08-03

git branch "$UPDATE_BRANCH"
git checkout "$UPDATE_BRANCH"

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
  stylua "${ADDON_ROOT}/library"
}

for ADDON in $ADDONS; do
  _update $ADDON
done

cd "${ROOT}"

git add -Av
git commit -m "Update TeX related submodules to the latest version"

git push -u origin "$UPDATE_BRANCH"
