# A Template for Technion Theses

This is a template for writing a thesis according to the Technion specifications. 
Please, however, check with the graduate school website to see if any specifications have changed. 
This template was written by Boaz Shuval (January 2019). 

## Instructions

This template is provided as is. Please check with the Technion graduate school website to see if the guidelines have changed, as they often do. For
the latest directions from the graduate school, see: 
https://graduate.technion.ac.il/graduation/thesis-editing/
(This is the website address circa January 2019). 

All files use UTF-8 encoding. Make sure your LaTeX system supports this encoding. 

### Preparing the Thesis

0. The main.tex file is the main file to be compiled. Place it (with the other thesis files) in the same directory as the .cls and .sty files provided
1. The main class is technionThesis.cls.
   It has the the following options:  
    - hyperref         Add hyperlinks
    - publist          Add a list of publications in the front pages (update list in thesissetup.sty)
    - addack           Add an acknowledgments page (only for final version!)
    - advisement       Use "advisement" instead of "supervision" in front pages (a pet peeve of mine)
    - spacepar         Add a blank line between paragraphs
    - firstparindent   Indent the first paragraph of a chapter/section
    - libertine        Use a different selection of fonts, based on libertine, for the English part of the thesis. (See note 4)
2. In the file technionThesisSetup.sty you must input your details in the various commands. It is pretty self explanatory. 
3. The class loads a number of packages that the class author (Boaz Shuval) uses regularly. It also sets up theorem-style environments.
   If you know what you're doing, feel free to change things as you see fit. Otherwise, leave this alone. 
3.1  Environments are defined using amsthm. The following environments are available:
    - Theorem-style: theorem, lemma, corollary, proposition, conjecture
      (Heading in bold, text in italics)
      These all share consecutive numbering, in the format (chapter.number)
    - Definition-style: definition, example, assumption, condition 
      (Heading in bold, text upright)
      These are numbered (chapter.number) with their own numbering. Assumption and condition have alphanumeric numbering (A,B,C, etc.)
    - Remark-style: remark, question, discussion
      (Heading in italics, text upright)
      These are numbered (chapter.number) with their own numbering. Discussion is unnumbered. 
    - Proof environments: proof, IEEEproof. Both have a black square at the proof end. 
3.2  Packages loaded (partial listing):
    - mathtools (which loads amsmath)
    - amsthm, amssymb
    - IEEEtrantools (loads IEEEeqnarray, and also sets the bibliography style)
    - graphicx 
    - tikz (including various useful tikz libraries) 
    - cleveref (for referring to sections, etc, using \Cref, automagically adding the header)
    - stackrel
    - accents  (for adding symbols above symbols)
    - xspace (for adding a smart space after a macro command)
    - tabto  (add a tabstop for lining things up)
    - algorithm2e (ruled, vlined)
    - url
    - polyglossia (for Hebrew support)
    - longtable (for a table that runs over more than one page; useful for the abstract)
    - booktabs, multirow (for nicer tables)
4. Place all of your own commands in the file Example/technioThesisMacros.sty. That is, various \newcommand and \DeclareMathOperator are defined here. I've defined a few
   useful ones for you to get started. 
5. There are now .tex files for you to edit: 
   - abstract.tex         for your abstract in English (200-500 words)
   - habstract.tex        for your abstract in Hebrew (500-2000 words)
   - acknowledgments.tex  for your acknowledgments in English
   - hacknowledgments.tex for your acknowledgments in Hebrew
   - introduction.tex     for your introduction chapter
   - chapfirst.tex        for your first chapter (also chapsecond.tex, and you may additional chapter as you see fit)
   - chapsecond.tex       for your second chapter (add additional chapters as you see fit)
   - discussion.tex       for your discussion/conclusions chapter
   - appendix.tex         for your appendix (appendices must appear in their own chapters, and not as part of the main text). 

### Compilation
Compile using xelatex. If you are using latexmk, you may include in the compilation directory a file called  .latexmkrc
with the following line in it: 

$pdflatex = 'xelatex --shell-escape %O %S';

This tells latexmk to use xelatex for compilation, so you need not worry
about this.
You may also compile this on overleaf (again, use xelatex). 

The Hebrew portion of the thesis is based on the polyglossia package. It uses the David CLM font for Hebrew. Thus, you must install the culmus fonts
for this to work on your installation. 

### Be a pal
Please share this template with your friends and colleagues. 
If you enjoyed using it, consider sending me a note to let me know. 
If you find a bug, or have a suggestion for improvement, I'd love to know about it.

## Files in this Template

-  technionThesis.cls       The class file
-  technionThesisSetup.sty  Setup data fields
-  README.md                This file
Inside the Example directory:
-  technionThesisMacros.sty Define your macros
-  abbrev.tex               
-  abstract.tex             
-  acknowledgments.tex
-  appendix.tex
-  chapfirst.tex
-  chapsecond.tex
-  discussion.tex
-  habstract.tex            Hebrew abstract
-  hacknowledgments.tex     Hebrew acknowledgments
-  introduction.tex
-  main.tex                 Main thesis file
-  mybib.bib

## License
This template is licensed under Creative Commons CC BY 4.0. 

## Notes
1. This template was tested on a mac running macOS 10.13, with TEXLIVE2017. It was also tested on overleaf in January 2019, which also runs TEXLIVE2017. 
2. There is a bug when using TEXLIVE2018, which manifests itself in the figure/table numbering. If you encounter this bug, use the memoir package from
   TEXLIVE2017, instead. 
3. The template uses the Memoir package internally. The chapter heading design is a modified version of a design by Vincent Zoonekynd 
   (it is modified from the BlueBox style in https://ctan.org/pkg/memoirchapterstyles).  
4. If using the libertine option, make sure to use the latest version of newtxmath, available from https://ctan.org/pkg/newtx 
   (download the file newtxmath.sty to the home directory)


## Version History
31 January 2019:   Initial Version


