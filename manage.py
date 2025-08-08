#! /usr/bin/python

import argparse
import difflib
import glob
import logging
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import unittest
import urllib.request
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Any, Callable, Literal, Optional, Union, cast
import textwrap

logging.basicConfig(
    format="%(levelname)s %(message)s",
    stream=sys.stdout,
)

logger = logging.getLogger(__name__)


project_base_path: Path = Path(__file__).resolve().parent
"""The parent directory of this repository."""

# Removed by a regex: ---Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
copyright_notice = """------------------------------------------------------------------------
---
---This program is free software: you can redistribute it and/or modify it
---under the terms of the GNU General Public License as published by the
---Free Software Foundation, either version 2 of the License, or (at your
---option) any later version.
---
---This program is distributed in the hope that it will be useful, but
---WITHOUT ANY WARRANTY; without even the implied warranty of
---MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
---Public License for more details.
---
---You should have received a copy of the GNU General Public License along
---with this program. If not, see <https://www.gnu.org/licenses/>."""


class Colors:
    """ANSI color codes

    Source: https://gist.github.com/rene-d/9e584a7dd2935d0f461904b9f2950007
    """

    BLACK = "\033[0;30m"
    RED = "\033[0;31m"
    GREEN = "\033[0;32m"
    BROWN = "\033[0;33m"
    BLUE = "\033[0;34m"
    PURPLE = "\033[0;35m"
    CYAN = "\033[0;36m"
    LIGHT_GRAY = "\033[0;37m"
    DARK_GRAY = "\033[1;30m"
    LIGHT_RED = "\033[1;31m"
    LIGHT_GREEN = "\033[1;32m"
    YELLOW = "\033[1;33m"
    LIGHT_BLUE = "\033[1;34m"
    LIGHT_PURPLE = "\033[1;35m"
    LIGHT_CYAN = "\033[1;36m"
    LIGHT_WHITE = "\033[1;37m"
    BOLD = "\033[1m"
    FAINT = "\033[2m"
    ITALIC = "\033[3m"
    UNDERLINE = "\033[4m"
    BLINK = "\033[5m"
    NEGATIVE = "\033[7m"
    CROSSED = "\033[9m"
    END = "\033[0m"


def _apply_color(color: str, text: Any) -> str:
    return color + str(text) + Colors.END


def red(text: Any) -> str:
    return _apply_color(Colors.RED, text)


def green(text: Any) -> str:
    return _apply_color(Colors.GREEN, text)


def _run_stylua(path: Path | str) -> None:
    subprocess.check_call(
        [
            "/usr/local/bin/stylua",
            "--config-path",
            project_base_path / "stylua.toml",
            path,
        ]
    )


def _run_pygmentize(path: Path | str) -> None:
    subprocess.check_call(
        [
            "pygmentize",
            path,
        ]
    )


def _is_git_commited() -> bool:
    """
    Checks if there are no uncommitted changes in the current Git repository.

    Returns:
        bool: True if the working directory is clean (no changes since last commit), False otherwise.
    """
    output: str = subprocess.check_output(["git", "diff", "HEAD"], encoding="utf-8")
    return output == ""


def _get_latest_git_commitid() -> str:
    return subprocess.check_output(
        ["git", "rev-parse", "HEAD"], encoding="utf-8"
    ).strip()


def _apply(glob_relpath: str, fn: Callable[[Path], None]) -> None:
    """
    Applies a given function to each file matching a glob pattern.

    Args:
        glob_relpath: Relative glob pattern to match files.
        fn: Function to apply to each matched file. The function should accept a single string argument representing the file path.

    Returns:
        None
    """
    for path in glob.glob(str(project_base_path / glob_relpath), recursive=True):
        logger.debug(
            "Apply function %s on file %s", green(fn.__name__), green(str(path))
        )
        fn(Path(path))


def _update_text_file(path: str | Path, fn: Callable[[str], str]) -> None:
    orig: str
    updated: str
    with open(path) as src:
        orig = src.read()
    updated = fn(orig)
    with open(path, "w") as dest:
        dest.write(updated)
    if logger.isEnabledFor(logging.DEBUG):
        _diff(orig, updated)


