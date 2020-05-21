 
  #asmejour: A template for ASME journal papers#
 
  Version 1.12 dated 2020/04/12.

  ####Overview####
  This class provides a template to format preprints submitted to ASME journals. The layout and reference
  formats follow the style that is being used for published papers in 2020.
  
  This work is not a publication of ASME itself.

  Files in this distribution are:

  ```   README.md              --  this file
      asmejour.cls           --  the class file
      asmejour.bst           --  bibtex style for ASME journal references
      asmejour-template.tex  --  a latex template/example for this class
      asmejour-template.pdf  --  documentation/sample paper
      asmejour-sample.bib    --  a sample bibliography file
      *
      sample-figure-1.pdf, 
      sample-figure-2a.pdf, 
      sample-figure-2b.pdf   -- figures for the example```

  The .tex and .cls files are commented and should be self-explanatory.

  
  This template was designed to approach the following aims:

- closely approximate ASME's fonts and layout, including author/title/abstract design

- follow today's ASME style for reference lists

- support hyperref package (hyperlinks for figures, tables, citations, and web)

- support pdf bookmarks and metadata

- use the features of the newtxtext and newtxmath font packages

- support bold face, math, citations, and footnotes in section headings 

- provide automatic layout of author blocks for multiple addresses


  ####Author####
  
  John H. Lienhard V
  
  Department of Mechanical Engineering
          
  Massachusetts Institute of Technology
          
  Cambridge, MA 02139-4307 USA


 ---
 
 ####Change log####
 
v1.12 (2020/04/12): Change subfigure \\ref labels to have parentheses around italic letters; remove space between consecutive numerical citations; add macro to adjust vertical space below abstract; edit documentation; remove varl and varqu options of inconsolata font; extensively edit/document asmejour-sample.bib file. 

Many changes to asmejour.bst (v1.03) to improve consistency with ASME reference formats for collections, technical reports, and conference papers, to better manage hyperlinks, and to warn for missing fields. These includes: move venue, eventdate, and paper number to end of @inproceedings; move paper number after address of @techreport; hyperlink technical report numbers and conference numbers, and provide fallback for missing numbers; separate serial collection parenthetical layout from @incollection into new @inserialcollection; add default name for @inproceedings paper number, "Paper No.", changed by type ={} (this alternation is not backward compatible!); add oclc macro for archive field; complete the set of macros for ASME journal names.

v1.11: ensure T1 font encoding, utf-8 input, and LuaLaTeX compatibility; edit documentation.

v1.10: update asmejour.bst to most recent Crossref standard prefix for doi (https://doi.org/); remove xpatch package from class file; disable \\( and \\) in pdf bookmarks to avoid warnings; adjust \\eqref in bookmarks; edit documentation.

v1.09: adjust nomenclature list; edit language support

v1.08: adjust penalties in nomenclature list; fix minor typos in template

v1.07: add commands for \\toprule, \\midrule, and \\bottomrule in ASME style; add advice on landscape material; minor edits to \\entry and for language support.

v1.06:  allow standard \\date, \\maketitle,  and \\title commands and abstract environment; make final column balancing a package option; remove \\normalfont from AMS equation tags to allow tags to match caption font; incorporate \\subfigure in example template; allow line numbers in AMS display math; provide comma between sequential footnote marks; adjust babel options; other minor edits; revise template text.

v1.05:  automate list of figures/tables with option to omit; replace balance package with flushend package and automate; revise skips in nomenclature; address conflicts of lineno package with other elements; option to hyphenate typewriter font; new options for footer text; adjust \\emergencystretch and \\tolerance; additional documentation and references

v1.04:  edit documentation; add language support via babel
 
v1.03:  expand documentation; fix conflict between lineno and balance packages; more footer options; edit \\entry
 
v1.02:  adjust formats of 2nd and 3rd level headings; add option for line numbers; eqn tags in blue
 
v1.01:  edit documentation, remove development code
 
v1.00:  initial release
 
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
