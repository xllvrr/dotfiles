wsemclassic
===========

A LaTeX document class for bavarian school w-seminar papers, based on report.


Usage
-----------

to use [wsemclassic][ws@github]
for your w-seminar paper,

* download it (e.g. `git clone git://github.com/jorsn/wsemclassic.git`)
* put `wsemclassic.cls` into your working dir or a `texmf` dir
* if you put it into a `texmf` dir, index it (texlive: run `texhash`)
* insert the following into your LaTeX preamble (before `\begin{document}`):

```latex
\documentclass[bibfile=<bibtex database name>]{wsemclassic}

\author{<Your Name>}
\title{<Paper Title>}
\date{Abiturjahrgang~<year>}
\subject{<Seminar Title/Subject>}
\school{<School Name>}
\major{major}{<Seminar Major Subject (Leitfach)>}
\teacher{<Your Teacher>}
\place{<The place where you live/write your paper>}
```

For maximum conformity with the
[Bavarian Kultusministerium's recommendations][recomm]
use `strict` class option.
To see all options take a look at the first few lines of `wsemclassic.cls`.

[ws@github]: https://github.com/jorsn/wsemclassic "GitHub: wsemclassic"
[recomm]: http://www.jack-steinberger-gymnasium.de/joomla/images/Dokumente/Oberstufe/Material/Merkblatt_Seminararbeit.pdf


### Example

To see an example please have a look at wsemclassic-test.tex.
You can build the PDF by running `make` or building it manually using `pdflatex`/`lualatex` and `bibtex`.



Copyright
-----------

Copyright (c) 2013 Johannes Rosenberger <jo.rosenberger at gmx-topmail.de>

This code is released under a BSD Style License.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.

For more details please read the '[LICENSE]' file.

[LICENSE]: https://github.com/jorsn/wsemclassic/blob/master/LICENSE