def _clean_docstrings(content: str) -> str:
    """
    Cleans and formats Lua-style docstrings in the given content string.

    This function performs the following operations:
    - Ensures that a docstring starts with an empty comment line.
    - Removes duplicate empty comment lines.
    - Allows only one consecutive empty line in the content.

    Args:
        content: The string containing Lua-style docstrings to be cleaned.

    Returns:
        str: The cleaned and formatted docstring content.
    """
    # Start a docstring with an empty comment line.
    content = re.sub(r"\n\n---(?=[^\n])", r"\n\n---\n---", content)

    # Remove duplicate empty comment lines.
    content = re.sub("\n---(\n---)+\n", "\n---\n", content)

    content = content.replace("\n\n---\n\n", "\n\n")

    # Allow only one empty line
    content = _remove_duplicate_empty_lines(content)

    # Side effect with code examples in Lua docstrings
    # content = content.replace(") end\n---", ") end\n\n---")

    # Add an empty comment line before the @param annotation.
    # content = re.sub(
    #     r"(?<!\n---)\n---@param(?=.*?\n.*?@param)", r"\n---\n---@param", content
    # )
    return content


def _diff(a: str, b: str) -> None:
    for line in difflib.unified_diff(a.splitlines(), b.splitlines(), n=1):
        if line.startswith("-"):
            print(Colors.RED + line + Colors.END)
        elif line.startswith("+"):
            print(Colors.GREEN + line + Colors.END)
        elif line.startswith("@@"):
            print(Colors.PURPLE + line + Colors.END)
        else:
            print(line)


def _copy_directory(
    src: str | Path, dest: str | Path, delete_dest: bool = True
) -> None:
    """
    Copies the contents of the source directory to the destination directory.

    If the destination directory exists, it is first removed along with all its contents.
    Then, the source directory is copied to the destination path.

    Args:
        src: Path to the source directory to copy.
        dest: Path to the destination directory.
    """
    if isinstance(dest, str):
        dest = Path(dest)
    if dest.exists() and delete_dest:
        shutil.rmtree(dest)
    shutil.copytree(src, dest, dirs_exist_ok=True)


Subproject = Literal[
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]

subprojects: list[Subproject] = [
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]

subprojects_dict: dict[str, str] = {
    "lualatex": "LuaLaTeX",
    "lualibs": "Lualibs",
    "luametatex": "LuaMetaTeX",
    "luaotfload": "LuaOTFLoad",
    "luatex": "LuaTeX",
}

# convert


def _download_url(url: str, dest_path: str) -> None:
    logger.debug("Download %s into %s", url, dest_path)
    with urllib.request.urlopen(url) as response:
        data = response.read()
        with open(dest_path, "wb") as f:
            f.write(data)


def convert_tex() -> None:
    def _convert(path: Path) -> None:
        content: str = ""

        with open(path) as src:
            content = src.read()

        content = re.sub(
            r"\\(type|typ|prm|lpr|nod|syntax|notabene|whs|cbk)[\s]*\{([^}]*)\}",
            r"`\2`",
            content,
        )

        content = re.sub(
            r"\\libidx\s*\{(.*?)\}\s*\{(.*?)\}",
            r"`\1.\2`",
            content,
        )

        content = re.sub(
            r"\\(hyphenatedurl)[\s]*\{([^}]*)\}",
            r"\2",
            content,
        )

        content = re.sub(r"\\quote\s*\{([^}]*)\}", r"“\1”", content)
        content = re.sub(r"\$([^$]+)\$", r"`\1`", content)

        content = re.sub(r"\\TEX\\?", "*TeX*", content)
        content = re.sub(r"\\CONTEXT\\?", "*ConTeXt*", content)
        content = re.sub(r"\\LUATEX\\?", "*LuaTeX*", content)
        content = re.sub(r"\\LUA\\?", "*Lua*", content)
        content = re.sub(r"\\PDF\\?", "*PDF*", content)
        content = re.sub(r"\\OPENTYPE\\?", "*OpenType*", content)
        content = re.sub(r"\\TRUETYPE\\?", "*TrueType*", content)
        content = re.sub(r"\\MICROSOFT\\?", "*Microsoft*", content)
        content = re.sub(r"\\FONTFORGE\\?", "*FontForge*", content)
        content = re.sub(r"\\POSTSCRIPT\\?", "*PostScript*", content)
        content = re.sub(r"\\UTF-?8?\\?", "*UTF-8*", content)
        content = re.sub(r"\\UNICODE\\?", "*Unicode*", content)

        content = re.sub(
            r"\\(starttyping|startfunctioncall|stoptyping|stopfunctioncall)",
            "```",
            content,
        )

        content = re.sub(r"\\startitemize(\[[^]]*\])?", "", content)
        content = re.sub(r"\\startitem\s*", "* ", content)
        content = re.sub(r"\\stopitem(ize)?", "", content)

        content = content.replace("~", " ")
        content = content.replace("|-|", "-")
        content = content.replace("|/|", "/")
        content = content.replace("\\NC \\NR", "")
        content = re.sub(r"\\(NC|DB|BC|LL|TB|stoptabulate)", "", content)
        content = re.sub(r"\\starttabulate\[.*?\]", "", content)
        content = content.replace("etc.\\", "etc.")

        content = "---" + content.replace("\n", "\n---")

        content = re.sub(
            r"\\start(sub)*(section|chapter)*\[.*title=\{(.*?)\}\]", r"# \3", content
        )
        content = re.sub(r"\\(sub)*section\{(.*?)\}", r"# \2", content)
        content = re.sub(r"\\(libindex|topicindex)\s*\{[^}]+\}", "", content)
        content = re.sub(r"---\n(---\n)+", "---\n", content)

        content = re.sub(
            r"---\\stop(sub)*section",
            "----------------------------------------------------------------\n\n",
            content,
        )

        content = re.sub(
            r"--- `(.*)` +(float|string|boolean|number|table|.*node) +",
            r"---@field \1 \2 # ",
            content,
        )

        content = re.sub(r"\n--- {10,}", r" ", content)

        with open(str(path) + ".lua", "w") as dest:
            dest.write(content)

    _apply("resources/manuals/**/*.tex", _convert)


