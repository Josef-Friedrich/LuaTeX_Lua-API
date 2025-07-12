#! /usr/bin/python

import re
import glob

from pathlib import Path


def patch_file(file_name: str):
    content: str = ""

    with open(file_name) as src:
        content = src.read()

    # Remove the navigation table
    content = re.sub(r"^_N\..+(?=\n)", "", content, flags=re.MULTILINE)

    # Remove duplicate empty lines.
    content = re.sub("\n\n+", "\n\n", content)

    # Remove leading and trailing whitespace
    content = content.strip() + "\n"

    with open(file_name, "w") as dest:
        dest.write(content)

    print(content)


for file_name in glob.glob(
    str(Path(__file__).resolve().parent.parent) + "/dist/**/*.lua"
):
    print(file_name)
    patch_file(file_name)
