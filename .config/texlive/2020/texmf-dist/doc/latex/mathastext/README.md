<!-- -->
            +-------------------------------------------+
            +                                           +
            +                mathastext                 +
            +                                           +
            +     'Use the text font in math mode'      +
            +                                           +
            +-------------------------------------------+

This Work may be distributed and/or modified under the conditions
of the [LPPL1.3c](http://www.latex-project.org/lppl/lppl-1-3c.txt)

The Author of this Work is Jean-Francois Burnol

Copyright (C) 2011-2019 Jean-Francois Burnol (`jfbu at free dot fr`)

      Source: mathastext.dtx 1.3w 2019/11/16


DESCRIPTION
===========

Optimal typographical results for documents containing
mathematical symbols can only be hoped for with math fonts
specifically designed to match a given text typeface.
Although the list of freely available math fonts (alongside
the Computer Modern and AMS extension fonts) is slowly
expanding (fourier, kpfonts, mathdesign, pxfonts, txfonts,
newpx, newtx, ...) it remains limited, and the situation is
even worse with Unicode fonts (XeTeX/LuaTeX). So if you can't
find a math font which fits well with your favorite text
font, and wish to still be able to typeset mathematical
documents, perhaps not of the highest typographical quality,
but at least not subjected to obvious visual incompatibilities
between your text font and the math fonts, try out mathastext:
it will simply use the text font also for the math!

- http://jf.burnol.free.fr/mathastext.html
- http://jf.burnol.free.fr/showcase.html

USAGE
=====

`mathastext` is a LaTeX package

      \usepackage{mathastext}

The document will use in math mode the text font as configured at
package loading time, for these characters:

      abcdefghijklmnopqrstuvwxyz
      ABCDEFGHIJKLMNOPQRSTUVWXYZ
      0123456789
      !?,.:;+-=()[]/#$%&<>|{}\

Main options: `italic`, `subdued`, `LGRgreek`.
- Use the `italic` option to get the Latin letters in math mode
  be in italics. Digits and log-like operator names (pre-defined
  as well as user-defined) will be in the same shape as the text
  font (usually this means upright).
- each `\Mathastext[<name>]` in the preamble defines a math version
  to be later activated in the document body via the command
  `\MTversion{<name>}`.
- With the `subdued` option, mathastext will be active
  only inside such math versions.
- For documents needing Greek letters the following is
  possible:
  - no option: Greek letters defined by other packages,
  - `eulergreek`: use the Euler font for the Greek letters,
  - `symbolgreek`: use the Postscript Symbol font for the
     Greek letters.
  - `LGRgreek`: use the document text font in LGR encoding.
     Further options specify the shape of the lowercase
     and uppercase Greek glyphs; starting with v1.15c it is
     possible to use multiple distinct LGR fonts in the
     same document.
- Commands are provided to scale the Euler and Symbol fonts by an
  arbitrary factor to let them fit better with the document text
  font.
- `\MTsetmathskips` allows to set up extra spacings around letters.

RECENT CHANGES
==============

1.3w \[2019/11/16\]
----

* LaTeX 2019-10-01 release (up to patch level 3 inclusive)
  together with `amsmath` conspired `:-)` to break `mathastext`,
  in connexion with math accents. This has been fixed upstream,
  but I am releasing nevertheless a hot fix to this
  [issue](https://github.com/latex3/latex2e/issues/216)
  (this is compatible with future LaTeX releases).

* Fix: the `\hbar` is originally a robust command but
  becomes a `\mathchardef` token if (e.g.) `amsfonts` is
  loaded and then with recent LaTeX `\hbar<space>` is
  made undefined and `mathastext` definition of it
  remained without effect. The `\mathastext` own `\hbar`
  is now defined `\protected`.

* Fix: option `noendash` (or `symboldelimiters` which implies
  it) caused (since `1.3u`) a bug under Unicode engines when
  setting up the minus sign.

* Version names declared via the optional argument of
  `\Mathastext` or as first argument of `\MTDeclareVersion`
  must not be `normal` or `bold`. Enforce that! (this was
  marked as a bug to fix since `2012/10/24`...)

1.3v \[2019/09/19\]
----

* LaTeX 2019-10-01 release has made more math macros robust.
  This applies in particular to the math accents and to the
  `\hbar`. This required for mathastext to adapt. Also
  `\leftarrowfill` and `\rightarrowfill` are now defined
  robust by the kernel, hence mathastext does the same. These
  changes are dropped if mathastext detects an older LaTeX
  format.

* These LaTeX kernel changes motivated an examination of some
  redefinitions done (optionally) by mathastext:
  - The user math alphabet macros got redefined as expanding
    to some other (robust) math alphabet macros, but were not
    robust in the strict sense. This does cause some issues
    for moving arguments in the context of multiple math
    versions, hence it was a bug. The special behaviour of the
    math alphabet commands (they redefine themselves and other
    macros on first use) makes is somewhat problematic for
    mathastext to keep them updated across math versions and
    at the same time strictly LaTeX2e robust. Thus mathastext
    now requires the e-TeX primitive `\protected` and uses it
    for the definitions of the user level math alphabet
    macros.
  - There are a number of `\mathchardef` tokens which (under
    certain options and/or configuration via the package user
    interface), mathastext redefines as macros. These macros
    cause no issue in moving arguments (they are not
    "fragile"), still it is probably better if they expand
    only at the time of typesetting. To this effect they are
    now also `\protected`: `\exists`, `\forall`, `\colon`,
    `\setminus`, `\mid`, `\prod`, `\sum`, `\imath`, `\jmath`.
  - The macro `\vert` (which expands to a `\delimiter`) is now
    defined robust by LaTeX. Its mathastext redefinition is a
    `\protected` one rather.
  - The `\{` and `\}` (which get redefined only under
    `\MTexplicitbracesobeymathxx` regime) are now strictly
    robust in the LaTeX2e sense (formerly they were `\let` to
    some robust macros, and this did not make them strictly
    LaTeX2e-robust entities).

* The various changes in mathastext described in the previous item
  apply independently of the LaTeX release version. The
  LaTeX format itself requires the e-TeX extensions since 2015.

1.3u (2019/08/20)
---

* new feature: the initial release dealt with only one font, and
  although shortly thereafter the 1.11 version added support for
  extended math versions, it was documented that some font-dependent
  set-up (minus as endash, dotless i and j, hbar, math accents) was
  done only once. This release makes the relevant characters font
  encoding savvy in each mathastext-extended math version. Thus,
  they should render correctly even with multiple math versions
  using fonts with varying encodings.

  This reinforces importance of using `\MTversion` and not the
  LaTeX `\mathversion` when switching to a new math version (which
  got declared via the package interface). The implementation is
  compatible with Unicode engines and mixed usage of `TU` encoding
  (OpenType fonts) with traditional 8bits TeX font encodings. For
  all engines, all used (8bits) encodings must have been passed as
  options to the `fontenc` package.

  Thanks to Falk Hanisch for feature request and code suggestions.

* new option `unimathaccents`: this adds to option `mathaccents`
  the demand to use the text font accents for OpenType fonts in math
  mode via the `\Umathaccent` primitive. Indeed, as my testing
  showed that this gave non-satisfactory results both with XeTeX
  and LuaTeX regarding the horizontal placement of the accents,
  the main option `mathaccents` acts only on 8bits encoded fonts.

* bugfix: the `\Mathastext` without optional argument forgot to
  repeat some font-encoding dependent initialization set-up done
  originally during package loading.

* bugfix: under the `subdued` option macros `\MTmathactiveletters`
  or `\MTnonlettersobeymathxx` now act like no-ops if
  issued explicitly while in the `normal` or `bold` math version.
  Formerly, this was not the case and could cause bugs such as a
  disappearing minus sign in math mode.

* bugfix: the letter `h` used in the `\hbar` obeyed the extra
  skips as set-up by `\MTsetmathskips`, badly interfering with the
  horizontal positioning of the bar accent. They are now ignored
  (as well as the added italic correction).