def convert_html() -> None:
    def _convert(path: Path) -> None:
        content: str = ""

        with open(path) as src:
            content = src.read()

        content = re.sub(
            r"</?(tt|code)>",
            "`",
            content,
        )

        content = re.sub(
            r"</?pre.*?>",
            "```",
            content,
        )

        content = re.sub(r"<li> *", "* ", content)

        content = re.sub(r"</?.*?> *", "", content)

        content = "---" + content.replace("\n", "\n---")

        with open(str(path) + ".lua", "w") as dest:
            dest.write(content)

    _apply("resources/**/*.html", _convert)


def example(
    src_relpath: str,
    luaonly: bool = False,
    subproject: Subproject = "luatex",
    print_docstring: bool = False,
) -> None:
    def _extract_tex_markup(lua_code: str) -> tuple[str, str]:
        """
        Extracts lines marked with '--tex: ' from Lua code and separates them from the rest.

        Args:
            lua_code: The Lua code as a string, potentially containing lines starting with '--tex: '.

        Returns:
            tuple[str, str]: A tuple containing:
                - The cleaned Lua code as a single string with '--tex: ' lines removed.
                - The extracted TeX markup as a single string, with the '--tex: ' prefix stripped from each line.
        """

        tex_markup: list[str] = []
        cleaned: list[str] = []
        for line in lua_code.splitlines():
            if line.startswith("--tex: "):
                tex_markup.append(line[7:])
            else:
                cleaned.append(line)
        return ("\n".join(cleaned), "\n".join(tex_markup))

    def _clean(lua_code: str) -> str:
        """Clean the source Lua example file. Remove the import from utils. Trim."""
        cleaned = lua_code.splitlines()
        if 'require("utils")' in cleaned[0]:
            cleaned = cleaned[1:]
        if cleaned[0] == "":
            cleaned = cleaned[1:]
        output = "\n".join(cleaned)
        return output.strip()

    def _extract_shebang(
        lua_code: str,
    ) -> tuple[str, list[str], Optional[bool]]:
        # Parse the first line to support a shebang syntax
        # #! luatex --lua-only
        # #! /usr/local/texlive/bin/x86_64-linux/luatex
        args: list[str] = []
        luaonly: Optional[bool] = None
        if lua_code.startswith("#!"):
            lines = lua_code.splitlines()
            first_line = lines[0]
            first_line = first_line.replace("#!", "")
            if "--luaonly" in first_line:
                luaonly = True
            args = shlex.split(first_line)
            # Remove the shebang
            lua_code = "\n".join(lines[1:])
        return (lua_code, args, luaonly)

    def _render_docstring(lua_code: str) -> str:
        lines: list[str] = ["", "---__Example:__", "---", "---```lua"]
        for line in lua_code.splitlines():
            lines.append("---" + line)
        lines.append("---```")
        lines.append("---")
        return "\n".join(lines)

    def _write_tex_file(path: Path, additional_tex_markup: str) -> None:
        tex_content: str = (
            "\\directlua{dofile('tmp.lua')}\n" + additional_tex_markup + "\\bye\n"
        )
        logger.debug(tex_content)
        path.write_text(tex_content)

    def _copy_to_clipboard(content: str) -> None:
        read, write = os.pipe()
        os.write(write, content.encode(encoding="utf-8"))
        os.close(write)
        subprocess.check_call(["xclip", "-selection", "clipboard"], stdin=read)

    def _run_example(
        src: Path,
        luaonly: bool = False,
        print_docstring: bool = False,
    ) -> None:
        """Run and execute one example file"""
        relpath: str = str(src).replace(str(project_base_path / "examples") + "/", "")
        print(f"Example: {green(relpath)}")

        logger.debug(f"Example source: {src}")

        # Lua require does not support absolute paths, so we are running all
        # examples from this repos base path
        dest_lua: Path = project_base_path / "tmp.lua"

        src_code = src.read_text()

        (
            src_code,
            args,
            _luaonly,
        ) = _extract_shebang(src_code)

        if _luaonly is not None:
            luaonly = True

        src_code_cleaned = _clean(src_code)
        src_code_cleaned, tex_markup = _extract_tex_markup(src_code_cleaned)

        src_cleaned = project_base_path / "tmp_cleaned.lua"
        src_cleaned.write_text(src_code_cleaned)

        _run_pygmentize(src_cleaned)

        docstring: str = _render_docstring(src_code_cleaned)
        if print_docstring:
            print(docstring)

        _copy_to_clipboard(docstring)

        dest_lua.write_text(
            "print('---start---')\n" + src_code + "\nprint('---stop---')"
        )

        dest_tex: Optional[Path] = None

        if not luaonly:
            dest_tex = project_base_path / "tmp.tex"
            _write_tex_file(dest_tex, tex_markup)

        dest: Path
        if dest_tex is None:
            dest = dest_lua
        else:
            dest = dest_tex

        if len(args) == 0:
            args = ["luatex"]
        if luaonly and "--luaonly" not in args:
            args.append("--luaonly")
        result = subprocess.run(
            [*args, "--halt-on-error", str(dest)],
            capture_output=True,
            text=True,
            cwd=project_base_path,
            timeout=5,
        )
        output = result.stdout
        output = re.sub(r"^.*---start---", "", output, flags=re.DOTALL)
        output = re.sub(r"---stop---.*$", "", output, flags=re.DOTALL)
        print(output)
        if result.returncode != 0:
            sys.exit(1)

    src: Path
    if src_relpath.startswith("examples"):
        src = project_base_path / src_relpath
    else:
        src = project_base_path / "examples" / subproject / src_relpath

    if not src.exists():
        with_extension = Path(str(src) + ".lua")
        if with_extension.exists():
            src = with_extension

    if not src.exists():
        raise Exception(f"The specified path doesn’t exist: {src}")

    if src.is_dir():
        for path in glob.glob(f"{src}/**/*.lua", recursive=True):
            _run_example(Path(path), luaonly=luaonly, print_docstring=print_docstring)
    else:
        _run_example(src, luaonly=luaonly, print_docstring=print_docstring)


