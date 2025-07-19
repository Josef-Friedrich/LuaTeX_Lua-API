#! /usr/bin/python

import argparse
import tempfile
from pathlib import Path
import subprocess
import re
import glob
from typing import Literal

project_base_path: Path = Path(__file__).resolve().parent


def open_file(path: Path) -> None:
    subprocess.call(
        ["xdg-open", str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


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
        open_file(pdf)


def merge_type_definitions(subproject: Subproject = "luatex") -> None:
    contents: list[str] = []

    def merge_file(file_name: str) -> None:
        content: str = ""
        with open(file_name) as src:
            content = src.read()
        # Remove the return statements
        content = re.sub(r"^return .+\n", "", content, flags=re.MULTILINE)
        contents.append(content)

    for file_name in sorted(
        glob.glob(str(project_base_path) + "/dist/" + subproject + "/*.lua")
    ):
        print(file_name)
        merge_file(file_name)

    dist_dir: Path = project_base_path / "dist-ctan" / subproject
    dist_dir.mkdir(parents=True, exist_ok=True)
    with open(dist_dir / (subproject + "-type-definitions.lua"), "w") as f:
        f.write("\n".join(contents))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command")
    example_parser = subparsers.add_parser(
        "example",
        help="Compile examples in the folder ./examples",
        description="You can specify the relative path of a Lua file or of a TeX file.",
    )
    example_parser.add_argument("relpath")

    merge_parser = subparsers.add_parser(
        "merge",
        help="Merge multiple definitions files into one for the CTAN upload.",
        description="Specify the subproject folder.",
    )
    merge_parser.add_argument("subproject")

    args = parser.parse_args()

    if args.command == "example":
        compile_example(args.relpath)
    elif args.command == "merge":
        merge_type_definitions(args.subproject)
    else:
        parser.print_help()
