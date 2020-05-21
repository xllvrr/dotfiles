# tkz-doc — Class and package for the documentation of all tkz-* packages.

Release 1.43c 2020/04/10

## Note

This package is highly experimental and subject to change without notice.

## Licence

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
[LaTeX Project Public License](https://www.latex-project.org/lppl/)
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.
This work has the LPPL maintenance status “maintained”.
The Current Maintainer of this work is Alain Matthes.

## Installation

The package `tkz-doc` is present in `TeXLive` and `MiKTeX`, use the
package manager to install.

For manual installation all files must be moved into the different directories in your
installation `TDS` tree or in your `TEXMFHOME`:

```
  doc/README.md -> TDS:doc/latex/tkz-doc/README.md
  latex/*.*     -> TDS:tex/latex/tkz-doc/*.*
```

## How to use it

1. If you want to compile the documentation of a `tkz-*` package, you need to use the lualatex engine.

## History

- v 1.43 Correction of bug about the color. Remove the library `babel` of `TikZ`
- v 1.42 I added in the version 1.4, an option called `cadre`. If you want to draw the frame of the cover, you need to use this option. In this case, you need to
install the font `orna4`. By default, no frame.

## Author

Alain Matthes, 5 rue de Valence, Paris 75005, al (dot) ma (at) mac (dot) com
