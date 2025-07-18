#! /usr/bin/python

import argparse
import sys
import tempfile
from pathlib import Path
import subprocess
import re
import glob
from typing import Callable, Literal

project_base_path: Path = Path(__file__).resolve().parent


def _open_file(path: Path) -> None:
    subprocess.call(
        ["xdg-open", str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


def _apply_function_on_glob(glob_relpath: str, fn: Callable[[str], None]) -> None:
    for file_name in glob.glob(str(project_base_path) + "/" + glob_relpath):
        print(file_name)
        fn(file_name)


Subproject = Literal[
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]


def compile_example(src_relpath: str) -> None:
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

    Returns:
        None
    """
    tmp_dir = Path(tempfile.mkdtemp())

    src: Path
    if src_relpath.startswith("examples"):
        src = project_base_path / src_relpath
    else:
        src = project_base_path / "examples" / src_relpath

    dest: Path = tmp_dir / src.name
    dest.write_bytes(src.read_bytes())

    dest_lua: Path
    dest_tex: Path

    if src.suffix == ".lua":
        dest_lua = dest
        dest_tex = dest.with_suffix(".tex")
        dest_tex.write_text("\\directlua{dofile('" + str(dest_lua) + "')}\n\\bye\n")
    else:
        dest_tex = dest
        dest_lua = dest.with_suffix(".lua")

    result = subprocess.run(
        ["luatex", str(dest_tex)], capture_output=True, text=True, cwd=tmp_dir
    )

    print(result.stdout)

    pdf: Path = dest.with_suffix(".pdf")

    if pdf.exists():
        _open_file(pdf)


def format_docstrings() -> None:
    def _format(file_name: str) -> None:
        content: str = ""

        with open(file_name) as src:
            content = src.read()

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

        with open(file_name, "w") as dest:
            dest.write(content)

    _apply_function_on_glob("library/**/*.lua", _format)


def merge_type_definitions(subproject: Subproject = "luatex") -> None:
    contents: list[str] = []

    def _merge(file_name: str) -> None:
        content: str = ""
        with open(file_name) as src:
            content = src.read()
        # Remove the return statements
        content = re.sub(r"^return .+\n", "", content, flags=re.MULTILINE)
        contents.append(content)

    _apply_function_on_glob("dist/" + subproject + "/*.lua", _merge)

    dist_dir: Path = project_base_path / "dist-ctan" / subproject
    dist_dir.mkdir(parents=True, exist_ok=True)
    with open(dist_dir / (subproject + "-type-definitions.lua"), "w") as f:
        f.write("\n".join(contents))


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

    if args.command == "example":
        compile_example(args.relpath)
    elif args.command == "format":
        format_docstrings()
    elif args.command == "merge":
        merge_type_definitions(args.subproject)
    elif args.command == "remove-navigation-table":
        remove_navigation_table()
    else:
        parser.print_help()
        sys.exit(1)
