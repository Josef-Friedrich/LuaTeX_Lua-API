#! /usr/bin/python

import argparse
import difflib
import glob
import logging
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import unittest
import urllib.request
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Any, Callable, Literal, Optional, Union, cast
import textwrap

logging.basicConfig(
    format="%(levelname)s %(message)s",
    stream=sys.stdout,
)

logger = logging.getLogger(__name__)


project_base_path: Path = Path(__file__).resolve().parent
"""The parent directory of this repository."""

# Removed by a regex: ---Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
copyright_notice = """------------------------------------------------------------------------
---
---This program is free software: you can redistribute it and/or modify it
---under the terms of the GNU General Public License as published by the
---Free Software Foundation, either version 2 of the License, or (at your
---option) any later version.
---
---This program is distributed in the hope that it will be useful, but
---WITHOUT ANY WARRANTY; without even the implied warranty of
---MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
---Public License for more details.
---
---You should have received a copy of the GNU General Public License along
---with this program. If not, see <https://www.gnu.org/licenses/>."""


class Colors:
    """ANSI color codes

    Source: https://gist.github.com/rene-d/9e584a7dd2935d0f461904b9f2950007
    """

    BLACK = "\033[0;30m"
    RED = "\033[0;31m"
    GREEN = "\033[0;32m"
    BROWN = "\033[0;33m"
    BLUE = "\033[0;34m"
    PURPLE = "\033[0;35m"
    CYAN = "\033[0;36m"
    LIGHT_GRAY = "\033[0;37m"
    DARK_GRAY = "\033[1;30m"
    LIGHT_RED = "\033[1;31m"
    LIGHT_GREEN = "\033[1;32m"
    YELLOW = "\033[1;33m"
    LIGHT_BLUE = "\033[1;34m"
    LIGHT_PURPLE = "\033[1;35m"
    LIGHT_CYAN = "\033[1;36m"
    LIGHT_WHITE = "\033[1;37m"
    BOLD = "\033[1m"
    FAINT = "\033[2m"
    ITALIC = "\033[3m"
    UNDERLINE = "\033[4m"
    BLINK = "\033[5m"
    NEGATIVE = "\033[7m"
    CROSSED = "\033[9m"
    END = "\033[0m"

    @staticmethod
    def _apply_color(color: str, text: Any) -> str:
        return color + str(text) + Colors.END

    @staticmethod
    def red(text: Any) -> str:
        return Colors._apply_color(Colors.RED, text)

    @staticmethod
    def green(text: Any) -> str:
        return Colors._apply_color(Colors.GREEN, text)


def _run_stylua(path: Path | str) -> None:
    subprocess.check_call(
        [
            "/usr/local/bin/stylua",
            "--config-path",
            project_base_path / "stylua.toml",
            path,
        ]
    )


def _run_pygmentize(path: Path | str) -> None:
    subprocess.check_call(
        [
            "pygmentize",
            path,
        ]
    )


def _diff(a: str, b: str) -> None:
    for line in difflib.unified_diff(a.splitlines(), b.splitlines(), n=1):
        if line.startswith("-"):
            print(Colors.RED + line + Colors.END)
        elif line.startswith("+"):
            print(Colors.GREEN + line + Colors.END)
        elif line.startswith("@@"):
            print(Colors.PURPLE + line + Colors.END)
        else:
            print(line)


def _copy_directory(
    src: str | Path, dest: str | Path, delete_dest: bool = True
) -> None:
    """
    Copies the contents of the source directory to the destination directory.

    If the destination directory exists, it is first removed along with all its contents.
    Then, the source directory is copied to the destination path.

    Args:
        src: Path to the source directory to copy.
        dest: Path to the destination directory.
    """
    if isinstance(dest, str):
        dest = Path(dest)
    if dest.exists() and delete_dest:
        shutil.rmtree(dest)
    shutil.copytree(src, dest, dirs_exist_ok=True)


def _download_url(url: str, dest_path: str) -> None:
    logger.debug("Download %s into %s", url, dest_path)
    with urllib.request.urlopen(url) as response:
        data = response.read()
        with open(dest_path, "wb") as f:
            f.write(data)


Subproject = Literal[
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]

subprojects: list[Subproject] = [
    "lualatex",
    "lualibs",
    "luametatex",
    "luaotfload",
    "luatex",
]

subprojects_dict: dict[str, str] = {
    "lualatex": "LuaLaTeX",
    "lualibs": "Lualibs",
    "luametatex": "LuaMetaTeX",
    "luaotfload": "LuaOTFLoad",
    "luatex": "LuaTeX",
}


