MATHASTEXT CHANGE LOG
=====================

1.3w \[2019/11/16\]
----

* LaTeX 2019-10-01 release (up to patch level 3 inclusive)
  together with `amsmath` conspired `:-)` to break `mathastext`,
  in connexion with math accents. This has been fixed upstream,
  but I am releasing nevertheless a hot fix to this
  https://github.com/latex3/latex2e/issues/216 issue
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
  robust in the strict sense. This does cause some issues for
  moving arguments in the context of multiple math versions,
  hence it was a bug. The special behaviour of the math
  alphabet commands (they redefine themselves and other macros
  on first use) makes is somewhat problematic for mathastext
  to keep them updated across math versions and at the same
  time strictly LaTeX2e robust. Thus mathastext now requires
  the e-TeX primitive `\protected` and uses it for the
  definitions of the user level math alphabet macros.

  - There are a number of `\mathchardef` tokens which (under
  certain options and/or configuration via the package user
  interface), mathastext redefines as macros. These macros
  cause no issue in moving arguments (they are not "fragile"),
  still it is probably better if they expand only at the time
  of typesetting. To this effect they are now also
  `\protected`: `\exists`, `\forall`, `\colon`, `\setminus`,
  `\mid`, `\prod`, `\sum`, `\imath`, `\jmath`.

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

1.3u \[2019/08/20\]
----

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

1.3t \[2018/08/22\]
----

* bugfix: the 1.3s bugfix about `subdued` compatibility with
  `fontspec` was deficient.

* bugfix: very old (v1.2, 2012/12/20) bug causing low-level TeX error
  during package loading (with pdflatex) when setting up the math minus
  sign to be the text font endash character, in cases with
  `\encodingdefault` other than OT1, T1 or LY1, e.g. something like
  T2A.

* `\imath` and `\jmath` obey the `subdued` regime. And the minus sign
  is now handled especially to ensure perfect compatibility with the
  `subdued` option.

* breaking change: `mathastext` does not redefine anymore
  `\i` and `\j` to let them be usable both in text and math mode.

1.3s \[2018/08/21\]
----

* fix to an issue with `subdued` option in a `fontspec` context.


1.3r \[2016/11/06\]
----

* documentation tweaks.

1.3q \[2016/10/31\]
----

* new option `unicodeminus`.

* the `Recent Changes` section of the documentation has been removed as it
  was a duplicate of information available in the `Change Log`.

* some other
  changes in the documentation, in particular the use of straight quotes
  in verbatim.

1.3p \[2016/05/13\]
----

* bugfix: release `1.3n` had forgotten to activate by default its new
  customization of the amsmath macro `\newmcodes@` (it was done from
  using `\MTversion` in the document body but not by default at start
  of body.)

* public name `\MTfixmathfonts` for a `1.3o` macro.

1.3o \[2016/05/03\]
----

* `mathastext` fixes an issue related to a feature of `LuaLaTeX` and
  `luaotfload` that OpenType fonts are declared in one of two modes:
  `node` and `base`, and only the latter is functional in math mode. But
  by default text fonts are declared in mode `node`. Thus `mathastext`
  now intervenes to make it so that the font it declares in math mode
  will use mode `base`. This fixes issues with for example old style
  figures being used while the text font used lining figures (or vice
  versa, depending on the font). But see the code comments for more.

1.3n \[2016/04/22\]
----

* at long last, `mathastext` takes care properly of annoying and perplexing
  amsmath's `\newmcodes@`. The very recent change in `amsopn.sty` finally
  made it compatible with Unicode engines, but anyhow, `mathastext` must do
  its own patch to use the correct font. All of this taking into account
  the various options passed to the package. Lots of trouble for a tiny thing.

1.3m \[2016/04/02\]
----

* minor code maintenance before annual TL freeze.

1.3l \[2016/01/29\]
----

* compatibility with fontspec's upcoming switch from `EU1/EU2` to
  `TU` common to both Unicode engines.

1.3k \[2016/01/24\]
----

* typos fixed in the documentation. In particular, the README link to
  the package homepage had remained broken from day one of the package
  releases: `mathastext.html` therein was misspelled as
  `mathsastext.html` ! (but the pdf documentation had the correct link;
  as well as the CTAN catalogue).

