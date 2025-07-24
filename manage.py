#! /usr/bin/python

import argparse
import glob
import re
import shlex
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path
from typing import Callable, Literal, Union
import logging
from datetime import datetime

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
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


def _open_file(path: Path) -> None:
    subprocess.call(
        ["xdg-open", str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


def _apply_function_on_glob(glob_relpath: str, fn: Callable[[str], None]) -> None:
    for file_name in glob.glob(str(project_base_path) + "/" + glob_relpath):
        print(file_name)
        fn(file_name)


def _clean_docstrings(content: str) -> str:
    # Start a docstring with an empty comment line.
    content = re.sub(r"\n\n---(?=[^\n])", r"\n\n---\n---", content)

    # Remove duplicate empty comment lines.
    content = re.sub("\n---(\n---)+\n", "\n---\n", content)

    # Side effect with code examples in Lua docstrings
    # content = content.replace(") end\n---", ") end\n\n---")

    # Add an empty comment line before the @param annotation.
    # content = re.sub(
    #     r"(?<!\n---)\n---@param(?=.*?\n.*?@param)", r"\n---\n---@param", content
    # )
    return content


Subproject = Literal[
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]

# convert


def _download_url(url: str, dest_path: str) -> None:
    print(f"Download {url} into {dest_path}")
    with urllib.request.urlopen(url) as response:
        data = response.read()
        with open(dest_path, "wb") as f:
            f.write(data)


def convert_tex() -> None:
    def _convert(file_name: str) -> None:
        content: str = ""

        with open(file_name) as src:
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

        with open(file_name + ".lua", "w") as dest:
            dest.write(content)

    _apply_function_on_glob("resources/manuals/**/*.tex", _convert)


def convert_html() -> None:
    def _convert(file_name: str) -> None:
        content: str = ""

        with open(file_name) as src:
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

        with open(file_name + ".lua", "w") as dest:
            dest.write(content)

    _apply_function_on_glob("resources/**/*.html", _convert)


# example


def compile_example(src_relpath: str, luaonly: bool = False) -> None:
    """
    Compiles a Lua or TeX example file using LuaTeX.

    Given a relative path to a source file (either Lua or TeX), this function:
    - Copies the source file to a temporary directory.
    - If the source is a Lua file, generates a TeX wrapper that runs the Lua file via \\directlua.
    - Runs LuaTeX on the TeX file in the temporary directory.
    - Prints the output from LuaTeX.
    - If a PDF is generated, opens the PDF file.

    Args:
        src_relpath (str): Relative path to the source example file (Lua or TeX).
        luaonly: Only execute the Lua file and don’t create a corresponding TeX file.

    Returns:
        None
    """
    tmp_dir = Path(tempfile.mkdtemp())

    src: Path
    if src_relpath.startswith("examples"):
        src = project_base_path / src_relpath
    else:
        src = project_base_path / "examples" / src_relpath

    # dest: Path = tmp_dir / src.name
    # """The path of the destination file that is copied to a temporary directory."""

    dest: Path = project_base_path / ("tmp" + src.suffix)
    """Lua require does not support absolute paths"""

    src_content = src.read_text()

    src_content = re.sub(
        r"(\./)?resources/utils",
        str(project_base_path / "resources/utils"),
        src_content,
    )

    args: list[str] = ["luatex"]

    if luaonly:
        args.append("--luaonly")

    # Parse the first line to support a shebang like syntax
    # --! luatex --lua-only
    # --! /usr/local/texlive/bin/x86_64-linux/luatex
    if src_content.startswith("--!"):
        first_line = src_content.splitlines()[0]
        first_line = first_line.replace("--!", "")
        if "--luaonly" in first_line:
            luaonly = True
        args = shlex.split(first_line)
        print(args)

    dest.write_text(src_content)

    dest: Path

    if src.suffix == ".lua" and not luaonly:
        dest_lua = dest
        dest = dest.with_suffix(".tex")
        dest.write_text("\\directlua{dofile('" + str(dest_lua) + "')}\n\\bye\n")

    result = subprocess.run(
        [*args, "--halt-on-error", str(dest)],
        capture_output=True,
        text=True,
        cwd=tmp_dir,
        timeout=5,
    )
    print(result.stdout)
    pdf: Path = dest.with_suffix(".pdf")

    if pdf.exists():
        _open_file(pdf)


# format


def format_docstrings() -> None:
    def _format(file_name: str) -> None:
        content: str = ""

        with open(file_name) as src:
            content = src.read()

        content = _clean_docstrings(content)

        with open(file_name, "w") as dest:
            dest.write(content)

    _apply_function_on_glob("library/**/*.lua", _format)


# manuals


def download_manuals() -> None:
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


def merge_type_definitions(subproject: Subproject = "luatex") -> None:
    """Merge all lua files of a subproject into one big file for the CTAN upload."""
    contents: list[str] = []

    def _merge(file_name: str) -> None:
        content: str = ""
        with open(file_name) as src:
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

    _apply_function_on_glob("dist/" + subproject + "/*.lua", _merge)

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


def remove_navigation_table() -> None:
    def _remove(file_name: str) -> None:
        content: str = ""

        with open(file_name) as src:
            content = src.read()

        content = content.replace(
            "---A helper table to better navigate through the documentation using the\n"
            + "---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n\n",
            "",
        )

        # Remove the navigation table
        content = re.sub(r"^_N.+\n", "", content, flags=re.MULTILINE)

        # Remove duplicate empty lines.
        content = re.sub("\n\n+", "\n\n", content)

        # Remove leading and trailing whitespace
        content = content.strip() + "\n"

        with open(file_name, "w") as dest:
            dest.write(content)

    _apply_function_on_glob("dist/**/*.lua", _remove)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command")

    convert_parser = subparsers.add_parser(
        "convert",
        help="Convert manuals",
    )

    example_parser = subparsers.add_parser(
        "example",
        help="Compile examples in the folder ./examples",
        description="You can specify the relative path of a Lua file or of a TeX file.",
    )
    example_parser.add_argument("relpath")

    format_parser = subparsers.add_parser(
        "format",
        help="Format the lua docstrings (Remove duplicate empty comment lines, start docstring with an empty line)",
    )

    manuals_parser = subparsers.add_parser(
        "manuals",
        help="Download the TeX or HTML sources of the manuals.",
    )

    merge_parser = subparsers.add_parser(
        "merge",
        help="Merge multiple definitions files into one for the CTAN upload.",
        description="Specify the subproject folder.",
    )
    merge_parser.add_argument("subproject")

    navigation_parser = subparsers.add_parser(
        "remove-navigation-table",
        help="Remove the navigation table in all subprojects in the dist folder.",
    )

    args = parser.parse_args()

    if args.command == "convert":
        convert_tex()
        convert_html()
    elif args.command == "example":
        compile_example(args.relpath)
    elif args.command == "format":
        format_docstrings()
    elif args.command == "manuals":
        download_manuals()
    elif args.command == "merge":
        merge_type_definitions(args.subproject)
    elif args.command == "remove-navigation-table":
        remove_navigation_table()
    else:
        parser.print_help()
        sys.exit(1)