# format


def format() -> None:
    def _format(path: Path) -> None:
        _update_text_file(path, _clean_docstrings)
        _run_stylua(path)

    _apply("library/**/*.lua", _format)


def manuals() -> None:
    luatex_files: dict[str, Union[str, None]] = {
        "luatex-backend.tex": "14_backend.tex",
        "luatex-callbacks.tex": "09_callbacks.tex",
        "luatex-contents.tex": None,
        "luatex-enhancements.tex": "02_enhancements.tex",
        "luatex-export-titlepage.tex": None,
        "luatex-firstpage.tex": None,
        "luatex-fontloader.tex": "12_fontloader.tex",
        "luatex-fonts.tex": "06_fonts.tex",
        "luatex-graphics.tex": "11_graphics.tex",
        "luatex-harfbuzz.tex": "13_harfbuzz.tex",
        "luatex-introduction.tex": None,
        "luatex-languages.tex": "05_languages.tex",
        "luatex-logos.tex": None,
        "luatex-lua.tex": "04_lua.tex",
        "luatex-math.tex": "07_math.tex",
        "luatex-modifications.tex": "03_modifications.tex",
        "luatex-nodes.tex": "08_nodes.tex",
        "luatex-preamble.tex": "01_preamble.tex",
        "luatex-registers.tex": None,
        "luatex-statistics.tex": None,
        "luatex-style.tex": None,
        "luatex-tex.tex": "10_tex.tex",
        "luatex-titlepage.tex": None,
    }

    for file, renamed in luatex_files.items():
        if renamed:
            _download_url(
                f"https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual/{file}",
                str(project_base_path) + f"/resources/manuals/luatex/{renamed}",
            )

    for file in [
        "luametatex-assumptions.tex",
        "luametatex-callbacks.tex",
        "luametatex-constructions.tex",
        "luametatex-contents.tex",
        "luametatex-engines.tex",
        "luametatex-fonts.tex",
        "luametatex-internals.tex",
        "luametatex-introduction.tex",
        "luametatex-languages.tex",
        "luametatex-libraries.tex",
        "luametatex-lua.tex",
        "luametatex-math.tex",
        "luametatex-metapost.tex",
        "luametatex-nodes.tex",
        "luametatex-pdf.tex",
        "luametatex-primitives.tex",
        "luametatex-principles.tex",
        "luametatex-style.tex",
        "luametatex-tex.tex",
        "luametatex-tokens.tex",
        "luametatex.tex",
    ]:
        _download_url(
            f"https://github.com/contextgarden/context/blob/main/doc/context/sources/general/manuals/luametatex/{file}",
            str(project_base_path) + f"/resources/manuals/luametatex/{file}",
        )