class TextFile(Path):
    orig_content: str
    content: str

    def __init__(self, *args, **kwargs) -> None:  # type: ignore
        super().__init__(*args, **kwargs)  # type: ignore
        if self.exists():
            self.content = self.read_text()
        else:
            self.content = ""
        self.orig_content = self.content

    def _remove_duplicate_empty_lines(self) -> None:
        """Remove duplicate empty lines."""
        self.content = re.sub("\n\n+", "\n\n", self.content)

    def remove_navigation_table(self) -> None:
        self.content = self.content.replace(
            "---A helper table to better navigate through the documentation using the\n"
            + "---outline: https://github.com/Josef-Friedrich/LuaTeX_Lua-API#navigation-table-_n\n",
            "",
        )
        # Remove the navigation table
        self.content = re.sub(r"^_N.+\n", "", self.content, flags=re.MULTILINE)

        self._remove_duplicate_empty_lines()
        # Remove leading and trailing whitespace
        self.content = self.content.strip() + "\n"
        self.save()

    def clean_docstrings(self) -> None:
        """
        Cleans and formats Lua-style docstrings in the given content string.

        This function performs the following operations:
        - Ensures that a docstring starts with an empty comment line.
        - Removes duplicate empty comment lines.
        - Allows only one consecutive empty line in the content.

        Args:
            path: The path containing Lua-style docstrings to be cleaned.
        """

        # Start a docstring with an empty comment line.
        self.content = re.sub(r"\n\n---(?=[^\n])", r"\n\n---\n---", self.content)

        # Remove duplicate empty comment lines.
        self.content = re.sub("\n---(\n---)+\n", "\n---\n", self.content)

        self.content = self.content.replace("\n\n---\n\n", "\n\n")

        # Allow only one empty line
        self._remove_duplicate_empty_lines()

        # Side effect with code examples in Lua docstrings
        # content = content.replace(") end\n---", ") end\n\n---")

        # Add an empty comment line before the @param annotation.
        # content = re.sub(
        #     r"(?<!\n---)\n---@param(?=.*?\n.*?@param)", r"\n---\n---@param", content
        # )
        self.save()

    def convert_html_to_lua(self) -> None:
        self.content = re.sub(
            r"</?(tt|code)>",
            "`",
            self.content,
        )
        self.content = re.sub(
            r"</?pre.*?>",
            "```",
            self.content,
        )
        self.content = re.sub(r"<li> *", "* ", self.content)
        self.content = re.sub(r"</?.*?> *", "", self.content)
        self.content = "---" + self.content.replace("\n", "\n---")
        self.save()

    def convert_tex_to_lua(self) -> None:
        self.content = re.sub(
            r"\\(type|typ|prm|lpr|nod|syntax|notabene|whs|cbk)[\s]*\{([^}]*)\}",
            r"`\2`",
            self.content,
        )

        self.content = re.sub(
            r"\\libidx\s*\{(.*?)\}\s*\{(.*?)\}",
            r"`\1.\2`",
            self.content,
        )

        self.content = re.sub(
            r"\\(hyphenatedurl)[\s]*\{([^}]*)\}",
            r"\2",
            self.content,
        )

        self.content = re.sub(r"\\quote\s*\{([^}]*)\}", r"“\1”", self.content)
        self.content = re.sub(r"\$([^$]+)\$", r"`\1`", self.content)

        self.content = re.sub(r"\\TEX\\?", "*TeX*", self.content)
        self.content = re.sub(r"\\CONTEXT\\?", "*ConTeXt*", self.content)
        self.content = re.sub(r"\\LUATEX\\?", "*LuaTeX*", self.content)
        self.content = re.sub(r"\\LUA\\?", "*Lua*", self.content)
        self.content = re.sub(r"\\PDF\\?", "*PDF*", self.content)
        self.content = re.sub(r"\\OPENTYPE\\?", "*OpenType*", self.content)
        self.content = re.sub(r"\\TRUETYPE\\?", "*TrueType*", self.content)
        self.content = re.sub(r"\\MICROSOFT\\?", "*Microsoft*", self.content)
        self.content = re.sub(r"\\FONTFORGE\\?", "*FontForge*", self.content)
        self.content = re.sub(r"\\POSTSCRIPT\\?", "*PostScript*", self.content)
        self.content = re.sub(r"\\UTF-?8?\\?", "*UTF-8*", self.content)
        self.content = re.sub(r"\\UNICODE\\?", "*Unicode*", self.content)

        self.content = re.sub(
            r"\\(starttyping|startfunctioncall|stoptyping|stopfunctioncall)",
            "```",
            self.content,
        )

        self.content = re.sub(r"\\startitemize(\[[^]]*\])?", "", self.content)
        self.content = re.sub(r"\\startitem\s*", "* ", self.content)
        self.content = re.sub(r"\\stopitem(ize)?", "", self.content)

        self.content = self.content.replace("~", " ")
        self.content = self.content.replace("|-|", "-")
        self.content = self.content.replace("|/|", "/")
        self.content = self.content.replace("\\NC \\NR", "")
        self.content = re.sub(r"\\(NC|DB|BC|LL|TB|stoptabulate)", "", self.content)
        self.content = re.sub(r"\\starttabulate\[.*?\]", "", self.content)
        self.content = self.content.replace("etc.\\", "etc.")

        self.content = "---" + self.content.replace("\n", "\n---")

        self.content = re.sub(
            r"\\start(sub)*(section|chapter)*\[.*title=\{(.*?)\}\]",
            r"# \3",
            self.content,
        )
        self.content = re.sub(r"\\(sub)*section\{(.*?)\}", r"# \2", self.content)
        self.content = re.sub(r"\\(libindex|topicindex)\s*\{[^}]+\}", "", self.content)
        self.content = re.sub(r"---\n(---\n)+", "---\n", self.content)

        self.content = re.sub(
            r"---\\stop(sub)*section",
            "----------------------------------------------------------------\n\n",
            self.content,
        )

        self.content = re.sub(
            r"--- `(.*)` +(float|string|boolean|number|table|.*node) +",
            r"---@field \1 \2 # ",
            self.content,
        )

        self.content = re.sub(r"\n--- {10,}", r" ", self.content)

        self.save()

    def create_navigation_table(self) -> None:
        self.content = re.sub(
            r"[^\w\n]",
            "_",
            self.content,
        )
        self.content = re.sub(
            r"__+",
            "_",
            self.content,
        )
        self.content = re.sub(
            r"_\n",
            "\n",
            self.content,
        )
        self.content = re.sub(
            r"\n(?=\w)",
            "\n_N._",
            self.content,
        )
        self.content = re.sub(
            r"(?<=\w)\n",
            " = 0\n",
            self.content,
        )
        self.save()

    def save(self) -> None:
        if logger.isEnabledFor(logging.DEBUG):
            _diff(self.orig_content, self.content)
        self.write_text(self.content)


