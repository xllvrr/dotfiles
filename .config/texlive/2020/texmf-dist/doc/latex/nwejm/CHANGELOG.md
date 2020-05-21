# [Unreleased]

# [1.0.1] - 2020-03-18

## Fixed
- Track changes in `expl3`.
- Fix bugs due to changes in `expl3`.

# [1.0.0] - 2020-01-28

## Added
- README file.
- CHANGELOG file (following https://keepachangelog.com/en/1.0.0/).
- Semantic versionning (following https://semver.org/).
- Publication director, composer, masthead (not for the articles' authors).

## Fixed
- Track changes in `expl3`.

# [0.98f] - 2019-03-18

## Added
- Built-in "conditions" enumeration.
- New public command for easily create new enumerations.

## Changed
- "Such that" symbol in sets definitions now is `\vert` instead of `\slash`.
- `authoryear` bib and cite style changed for `authoryear-comp`.
- Hyperfootnotes now true.
- Documentation improved.
- Plural forms of (new) theorems now handled.
- Command `\textcite` revisited.
- Minor other changes.

## Fixed
- Several bug fixes.

# [0.98e] - 2018-04-07

## Changed
- Track changes in `expl3`.
- Support for `biblatex` 3.8 changes.
- "Cont. next page" notifications for `align` and `multline` across page breaks.
- *Breaking change* `flalign(*)` and `alignat(*)` now are aliases of `align(*)`
  (needed for the previous feature).
- *Breaking change* Package `autonum` not loaded anymore: `equation`, `align`,
  `gather`, `multline` and `flalign` that have to be un-numbered should now be
  starred.
- Some new, minor, features.

## Fixed
- Several bug fixes.

# [0.98c] - 2017-02-09

## Fixed
- Fix error due to `l3sort` is now available directly on loading `expl3`.

# [0.98b] - 2017-02-06

## Changed
- Adjustments because of deprecated functions removed from `expl3`.

## Fixed
- Fix "n.d." appeared in case `.bib` files use `year` field instead of `date`
  field.
- Other minor bug fix.

# [0.98a] - 2017-01-06

## Changed
- Documentation improved.

## Fixed
- Bug fixes.

# [0.97] - 2016-06-10

## Added
- Instructions to authors

## Changed
- Package `xy` declared incompatible with the current bundle.

## Fixed
- Sections in appendices of the documentation are alphabetically numbered.
- The page numbers of standalone articles/issue are synchronized.

# [0.96] - 2016-04-14

## Changed
- Improvements.
- (Not backward compatible) Big sets macros prefixed with `bb`, e.g. `\bbR`
  instead of `\R`.

## Fixed
- Bug fixes.

# [0.95] - 2016-04-04

- Initial CTAN release of the `nwejm` bundle.