1.3j \[2016/01/15\]
----

* renamed and modified recent `1.3i`'s `\MTactivemathoff` into
  `\MTeverymathoff`. Added `\MTeverymathdefault`.

* `subdued` mode is a bit stronger: also the asterisk reverts to the
  default (if it was modified due to option `asterisk`), the added
  extra `\mskip`'s (useful with upright fonts) for `'`, `\exists`,
  and `\forall` are suppressed rather than re-configured to use `0mu`.
  Related new commands `\MTexistsdoesskip`, `\MTforalldoesskip`,
  `\MTprimedoesskip`, `\MTnormalexists`, `\MTnormalforall`,
  `\MTnormalprime`.

* the toggle for using mathematically active letters is only emitted
  once during package loading; the `\Mathastext` command does not do
  it anymore; the use in the preamble of `\MTmathstandardletters`,
  or `\MTnoicinmath` and related commands is not overruled by later
  use of `\Mathastext`.

* quite a few documentation improvements and rewrites, particularly
  in the description of commands which are related to the
  modifications of mathcodes (mainly for math activation of
  characters or letters) as done by mathastext at `\everymath` or
  `\everydisplay`.

1.3i \[2016/01/06\]
----

* `\url` from `url.sty` as well as `\url` and `\nolinkurl` from
  `hyperref.sty` use math mode and (by default) the monospace text
  font. To avoid mathastext overwriting the special preparation done
  by `{url,hyperref}.sty` the commands `\url/\nolinkurl` are patched
  to do automatically `\MTactivemathoff` (now `\MTeverymathoff`)
  before entering math mode.

* the extra skips specified by `\MTsetmathskips` are not inserted
  around letters if inside the arguments of math alphabet commands,
  or within operator names.

* the added explicit italic corrections (for non-oblique fonts) were
  disabled within math alphabet scopes, except `mathnormal`; they
  are now disabled within all math alphabets, inclusive of
  `mathnormal`.

1.3h \[2015/10/31\]
----

* bugfixes: since `1.3d 2014/05/23` the option `symbolgreek` caused
  `\ell` to become undefined, and, similarly but far worse, options
  `selfGreek`, `selfGreeks` caused all lowercase Greek letters
  `\alpha`, `\beta`, etc.. to become undefined.

1.3g \[2015/10/15\]
----

* following `2015/10/01` LaTeX release, removal of the `"luatex"`
  prefix from the names of the LuaLaTeX math primitives. Compatibility
  maintained with older LaTeX formats.

1.3f \[2015/09/12\]
----

* the replacement of amsmath's `\resetMathstrut@`, when it is
  done, emits an Info rather than a Warning as this could be
  potentially stressful to some users.

* the `README` self-extracts from the `dtx` source, as a text
  file `README.md` with Markdown syntax.

1.3e \[2015/09/10\]
----

* bugfix: under option nosmalldelims, `\lbrace` and `\rbrace` were
  redefined as math symbols and could not be used as delimiters.

1.3d \[2015/02/26\]
----

* the documentation mentions the improved compatibility of mathastext
  with the latest (3.34) beamer release: no more need for
  `\usefonttheme{professionalfonts}`.

1.3d \[2014/05/23\]
----

* new commands `\MTstandardgreek` and `\MTcustomgreek`.

* The Greek letters, in case of use of one of the package related
  options, are left to their defaults in the normal and bold math
  versions if the subdued option was also used (this was so far
  the case only with options LGRgreek/LGRgreeks).

* `\newmcodes@` of amsmath is left untouched if package
  lualatex-math is detected.

1.3c \[2013/12/14\]
----

* added a starred variant to `\MTversion` which tells mathastext to
  only do the math set-up and not modify the text fonts.

* added second optional version name argument to `\Mathastext` and
  to `\MTDeclareVersion`, to transfer settings for things not
  otherwise changed by mathastext from a math version to the one
  declared. This is mainly for symbols and large symbols to be the
  bold ones when the user sets up the series of a mathastextified
  font to be bold in a mathastext-declared version.

* renamed `\defaultprod` to `\MToriginalprod`, `\defaultsum` to
  `\MToriginalsum`, (this is in case of option symbolmisc).

* changes to the dtx organization; options for generating the
  documentation can be customized in generated mathastext.tex file.

* 1.2d code for `\#`, `\$`, `\%`, and `\&` modified erroneously the
  earlier correct 1.2c code and created a bug showing up with more
  than 16 math families (a possibility only with lualatex or
  xelatex).