def _apply(
    relpath: str | Path, fn: Callable[[TextFile], None], extension: str = "lua"
) -> None:
    """
    Applies a given function to each file matching a glob pattern.

    Args:
        glob_relpath: Relative glob pattern to match files.
        fn: Function to apply to each matched file. The function should accept a single string argument representing the file path.

    Returns:
        None
    """
    for path in glob.glob(
        str(project_base_path / relpath) + "/**/*." + extension, recursive=True
    ):
        logger.debug(
            "Apply function %s on file %s",
            Colors.green(fn.__name__),
            Colors.green(str(path)),
        )
        fn(TextFile(path))


class Repository(Path):
    def __execute(self, *args: str) -> int:
        return subprocess.check_call(args, cwd=self)

    def __checkout(self, branch: str = "main") -> None:
        self.__execute("git", "checkout", branch)

    def checkout_clean(self, branch: str = "main") -> None:
        self.__add()
        self.__reset()
        self.__checkout(branch)
        self.__add()
        self.__reset()
        self.__pull(branch)

    def __add(self) -> None:
        self.__execute("git", "add", "-A")

    def __reset(self) -> None:
        self.__execute("git", "reset", "--hard", "HEAD")

    def __pull(self, branch: str = "main") -> None:
        self.__execute("git", "pull", "origin", branch)

    def __push(self, branch: str = "main") -> None:
        self.__execute("git", "push", "-u", "origin", branch)

    def __commit(self, message: str) -> bool:
        result = subprocess.run(["git", "commit", "-m", message], cwd=self)
        return result.returncode == 0

    def is_commited(self) -> bool:
        """
        Checks if there are no uncommitted changes in the current Git repository.

        Returns:
            bool: True if the working directory is clean (no changes since last commit), False otherwise.
        """
        return (
            subprocess.check_output(["git", "diff", "HEAD"], encoding="utf-8", cwd=self)
            == ""
        )

    def get_latest_commitid(self) -> str:
        return subprocess.check_output(
            ["git", "rev-parse", "HEAD"], encoding="utf-8", cwd=self
        ).strip()

    def get_latest_commit_url(self) -> str:
        latest = self.get_latest_commitid()
        # git@github.com:TeXLuaCATS/LuaMetaTeX.git
        # https://github.com/TeXLuaCATS/LuaMetaTeX.git
        remote = self.get_remote()
        remote = remote.replace(".git", "")
        remote = re.sub("^.*github.com.", "", remote)
        # https://github.com/TeXLuaCATS/LuaMetaTeX/commit/7ec2a8ef132ce450e62c29ce4dfea0c7ac67fb42
        return f"https://github.com/{remote}/commit/{latest}"

    def get_remote(self) -> str:
        return subprocess.check_output(
            ["git", "remote", "get-url", "origin"], encoding="utf-8", cwd=self
        ).strip()

    def sync_from_remote(self, branch: str = "main") -> None:
        self.__checkout(branch)
        self.__add()
        self.__reset()
        self.__pull(branch)

    def sync_to_remote(
        self,
        message: str,
        branch: str = "main",
    ) -> None:
        self.__add()
        if self.__commit(message):
            self.__push(branch=branch)


ManualsSpec = Union[list[str], dict[str, Optional[str]]]