# merge


def merge(subproject: Subproject = "luatex") -> None:
    """Merge all lua files of a subproject into one big file for the CTAN upload."""
    contents: list[str] = []

    def _merge(path: Path) -> None:
        content: str = ""
        with open(path) as src:
            content = src.read()
        # Remove the return statements
        content = re.sub(r"^return .+\n", "", content, flags=re.MULTILINE)

        content = re.sub(
            r"---Copyright \(C\) 2022-20\d\d by Josef Friedrich <josef@friedrich\.rocks>\n",
            "",
            content,
        )
        content = content.replace(copyright_notice, "")
        # Remove all ---@meta definitions. We add one ---@meta later
        content = content.replace("---@meta\n", "")
        contents.append(content)

    _apply("dist/library/" + subproject + "/*.lua", _merge)

    # Add copyright notice and meta definition at the beginning
    contents.insert(
        0,
        f"---Copyright (C) 2022-{datetime.now().year} by Josef Friedrich <josef@friedrich.rocks>",
    )
    contents.insert(1, copyright_notice)
    contents.insert(2, "---@meta\n")

    dist_dir: Path = project_base_path / "luatex-type-definitions"
    dist_dir.mkdir(parents=True, exist_ok=True)

    content = "\n".join(contents)
    # Artefact of the copyright removal
    content = content.replace("\n\n---\n\n", "")
    content = _clean_docstrings(content)
    with open(dist_dir / (subproject + "-type-definitions.lua"), "w") as f:
        f.write(content)


# navigation


def create_navigation_table() -> None:
    with open("tmp.lua") as src:
        content = src.read()

    content = re.sub(
        r"[^\w\n]",
        "_",
        content,
    )

    content = re.sub(
        r"__+",
        "_",
        content,
    )

    content = re.sub(
        r"_\n",
        "\n",
        content,
    )

    content = re.sub(
        r"\n(?=\w)",
        "\n_N._",
        content,
    )

    content = re.sub(
        r"(?<=\w)\n",
        " = 0\n",
        content,
    )

    with open("tmp-read.lua", "w") as dest:
        print(content)
        dest.write(content)


def _remove_duplicate_empty_lines(content: str) -> str:
    """Remove duplicate empty lines."""
    return re.sub("\n\n+", "\n\n", content)


def _remove_navigation_table(path: Path) -> None:
    def __remove_navigation_table(content: str) -> str:
        content = content.replace(
            "---A helper table to better navigate through the documentation using the\n"
            + "---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n\n",
            "",
        )
        # Remove the navigation table
        content = re.sub(r"^_N.+\n", "", content, flags=re.MULTILINE)

        content = _remove_duplicate_empty_lines(content)
        # Remove leading and trailing whitespace
        return content.strip() + "\n"

    _update_text_file(path, __remove_navigation_table)


