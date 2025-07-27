#! /usr/bin/python

import argparse
import difflib
import glob
import logging
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import urllib.request
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Callable, Literal, Optional, Union, cast
import unittest

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


def _apply_color(color: str, text: str) -> str:
    return color + text + Colors.END


def red(text: str) -> str:
    return _apply_color(Colors.RED, text)


def green(text: str) -> str:
    return _apply_color(Colors.GREEN, text)


def _open_file(path: Path) -> None:
    subprocess.call(
        ["xdg-open", str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


def _run_stylua(path: Path | str) -> None:
    subprocess.check_call(
        [
            "/usr/local/bin/stylua",
            "--config-path",
            project_base_path / "resources" / "stylua.toml",
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
    # Start a docstring with an empty comment line.
    content = re.sub(r"\n\n---(?=[^\n])", r"\n\n---\n---", content)

    # Remove duplicate empty comment lines.
    content = re.sub("\n---(\n---)+\n", "\n---\n", content)

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


# example


def compile_example(
    src_relpath: str, luaonly: bool = False, subproject: Subproject = "luatex"
) -> None:
    """
    Compiles a Lua or TeX example file.

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
        src = project_base_path / "examples" / subproject / src_relpath

    logger.debug(f"Example source: {src}")

    # dest: Path = tmp_dir / src.name
    # """The path of the destination file that is copied to a temporary directory."""

    dest: Path = project_base_path / ("tmp" + src.suffix)
    """Lua require does not support absolute paths"""

    src_content = src.read_text()

    if logger.isEnabledFor(logging.DEBUG):
        _run_pygmentize(src)

    src_content = re.sub(
        r"(\./)?resources/utils",
        str(project_base_path / "resources/utils"),
        src_content,
    )

    args: list[str] = ["luatex"]

    if luaonly:
        args.append("--luaonly")

    # Parse the first line to support a shebang syntax
    # #! luatex --lua-only
    # #! /usr/local/texlive/bin/x86_64-linux/luatex
    if src_content.startswith("#!"):
        lines = src_content.splitlines()
        first_line = lines[0]
        first_line = first_line.replace("#!", "")
        if "--luaonly" in first_line:
            luaonly = True
        args = shlex.split(first_line)
        # Remove the shebang
        src_content = "\n".join(lines[1:])

    if src.suffix == ".lua":
        src_content = "print('---start---')\n" + src_content + "\nprint('---stop---')"

    dest.write_text(src_content)

    if src.suffix == ".lua" and not luaonly:
        dest_lua = dest
        dest = dest.with_suffix(".tex")
        tex_content = "\\directlua{dofile('" + str(dest_lua) + "')}\n\\bye\n"
        logger.debug(tex_content)
        dest.write_text("\\directlua{dofile('" + str(dest_lua) + "')}\n\\bye\n")

    result = subprocess.run(
        [*args, "--halt-on-error", str(dest)],
        capture_output=True,
        text=True,
        cwd=tmp_dir,
        timeout=5,
    )

    output = result.stdout

    output = re.sub(r"^.*---start---", "", output, flags=re.DOTALL)
    output = re.sub(r"---stop---.*$", "", output, flags=re.DOTALL)

    print(output)
    pdf: Path = dest.with_suffix(".pdf")

    if pdf.exists():
        _open_file(pdf)


# format


def format_docstrings() -> None:
    def _format(path: Path) -> None:
        _update_text_file(path, _clean_docstrings)
        _run_stylua(path)

    _apply("library/**/*.lua", _format)


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

    _apply("dist/" + subproject + "/*.lua", _merge)

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


def _push_into_downstream_submodule(subproject: Subproject) -> None:
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

    if not _is_git_commited():
        raise Exception("Uncommited changes found! Commit first, then retry!")

    subprocess.check_call(["git", "add", "-A"], cwd=path)
    subprocess.check_call(["git", "reset", "--hard", "HEAD"], cwd=path)
    subprocess.check_call(["git", "pull", "origin"], cwd=path)

    commit_id = _get_latest_git_commitid()

    shutil.copytree(project_base_path / "library" / subproject, path / "library")
    subprocess.check_call(["git", "add", "-A"], cwd=path)
    subprocess.check_call(
        [
            "git",
            "commit",
            "-m",
            f"Sync with https://github.com/Josef-Friedrich/LuaTeX_Lua-API/commit/{commit_id}",
        ],
        cwd=path,
    )
    subprocess.check_call(["git", "push", "-u", "origin", "main"], cwd=path)


def distribute() -> None:
    """
    Copies the contents of the 'library' directory to a new 'dist' directory,
    removing any existing 'dist' directory first.

    Raises:
        OSError: If there is an error removing or copying directories.
    """
    src_dir = project_base_path / "library"
    dest_dir = project_base_path / "dist"
    if dest_dir.exists():
        shutil.rmtree(dest_dir)
    shutil.copytree(src_dir, dest_dir)

    _apply("dist/**/*.lua", _remove_navigation_table)

    for subproject in subprojects:
        _push_into_downstream_submodule(subproject)


@dataclass
class Args:
    debug: bool
    command: Literal[
        "convert",
        "dist",
        "e",
        "example",
        "format",
        "manuals",
        "merge",
        "test",
    ]
    relpath: Optional[str]
    subproject: Optional[Subproject]
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
        shutil.rmtree(project_base_path / "dist")
        distribute()
        self.assertTrue(
            (project_base_path / "dist" / "luatex" / "callback.lua").exists()
        )

        def __check_navigation_table(path: Path):
            self.assertNotIn("_N.", path.read_text(), path)

        _apply("dist/**/*lua", __check_navigation_table)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-d", "--debug", action="store_true")

    subparsers = parser.add_subparsers(dest="command")

    convert_parser = subparsers.add_parser(
        "convert",
        help="Convert manuals",
    )

    dist_parser = subparsers.add_parser(
        "dist",
        help="Copy library to dist and remove the navigation table.",
    )

    example_parser = subparsers.add_parser(
        "example",
        aliases=["e"],
        help="Compile examples in the folder ./examples",
        description="You can specify the relative path of a Lua file or of a TeX file.",
    )
    example_parser.add_argument(
        "-p", "--subproject", help="Select the subproject.", choices=subprojects
    )
    example_parser.add_argument(
        "-l",
        "--luaonly",
        help="Exectute the example in an Lua only environement without the TeX related libraries",
        action="store_true",
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

    test_parser = subparsers.add_parser("test", help="Run the embedded unittest.")

    args = cast(Args, parser.parse_args())

    if args.debug:
        logger.setLevel(logging.DEBUG)
    if args.command == "e":
        args.command = "example"

    if args.command == "convert":
        convert_tex()
        convert_html()
    elif args.command == "dist":
        distribute()
    elif args.command == "example" and args.relpath:
        if args.subproject:
            compile_example(args.relpath, args.luaonly, args.subproject)
        else:
            compile_example(args.relpath, args.luaonly)
    elif args.command == "format":
        format_docstrings()
    elif args.command == "manuals":
        download_manuals()
    elif args.command == "merge" and args.subproject:
        merge_type_definitions(args.subproject)
    elif args.command == "test":
        suite = unittest.defaultTestLoader.loadTestsFromTestCase(TestManager)
        runner = unittest.TextTestRunner()
        runner.run(suite)
    else:
        parser.print_help()
        sys.exit(1)