@dataclass
class ManagedSubproject:
    name: str
    """The name of the subproject must match the name of its parent subfolder exactly.
    For example: LuaTeX"""

    manuals: Optional[ManualsSpec] = None

    manuals_base_url: Optional[str] = None

    @property
    def lowercase_name(self) -> str:
        """For example: luatex"""
        return self.name.lower()

    @property
    def base(self) -> Path:
        """For example: LuaCATS/upstream/luasocket"""
        return project_base_path / "LuaCATS" / "upstream" / self.name

    @property
    def library(self) -> Path:
        """For example: TeXLuaCATS/LuaTeX/library"""
        return self.base / "library"

    @property
    def dist(self) -> Path:
        """For example: dist/LuaTeX"""
        return project_base_path / "dist" / self.name

    _repo: Optional[Repository] = None

    @property
    def repo(self) -> Repository:
        """For example: LuaCATS/upstream/luasocket"""
        if not self._repo:
            self._repo = Repository(self.base)
        return self._repo

    _downstream_repo: Optional[Repository] = None

    @property
    def downstream_repo(self) -> Optional[Repository]:
        """For example: TeXLuaCATS/LuaTeX/resources/manual"""
        return None

    @property
    def downstream_library(self) -> Optional[Path]:
        """For example: LuaCATS/downstream/tex-luatex"""
        if self._downstream_repo:
            return self._downstream_repo / "library"

    @property
    def manuals_path(self) -> Path:
        """For example: TeXLuaCATS/LuaTeX/resources/manual"""
        path = self.repo / "resources" / "manual"
        if not path.exists():
            path.mkdir(parents=True)
        return path

    def download_manuals(self) -> None:
        def _download(src_filename: str, dest_filename: Optional[str] = None) -> None:
            if dest_filename is None:
                dest_filename = src_filename
            _download_url(
                f"{self.manuals_base_url}/{src_filename}",
                f"{self.manuals_path}/{dest_filename}",
            )

        if self.manuals is not None and self.manuals_base_url is not None:
            if isinstance(self.manuals, list):
                for src_filename in self.manuals:
                    _download(src_filename)
            else:
                for src_filename, dest_filename in self.manuals.items():
                    if dest_filename:
                        _download(src_filename, dest_filename)

    def sync_from_remote(self) -> None:
        self.repo.sync_from_remote()
        downstream = self.downstream_repo
        if downstream is not None:
            downstream.sync_from_remote()

    def format(self) -> None:
        _run_stylua(self.library)
        _apply(self.library, lambda file: file.clean_docstrings())
        if self.downstream_library:
            _apply(
                str(self.downstream_library) + "/**/*.lua",
                lambda file: file.clean_docstrings(),
            )
            _run_stylua(self.downstream_library)

    def distribute(self) -> None:
        dist = self.dist / "library"
        _copy_directory(self.library, dist)

        _apply(dist, lambda file: file.remove_navigation_table())
        _apply(dist, lambda file: file.clean_docstrings())

        if not self.repo.is_commited():
            raise Exception("Uncommited changes found! Commit first, then retry!")

        if self.downstream_repo:
            _copy_directory(dist, self.downstream_repo / "library")
            self.downstream_repo.sync_to_remote(
                "Sync with " + self.repo.get_latest_commit_url()
            )

    def generate_markdown_docs(self, commit_id: str) -> None:
        self.distribute()

        resources = project_base_path / "resources" / "html-docs"

        src = self.dist / "library"
        dest = project_base_path / "dist" / self.dist / "docs"

        subprocess.check_call(
            [
                "emmylua_doc",
                src,
                "--override-template",
                resources / "emmylua-templates",
                "--site-name",
                self.name,
                "--output",
                self.repo,
            ]
        )

        # css
        shutil.copyfile(
            resources / "extra.css", dest / "docs" / "stylesheets" / "extra.css"
        )

        # logo
        # https://squidfunk.github.io/mkdocs-material/setup/changing-the-logo-and-icons/#logo
        logo_src = resources / "images" / "logos" / (self.lowercase_name + ".svg")
        if logo_src.exists():
            logo_dest = dest / "docs" / "assets" / "logo.svg"
            logo_dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(logo_src, logo_dest)

        _copy_directory(
            resources / "webfonts" / "DejaVu",
            dest / "docs" / "assets" / "fonts",
            delete_dest=False,
        )

        subprocess.check_call(["mkdocs", "build"], cwd=dest)

        self.repo.checkout_clean("gh-pages")

        _copy_directory(dest, self.repo)

        self.repo.sync_to_remote("Generate docs", "gh-pages")


@dataclass
class ManagedTeXSubproject(ManagedSubproject):
    @property
    def base(self) -> Path:
        return project_base_path / "TeXLuaCATS" / self.name

    @property
    def downstream_repo(self) -> Optional[Repository]:
        if not self._downstream_repo:
            self._downstream_repo = Repository(
                project_base_path
                / "LuaCATS"
                / "downstream"
                / f"tex-{self.lowercase_name}"
            )
        if self._downstream_repo.exists():
            return self._downstream_repo


