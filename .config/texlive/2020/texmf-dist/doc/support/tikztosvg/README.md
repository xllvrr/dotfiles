# tikztosvg(1)
Pablo Emílio Escobar Gaviria <pablo-escobar@riseup.net>

The `tikztosvg(1)` command renders TikZ diagrams to SVG, using 
[`bash`](https://www.gnu.org/software/bash/), [`xetex`](http://xetex.sourceforge.net/) and 
[`pdf2svg`](https://github.com/dawbarton/pdf2svg).

## Usage

```
tikztosvg [OPTION]... INPUT_PATH
```

### Options

**-o, --output=OUTPUT_PATH**
* Write output to file *OUTPUT_PATH*.
  Defaults to the base name of the input file suffixed with the _.svg_ 
  extension. The file is resolved relative to the working directory.

**-p, --package=+PACKAGE**
* Include `\usepackage{PACKAGE}` when rendering the diagram.

**-q, --quiet**
* Silence application log messages and script warnings.

**-h, --help**
* Print a help message.

**-v, --version**
* Print version information.

## Example

Let's say you want to convert the file `exemple.tikz` to SVG:

```tex
\begin{tikzcd}
    G \arrow[r, "\varphi"] \arrow[d, "\psi"', two heads] & H \\
    \sfrac{G}{\ker \varphi} \arrow[ru, dotted]           &  
\end{tikzcd}
```

You could achieve that by running the following command:

```
tikztosvg -p tikz-cd -p xfrac example.tikz
```

The results will be stored in the file `example.svg`:

![example](https://github.com/GarkGarcia/tikztosvg/raw/master/example/example.svg)

## Installation

The `tikztosvg(1)` command and it's man page can be installed in Unix systems by 
running:

```
$ curl -s https://raw.githubusercontent.com/GarkGarcia/tikztosvg/master/install.sh | sudo sh
```

The executable is installed in `$HOME/.local/bin/` and the man-page is 
installed in `$HOME/.local/share/man/man1/`.

## Authors

**TikzToSvg** was written by 
[Pablo Emílio Escobar Gavira](mailto:pablo-escobar@riseup.net).

**pdf2svg** was written by [David Barton](mailto:davebarton@cityinthesky.co.uk) 
and [Matthew Flaschen](mailto:matthew.flaschen@gatech.edu).

## License

© 2020 Pablo Emílio Escobar Gaviria.

Free use of this software is granted under the terms of the GPL-3.0 License.