1.3a \[2013/09/04\]
----

* the somewhat silly `\string`'s are removed from the
  `\MTsetmathskips` command of release 1.3, thus allowing its first
  argument to be a macro, or any expandable code, giving a letter.

* the amsmath `\resetMathstrut@`, which is incompatible with a
  mathematically active parenthesis ( is now modified only if
  necessary (i.e. only when `\MTnonlettersobeymathxx` is issued) and
  is restored to its original value if not needed anymore (i.e.
  after `\MTnonlettersdonotobeymathxx`, as for example when
  switching to the normal version under option subdued).

* improved documentation.

1.3  \[2013/09/02\]
----

* commands `\MTsetmathskips` and `\MTunsetmathskips` added.

* commands `\MTmathactiveletters` and `\MTmathstandardletters` to
  govern the math activation of letters independently of its use
  for insertion of the italic corrections (`\MTicinmath` and
  `\MTnoicinmath` correspondingly modified).

* the new `\luatexUmathcodenum` as available since TL2013 allows
  identical treatment by mathastext of = and - under both LuaTeX
  and XeTeX.

* `\newmcodes@` of amsmath is left untouched in case of option basic.

* a sentence containing | which was written to the log during the
  loading caused a problem if | was active (typically if
  `\MakeShortVerb`{\|} was added to the preamble prior to the
  loading of mathastext).

* some preemptive measures taken regarding things such as `\mid`,
  `\lbrace`, and `\rbrace`, as some packages define these things in
  manners which made the re-definitions done by mathastext issue
  errors.

1.2f \[2013/01/21\]
----

* minor code improvements. Change log added to the user manual.

1.2e \[2013/01/10\]
----

This version should be the last one in the 1.2 series as it seems to
correct most of the main problems which were introduced with the massive
use of mathematically active characters in versions 1.2 and 1.2b.

* It is indeed a thorny point when one wants to modify an active character in
  math mode only (without breaking usage in label's and ref's for example).
  The package now does that _only_ if the activation originated in the Babel
  system as it is then possible to modify appropriately the Babel macros
  `\user@active<char>` and `\normal@char<char>`, at the time of entering math
  mode (mathastext does all its activation job at `\everymath` and
  `\everydisplay`).

  The relevant issues are discussed in section 2.10 of the user manual, in the
  test file mathastexttestalphabets.tex, and in the source code comments for
  macro `\mst@mathactivate`. The inherent incompatibility of Babel with
  packages having made mathematically active the characters itself makes
  document active is circumvented by this interference of mathastext. A
  generally applicable Babel patch could be derived from the method used by
  mathastext.

  For the non catcode active characters, mathematical activation is used.
  This is done at the entrance in math mode.

* Sadly, the feature of added italic corrections introduced in
     version 1.2b did not behave as described in the user manual, due to
     forgotten group braces. Fixed.

* The command `\MTlowerast` from the user manual of v1.2d was not the
     one implemented in the source code. Fixed.

* The test files automatically extracted from a latex run on the dtx
     file have been revised and extended.

* The code is better documented.

1.2d \[2013/01/02\]
----

*  an incompatibility with amsmath (its macro `\resetMathstrut@`),
      exists since version 1.2 of the package. This is fixed
      here.

*  various improvements in dealing with the asterisk and in the
      mechanism of letting non-letter symbols obey the math alphabet
      commands.

*  documentation extended and improved.

1.2c \[2012/12/31\]
----

*  mathastext now inserts automatically after all (latin)
      letters in math mode their italic corrections, if the font
      used is upright (sic). This improves the spacings for the
      positioning of subscripts. The feature is de-activated
      inside the math alphabets commands (apart from `\mathnormal`),
      so as to not prohibit the formation of ligatures.

*  the documentation has been extended to explain in detail the
      issues which are relevant to the new feature of added italic
      corrections.

* version 1.2 had some bad bugs when confronted to active
  characters. This is corrected and additionally
  `\MTnonlettersdonotobeymathxx` is made the default, as the user
  input is too much constrained in its absence.

*  a less fatal, but still annoying, typo had made the dot in 1.2
      of type `\mathpunct` rather than `\mathord`.

*  the inner namespace has been rationalized a bit.

1.2 \[2012/12/20\]
----

*  a new command sets up the amount of space to be automatically
      inserted before the derivative glyph (useful when using an
      upright font).

*  the scope of the math alphabets has been extended to apply
      to the non-alphabetical characters, and also to operator
      names.

*  the format of the dtx file has changed. The package file
      is self-extracting from the dtx, and four additional test
      files are also produced during `latex mathastext.dtx`.

1.15f and 1.15g \[2012/10/25\]
----

*  `\$`, `\#`, `\&`, and `\%` had been re-defined by mathastext since its
      inception in a rather strange (but working) way, which
      could cause surprises to other packages. Fixed.

*  the subdued mechanism for the math alphabets is implemented
      in a simpler and more efficient manner than in 1.15e.

*  the `defaultxx` options act a bit differently, and are more
      useful in case of a `too many math alphabets` situation.

*  various improvements in the documentation.

*  general clean up and better commenting of the source code.

1.15e \[2012/10/22\]
----

*  new user commands to specify skip or glue to be
      inserted after the math symbols `\exists` and `\forall`

*  complete (user transparent) rewrite of the code
      implementing the subdued option; and its action has
      been extended to apply also to the `\mathbf`, `\mathit`,
      `\mathsf`, `\mathtt` alphabets and not only to `\mathrm` and
      `\mathnormal` as in the previous versions.

*  improvements in the documentation.

1.15d \[2012/10/13\]
----

* the Unicode situation is now correctly treated, throughout the
  code (this had been left in a half-done way from version 1.14 of
  April 2011).

* this includes an issue related to amsmath and its
  DeclareMathOperator macro which has been fixed,

* and the code related to `\relbar` and `\Relbar` (and
  `\models`) has been revised.

1.15c \[2012/10/05\]
----

*  it is now possible to use distinct fonts in LGR encoding
      for the Greek letters according to the current math
      version.

*  improvements to the documentation.

1.15b
----

*  corrected a 'feature' of 1.15 which was backward-incompatible

*  improvements to the pdf documentation

1.15  \[2012/09/26\]
----

*  the subdued option allows the mathastextification to
      act only locally.

*  some measures taken to deal with amsmath related
      issues when using xetex or luatex.

1.14c
----

*  a bug is fixed: the `\Mathastext` macro reinitializes
      the fonts in the normal and bold math versions, but it
      also erroneously redeclared the math alphabet changing
      commands which could have been set up in previously
      defined math versions (via earlier calls to
      `\Mathastext`\[version_name\]).

1.14b \[2011/04/03\]
----

*  there was a bug with `\$`, `\#`, `\&`, `\%` in math mode which
      showed up when ten or more math families had been
      declared. This bug affected also the minus sign under
      the same circumstances, when Unicode engines were
      used. Fixed.

*  the options LGRgreek and selfGreek act now a bit
      differently, and new options LGRgreeks and selfGreeks
      have been defined.

*  I also cleaned up a bit the code, for a more
      structured namespace.

1.14
----

*  mathastext now modifies also the math alphabets `\mathit`,
      `\mathsf` and `\mathtt`, thus making it a quite generic
      complete manner to adapt the math configuration to fonts
      provided with no math support.

1.13b
----

*  when the Symbol font is used for `\prod` and `\sum` this
      will be only for inline math; display math will use the
      default glyphs

1.13 \[2011/03/11\]
----

*  the LGRgreek option is added.

*  internal changes for better readability of the code.

1.12
----

*  various bugs have been corrected.

*  the endash and alldelims options are active by default.

*  the package is more Unicode aware.

*  the `\Mathastext` command has been improved to
      facilitate the mechanism of math versions also when
      using XeTeX or LuaTeX (with package fontspec.)

*  the en-dash and dotless i and j now work with all
      encodings, Unicode inclusive.

1.11 \[2011/02/06\]
----

*  optional argument to `\Mathastext` macro.

1.1  \[2011/02/01\]
----

*  options italic and frenchmath.

1.0  \[2011/01/25\]
----

*  Initial version.