managed_subprojects: dict[str, ManagedSubproject] = {
    "lmathx": ManagedSubproject("lmathx"),
    "lpeg": ManagedSubproject("lpeg"),
    "luaharfbuzz": ManagedSubproject("luaharfbuzz"),
    "luasocket": ManagedSubproject("luasocket"),
    "luazip": ManagedSubproject("luazip"),
    "lzlib": ManagedSubproject("lzlib"),
    "md5": ManagedSubproject("md5"),
    "slnunicode": ManagedSubproject("slnunicode"),
    # TeX
    "lualatex": ManagedTeXSubproject("LuaLaTeX"),
    "lualibs": ManagedTeXSubproject(
        "Lualibs",
        manuals={
            "cld-abitoflua.tex": "01_abitoflua.tex",
            "cld-afewdetails.tex": "04_afewdetails.tex",
            "cld-backendcode.tex": "15_backendcode.tex",
            "cld-callbacks.tex": "14_callbacks.tex",
            "cld-contents.tex": None,
            "cld-ctxfunctions.tex": "11_ctxfunctions.tex",
            "cld-environment.tex": None,
            "cld-files.tex": "20_files.tex",
            "cld-gettingstarted.tex": "02_gettingstarted.tex",
            "cld-goodies.tex": "16_goodies.tex",
            "cld-graphics.tex": "06_graphics.tex",
            "cld-introduction.tex": None,
            "cld-logging.tex": "09_logging.tex",
            "cld-luafunctions.tex": "10_luafunctions.tex",
            "cld-macros.tex": "07_macros.tex",
            "cld-mkiv.tex": None,
            "cld-moreonfunctions.tex": "03_moreonfunctions.tex",
            "cld-nicetoknow.tex": "17_nicetoknow.tex",
            "cld-scanners.tex": "12_scanners.tex",
            "cld-somemoreexamples.tex": "05_somemoreexamples.tex",
            "cld-specialcommands.tex": "19_specialcommands.tex",
            "cld-summary.tex": "18_summary.tex",
            "cld-titlepage.tex": None,
            "cld-variables.tex": "13_variables.tex",
            "cld-verbatim.tex": "08_verbatim.tex",
        },
        manuals_base_url="https://raw.githubusercontent.com/contextgarden/context/refs/heads/main/doc/context/sources/general/manuals/cld",
    ),
    "luametatex": ManagedTeXSubproject(
        "LuaMetaTeX",
        manuals={
            "luametatex-assumptions.tex": "04_assumptions.tex",
            "luametatex-callbacks.tex": "07_callbacks.tex",
            "luametatex-constructions.tex": "03_constructions.tex",
            "luametatex-contents.tex": None,
            "luametatex-engines.tex": "01_engines.tex",
            "luametatex-fonts.tex": "08_fonts.tex",
            "luametatex-internals.tex": "05_internals.tex",
            "luametatex-introduction.tex": None,
            "luametatex-languages.tex": "09_languages.tex",
            "luametatex-libraries.tex": "17_libraries.tex",
            "luametatex-lua.tex": "10_lua.tex",
            "luametatex-math.tex": "13_math.tex",
            "luametatex-metapost.tex": "11_metapost.tex",
            "luametatex-nodes.tex": "15_nodes.tex",
            "luametatex-pdf.tex": "14_pdf.tex",
            "luametatex-primitives.tex": "06_primitives.tex",
            "luametatex-principles.tex": "02_principles.tex",
            "luametatex-style.tex": None,
            "luametatex-tex.tex": "12_tex.tex",
            "luametatex-tokens.tex": "16_tokens.tex",
            "luametatex-security.tex": "18_security.tex",
            "luametatex.tex": None,
        },
        manuals_base_url="https://raw.githubusercontent.com/contextgarden/context/refs/heads/main/doc/context/sources/general/manuals/luametatex",
    ),
    "luaotfload": ManagedTeXSubproject("LuaOTFload"),
    "luatex": ManagedTeXSubproject(
        "LuaTeX",
        manuals={
            "luatex-backend.tex": "14_backend.tex",
            "luatex-callbacks.tex": "09_callbacks.tex",
            "luatex-contents.tex": None,
            "luatex-enhancements.tex": "02_enhancements.tex",
            "luatex-export-titlepage.tex": None,
            "luatex-firstpage.tex": None,
            "luatex-fontloader.tex": "12_fontloader.tex",
            "luatex-fonts.tex": "06_fonts.tex",
            "luatex-graphics.tex": "11_graphics.tex",
            "luatex-harfbuzz.tex": "13_harfbuzz.tex",
            "luatex-introduction.tex": None,
            "luatex-languages.tex": "05_languages.tex",
            "luatex-logos.tex": None,
            "luatex-lua.tex": "04_lua.tex",
            "luatex-math.tex": "07_math.tex",
            "luatex-modifications.tex": "03_modifications.tex",
            "luatex-nodes.tex": "08_nodes.tex",
            "luatex-preamble.tex": "01_preamble.tex",
            "luatex-registers.tex": None,
            "luatex-statistics.tex": None,
            "luatex-style.tex": None,
            "luatex-tex.tex": "10_tex.tex",
            "luatex-titlepage.tex": None,
        },
        manuals_base_url="https://gitlab.lisn.upsaclay.fr/texlive/luatex/-/raw/master/manual",
    ),
}

