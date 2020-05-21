# tkz-base

Release 3.06c 2020/04/06

## Description

The package `tkz-base` provides some tools like a Cartesian (rectangular)
coordinate system to other packages like `tkz-euclide` or `tkz-fct`.
With this package, you can draw coordinate axis, grids, draw points, the
principle  is to specify the position of any point in two-dimensional space by
an unique couple of coordinates.

## Licence

The scontents package may be modified and distributed under the terms and
conditions of the [LaTeX Project Public
License](https://www.latex-project.org/lppl/), version 1.3c or greater.

## Features

- needs xfp.sty, numprint;
- requires and automatically loads  PGF/TikZ > 3.0;
- compiles with utf8, pdflatex, lualatex;

## Installation

The package `tkz-base` is present in `TeXLive` and `MiKTeX`, use the
package manager to install.

You can experiment with the `tkz-base` package by placing all of the
distribution files in the directory containing your current tex file.

For manual instalation all files must be moved into the different directories in your
installation `TDS` tree or in your `TEXMFHOME`:

```
  doc/TKZdoc-base.pdf -> TDS:doc/latex/tkz-doc/TKZdoc-base.pdf
  doc/examples/*.*    -> TDS:doc/latex/tkz-doc/examples/*.*
  doc/sourcedoc/*.*   -> TDS:doc/latex/tkz-doc/sourcedoc/*.*
  code/*.*            -> TDS:tex/latex/tkz-doc/*.*
```

## How to use it


To use the package `tkz-base`, place the following lines in the preamble of
your LaTeX document.

```
\usepackage{tkz-base}
```

The line `\usepackage{tkz-base}` loads TikZ.
The line `\usetkzobj{all}` loads all objects used by `tkz-euclide`.
With `\usepackage{tkz-euclide}` you don't need to use `\usetkzobj`

To avoid package conflicts, you need to load `xcolor` before `TikZ` or `tkz-base` or
`tkz-euclide`.

## Documentation

Documentations for `tkz-base` and `tkz-euclide`  are available on CTAN and your
distribution.


## Examples

All  examples given in documentation will be stored on CTAN as standalone
files, ready for compilation. You can use the main.tex file to load and
compile  an example.

Other examples, en français, can be found on my site  [http://altermundus.fr](http://altermundus.fr).

## Compatibility

The new version of `tkz-base` is *not* fully compatible with the version 1.16 but
the differences are minor

## History

- 3.06c correction of the documentation ( thanks to Laurent Van Deik)
- 3.05c correction of bugs, some macros have migrated to `tkz-euclide`
- 3.02c correction of bugs, new code
- 3.01c correction of bugs, new code
- 1.16 correction of bugs
- 1.13 first version

## Author

Alain Matthes, 5 rue de Valence, Paris 75005, al (dot) ma (at) mac (dot) com

