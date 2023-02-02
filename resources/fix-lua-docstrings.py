#! /usr/bin/python

import re
import glob

from pathlib import Path


def patch_file(file_name: str):
    content: str = ""

    with open(file_name) as src:
        content = src.read()

    # Start a docstring with an empty comment line.
    content = re.sub(r"\n\n---(?=[^\n])", r"\n\n---\n---", content)

    # Remove duplicate empty comment lines.
    content = content.replace("\n---\n---\n", "\n---\n")

    # Add an empty comment line before the @param annotation.
    # content = re.sub(
    #     r"(?<!\n---)\n---@param(?=.*?\n.*?@param)", r"\n---\n---@param", content
    # )

    with open(file_name, "w") as dest:
        dest.write(content)

    print(content)


for file_name in glob.glob(
    str(Path(__file__).resolve().parent.parent) + "/library/**/*.lua"
):
    print(file_name)
    patch_file(file_name)