parent_repo = Repository(project_base_path)
vscode_extension_repo = Repository(project_base_path, "vscode_extension")


# convert


def convert_tex() -> None:
    _apply("resources/manuals", lambda file: file.convert_tex_to_lua(), extension="tex")


def convert_html() -> None:
    _apply("resources", lambda file: file.convert_html_to_lua(), extension="html")


def example(
    src_relpath: str,
    luaonly: bool = False,
    subproject: Subproject = "luatex",
    print_docstring: bool = False,
) -> None:
    def _extract_tex_markup(lua_code: str) -> tuple[str, str]:
        """
        Extracts lines marked with '--tex: ' from Lua code and separates them from the rest.

        Args:
            lua_code: The Lua code as a string, potentially containing lines starting with '--tex: '.

        Returns:
            tuple[str, str]: A tuple containing:
                - The cleaned Lua code as a single string with '--tex: ' lines removed.
                - The extracted TeX markup as a single string, with the '--tex: ' prefix stripped from each line.
        """

        tex_markup: list[str] = []
        cleaned: list[str] = []
        for line in lua_code.splitlines():
            if line.startswith("--tex: "):
                tex_markup.append(line[7:])
            else:
                cleaned.append(line)
        return ("\n".join(cleaned), "\n".join(tex_markup))

    def _clean(lua_code: str) -> str:
        """Clean the source Lua example file. Remove the import from utils. Trim."""
        cleaned = lua_code.splitlines()
        if 'require("utils")' in cleaned[0]:
            cleaned = cleaned[1:]
        if cleaned[0] == "":
            cleaned = cleaned[1:]
        output = "\n".join(cleaned)
        return output.strip()

    def _extract_shebang(
        lua_code: str,
    ) -> tuple[str, list[str], Optional[bool]]:
        # Parse the first line to support a shebang syntax
        # #! luatex --lua-only
        # #! /usr/local/texlive/bin/x86_64-linux/luatex
        args: list[str] = []
        luaonly: Optional[bool] = None
        if lua_code.startswith("#!"):
            lines = lua_code.splitlines()
            first_line = lines[0]
            first_line = first_line.replace("#!", "")
            if "--luaonly" in first_line:
                luaonly = True
            args = shlex.split(first_line)
            # Remove the shebang
            lua_code = "\n".join(lines[1:])
        return (lua_code, args, luaonly)

    def _render_docstring(lua_code: str) -> str:
        lines: list[str] = ["", "---__Example:__", "---", "---```lua"]
        for line in lua_code.splitlines():
            lines.append("---" + line)
        lines.append("---```")
        lines.append("---")
        return "\n".join(lines)

    def _write_tex_file(path: Path, additional_tex_markup: str) -> None:
        tex_content: str = (
            "\\directlua{dofile('tmp.lua')}\n" + additional_tex_markup + "\\bye\n"
        )
        logger.debug(tex_content)
        path.write_text(tex_content)

    def _copy_to_clipboard(content: str) -> None:
        read, write = os.pipe()
        os.write(write, content.encode(encoding="utf-8"))
        os.close(write)
        subprocess.check_call(["xclip", "-selection", "clipboard"], stdin=read)

    def _run_example(
        src: Path,
        luaonly: bool = False,
        print_docstring: bool = False,
    ) -> None:
        """Run and execute one example file"""
        relpath: str = str(src).replace(str(project_base_path / "examples") + "/", "")
        print(f"Example: {Colors.green(relpath)}")

        logger.debug(f"Example source: {src}")

        # Lua require does not support absolute paths, so we are running all
        # examples from this repos base path
        dest_lua: Path = project_base_path / "tmp.lua"

        src_code = src.read_text()

        (
            src_code,
            args,
            _luaonly,
        ) = _extract_shebang(src_code)

        if _luaonly is not None:
            luaonly = True

        src_code_cleaned = _clean(src_code)
        src_code_cleaned, tex_markup = _extract_tex_markup(src_code_cleaned)

        src_cleaned = project_base_path / "tmp_cleaned.lua"
        src_cleaned.write_text(src_code_cleaned)

        _run_pygmentize(src_cleaned)

        docstring: str = _render_docstring(src_code_cleaned)
        if print_docstring:
            print(docstring)

        _copy_to_clipboard(docstring)

        dest_lua.write_text(
            "print('---start---')\n" + src_code + "\nprint('---stop---')"
        )

        dest_tex: Optional[Path] = None

        if not luaonly:
            dest_tex = project_base_path / "tmp.tex"
            _write_tex_file(dest_tex, tex_markup)

        dest: Path
        if dest_tex is None:
            dest = dest_lua
        else:
            dest = dest_tex

        if len(args) == 0:
            args = ["luatex"]
        if luaonly and "--luaonly" not in args:
            args.append("--luaonly")
        result = subprocess.run(
            [*args, "--halt-on-error", str(dest)],
            capture_output=True,
            text=True,
            cwd=project_base_path,
            timeout=5,
        )
        output = result.stdout
        output = re.sub(r"^.*---start---", "", output, flags=re.DOTALL)
        output = re.sub(r"---stop---.*$", "", output, flags=re.DOTALL)
        print(output)
        if result.returncode != 0:
            sys.exit(1)

    src: Path
    if src_relpath.startswith("examples"):
        src = project_base_path / src_relpath
    else:
        src = project_base_path / "examples" / subproject / src_relpath

    if not src.exists():
        with_extension = Path(str(src) + ".lua")
        if with_extension.exists():
            src = with_extension

    if not src.exists():
        raise Exception(f"The specified path doesn’t exist: {src}")

    if src.is_dir():
        for path in glob.glob(f"{src}/**/*.lua", recursive=True):
            _run_example(Path(path), luaonly=luaonly, print_docstring=print_docstring)
    else:
        _run_example(src, luaonly=luaonly, print_docstring=print_docstring)


