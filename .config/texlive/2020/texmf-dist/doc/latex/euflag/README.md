# euflag

This is the README.md file for the euflag LaTeX package v0.4 (2019-02-02)

##Summary
%% This package implements a single command \euflag which reproduces the
official flag of the European Union using just the built-in picture
environment, with the _xcolor_ and _graphicx_ packages and the _amssymb_
font.
%% The flag is reproduced at 1em high based on the current font size, so it
can be scaled arbitrarily by changing the font size (see examples in ).
%% \begingroup\centering\fontsize{230}{0}\selectfont\euflag\par\endgroup


##Normal installation

If this package is distributed from CTAN, it should be in a zip file
which allows it to be installed automatically by the TeX Live update
manager _tlmgr_ and similar automated installers. If you are using
automated package installation, no further action is required.


##TDS installation

This package is also available as a `.tds.zip` file. TDS is the TeX
Directory Structure, the standard layout for a modern TeX installation.
This enables the package to be unzipped directly into your Personal TeX
Directory (see below for what this is and how to create one on your
system).

  *  Install it on any TDS-compliant personal system (laptop, desktop,
workstation, table, smartphone, PDA, etc) by unzipping it straight into
your Personal TeX Directory (folder). This will put all the files into
the right places, so you can start using them immediately.


  *  If you haven't yet created a personal TeX directory, see below for
details of what one is, and how to create it.


  *  On a shared (multiuser) system like a server, unzip it into the
$TEXMFLOCAL directory instead (see below), and run your TeX
directory-indexing program (eg _texhash__mktexlsr_, etc) so that
everyone can use it.


  *  If you are using an old non-TDS-compliant system, see below under Manual
Installation.


###Your Personal TeX Directory

This is a directory (folder) on single-user systems where you should put
all your local manual modifications (updates, and additions such as new
or updated classes, packages, and fonts) that are _not_ handled
automatically by the TeX Live update manager (_tlmgr_). The name and
location are fixed:


<dl>

  <dt>Apple Mac OS X

</dt>

  <dd>`~/Library/texmf`

</dd>

  <dt>Unix and GNU/Linux

</dt>

  <dd>`~/texmf`

</dd>

  <dt>MS-Windows 95/XP

</dt>

  <dd>`C:\texmf`

</dd>

  <dt>MS-Windows 2007 and above

</dt>

  <dd>`Computer\System\YOURNAME\texmf`

</dd>

</dl>

Create that folder now if it does not already exist. Put (or unzip) all
additions to your system that are not handled by _tlmgr_ into this
directory, following _exactly_ the subdirectory structure that is used
in your main TeX distribution (unzipping a TDS file does this for you).
This is what enables LaTeX to find stuff automatically.


> #### If you are a Windows user running _MiKTeX_

 ####

> When you create the folder, you must add it to _MiKTeX_'s list of supported folders. Run the _MiKTeX Maintenance/Settings_ program, select the `Roots` tab, and add the folder. You only have to do this once.
> 
> Each time you add or remove software in your personal TeX folder, you _must_ also click on the `Update FNDB` button in the `General` tab.
> 

Unix (Mac and GNU/Linux) users do not need to (indeed, should not) run
their filename database indexer (_mktexlsr_ or _texhash_) for files put
in your personal TeX directory.


##Installation on shared systems

On multi-user systems (Unix-based), identify the shared local directory
tree with the command

    kpsewhich -expand-var '$TEXMFLOCAL'

This will give you the location of the shared `texmf` directory into
which you must install these files.

Do not forget to run the _texhash_ or _mktexlsr_ (filename indexer)
program after installation, otherwise the files will not be found by
LaTeX and nothing will work!


##Manual installation (non-TDS systems)

To install this software manually, unzip the zip file into a temporary
directory and move the class and/or package file[s] from the
`tex/latex/euflag` directory to a location (directory/folder) where
LaTeX will find it on your system. This is referred to in some
documentation as “the TEXINPUTS directory”, although it may be called
something else on your system.

_It is your responsibility to know where this location is._ See the
question in the TeX FAQ at
http://www.tex.ac.uk/cgi-bin/texfaq2html?label=inst-wlcf for more
information. If you do not know, or cannot find it, or do not have
access to it, your TeX system may be out of date and need replacing.


##Last resort

In an emergency, or as a last resort on unmanageable systems, it is
possible simply to put the class and/or package file[s] into your
current working directory (the same folder as your `.tex` file[s]).

While this may work, it is not supported, and may lead to other
resources (packages, fonts, images etc) not being found.


##Usage

Make this the first line of your LaTeX document:

    \usepackage[options]{}

(or other class or package if more than one is supplied). Read the
documentation for the options available. The documentation is
distributed as a PDF document in the zip file. You can also regenerate
it by typesetting the `euflag.dtx` file with `xelatex` (and `biber` and
_makeindex_) in the normal way.


##Bugs and TODO

No outstanding reported bugs at the time of this version.


##Copyright

The following statement is included in the source code:

     Transformed from euflag.xml by ClassPack db2dtx.xsl
     version 1.10 (2019-01-22) on Sunday 3 February 2019 at 21:19:20
    
     euflag.sty is copyright © 2019 by Peter Flynn <peter@silmaril.ie>
    
     This work may be distributed and/or modified under the
     conditions of the LaTeX Project Public License, either
     version 1.3 of this license or (at your option) any later
     version. The latest version of this license is in:
    
         http://www.latex-project.org/lppl.txt
    
     and version 1.3 or later is part of all distributions of
     LaTeX version 2005/12/01 or later.
    
     This work has the LPPL maintenance status ‘maintained’.
     
     The current maintainer of this work is Peter Flynn <peter@silmaril.ie>
    
     This work consists of the files euflag.dtx and euflag.ins,
     the derived file , 
     and any other ancillary files listed in the MANIFEST.
    

