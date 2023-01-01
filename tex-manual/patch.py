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

content = content.replace("\\TEX\\", "*TeX*")
content = content.replace("\\CONTEXT\\", "*ConTeXt*")
content = content.replace("\\LUATEX\\", "*LuaTeX*")
content = content.replace("\\LUA\\", "*Lua*")

content = content.replace("\\starttyping", "```")
content = content.replace("\\stoptyping", "```")

content = content.replace("\\startitemize[packed]", "")
content = content.replace("\\stopitemize", "")


content = content.replace("\\startitem", "* ")
content = content.replace("\\stopitem", "")


content = "---" + content.replace("\n", "\n---")


with open(file_name + ".lua", "w") as dest:
    dest.write(content)

print(content)