def _git_reset_pull(path: str | Path) -> None:
    subprocess.check_call(["git", "checkout", "main"], cwd=path)
    subprocess.check_call(["git", "add", "-A"], cwd=path)
    subprocess.check_call(["git", "reset", "--hard", "HEAD"], cwd=path)
    subprocess.check_call(["git", "pull", "origin", "main"], cwd=path)


def _format_commit_message(commit_id: str) -> str:
    return f"Sync with https://github.com/Josef-Friedrich/LuaTeX_Lua-API/commit/{commit_id}"


def _git_commit_push(
    repo: str | Path,
    message: Optional[str] = None,
    commit_id: Optional[str] = None,
    branch: str = "main",
) -> None:
    subprocess.check_call(["git", "add", "-A"], cwd=repo)

    if commit_id:
        message = _format_commit_message(commit_id)
    if not message:
        raise Exception("Provide a message or a commit id")

    result = subprocess.run(
        [
            "git",
            "commit",
            "-m",
            message,
        ],
        cwd=repo,
    )
    if result.returncode == 0:
        subprocess.check_call(["git", "push", "-u", "origin", branch], cwd=repo)


def _push_into_downstream_submodule(subproject: Subproject, commit_id: str) -> None:
    """
    Synchronizes the specified subproject's distribution files with its downstream LuaCATS submodule repository.

    This function performs the following steps:
    1. Determines the downstream submodule path for the given subproject.
    2. Skips processing if the downstream repository does not exist.
    3. Ensures the downstream repository is on the 'main' branch and up-to-date.
    4. Copies the built distribution files into the downstream repository's 'library' directory.
    5. Stages all changes and commits them with a message referencing the source commit.
    6. Pushes the commit to the remote 'main' branch if changes were committed.

    Args:
        subproject: The name of the subproject to synchronize.
        commit_id: The commit hash from the source repository to reference in the commit message.
    """
    path = (
        project_base_path
        / "resources"
        / "LuaCATS"
        / "downstream"
        / ("tex-" + subproject)
    )

    # luaotfload has no downstream LuaCATS repository
    if not path.exists():
        return

    _git_reset_pull(path)

    _copy_directory(
        project_base_path / "dist" / "library" / subproject, path / "library"
    )

    _git_commit_push(
        path,
        commit_id=commit_id,
    )


def _replace(path: Path, search: str, replace: str) -> str:
    """
    Replace all occurrences of 'search' with 'replace' in the file at 'path'.

    Args:
        path: The path to the file to modify.
        search: The substring to search for.
        replace: The string to replace with.

    Returns:
        The updated file content as a string.
    """
    content = path.read_text()
    updated = content.replace(search, replace)
    path.write_text(updated)
    return updated


def _replace_line(path: Path, search: str, new_line: str) -> None:
    """
    Replaces lines in a file that contain a specific search string with a new line.

    Args:
        path: The path to the file to be modified.
        search: The substring to search for in each line.
        new_line: The line to replace any matching lines with.

    Returns:
        None

    Note:
        If the file does not exist, the function does nothing.
    """
    if path.exists():
        lines: list[str] = path.read_text().splitlines()
        new_lines: list[str] = []
        for old_line in lines:
            if search in old_line:
                new_lines.append(new_line)
            else:
                new_lines.append(old_line)
        path.write_text("\n".join(new_lines) + "\n")


def _append_text(path: Path, text: str) -> None:
    """
    Appends the given text to the end of the file at the specified path.

    Args:
        path: The path to the file to which the text will be appended.
        text: The text to append to the file.

    Raises:
        OSError: If there is an error reading from or writing to the file.
    """
    path.write_text(path.read_text() + text)


