# LuaTeX Lua API

## Version on CTAN

<!-- Die Typ-Definitionen für LuaTeX werden auf CTAN als eine einzige
Datei veröffentlicht, um das CTAN-Verzeichnis nicht mit vielen einzelnen
Lua-Dateien zu überladen. -->
The type definitions for LuaTeX are published on CTAN as a single file to avoid
cluttering the CTAN directory with many individual Lua files.
<!-- Da diese eine Datei knapp 1,5 MB groß ist, muss eine Konfiguration
vorgenommen werden, damit der Sprachserver die Datei laden kann -->
Since this one file is just under 1.5 MB in size, a configuration must be made
so that the language server can load the file.
<!-- Das folgende Konfigurationsbeispiel legt die Dateigröße für das Laden
von Typdefinitionen auf maximal 5000 kB fest. -->
The following configuration example sets the preload file size to a maximum of 5000 kB.

```json
{
    "Lua.workspace.preloadFileSize": 5000,
}
```

<!-- Es gibt mehrere Möglichkeiten die LuaTeX-Typdefinitionen in einem
Projekt einzubingen. -->
There are several ways to include LuaTeX type definitions in a project.
<!-- Am einfachsten ist es, die Datei in den Projektordner zu kopieren. -->
The easiest way is to copy the file into the project folder.
<!-- Oder Sie verwenden die Konfiguration `Lua.workspace.library`. -->
Or you can use the configuration `Lua.workspace.library`:

```json
{
    "Lua.workspace.library": ["/path/to/luatex-type-definitions.lua"]
}
```

## Current version

2025/07/13 v0.1.0

## License

Copyright (C) 2022-2025 by Josef Friedrich <josef@friedrich.rocks>
------------------------------------------------------------------------

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 2 of the License, or (at your
option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details.

You should have received a copy of the GNU General Public License along
with this program. If not, see <https://www.gnu.org/licenses/>.
