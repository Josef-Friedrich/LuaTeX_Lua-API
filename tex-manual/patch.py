#! /usr/bin/python

import re
import sys


if len(sys.argv) < 2:
    print("Usage: {} <filename>".format(sys.argv[0]))
    sys.exit(1)


content: str = ""

file_name = sys.argv[1]

with open(file_name) as src:
    content = src.read()

content = re.sub(r"\\type[\n ]+\{([^}]*)\}", r"`\1`", content, flags=re.DOTALL)
content = re.sub(r"\\typ[\n ]+\{([^}]*)\}", r"`\1`", content, flags=re.DOTALL)
content = re.sub(r"\\prm[\n ]+\{([^}]*)\}", r"`\1`", content, flags=re.DOTALL)
content = re.sub(r"\\lpr[\n ]+\{([^}]*)\}", r"`\1`", content, flags=re.DOTALL)
content = re.sub(r"\\quote[\n ]+\{([^}]*)\}", r"“\1”", content, flags=re.DOTALL)
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

content = "---" + content.replace("\n", "\n---")


with open(file_name + ".lua", "w") as dest:
    dest.write(content)

print(content)