def _generate_markdown_docs(subproject: Subproject, commit_id: str) -> None:
    src = project_base_path / "dist" / "library" / subproject
    dest = project_base_path / "dist" / "docs" / subproject
    subprocess.check_call(["emmylua_doc", src, "--output", dest])

    subproject_title = subprojects_dict[subproject]

    mkdocs_yml = dest / "mkdocs.yml"

    # css

    css = dest / "docs" / "stylesheets" / "extra.css"
    css.parent.mkdir(parents=True, exist_ok=True)
    css.touch(exist_ok=True)
    css.write_text(
        """
.md-header {
  /* \\definecolor[othercolor][r=.5,g=.5] https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/blob/4f2b914d365bab8a2747afe6e8c86d0f1c8475f7/manual/luatex-style.tex#L114 */
  background-color: #808000;
}
"""
    )

    _append_text(
        mkdocs_yml,
        """
extra_css:
  - stylesheets/extra.css
""",
    )

    # logo

    # https://squidfunk.github.io/mkdocs-material/setup/changing-the-logo-and-icons/#logo
    logo_src = (
        project_base_path / "resources" / "images" / "logos" / (subproject + ".svg")
    )
    if logo_src.exists():
        logo_dest = dest / "docs" / "assets" / "logo.svg"
        logo_dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(logo_src, logo_dest)
        mkdocs_yml.read_text()
        _replace(mkdocs_yml, "\ntheme:\n", "\ntheme:\n  logo: assets/logo.svg\n")

    # syntax highlighting

    _append_text(
        mkdocs_yml,
        """
markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
""",
    )

    _replace_line(mkdocs_yml, "site_name: ", f"site_name: {subproject_title}")

    subprocess.check_call(["mkdocs", "build"], cwd=dest)

    gh_pages_repo = project_base_path / "subrepos" / "TeXLuaCATS" / subproject_title

    logger.debug("Github pages repo: %s", gh_pages_repo)

    if gh_pages_repo.is_dir():
        subprocess.check_call(["git", "add", "-Av"], cwd=gh_pages_repo)
        subprocess.check_call(["git", "reset", "--hard", "HEAD"], cwd=gh_pages_repo)
        subprocess.run(
            ["git", "branch", "gh-pages"], cwd=gh_pages_repo
        )  # ignore cli error
        subprocess.check_call(["git", "checkout", "gh-pages"], cwd=gh_pages_repo)
        subprocess.run(
            ["git", "pull", "origin", "gh-pages"], cwd=gh_pages_repo
        )  # ignore cli error
        _copy_directory(dest / "site", gh_pages_repo, delete_dest=False)

        _git_commit_push(gh_pages_repo, commit_id=commit_id, branch="gh-pages")


def dist() -> None:
    """
    Copies the contents of the 'library' directory to a new 'dist' directory,
    removing any existing 'dist' directory first.

    Entry point for `make dist`

    Raises:
        OSError: If there is an error removing or copying directories.
    """
    format()
    src_dir = project_base_path / "library"
    dest_dir = project_base_path / "dist" / "library"
    _copy_directory(src_dir, dest_dir)

    _apply("dist/library/**/*.lua", _remove_navigation_table)

    def _clean(path: Path) -> None:
        _update_text_file(path, _clean_docstrings)

    _apply("dist/library/**/*.lua", _clean)

    if not _is_git_commited():
        raise Exception("Uncommited changes found! Commit first, then retry!")
    commit_id = _get_latest_git_commitid()

    for subproject in subprojects:
        _push_into_downstream_submodule(subproject, commit_id)
        _generate_markdown_docs(subproject, commit_id)

    vscode_path = project_base_path / "resources" / "vscode_extension"
    _git_reset_pull(vscode_path)
    _copy_directory(project_base_path / "dist" / "library", vscode_path / "library")
    _git_commit_push(
        vscode_path,
        _format_commit_message(commit_id),
    )

    _git_commit_push(project_base_path, "Update submodules")


def rewrap(path: str) -> None:
    """Rewrap the comments"""
    abspath = Path(path).resolve()
    lines: list[str] = []
    for line in abspath.read_text().splitlines():
        if line.startswith('---'):
            line = line[3:]
        else:
            line = ""
        lines.append(line)

    # Rewrap paragraphs: group lines into paragraphs, then wrap each paragraph
    paragraphs: list[str] = []
    current_paragraph: list[str] = []
    for line in lines:
        if line.strip() == "":
            if current_paragraph:
                paragraphs.append(" ".join(current_paragraph))
                current_paragraph = []
        else:
            current_paragraph.append(line.strip())
    if current_paragraph:
        paragraphs.append(" ".join(current_paragraph))

    rewrapped = "\n\n".join(
        "\n".join(textwrap.wrap(paragraph, width=77)) for paragraph in paragraphs
    )
    lines: list[str] = []
    for line in rewrapped.splitlines():
        lines.append('---' + line)
    print("\n".join(lines))


