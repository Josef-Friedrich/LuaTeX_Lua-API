#! /usr/bin/python

import re
import glob

from pathlib import Path


def patch_file(file_name: str):
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
        r"\\(starttyping|startfunctioncall|stoptyping|stopfunctioncall)", "```", content
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
    content = re.sub(
        r"\\(sub)*section\{(.*?)\}", r"# \2", content
    )
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

    print(content)



for file_name in glob.glob(str(Path(__file__).resolve().parent) + "/manuals/**/*.tex"):
    print(file_name)
    patch_file(file_name)
