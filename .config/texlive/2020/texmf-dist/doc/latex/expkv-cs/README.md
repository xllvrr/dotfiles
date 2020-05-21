-------------------------------------------------------------------------------
# expkv-cs -- define expandable key=val macros using expkv

Version 2020-04-29 v0.3

Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

Hosted at https://github.com/Skillmon/tex_expkv-cs

-------------------------------------------------------------------------------

Copyright (C) 2020 Jonathan P. Spratte

This  work may be  distributed and/or  modified under  the conditions  of the
LaTeX Project Public License (LPPL),  either version 1.3c  of this license or
(at your option) any later version.  The latest version of this license is in
the file:

  http://www.latex-project.org/lppl.txt

This work is "maintained" (as per LPPL maintenance status) by
  Jonathan P. Spratte.

-------------------------------------------------------------------------------

This provides means to define expandable key=val taking macros utilizing
[`expkv`](https://github.com/Skillmon/tex_expkv). It is generic code and only
requires `expkv` for its parsing. There is a LaTeX package `expkv-cs.sty`
included to play nice on LaTeX's package loading system, but that package is not
needed and does not provide more functionality than the generic code in
`expkv-cs.tex`.
