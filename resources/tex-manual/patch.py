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
        r"\\(type|typ|prm|lpr|nod|syntax|notabene|whs)[\s]*\{([^}]*)\}", r"`\2`", content
    )

    content = re.sub(r"\\quote\s*\{([^}]*)\}", r"“\1”", content)
    content = re.sub(r"\$([^$]+)\$", r"`\1`", content)

    content = re.sub(r"\\TEX\\?", "*TeX*", content)
    content = re.sub(r"\\CONTEXT\\?", "*ConTeXt*", content)
    content = re.sub(r"\\LUATEX\\?", "*LuaTeX*", content)
    content = re.sub(r"\\LUA\\?", "*Lua*", content)

    content = re.sub(
        r"\\(starttyping|startfunctioncall|stoptyping|stopfunctioncall)", "```", content
    )

    content = re.sub(r"\\startitemize(\[[^]]*\])?", "", content)
    content = re.sub(r"\\startitem\s*", "* ", content)
    content = re.sub(r"\\stopitem(ize)?", "", content)

    content = content.replace("~", " ")
    content = content.replace("|-|", "-")
    content = content.replace("|/|", "/")
    content = content.replace("\\NC \\NR", "")
    content = content.replace("\\NC", "")

    content = "---" + content.replace("\n", "\n---")

    with open(file_name + ".lua", "w") as dest:
        dest.write(content)

    print(content)


if len(sys.argv) < 2:
    for file_name in glob.glob(str(Path(__file__).resolve().parent) + "/*.tex"):
        patch_file(file_name)
else:
    patch_file(sys.argv[1])
