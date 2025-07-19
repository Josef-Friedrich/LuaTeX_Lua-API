#! /usr/bin/python

import argparse
import tempfile
from pathlib import Path
import subprocess


project_base_path: Path = Path(__file__).resolve().parent.parent


def open_file(path: Path) -> None:
    subprocess.call(
        ["xdg-open", str(path)], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


def compile_example(src_relpath: str) -> None:
    tmp_dir = Path(tempfile.mkdtemp())
    print(f"Temp directory: {tmp_dir}")

    src: Path = project_base_path / "examples" / src_relpath

    dest: Path = tmp_dir / src.name
    dest.write_bytes(src.read_bytes())

    dest_lua: Path
    dest_tex: Path

    if src.suffix == ".lua":
        dest_lua = dest
        print(dest_lua.read_text())
        dest_tex = dest.with_suffix(".tex")
        dest_tex.write_text("\\directlua{dofile('" + str(dest_lua) + "')}\n\\bye\n")
        print(dest_tex.read_text())
    else:
        dest_tex = dest
        dest_lua = dest.with_suffix(".lua")

    result = subprocess.run(
        ["luatex", str(dest_tex)], capture_output=True, text=True, cwd=tmp_dir
    )

    # print("Luatex stdout:")
    print(result.stdout)
    # print("Luatex stderr:")
    # print(result.stderr)

    pdf = dest.with_suffix(".pdf")
    open_file(pdf)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command")
    example_parser = subparsers.add_parser("example")
    example_parser.add_argument("relpath")

    args = parser.parse_args()

    if args.command == "example":
        compile_example(args.relpath)
