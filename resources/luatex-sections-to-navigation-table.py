#! /usr/bin/python

import re


with open("tmp.lua") as src:
    content = src.read()


content = re.sub(
    r"[^\w\n]",
    "_",
    content,
)

content = re.sub(
    r"__+",
    "_",
    content,
)

content = re.sub(
    r"_\n",
    "\n",
    content,
)

content = re.sub(
    r"\n(?=\w)",
    "\n_N._",
    content,
)

content = re.sub(
    r"(?<=\w)\n",
    " = 0\n",
    content,
)


with open("tmp-read.lua", "w") as dest:
    print(content)
    dest.write(content)
