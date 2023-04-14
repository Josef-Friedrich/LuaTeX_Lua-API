#! /bin/sh

LUA_HOME="${HOME}/repos/lua"

PROJECT_DIR="${LUA_HOME}/luatex_api_all"

HASH="$(git rev-parse HEAD)"

COMMIT_MESSAGE="Sync with https://github.com/Josef-Friedrich/LuaTeX_Lua-API/commit/$HASH"

_sync() {
  local NAME="$1"
  cd "$LUA_HOME/${NAME}"

  git pull origin

  rsync -av --delete "${PROJECT_DIR}/dist/${NAME}/" "${LUA_HOME}/${NAME}/library/"

  git add -Av
  # git commit -m "$COMMIT_MESSAGE"
  # git push -u origin main
}

if [ -n "$(git diff HEAD)" ]; then
  echo Commit first
  exit 1
fi

git pull
git push

rsync -av --delete "${PROJECT_DIR}/library/" "${PROJECT_DIR}/dist/"
"${PROJECT_DIR}/resources/remove-navigation-table.py"

_sync lualatex
_sync lualibs
_sync luametatex
_sync luatex
