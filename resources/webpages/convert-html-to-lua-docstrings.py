#! /usr/bin/python

import re
import sys
import glob

from pathlib import Path


def patch_file(file_name: str):
    content: str = ""

    with open(file_name) as src:
        content = src.read()

    content = re.sub(
        r"</?tt>",
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

    print(content)


if len(sys.argv) < 2:
    for file_name in glob.glob(str(Path(__file__).resolve().parent) + "/**/*.html"):
        patch_file(file_name)
else:
    patch_file(sys.argv[1])
