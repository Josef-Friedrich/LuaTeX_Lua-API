#! /usr/bin/python

import glob
import re
from pathlib import Path

contents: list[str] = []


project_base_path: Path = Path(__file__).resolve().parent.parent


def merge_file(file_name: str) -> None:
    content: str = ""
    with open(file_name) as src:
        content = src.read()

    # Remove the return statements
    content = re.sub(r"^return .+\n", "", content, flags=re.MULTILINE)
    contents.append(content)


for file_name in sorted(
    glob.glob(str(Path(__file__).resolve().parent.parent) + "/dist/luatex/*.lua")
):
    print(file_name)
    merge_file(file_name)


dist_dir: Path = project_base_path / "dist-ctan" / "luatex"

dist_dir.mkdir(parents=True, exist_ok=True)

with open(dist_dir / "luatex-type-definitions.lua", "w") as f:
    f.write("\n".join(contents))