def format() -> None:
    for _, subproject in managed_subprojects.items():
        subproject.format()


def manuals() -> None:
    for _, subproject in managed_subprojects.items():
        subproject.download_manuals()


def merge(subproject: Subproject = "luatex") -> None:
    """Merge all lua files of a subproject into one big file for the CTAN upload."""
    contents: list[str] = []

    def _merge(path: Path) -> None:
        content: str = ""
        with open(path) as src:
            content = src.read()
        # Remove the return statements
        content = re.sub(r"^return .+\n", "", content, flags=re.MULTILINE)

        content = re.sub(
            r"---Copyright \(C\) 2022-20\d\d by Josef Friedrich <josef@friedrich\.rocks>\n",
            "",
            content,
        )
        content = content.replace(copyright_notice, "")
        # Remove all ---@meta definitions. We add one ---@meta later
        content = content.replace("---@meta\n", "")
        contents.append(content)

    _apply("dist/library/" + subproject + "/*.lua", _merge)

    # Add copyright notice and meta definition at the beginning
    contents.insert(
        0,
        f"---Copyright (C) 2022-{datetime.now().year} by Josef Friedrich <josef@friedrich.rocks>",
    )
    contents.insert(1, copyright_notice)
    contents.insert(2, "---@meta\n")

    dist_dir: Path = project_base_path / "luatex-type-definitions"
    dist_dir.mkdir(parents=True, exist_ok=True)

    content = "\n".join(contents)
    # Artefact of the copyright removal
    content = content.replace("\n\n---\n\n", "")
    # content = _clean_docstrings(content)

    dest = dist_dir / (subproject + "-type-definitions.lua")

    with open(dest, "w") as f:
        f.write(content)

    TextFile(dest).clean_docstrings()


def dist() -> None:
    for _, subproject in managed_subprojects.items():
        subproject.distribute()
    # vscode extension
    vscode_extension_repo.checkout_clean("main")
    latest_commit_urls: list[str] = []
    for lowercase_name in ["lualatex", "lualibs", "luametatex", "luaotfload", "luatex"]:
        subproject = managed_subprojects[lowercase_name]
        _copy_directory(
            subproject.dist / "library",
            vscode_extension_repo / "library" / lowercase_name,
        )
        latest_commit_urls.append(subproject.repo.get_latest_commit_url())
    vscode_extension_repo.sync_to_remote(
        "Sync with:\n\n" + "- " + "\n- ".join(latest_commit_urls)
    )
    parent_repo.sync_to_remote("Update submodules")


def rewrap(path: str) -> None:
    """Rewrap the comments"""
    abspath = Path(path).resolve()
    lines: list[str] = []
    for line in abspath.read_text().splitlines():
        if line.startswith("---"):
            line = line[3:]
        else:
            line = ""
        lines.append(line)

    # Rewrap paragraphs: group lines into paragraphs, then wrap each paragraph
    paragraphs: list[str] = []
    current_paragraph: list[str] = []
    for line in lines:
        if line.strip() == "":
            if current_paragraph:
                paragraphs.append(" ".join(current_paragraph))
                current_paragraph = []
        else:
            current_paragraph.append(line.strip())
    if current_paragraph:
        paragraphs.append(" ".join(current_paragraph))

    rewrapped = "\n\n".join(
        "\n".join(textwrap.wrap(paragraph, width=77)) for paragraph in paragraphs
    )
    lines = []
    for line in rewrapped.splitlines():
        lines.append("---" + line)
    print("\n".join(lines))


def submodule() -> None:
    for _, subproject in managed_subprojects.items():
        subproject.sync_from_remote()


@dataclass
class Args:
    debug: bool
    command: Literal[
        "convert",
        "dist",
        "example",
        "format",
        "manuals",
        "merge",
        "rewrap",
        "submodule",
        "test",
    ]
    relpath: Optional[str]
    path: Optional[str]
    subproject: Subproject
    print_docstring: bool
    luaonly: bool


