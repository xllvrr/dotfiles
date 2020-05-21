 
  #asmeconf: A template for ASME conference papers#
 
  Version 1.18 dated 2020/04/14.

  ####Overview####
  This class provides a template to format ASME Conference papers according to
  the requirements on ASME's web pages (as posted in early 2020).
  
  [www.asme.org/publications-submissions/proceedings/formatting-the-paper](https://www.asme.org/publications-submissions/proceedings/formatting-the-paper)
  
  This work is not a publication of ASME itself.

  Files in this distribution are:

          README.md              --  this file
          asmeconf.cls           --  the class file
          asmeconf.bst           --  bibtex style for ASME conference format
          asmeconf-template.tex  --  a latex template/example for this class
          asmeconf-template.pdf  --  documentation/sample paper
          asmeconf-sample.bib    --  a sample bibliography file
          *
          sample-figure-1.pdf, 
          sample-figure-2a.pdf, 
          sample-figure-2b.pdf   -- figures for the example

  The .tex and .cls files are commented and should be self-explanatory.

  
  

  This template was designed to approach the following aims:

- match ASME's font current specifications and layout, including the most recent author layout

- match ASME's current citation formats

- support hyperref package (hyperlinks to figures, tables, references, web)

- support pdf bookmarks and metadata

- enable various math and text features with newtxmath and newtxtext packages

- support bold face, sans serif math in section headings

- support footnotes in section headings

- provide automatic layout of author and addresses in one of two styles

- provide line numbers for editing and review

- support balancing of columns on last page


  ####Author####
  
  John H. Lienhard V
  
  Department of Mechanical Engineering
          
  Massachusetts Institute of Technology
          
  Cambridge, MA 02139-4307 USA


 ---
 
 ####Change log####
 
 v1.18 (2020/04/14): edit and expand documentation; revise sample .bib file; extensive edits to asmeconf.bst, to better support hyperlinks, to correct eid error, and for better conformance to ASME style (details listed in .bst file); add foreign language example.
 
 v1.17: set T1 font encoding with utf-8 input, ensure LuaLaTeX compatibility; load hologo and metalogo packages; edit documentation.
 
 v1.16: remove xpatch and comment packages from class file; disable \\( and \\) in pdf bookmarks to avoid warnings; edit documentation.
 
 v1.15: correct extra space left by \\CorrespondingAuthor when that author is not last; correct breakage of \\ref in captions.  Thanks to Bret Van Poppel for reporting these issues.
 
 v1.14: edit documentation; use 2020 IMECE header in layout example
 
 v1.13: add babel options for language support; minor text edits; adjust nomenclature list penalties
 
 v1.12: add support for line numbers for editing; add support for final column balancing; edit skips in nomenclature; adjust \\tolerance and \\emergencystretch (for line breaking); improve support for equation tags in captions; adopt standard \\maketitle and \\title commands; include \\versionfootnote for tracking revisions of draft.
  
 v1.11: minor adjustments to title, author, and affiliation layout
 
 v1.1:  revise several parts of the layout to match ASME's updated specifications from Summer 2019 (including author block, abstract font, placement of nomenclature, and minor spacings); add .bst support for online references and eprints; expand documentation significantly; guidance on fitting equations into columns. 
 
 v1.07: improve support for numbered section headings; allow omission of corresponding author email; edit documentation
 
 v1.06: automate bold sans math in captions and headings; small adjustments to default spacings; adjust font of paper number to 18 pt; edit documentation
 
 v1.05: minor code clean-up; change to keyvalue for to control font for superiors
 
 v1.04: fix option passing for mathalfa package; adjust \\entry to create nomenclature subheadings efficiently.
 
 
 ---
 
 ####License####

 Copyright (c) 2020 John H. Lienhard

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
 associated documentation files (the "Software"), to deal in the Software without restriction, 
 including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
 subject to the following two conditions:

 The above copyright notice and this permission notice shall be included in all copies or 
 substantial portions of the Software.

 The software is provided "as is", without warranty of any kind, express or implied, including but 
 not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
 In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
 whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
 software or the use or other dealings in the software.