@dataclass
class Args:
    debug: bool
    command: Literal[
        "convert",
        "dist",
        "example",
        "format",
        "manuals",
        "merge",
        "rewrap",
        "test",
    ]
    relpath: Optional[str]
    path: Optional[str]
    subproject: Subproject
    print_docstring: bool
    luaonly: bool


class TestManager(unittest.TestCase):
    def test_is_git_commited(self) -> None:
        self.assertIsInstance(_is_git_commited(), bool)

    def test_get_latest_git_commitidself(self) -> None:
        self.assertEqual(len(_get_latest_git_commitid()), 40)

    def test_red(self) -> None:
        self.assertEqual(red("red"), "\x1b[0;31mred\x1b[0m")

    def test_green(self) -> None:
        self.assertEqual(green("green"), "\x1b[0;32mgreen\x1b[0m")

    def test_download(self) -> None:
        with tempfile.NamedTemporaryFile(delete=True) as tmp:
            _download_url("https://example.com", tmp.name)
            t = Path(tmp.name)
            self.assertTrue(t.exists())
            self.assertIn("Example", t.read_text())

    def test_distribute(self) -> None:
        shutil.rmtree(project_base_path / "dist" / "library")
        dist()
        self.assertTrue(
            (
                project_base_path / "dist" / "library" / "luatex" / "callback.lua"
            ).exists()
        )

        def __check_navigation_table(path: Path):
            self.assertNotIn("_N.", path.read_text(), path)

        _apply("dist/**/*lua", __check_navigation_table)


if __name__ == "__main__":
    main_parser = argparse.ArgumentParser()

    main_parser.add_argument("-d", "--debug", action="store_true")

    subparsers = main_parser.add_subparsers(dest="command")

    # convert
    convert_parser = subparsers.add_parser(
        "convert",
        help="Convert manuals",
    )

    # dist
    dist_parser = subparsers.add_parser(
        "dist",
        help="Copy library to dist and remove the navigation table.",
    )

    # example
    example_parser = subparsers.add_parser(
        "example",
        help="Compile examples in the folder ./examples",
        description="You can specify the relative path of a Lua file or of a TeX file.",
    )
    example_parser.add_argument(
        "-p",
        "--subproject",
        help="Select the subproject.",
        choices=subprojects,
        default="luatex",
    )
    example_parser.add_argument(
        "-l",
        "--luaonly",
        help="Exectute the example in an Lua only environement without the TeX related libraries",
        action="store_true",
    )
    example_parser.add_argument(
        "--print-docstring",
        help="Print the lua code into fenced markdown code plain as a Lua comment.",
        action="store_true",
    )

    example_parser.add_argument("relpath")

    # format
    format_parser = subparsers.add_parser(
        "format",
        help="Format the lua docstrings (Remove duplicate empty comment lines, start docstring with an empty line)",
    )

    # manuals
    manuals_parser = subparsers.add_parser(
        "manuals",
        help="Download the TeX or HTML sources of the manuals.",
    )

    # merge
    merge_parser = subparsers.add_parser(
        "merge",
        help="Merge multiple definitions files into one for the CTAN upload.",
        description="Specify the subproject folder.",
    )
    merge_parser.add_argument("subproject")

    # rewrap
    rewrap_parser = subparsers.add_parser(
        "rewrap",
        help="The Rewrap extension (https://github.com/dnut/Rewrap) does not support rewraping of thee hyphens prefixed comment lines.",
    )
    rewrap_parser.add_argument("path")

    # test
    test_parser = subparsers.add_parser("test", help="Run the embedded unittest.")

    args = cast(Args, main_parser.parse_args())

    if args.debug:
        logger.setLevel(logging.DEBUG)

    if args.command == "convert":
        convert_tex()
        convert_html()
    elif args.command == "dist":
        dist()
    elif args.command == "example" and args.relpath:
        example(
            args.relpath,
            luaonly=args.luaonly,
            subproject=args.subproject,
            print_docstring=args.print_docstring,
        )

    elif args.command == "format":
        format()
    elif args.command == "manuals":
        manuals()
    elif args.command == "merge" and args.subproject:
        merge(args.subproject)
    elif args.command == "rewrap" and args.path:
        rewrap(args.path)
    elif args.command == "test":
        suite = unittest.defaultTestLoader.loadTestsFromTestCase(TestManager)
        runner = unittest.TextTestRunner()
        runner.run(suite)
    else:
        main_parser.print_help()
        sys.exit(1)
