# uafthesis

## What is this?

*uafthesis* is a LaTeX document class meant for using with a University of Alaska Fairbanks-style thesis. It would be used like so:

    \documentclass{uafthesis}

Its development web site is at <https://github.com/jesusabdullah/uafthesis>.

## Basic Contents:

* `uafthesis.cls`: The class file itself.
* `bib_styles/`: A few common bibliography styles for BibTeX:
    * `/agufull08.bst` is the 2008 edition of the AGU bibliography style
    * `unsrtabbrv3.bst` is a style written by one of the authors of `uafthesis.cls`.
* `example.pdf`: Describes how to use `uafthesis.cls` while showing what it looks like.
* `example/`: Contains the source code for `example.pdf`.
* `README.md`: This file.

## Branches:

* `master` is the main branch, and is based on the 2004 thesis class.
* `2006` is a side branch which contains Ryan Woodard's 2006 version of `uafthesis.cls` which also tackled the missing "page" headers problem. A cursory analysis based on `diff uafthesis2004.cls uafthesis2006.cls` indicates that my solution to the "page heading" problem is probably better/easier. However, I may be wrong, and I really appreciate Ryan's work, so it's included in its own branch.

## Help

If you don't know how to use LaTeX or need general support, I would recommend the following resources for learning and asking questions:

* <http://en.wikibooks.org/wiki/LaTeX>
* <http://tex.stackexchange.com>
* <irc://freenode.net/#latex>

For questions directly pertaining to `uafthesis.tex`, refer to `example/example.pdf` or contact the latest author via [github](https://github.com/jesusabdullah/uafthesis/issues), twitter (http://twitter.com/jesusabdullah) or [email](email:josh.holbrook@gmail.com).

## Call to Arms

If you're a UAF student writing a thesis in LaTeX and have some improvements to
make, you should do so and share! `uafthesis.cls` could honestly use some TLC.

If you would like to use Github, here's the process for submitting changes:

2. Fork this project. There's a button on the upper-right corner of the main page.
3. *git clone* your new repository.
4. Make changes.
5. *git commit -m"Some changes I made for great justice."*
6. *git push origin master*
7. Hit me up with a pull request. This is also on the upper-right corner of the main page.

If you would rather not use git (if, for example, version control is scary and
confusing), feel free to contact me at josh.holbrook@gmail.com and we can find 
another way of updating the class file.

## Authors:

* **Curt A. L. Szuberla**   13 November 1996
* **Matt Heavner**           5 February 1999
* **Dana Moudry**           18 December 2002
* **Ryan Woodard**           2 December 2004
* **Joshua Holbrook**              (present)

## Licensing

Nothing is included with the original bundle, but based on the sources of the original latex materials, it's safe to say (imo) that the project is covered by the [**LaTeX Project Public License**](http://www.latex-project.org/lppl.txt).
