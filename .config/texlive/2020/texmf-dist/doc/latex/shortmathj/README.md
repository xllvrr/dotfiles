# latex-shortmathj

Automatically shortify titles of mathematical journals

This small dummy package just contains a simple list of full and short journal names
([AMS standard](https://mathscinet.ams.org/msnhtml/serials.pdf)).

## Usage
```latex
% In the preamble
\usepackage{shortmathj}

% In the document
\shortifyAMSjournalname{Discrete \& Computational Geometry}
% Result: Discrete Comp. Geom.
```

### In case of any problems
Please, don't hesitate to open an [issue at GitLab](https://gitlab.com/Nickkolok/latex-shortmathj/-/issues/new)
or to mail me: nickkolok@mail.ru

### Tweaking BibLaTex

BibLaTeX is a great tool that does many things for you.
To ask BibLaTeX to abbreviate the journal names, do smth like
```latex
\DeclareFieldFormat[article]{titlecase}{\shortifyAMSjournalname{#1}}
```
**Note that `shortmathj` itself does not require BibLaTeX to be used, unlike other abbreviating packages.**
`shortmathj` follows the UNIX-way: it just takes a full title and returns the shortified one.

Tip: for more sophsticated ways, see [plk@github/biblatex/#974](https://github.com/plk/biblatex/issues/974).

### Custom abbreviations

Edit `custom.csv` and rebuild the package.
See also [#2](https://gitlab.com/Nickkolok/latex-shortmathj/-/issues/2).

### Be careful!

`shortmathj.template.sty` from this repo is NOT what you want.
You should obtain `shortmathj.sty` somehow: build it youtself or download from CTAN (see below).

## Building

The build process requires NodeJS and NPM.

First of all, you may want to update the basic CSV file from
https://mathscinet.ams.org/msnhtml/annser.csv

Make sure that no journals have been excluded (otherwise add them to `custom.csv`).
`git` is a good tool for investigating that.

Then, run `npm install` to install all the dependencies.
Run `node index.js` to build `shortmathj.sty`.

## Repostories

+ [CTAN](https://ctan.org/pkg/shortmathj)

+ [GitLab](https://gitlab.com/Nickkolok/latex-shortmathj)

## License

LPPL - LaTeX Project Public License v1.3c+, DFSG compat.

## Authors

+ Nikolai Avdeev aka @nickkolok