class TestManager(unittest.TestCase):
    def test_repository_get_commit_id(self) -> None:
        self.assertEqual(len(Repository(project_base_path).get_latest_commitid()), 40)

    def test_repository_is_commited(self) -> None:
        self.assertIsInstance(Repository(project_base_path).is_commited(), bool)

    def test_repository_get_remote(self) -> None:
        self.assertEqual(
            Repository(project_base_path).get_remote(),
            "git@github.com:Josef-Friedrich/LuaTeX_Lua-API.git",
        )

    def test_repository_get_latest_commit_url(self) -> None:
        repo = Repository(project_base_path)
        self.assertIn(
            repo.get_latest_commitid(),
            repo.get_latest_commit_url(),
        )

    def test_red(self) -> None:
        self.assertEqual(Colors.red("red"), "\x1b[0;31mred\x1b[0m")

    def test_green(self) -> None:
        self.assertEqual(Colors.green("green"), "\x1b[0;32mgreen\x1b[0m")

    def test_download(self) -> None:
        with tempfile.NamedTemporaryFile(delete=True) as tmp:
            _download_url("https://de.wikipedia.org", tmp.name)
            t = Path(tmp.name)
            self.assertTrue(t.exists())
            self.assertIn("Wikipedia", t.read_text())

    def test_distribute(self) -> None:
        pass
        # shutil.rmtree(project_base_path / "dist" / "library")
        # dist()
        # self.assertTrue(
        #     (
        #         project_base_path / "dist" / "library" / "luatex" / "callback.lua"
        #     ).exists()
        # )

        # def __check_navigation_table(path: Path):
        #     self.assertNotIn("_N.", path.read_text(), path)

        # _apply("dist/**/*lua", __check_navigation_table)


if __name__ == "__main__":
    main_parser = argparse.ArgumentParser()

    main_parser.add_argument("-d", "--debug", action="store_true")

    subparsers = main_parser.add_subparsers(dest="command")

    # convert
    convert_parser = subparsers.add_parser(
        "convert",
        help="Convert manuals",
    )

    # dist
    dist_parser = subparsers.add_parser(
        "dist",
        help="Copy library to dist and remove the navigation table.",
    )

    # example
    example_parser = subparsers.add_parser(
        "example",
        help="Compile examples in the folder ./examples",
        description="You can specify the relative path of a Lua file or of a TeX file.",
    )
    example_parser.add_argument(
        "-p",
        "--subproject",
        help="Select the subproject.",
        choices=subprojects,
        default="luatex",
    )
    example_parser.add_argument(
        "-l",
        "--luaonly",
        help="Exectute the example in an Lua only environement without the TeX related libraries",
        action="store_true",
    )
    example_parser.add_argument(
        "--print-docstring",
        help="Print the lua code into fenced markdown code plain as a Lua comment.",
        action="store_true",
    )

    example_parser.add_argument("relpath")

    # format
    format_parser = subparsers.add_parser(
        "format",
        help="Format the lua docstrings (Remove duplicate empty comment lines, start docstring with an empty line)",
    )

    # manuals
    manuals_parser = subparsers.add_parser(
        "manuals",
        help="Download the TeX or HTML sources of the manuals.",
    )

    # merge
    merge_parser = subparsers.add_parser(
        "merge",
        help="Merge multiple definitions files into one for the CTAN upload.",
        description="Specify the subproject folder.",
    )
    merge_parser.add_argument("subproject")

    # rewrap
    rewrap_parser = subparsers.add_parser(
        "rewrap",
        help="The Rewrap extension (https://github.com/dnut/Rewrap) does not support rewraping of thee hyphens prefixed comment lines.",
    )
    rewrap_parser.add_argument("path")

    # submodule
    submodule_parser = subparsers.add_parser(
        "submodule",
        help="Update all submodules",
    )

    # test
    test_parser = subparsers.add_parser("test", help="Run the embedded unittest.")

    args = cast(Args, main_parser.parse_args())

    if args.debug:
        logger.setLevel(logging.DEBUG)

    if args.command == "convert":
        convert_tex()
        convert_html()
    elif args.command == "dist":
        dist()
    elif args.command == "example" and args.relpath:
        example(
            args.relpath,
            luaonly=args.luaonly,
            subproject=args.subproject,
            print_docstring=args.print_docstring,
        )
    elif args.command == "format":
        format()
    elif args.command == "manuals":
        manuals()
    elif args.command == "merge" and args.subproject:
        merge(args.subproject)
    elif args.command == "rewrap" and args.path:
        rewrap(args.path)
    elif args.command == "submodule":
        submodule()
    elif args.command == "test":
        suite = unittest.defaultTestLoader.loadTestsFromTestCase(TestManager)
        runner = unittest.TextTestRunner()
        runner.run(suite)
    else:
        main_parser.print_help()
        sys.exit(1)
