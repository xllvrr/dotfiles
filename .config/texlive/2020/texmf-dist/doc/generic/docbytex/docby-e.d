
%% DocBy.\TeX{} -- Making a Documentation Of Source Codes By TeX

\def\projectversion{\dbtversion}
\def\headtitle{DocBy.\TeX}

\showboxbreadth=1500 \showboxdepth=2  \hfuzz=4pt

\input docby.tex

\title DocBy.\TeX{} -- Making a Documentation Of Sources By \TeX{}

\author Petr Ol\v s\'ak

\centerline{\ulink[http://www.olsak.net/docbytex.html]%
                         {www.olsak.net/docbytex.html}}

\def\db{\dg\nb}
\def\du#1{\api{\nb#1}}
\let\quotehook=\langleactive
\def\insdef#1 {\ifirst{docby.tex}{def\nb#1 }{^^B\cbrace}{++}}
\def\inssdef#1 {\ifirst{docby.tex}{def\nb#1}{\empty}{+-}}
\bgroup
   \catcode`\[=1 \catcode`]=2 \catcode`\{=12 \catcode`\}=12
   \gdef\obrace[{] \gdef\cbrace[}]
\egroup
\def\indexhook{The control sequences marked by ($\succ$)
   are sequences at user level. Other control sequences are internal in 
   DocBy.\TeX. The bold page number points to the place where the
   sequence is defined and documented, other page numbers point 
   to occurrence of the sequence. The control sequences for users 
   have underlined pagenumber in the list of page numbers. This 
   means the page where the sequence is documented at user level.
   \medskip}
\def\nn#1 {\noactive{\nb#1}} \nn insert \nn undefined

\def\cnvbookmark#1{\lowercase{\lowercase{#1}}}
\def\bookmarkshook{\lo ìe \lo ¹s \lo èc \lo ør \lo ¾z \lo ýy
   \lo áa \lo íi \lo ée \lo úu \lo ùu \lo óo \lo òn }
\def\lo #1#2{\lccode`#1=`#2}

\dotoc \bookmarks

\sec Preface
%%%%%%%%%

DocBy.\TeX{} gives you a possibility to creating a documentation of
source codes by \TeX{}. The source codes can be i C language or
whatever other computer language.

On the contrast of Knuth's ``literal programming'' this tool does not
use any preprocessors for doing filters of information for human and
for computer which is stored in single source file. I suppose that
programmers prefer to write and tune the program in computer language
before they start to write the documentation. It would be fine to
write the documentation after that and without modifying of the source
code of the working program. Modern systems gives possibility to open
more windows with more than one text editors: you can see the source
code in one editor and write the documentation of it in second.
Now, there is no need to merge both information (for computer and
for human being) to single file.

The first part of this document (\cite[uziv]) describes the
\docbytex{} at user level. The next part documents the implicit macros
implemented in \docbytex{}, which are supposed that experienced user
will want to change them in order to realize special wishes.
The next section~\cite[design] includes the documentation of
design-like macros. User can change them to create a better look of
his/her document. The last section~\cite[implementace] describes all
macros of \docbytex{} at implementation level in detail.

This document is created by \docbytex{} itself, it means that it can
serve as an example of \docbytex{} usage.


\sec [uziv] For Users
%%%%%%%%%%%%%%%%%%%%%

\subsec [cleneni] File Types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \docbytex{} is proposed as a tool for making documentation of C
language. That is a reason why the next example is a documentation of
the hypothetical program written in this language. If you needs to
document another computer language, you can change some macros
(see the section~\cite[zmeny]).

Wee suppose that the source code is separated into
``modules''. Each module is intended to one special problem which is solved
by programmer. Each module has its own name ("foo" for example) and it is
written in files "foo.h" and "foo.c". These files are compiled into
"foo.o". All modules are linked at the end of compilation into the
executable program.

If we want to document these source files, we create new file with
".d" extension for each module, for example "foo.d". The documentation
of the module will be written in that file. Next we create the main
file (for example "program.tex") where all "*.d" files are included
by the command "\module"\du{module}. You can use commands
"\title" (name of the program), "\author"
(name of the author) and (for example) "\dotoc" for making
of table of contents, "\doindex" for generating of the
index. Of course, you can write first or general notes to the program 
in the main file too. The contents of the file "program.tex" can be:

\begtt
\input docby.tex
\title   The Program lup -- Documentation of The Source Codes

\author  Progr and Ammer

\dotoc  % the table of contents will be here

\sec The structure of the source files

The source files are in the three modules.
The auxiliary functions are defined in "base.c" and "base.h" files.
The window management are solved in "win.c" and "win.h" files.
The file "main.c" includes the function "main".
\module base
\module win
\module main
\doindex  % the index will be created here
\bye
\endtt

We decided to sort the documentation from ``simple'' functions to the
more complicated problems. Somebody can prefer another way from
"main" function first and the auxiliary functions at the end.
He/she can write:
\begtt
\module main
\module win
\module base
\doindex
\bye
\endtt

Both ways are possible because the documentation is hyperlinked
automatically. When the reader see the usage of some function,
he/she can simply go to the definition of this
function simply by one click. The reverse hyperlinks are included too.


\subsec [priklad] An Example of the Module Documentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Let we document the module "foo" in the file "foo.d".
This file is included by "module"~"foo" command. We can document any
part of source "foo.c" by words and combine this by a listing of parts
of source "foo.c" or "foo.h" by command "\ins"~"c <keyword>"\du{ins} or
"\ins"~"h <keyword>". The part of the source code is declared usually by
"//: <keyword>" line. The example follows.

Suppose that the following text is written in the file "foo.d"
\begtt
The struct \dg [struct] mypair is used as a return value of
"my_special_function". There are two "float" values.
\ins c mypair

The \dg [struct mypair] my_special_function() has one parameter "p"
and returns double and triple of this parameter in "mypair" struct.
\ins c my_special_function
\endtt

The file "foo.c" has to include the comments 
"//: "{\tt mypair} and "//: "{\tt my\_special\_function}. 
These comments delimit the part of source code to be listed in
the documentation:

\begtt
#include <stdio.h>

//: mypair

struct mypair {
  float x, y;
};

//: my_special_function

struct my_special_function (float p)
{
  struct mypair return_pair;
  return_pair.x = 2*p; // double of p
  return_pair.y = 3*p; // triple of p
  return return_pair;
} 
\endtt

The result looks like that:

\bigskip

The struct \dg [struct] mypair is used as a return value of
"my_special_function". There are two "float" values.
\def\modulename{foo}
\ins c mypair

The \dg [struct mypair] my_special_function() has one parameter "p"
and returns double and triple of this parameter in "mypair" struct.
\ins c my_special_function


The first listed part of source code is started by 
"//: "{\tt mypair} and ended by firs occurrence of the "//:".
The second listed part is started by "//: "{\tt my\_special\_function}   
and ended at the end of file. These delimiters (and the neighbouring
empty lines) are not printed.

The order of the listed parts are independent of the order in source
file. We can first comment my special function and include its source
code. Afterward we can explain the structure mypair and show the
source code of this structure.

Notice that the numbers of lines are inserted exactly by the lines in
source code. It means that the missing line 
"#include "{\tt<stdio.h>} has number one and first printed line has
the number five.

The "//: <keyword>" delimiter and the closing delimiter "//:" 
can be at arbitrary place of the line, no essential at begin of line.
The lines with the delimiters are not printed.

Notice the command "\dg" in source of the documentation. The
documented word (separated by space) follows immediately. The optional
parameter in brackets is interpreted as ``type'' of the documented
word.  The documented word is printed in red color on the rectangle
and all occurrences of that word in the documentation is printed in
blue color and treated as hyperlink to the place where is the word
documented (red color). The occurrence of that word have to be written
between the quotes {\tt\char`\"...\char`\"} or it is placed in the
inserted source code. You need not do any marks in source code in
order to highlight the usage of the documented word. This is done
automatically.

If the documented word has the brackets "()" at the end, then it is the
function. These brackets are not printed in the current place, 
but they are printed in the footnotes and in the index.

The quotes {\tt\char`\"...\char`\"} are delimiters of ``parts of
listings inside paragraph''. This text is printed by typewriter font
and the occurrences of documented words are hyperlinked here.
All characters have printed here without re-interpretation, it means
this environment behaves like ``verbatim''.

The footnote includes a list of all documented words on the current page.
Each word is followed by list of pages here. These pages points to all
pages here the documented word occurs.

All documented words are automatically inserted to the alphabetical
index created by "\doindex" command.


\subsec What Version of \TeX{} for \docbytex{}?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

In order to activate all features mentioned above we need to use
pdf\TeX{} extended by enc\TeX{}. The language of automatically 
generated words (such as Contents, Index) is selected by current
value of "\language" register when "\input docby.tex" is processed.
\docbytex{} writes on the terminal the ``modes'' information: 

\def\begtthook{\catcode`\!=0 \sfcode`.=1000 }
\begtt
This is DocBy.TeX, version !dbtversion, modes: enc+PDF+ENG
\endtt
\def\begtthook{}

\docbytex{} can work in the following modes:
"enc/NOenc", "PDF/DVI", "ENG/CS". 

The "enc"\api{enc} mode is activated if the enc\TeX{} is detected.
Otherwise (if enc\TeX{} is unavailable), \docbytex{} prints warning
and sets the "NOenc"\api{NOenc} mode: the occurrences of documented
words are not detected and hyperlinked. The index is much more poor,
because the pages with occurrences of the words are missing.
Only the places of documentation of the words are referred. 
It means that the enc\TeX{} extension is very important for \docbytex.
This extension is usually available in current \TeX{} distributions
and it is activated by "pdfcsplain" format. So the recommendation is: 
use "pdfcsplain" when you are using \docbytex.

The "PDF"\api{PDF} mode is activated if the pdf\TeX{} is
used. Otherwise \docbytex{} switches to the "DVI"\api{DVI} mode
and prints the warning message on the terminal. The colors and
hyperlinks are not working in "DVI" mode but the list of pages with
all occurrences of documented words is printed in index 
(if enc\TeX{} is activated).

If "\language=0" or "(pdf)csplain" isn't used 
then language mode is set to ENG (English words 
will be generated). Else this mode is set to CS (Czech words
will be generated). If you are using another language, you need
to redefine some macros, see section~\cite[nazvy].



\subsec Searching Words by Enc\TeX{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The hyperlinked words are located by enc\TeX{} by ``hungry algorithm''.
It means that if there are two documented words "abc" and "abcde" then
the text "abcdefg" is divided to the hyperlinked part "abcde" (the blue
color is used) and to the normal part "fg" (black color). The hyperlinked
part points to the place of the documentation of the word "abcde".
On the other hand the text "abcdx" is divided to hyperlinked part 
"abc" and this part points to the documentation of the word "abc".

Enc\TeX{} is not able to work with regular expositions. It means that
there is no simple possibility to search only words bounded by spaces,
other white characters or by punctuation. Enc\TeX{} 
searches the word as a part of another word. 
This leads to unexpected situations: the
short word is documented but it is a part of longer undocumented words
used in source code. For example, you document the structure "turn"
but you don't need to hyperlink the part of the word "return".
In such case you can define the "return" word as a ``normal''
undocumented word by the command "\noactive{<word>}"\du{noactive}
(for example "\noactive{return}"). This command declares the "<word>"
as a searched word (for enc\TeX) but sets it as inactive.

Imagine that you document a word which is used in code in ``documented
meaning'' only if some text precedes this word and/or some text
followed the word. If the word is used with another prefix/postfix
then this is undocumented meaning of the word. You can use in such
case a declaration "\onlyactive{<before>}{<word>}{<post>}"\du{onlyactive}.  
If you declare the word by "\dg <word>" (or by similar manner, see
section~\cite[ddsl]), then the word is hyperlinked in source code
only if the text "<before>" precedes and the text "<post>" follows.
The text "<before>" and/or "<post>" itself stays inactive.
The parameters "<before>" or "<post>" can be empty (no both
simultaneously) and you can use more "\onlyactive" declarations of
single "<word>".

\docbytex{} activates the enc\TeX{} searching only inside the group
{\tt\char`\"...\char`\"} or in listings of source codes.
It means that "\mubytein=1" (see enc\TeX{} documentation) is set only
in these situations. We recommend to leave "\mubytein=0" outside these
environment. If you set "\mubytein=1" (for example because of UTF-8
encoding) for the whole document then you do it on your own risk. 
The words inside your comments can be hyperlinked in such case.
 

\subsec The Index, Table of Contents, Footnotes and Bookmarks Generation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The index and table of contents generation is fully done on macro
level of \docbytex{}. You needn't use any external program
(\docbytex{} itself does the alphabetical sorting). Just write
"\doindex"\du{doindex} or "\dotoc"\du{dotoc} on the desired place in
your document. Warning: the table of contents is not correctly
generated after first pass of \TeX. You have to run \TeX{} twice.
The pages may be changed after second pass because of table of
contents is inserted. Thus correct oputput is (may be) 
guaranteed after third pass of \TeX. The words ``may be'' are written
here due to the problem with footnotes mentioned in 
section~\cite[specfootnote].
The footnotes are changed in all three \TeX{} runs and this influences
the vertical typesetting retrospectively.
This is a reason why \docbytex{} performs the check of
consistency of references generated by current and previous 
\TeX{} pass. This check is done during the "\bye"\du{bye} 
macro is processing. Thus, it is usable to write "\bye" command
instead "\end" primitive command at the end of the document.
If the "\bye" macro is used then you can see the message 
``{\tt OK, all references are consistent}'' on the terminal or the warning
``{\tt page references are inconsistent, run me again}''.

You can do test of consistency in more detail by following script:

\begtt
#!/bin/bash
cp document.ref document.r0
pdfcsplain document
diff document.r0 document.ref
\endtt

\docbytex{} tries to fix the footnote processing after second pass in
order to document convergence. If you do big changes in the document
after that then \docbytex{} does change the numbers of lines for
footnotes and the Overfull/Underfull boxes may occur. We recommend
to remove the {\tt.ref} file and to run three passes of 
\docbytex{} again in such case.

\docbytex{} creates the structured bookmarks in PDF output 
if "\bookmarks"\du{bookmarks} command is used. The structured
bookmarks include names of parts, sections, subsections and documented words.
There is no matter where the command "\bookmarks" is written because
the information used in bookmarks is read from {\tt.ref} file. 
The problem about encoding of texts of bookmarks is discussed in
section~\cite[hooky].


\subsec [vkladani] Source Code Inserting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Instead of simply command "\ins" you can use two more elaborate
commands "\ifirst"\du{ifirst} and "\inext"\du{inext} in order to
insert a part of source code in your documentation.

The "\ifirst{<file>}{<from>}{<to>}{<why>}" command inserts 
a part of the file "<file>" (full file name including extension)
from first line with the pattern "<from>" ending by line with the
pattern "<to>" or (if such line does not exists) to the end of file.
If the pattern "<from>" does not exists then the warning is printed on
the terminal.

The parameters of "\ifirst" command are first expanded and used
thereafter. The active tie character is expanded to the space.

The parameter "<why>" specifies if the line with "<from>" pattern
and/or the line with "<to>" pattern have to be printed or not.
This parameter has only two characters (plus and/or minus) with the
following meaning:

\begtt
why:  --   don't print first nor ending line
why:  +-   print first line but don't print ending line
why:  -+   don't print first line but print ending line
why:  ++   print both lines
\endtt

If the parameter "<from>" is empty (use "{}" notation) then the
printing starts on the begin of file. If the parameter "<to>" is
empty, only one line is printed. If "<to>=\end",\du{end} then
printing stops at the end of file. The ending line does not exists in
such case.

If the parameter "<from>" (or "<to>" respectively) 
has "\empty"\du{empty} value (use "{\empty}" notation) then 
the printing starts (or stops respectively) at the first empty line.
You can specify if this line is printed by "<why>" parameter.

The parameters "<from>" and "<to>" can be started by "^^B" character
(it means that the pattern have to be at the begin of the line) and/or
they can be ended by "^^E" character (it means that the pattern have
to be at the end of line). For example the parameter "^^Btext^^E"
means that "text" have to be on the line without nothing more.

The special \TeX{} characters (special categories) are not allowed 
in "<from>" and "<to>" parameters.  You have to use special control
sequences "\nb"\du{nb}, "\obrace"\du{obrace}, "\cbrace"\du{cbrace},
"\percent"\du{percent} and "\inchquote"\du{inchquote} instead of
"\", "{", "}", "%", {\tt\char`\"} characters. You can define aditional
sequences for another special \TeX{} characters, for example:

\begtt
{\catcode`\#=12 \gdef\hashmark{#}}
\endtt

If parameters "<from>" and "<to>" are the same or the "<from>" pattern
is on the same line as "<to>" pattern then only this line is printed
("<why>" have to be "++" or "+-"). If this condition is true but
"<why>" is "-+" or "--", then the printing of the code is stopped 
at next line with "<to>" pattern or at the end of the file.

The "\ifirst" command remembers the name of the included file and the
number of the last line which was read. Next time you can use the
command "\inext{<from>}{<to>}{<why>}". This command starts the
searching of the "<from>" pattern from the first line which wasn't
read by the previous "\ifirst" or "\inext" command. The parameters
of the "\inext" command have the same meaning as the parameters of the
"\ifirst" command. The parameter "<file>" is missing because the "<file>"
from the last "\ifirst" command is used.

The number of the last line read by "\ifirst" or "\inext" command is
stored in "\lineno"\du{lineno} register (no matter if this line was
printed or no). If the printing of code was stopped at the end of the
file then "\lineno" equals to the number of lines of the file.
You can do test of reaching of the end of file by "\ifeof\infile".

Examples:

\begtt
\ifirst {file.txt}{foo}{foo}{++}        % print the first line
                                        % with the text "foo"
\inext {foo}{foo}{++}                   % print the next line with 
                                        % the occurence of "foo"
\ifirst {file.c}{//: from}{//:}{--}     % the same as \ins command
\ifirst {file.h}{func(}{)}{++}          % print of function prototype
\ifirst {file.c}{func(}{^^B\cbrace}{++} % print of the code func 
\ifirst {file.txt}{}{\end}{++}          % print of the whole file
\ifirst {file.txt}{}{\empty}{+-}        % print of the first block
                                        % separated by empty line
\endtt

If the first line of the code to be printed is empty then it is not printed.
If the last line of the code to be printed is empty, it is not printed too.
This is an implicit behavior. But if you write
"\skippingfalse",\du{skippingfalse} then this behavior is switched off.
It means that the empty lines can occur at the begin or at the end of
listings. You can use "\skippingtrue"\du{skippingtrue} in order to
return to the implicit behavior.

The parameter "<from>" and "<to>" can have the prefix in the form
"\count=<number> ".\du{count} The value of the "<number> - 1" means how
many occurrences of the pattern have to be skipped and ignored during
searching. The "<number>"-th occurrence of the pattern is only
significant. For example "{\count=3 foo}" means that two occurrences
of "foo" have to be skipped and the third occurrence points to the
right place, where the printing of the code starts (or ends).

If the prefix "\count=<number> " is missing then \docbytex{} supposes
that "\count=1".

If the parameters "<from>" or "<to>" are empty and "\count=<number>" is
used then the space after "<number>" needn't be written and the
meaning is slightly different: 
If the "<from>" parameter is empty then "\count" means the number of
line from where the printing is started. If the parameter "<to>" is
empty then "\count" means the number of printed lines. The previous
sentences are true for "<why>=++" and for "\skippingfalse".
If the "<why>" parameter have different value and/or "\skipingtrue" 
then you must add/subtract one or two to/from the line 
number/number of lines. Examples:

\begtt
\skippingfalse
\ifirst {file.txt}{\count=20}{\count=10}{++} % print from line 20 to 29
\ifirst {file.txt}{}{\count=2 \empty}{+-} % print to the second empty line
\ifirst {file.txt}{\count=50}{\end}{++}  % print from 50th line to the end
\ifirst {file.tex}{\count=5 \nb section}{\count=2 \nb section}{+-}
                                  % print fifth section from TeX source
\endtt


\subsec [lineodkazy] References to Line Numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The command "\cite[<label>]" expands to the number of the line in
source code.  How to declare the "<label>"? You can do it by "\ilabel
[<label>]{<text>}".\du{ilabel} command used before the "\ifirst" or
"\inext" command. You can write more "\ilabel" commands if you want to
declare more "<label>"s hidden in the following listing. The order of
"\ilabel" commands is irrelevant.

If the couple "<label>" -- "<text>" is declared by "\ilabel" then the
"\ifirst" or "\inext" command recognizes the occurrence of the "<text>" in
the listing. The line number of the first occurrence of "<text>" is
connected to the "<label>", it means the "\cite" expands to such line
number. 

The "<label>" have to be unambiguous in the whole document. The "\cite"
reference works forward and backward (after second pass of \TeX{} run).

The table of couples "<label>" -- "<text>" created by set of "\ilabel"
commands is local. It means that it cooperate only with the first
"\ifirst" or "\inext" command. These commands use this table and reset
it to the null state. You have to create this table before next
"\ifirst"/"\inext" command again. 

\docbytex{} does not write any warning if a "<text>" doesn't occur in
the listing. Of course, if you use the unconnected "<label>" by
"\cite" command then the warning is printed. 

The following example uses the known file "foo.c" mentioned in the
section~\cite[priklad].

\begtt
The declaration of my very special function is on the line~\cite[myfunct].

\ilabel [myfunct] {function (float}
\ilabel [returnx] {pair.x}
\ifirst {foo.c}{}{}{++}

There is very specific idea on the line~\cite[returnx] where the input
parameter is multiplied by two.
\endtt


\subsec Verbatim Environment by  {\tt\nb begtt}/{\tt\nb endtt}
        and by Quotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Verbatim displays of the code can be included to the documentation by
"\begtt"\du{begtt} and "\endtt"\du{endtt} pair of commands. The
material to be displayed is written between these commands. All lines
are inserted without changes, without interpretation of special \TeX{}
characters. The lines are not numbered here and the occurrences of
documented words are not hyperlinked automatically.

The following sections~\cite[hooky] and~\cite[begtt] discuss more
possibilities of this environment.

You can write verbatim text in paragraph between quotes
{\tt\char`\"...\char`\"}. This text is written by typewriter font and
documented words are hyperlinked automatically. We recommend to use
this environment for all parts of documented code which is
mentioned inside the paragraph. This is analogical to math environment
separated by "$...$".


\subsec [ddsl] The Declaration of the Documented Word
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

You can use commands "\dg",\du{dg}
"\dgn",\du{dgn} "\dgh",\du{dgh} "\dl",\du{dl} "\dln"\du{dln} 
or "\dlh"\du{dlh} in order to declare the documented word. The
semantic of these commands is explained below. The syntax of these
commands are slightly special. The purpose is to minimize the work of
the writer, so the braces ("{}") are not used, parameters are separated
by space for instance.  All these commands have the same syntax
thus the example below uses only "\dg" command.

The possibilities of the syntax follows:

\def\begtthook{\langleactive \mubytein=1}
\begtt
\dg <word>            % <word> separed by space
\dg [<text>] <word>    % optional paremeter <text>
\dg [<text>]<word>     % the space between [<text>] add <word> is optional
\dg <word>()          % <word> with "()" separed by space
\dg [<text>]<word>()   % a combination of previous syntax
\dg <word>,           % <word> separed by comma
\dg [<text>] <word>,   % a combination of previous syntax
\dg <word>(),         % <word> with "()" separed by comma
\dg [<text>]<word>(),  % a combination of previous syntax
\dg <word>.           % <word> separed by period
etc...
\endtt
\def\begtthook{}

In general: The optional "[" can follow after "\dg" command. The
"<text>" separated by "]" is read in such case and subsequent optional
space is moved to the end of the "<text>". It means that
"\dg"~"[text] word" is the same as "\dg"~"[text ]word".
Next, the "<word>" is read. The "<word>" parameter cannot
include the space, comma, period, colon and semicolon because these
characters can be separator of the "<word>". These punctuation
characters are not part of the "<word>" but they are printed.
It means that "\dg word:" prints "word": to the output and sets 
the "word" as a documented word. If the scanned "<word>" ends by
brackets "()" then these brackets are removed from "<word>" parameter,
they are not printed in the current place but they are printed in
footnotes and in the index.

Attention: the space have to be written after comma, period, colon or
semicolon separator. If the space does follow immediately then the
scanning process works only if the text between comma-like separator 
and space does not contain active characters ({\tt\char`\"...\char`\"}
for example). If the first character after space is {\tt\char`\`}
(backward quote) then the space and this quote is not printed.

Examples:  "\dg"~"<word> `~<next text without line breaking>"
or: "\dg"~"<word> `"{\tt\char`\"...\char`\"}. 

The commands "\dgh", "\dgn", "\dln", "\dlh" with space as a separator
doesn't print this separator because they usually print nothing
(see below).

Semantic: The "<word>" parameter is documented word. If this "<word>"
occurs on the other place in the document between
{\tt\char`\"...\char`\"} or in code listing then it is hyperlinked
automatically (blue color). The documented word is highlighted by red
color in the place where the "\dg" command is used and the optional 
"<text>" or "()" does not printed. 
This is the destination of all blue hyperlinks. The "<word>" is printed in
footnote of the current page too including the optional "<text>" in
and/or including the optional "()". The list of pages where
the word is used is printed here too. The same is printed in the
index. The index is sorted alphabetically by the "<word>", not by the
optional "<text>". 

The "<word>" declared by "\dg" is declared globally. This place is a
reference point for the whole document.

The "\dgh" works like "\dg" but the word is not printed in the place
of "\dgh" (mnemonic: "\dg" hidden). But this place is still the
destination of hyperlinks and the word occurs in the footnote and in
the index.

The "\dgn" command (mnemonic: "\dg" next) 
saves its parameters but prints nothing.
The first occurrence of the "<word>" in the next listing will 
be treated as the "\dg" is written here.

The "\dl" declares "<word>" locally. If the short name "<word>" is
used in the same name space then it is hyperlinked and pointed to the
place where "\dl" is used. The name space is changed by "\module"
command. It means that "<word>" is used locally in the module.
The word declared by "\dl" lives in two variants: short name ``"<word>"''
and long name (depends on the current name space, typically
``"<word>./<modulename>"''). The long name is accessible in the whole
document. 

The section~\cite[jmenneprostory] explains the name spaces in more detail

Each word can be declared at most once in the document else the error
is printed by \docbytex{} on the terminal. In case of "\dl" the short
name is irrelevant but the long name have to be unambiguous.

The "\dlh" command is "\dl" hidden and the "\dln" means "\dl" next.
They are similar as "\dgh" and "\dgn".

If somebody hate this complicated parameter scanning then he/she can
use internal commands with three parameters in braces:
"\iidg",\du{iidg} 
"\iidgh",\du{iidgh} "\iidgn",\du{iidgn} 
"\iidl",\du{iidl} "\iidlh",\du{iidlh} "\iidln".\du{iidln}
The usage of the parameters is: "\iidg{<text>}{<word>}{<brackets>}".
Of course, you can do more by these commands: you can declare "<word>"
with spaces or another delimiters, you can write something different
than ``"()"'' as "<brackets>" parameter.


\subsec [jmenneprostory] Namespaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The namespace is a rule by which the short name of documented 
word is transformed to long name when "\dl" is used. You can set the
namespace by the command "\namespace"\du{namespace}.
If the command "\dl<word>" is used inside the
"\namespace" "{<pre-text>#1<post-text>}...\endnamespace".\du{endnamespace} 
environment then the short name is "<word>" and the long name is 
"<pre-text><word><post-text>".
All occurrences of "<word>" are transformed to the long name inside the
namespace environment. Outside of this environment the occurrence of
short name "<word>" is treated as no "\dl" command is used.
For example each word declared as "\dl<word>" inside
"\namespace"~"{#1//uff}...\endnamespace" environment is transformed to
the long name ``"<word>//uff"'' and the occurrences of "<word>" inside
this environment is hyperlinked and pointed to the place where
"\dl<word>" is used. Outside of this environment only sequences
"<word>//uff" are hyperlinked.

The namespace is undefined out of "\namespace...\endnamespace"
environment thus the "\dl" command cannot be used here.
The "\module" command declares namespace "#1./<modulename>"
thus you can use "\dl" command for local functions and variables
used in current module.

The long names are printed in the footnotes and in the index.
The index is sorted by the long names alphabetically. The table of
contents uses short names.

An example about namespaces follows:

\begtt
\namespace {ju::#1}   %% namespace "ju" is set
The word \dl aha is declared here.
The word "aha" is hyperlinked to the place of its declaration.
The word "ju::aha" is hyperlinked too.
\endnamespace
\namespace {wow::#1} %% namespace "wow" is set
The word \dl aha is declared here again.
The word "aha" points to the declaration inside "wow".
\endnamespace         %% namespace off
The word "aha" is inactive here but the words
"ju::aha" and "wow::aha" points to the right places.
\endtt

The "\namespace...\endnamespace" environments can be nested. The inner
environment have to have another namespace than the outside
environment. These environments work globally independent of the 
"\bgroup" and "\egroup". The "\endnamespace" command used outside of all
namespace environments does nothing. You needn't to close these
environments before "\bye" command. 


\subsec The Application Level of the Documentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

You can write the documentation to users of your code. For example the
rules of the usage of functions are documented here (API) without codes
of these functions. Suppose that you want to document the ``inside
behavior'' of these functions by presenting their codes in the same
document. The documented "<word>" (a function name) can point to two
different places in your documentation in such case: API documentation
and CODE documentation.

The place with the function code (detail documentation) is located by
"\dg" command (or similar). The second place where the word is
documented only for users without code can be declared by
"\api{<word>}"\du{api}. This command inserts the invisible mark only,
the destination of links. The table of contents mentions the word
and points to this place. The list of pages with the occurrences of the
word (in the index and in footnotes) contains one underlined
page number. This is the page where "\api" command is used.
Of course, the "\api{<word>}" command is not sufficient to including
the word to the index. You need use the "\dg" command (in another 
place of the document) too.

The word declared by "\api" command are printed in the index with the
"\apitext"\du{apitext} prefix. The implicit value of "\apitext" macro
is the special right arrow. You can see it in the index and in the
table of contents in this document. The "\api{\nb api}" is used here
but the code of "\api" macro is documented in section~\cite[reference].

You can reference the place marked by "\api{<word>}" by
"\cite[+<word>]". This macro expands to the page number where the
"\api{<word>}" is used. For example the "\cite[+\nb api]" expands to
\cite[+\nb api] in this document.

If there exist the API destination declared by "\api" command then
the red word printed in the "\dg" place is hyperlinked and it points
to the API destination. Typically, the occurrence of this word is
hyperlinked here with the "\dg" place as a destination. It means we have
these two destinations cross hyperlinked.


\subsec [kapsec] Title, Parts, Sections, Subsections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sections starts by "\sec"~"<Section Name>\par"\du{sec} command.
Each section can include subsections started by the command
"\subsec"~"<Subsection Name>\par"\du{subsec}.
Of course, the "\par" separator can be replaced by empty line
(see the example in section~\cite[cleneni]).
Sections and subsections are numbered automatically.

One or more sections can form a ``part'' which is started by
"\part"~"<Part Name>\par"\du{part} command. Parts are labeled by
letters A, B, C,~\dots\ and they are printed more noticeable in table
of contents than sections. The "\part" command does not reset the
section numbering. It means that sections are numbered from one in
the whole document, no matter if the document is divided into parts.

The "\module <modulename> " command creates a new section
"Module <modulename>", creates namespace and includes the
"<modulename>.d" file. You can change this default behavior,
see sections~\cite[nazvy] and~\cite[module].

The "\title<Name>\par"\du{title} command prints the title of the
document by huge font in rectangle. If the
"\projectversion"\du{projectversion} macro is defined then it expands
to the text printed in the right upper corner of the rectangle
by small font. The word ``version'' precedes. If our project has no
version then you can define (for example):

\begtt
\def\projectversion{\the\day. \the\month. \the\year}
\endtt

The "\author<text>\par"\du{author} command centers the "<text>" 
i the line and prints it bold. The common meaning is name(s) of the 
author(s).

The headline is created at each page of the document with the
current section (from left) and title of the document (from right).
You can redefine the right headline by new definition of the
"\headtitle"\du{headtitle} macro.

The optional parameter "<label>" in square brackets can be used 
with "\sec" and "\subsec" commands. The parameters looks like:
"\sec"~"[<label>] <Section Name>\par". If the "<label>" parameter is
used then you can reference this place by "\cite[<label>]". This macro
prints the number of referenced (sub)section and acts like
hyperlink.

You can disable the transport of "<(Sub)Section Name>" into table of
contents by "\savetocfalse"\du{savetocfalse} used before "\sec" or
"\subsec" command. This section has no number. The macro
"\emptynumber"\du{emptynumber} expands instead of number printing. This 
macro is set to empty by default. The "\savetocfalse" command
influences only first "\sec" or "\subsec" command.


\subsec [krizodkaz] Hyperlinks, References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


The destination of the hyperlink and/or reference have to be marked by
"<label>".  This can be done by optional parameter of the "\sec" or
"\subsec" command (see the section~\cite[kapsec]) or by the command
"\label[<label>]"\du{label} itself. You can make labels to line
numbers of inserted code too (see the section~\cite[lineodkazy]).  All
labels have to be unambiguous in whole document (independent of their
type).

The command "\pgref[<label>]"\du{pgref} expands to the number of the
page where the "<label>" is. The command
"\numref[<label>]"\du{numref} expands to the result which depends
on the type of the destination:

\begitems
\item * sections number if the destination is the section
\item * the pair "<secnumber>.<subsecnumber>" if the destination is
        the subsection.
\item * the number of the line if the destination is the line in the
        printed code
\item * empty if the destination is marked by "\label" command.
\enditems

Both macros "\pgref" and "\numref" expand to the texts mentioned above
without any more processing. It means that the printed text is not
treated as hyperlink.

You can use the command "\ilink"~"[<label>]{<text>}"\du{ilink}
in order to create the hyperlink in PDF mode.
This macro prints the "<text>" in blue color and it is treated as
hyperlink to the destination specified by "<label>".
For example the command "\cite[<label>]"\du{cite}
does the same as "\ilink[<label>]{\numref[<label>]}".
The real macro "\cite" executes a test if the "\numref[<label>]"
is empty and prints the "\pgref" in such case.

If the "<label>" is not declared then "\pgref{<label>}" and 
"\numref{<label>}" have no destination. The "\pgref" expands to
the text "-1000" and "\numref" is empty in such case. These macros
work on expand processor level thus no warning message is implemented
here. On the other hand the "\cite" command implements warnings.
See the code of "\cite" on the page~\cite[@\nb cite] for more detail.

The "\module"~"<modulename> " command creates the section with the
label ``"m:<modulename>"''. You can reference it by:

\begtt
\def\refmodule[#1]{\ilink[m:#1]{\tt#1}}
\endtt
%
The "\refmodule{<modulename>}" defined in the example above 
prints "<modulename>" and creates it as
hyperlink. For example "\refmodule[base]" prints the word ``base''
in blue typewriter font and creates it as the hyperlink to the begin of 
the section ``Module base'' if this section is crated by
"\module base " command. 

The "\dg", "\dgn" and "\dgh" commands perform the command "\label[@<word>]"
internally and the "\dl", "\dln" and "\dlh" perform the command
"\label[@<longname>]" internally. The "<longname>" is the long name of
the "<word>" in context of the current namespace.
For example, you can reference these places by 
"\link[@<word>]{The <word> documented on the page~\pgref[@<word>]}". 

The "\api{<word>}" command executes "\label[+<word>]" internally. It
means that you can reference this place by
"\ilink[+<word>]{API: <word>}" for instance. 

No more automatic numbering is processed by \docbytex{}. Only
numbers of sections, subsections and line numbers of the printed code.
If you want to create the numbers of figures, publications etc. Then
you have to write your own macros. You can use the
"\labeltext[<label>]{<text>}"\du{labeltext} command in such case.
This macro expands it parameters immediately and 
inserts invisible hyperlink destination into typeset material in
horizontal mode. Then macro "\numref{<label>}" expands to
"<text>" in the next pass of the \TeX{} run.
Example: we define the macro "\bib[label]" which inserts the
destination marked by the "<label>". The hyperlink with the number 
of the book can be created by "\cite[b:<label>]".

\begtt
\newcount\bibnum
\def\bib [#1]{\par\advance\bibnum by1 \indent
    \llap{[\the\bibnum] }\labeltext[b:#1]{[\the\bibnum]}\ignorespaces}
\endtt

\subsec Pictures Inserting
%%%%%%%%%%%%%%%%%%%%%%%%%%

The command "\ifig" "<width> <picname> "\du{ifig} inserts the picture
into your document. The picture have to be prepared in the file
"fig/<picname>.eps" (if \ilink[+DVI]{DVI mode} is used) and in the file
"fig/<picname>.pdf" (if \ilink[+PDF]{PDF mode} is used).
You can use another directory for pictures than "fig/" -- this name is
stored in the "\figdir"\du{figdir} macro and you can redefine it.
The "<width>" parameter is the ratio of the width of inserted picture
to the "\hsize" (unit-less). The inserted picture is placed to left
side with the paragraph indentation.
For example "\ifig 0.5 foo" inserts the picture prom "foo.pdf" 
(in PDF mode). The picture is scaled that its width is one half 
of the width of the printed text.

If you have the picture in "eps" format and you need to convert it to
"pdf" then you can use:

{\def\begtthook{\langleactive}
\begtt 
ps2pdf -dEPSCrop <picname>.eps
\endtt
\par}


\subsec Items
%%%%%%%%%%%%%

The list of items are surrounded by "\begitems"\du{begitems} and
"\enditems"\du{enditems} commands. The text is printed with one indent space
("\parindent") more in this environment. These environments can be
nested. Each item is started by "\item"~"<mark> ".\du{item}
The "<mark>" is printed left from the text. If the "<mark>" is the
star ("*") then it is changed to the bullet. You can write
"\item"~"\the\itemno) "\du{itemno} if you want to print numbered
items. The "\itemno" register counts from one in each
"\begitems"..."\enditems" environment.

The "\item" macro is redefined only inside "\begitems"..."\enditems"
environment. If you wish to use the plain\TeX{} macro "\item" then 
just don't use "\begitems" and "\enditems" commands.
 

\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent} \noactive{\percent\cbrace}


\sec [zmeny] For Advanced Users
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The definitions of basis macros of \docbytex{} are mentioned in 
this section. The user can change these definitions if he need
different behavior of \docbytex{} than default one. For example, user
documents different language than C and he/she redefine the
"\docsuffix" macro or he/she redefine the code of "\module" and
"\ins" commands completely.


\subsec [nazvy] Internal Names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The "\doindex" command creates new section with the name ``Index''.
The sections with names ``Table Of Contents'' or ``Module''
are inserted when table of contents is generated or "\module" command
is executed. The word ``version'' is prefixed when the number of
version is printed (if "\projectverion" is used). The text
">> PART" is inserted into bookmarks by "\part" command.
These texts are defined in the following macros:
\db titindex, \db tittoc, \db titmodule, \db titversion and \db opartname.

\ifirst {docby.tex}{Intern}{\empty}{--}

Note that different names are used by default when plain or csplain
format is processed. But user can redefine these macros independently
of the used format.


\subsec [hooky] Hooks
%%%%%%%%%%%%%%%%%%%%%

Some more elaborate macros ("\begtt", quotes, "\ifirst",
"\inext", "\doindex", "\dotoc") execute so called ``hook''
before processing of more code. These hooks are macros and they are
empty by default.

\ifirst {docby.tex}{begtthook}{\empty}{+-}

The \db begtthook macro is inserted after begin of the group and after all
catcodes are set by default before text inside the environment 
"\begtt...\endtt" is processed.
The \db quotehook macro is inserted after begin of the group and after
all cactodes are set by default before the text inside
"\begtt...\endtt" is processed.
The \db indexhook macro is inserted by "\doindex" command after new
section name is printed and before two column printing is activated.
You can insert the notice to index here (see the index of this document 
for example). 
The \db tochook macro is inserted by "\dotoc" command after new
section name is inserted and before first line of table of contents is
printed. 
The \db bookmarkshook macro is inserted inside the group at the begin
of bookmarks processing. You can set the different expansion of macros
used in bookmarks here. For example "\def\mylogo{MyProgram(R)}". 
Moreover, if you
say "\let\cnvbookmark=\lowercase" here then all characters is
converted to lower case in bookmarks. This is done by "\lowercase"
primitive thus the different meaning of special characters can be set
by "\lccode". I use it for removing of accents because accents in
bookmarks are interpreted by most PDF viewers wrongly.
The \db outputhook macro is inserted at the begin of the output
routine. We recommend to set chosen macros to "\relax" meaning in
order to they are not expanded in ".ref" file.

Examples:

\bgroup
\catcode`'13 \def'{\nb} \catcode`?=13 \def?{<} 
\def\begtthook{\langleactive\mubytein=1}
\begtt
\def\quotehook{\obeyspaces}   % normal spaces inside  "..." 
\def\quotehook{\langleactive} % ?text> is changed to <text>
\def\begtthook{\mubytein=1}   % auto-hyperlinks between 'begtt...'endtt
\def\begtthook{\setsmallprinting} % 'begtt...'endtt printed by small font
\def\begtthook{\catcode`\!=0} % !commands can be used in 'begtt...'endtt
\def\indexhook{The special index with such and such properties follows.}
\def\outputhook{\let\mylogo=\relax} % \mylogo is not expaded in *.ref
\endtt
\par
\egroup

\subsec [module] The Commands {\tt\nb module} and {\tt\nb ins}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The user documentation of these commands is in section~\cite[cleneni].
The  \db module "<file> " command reads the file with the name "<file>\docsuffix"
where \db docsuffix macro includes the suffix including the period.

\ilabel [linkincomment] {extension}
\insdef docsuffix  

The "\module" command inserts the name of the file (without the suffix)
into the auxiliary macro \db modulename. This macro is used by the
\db ins "<extension> <text> " command.

\inssdef ins

\subsec The Comments Turned to Green Color
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The  "\ifirst" and "\inext" commands recognise C comments in the form
"//..<eol>" and "/* .. */". These comments are printed in green color.
You can disable this behavior by "\noactive<string>" command.
You can set a new type of comments by \db setlinecomment "{<string>}" command.
These commands will be turned to green color from "<sting>" to end of line.
These commands work globally. For example

{\def\begtthook{\mubytein=1}
\begtt
\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent}}
\endtt
\par}
\noindent
activates comments used in \TeX{} sources and PostScript language.

You can set the comments of the type "/*...*/"
by the command \db setlrcomment "{<left>}{<right>}".

If you are interested what these macros do internally then you can read
the following part of this section.


\inext {mubyte}{\empty}{+-}

These macros are empty in no-enc mode. When enc\TeX{} is detected, 
they write information to enc\TeX{} table by "\mubyte...\endmubyte" 
primitive commands. 

The \db linecomment a \db leftcomment commands are inserted by enc\TeX{}
before each occurrence of declared character sequence. These commands sets
the current color to green:

\inext {linecomment}{\empty}{+-}

On the other hand, the \db rightcomment command have to switch off the 
green color after the declared sequence is detected. Thus 
enc\TeX{} cancels the detected sequence and "\rightcomment"
command returns this sequence back. After the returned sequence 
the \db returntoBlack command set the current color to black.  

\inext {returntoBlack}{\empty}{+-}

Each line of listing is started by "\Black" switch. So, the green comments
to the end of line work. But the green comment can be interrupted by
the pair "\Blue...\Black" (see line~\cite[linkincomment] in previous section).
In this case the "\Black" command have the "\Green" meaning so it
returns to the green color. Next line is started with original "\Black"
switch because each line is printed inside its own \TeX{} group.

The comments of type "/* ... */" can affect more lines. So more lines
have to be green and we re-define "\Black" to "\Green" globally.
The lines starts with "\Black" command with "\Green" meaning in such
case. The "\returntoBlack" returns to the original "\Black" switch 
globally.

\docbytex{} initializes the comments by the rules of C language:

\inext {setlinecomment}{\empty}{+-}


\sec [design] For Designers
%%%%%%%%%%%%%%%%%%%%%%%%%%%

The documentation of macros which influence the look of the document
follows. You can redefine it in order to change the design of your
document. I mean that it is better to write simply and good documented
macros for one purpose than the complicated macros with many
parameters. You can simply use them or redefine them.

The main processing of docbytex{} is hidden in more complicated macros
described in section~\cite[implementace]. This differentiation of
levels gives possibility to the designers to concentrate to
design-like problems and not to drown in complicated recursive loops
etc. of internal macros.

There are two different version of design macros: for pdf\TeX{} mode
and for DVI mode (without pdf\TeX{}). This is the reason why you can
see that the listings of following macros are often started by the text 
"\ifx\pdfoutput\undefined".


\subsec Parameters and Auxiliary Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The parameters \db hsize and \db vsize are unchanged in
\docbytex{}. User can set his/her own preferred values.
If they are unchanged by user then the default values from plain
(usable for letter format) or csplain (usable for A4) are used.

\docbytex{} sets new value for "\parindent" because we need more space
here for colourised squares in section names.

\ifirst {docby.tex}{parindent=}{\empty}{+-}

The \db nwidth dimen is used like ``narrowed "\hsize"'' for many
situations: the width of headline, footline and for title text.

\inext {nwidth}{\empty}{+-}

The glue at the bottom of each page is set by "\raggedbottom" macro
(defined in plain\TeX).
Moreover, the "\exhyphenpenalty=10000" is set in order to deny 
the linebreaking after dashes (like pp~11--13).

\inext {raggedbottom}{\empty}{+-}

The fonts 
\db bbf, \db bbbf, \db btt,
\db ttsmall, \db rmsmall, \db itsmall and \db partfont
are loaded here.

\inext {bbf=}{\empty}{+-}

The \db setsmallprinting macro sets the typewriter font and prepares
the \db ttstrut of appropriate size and activates the line printing
without vertical spaces between them by "\offinterlineskip" macro.
The "\parskip" value is set to "-1pt" in order to a small overlaps of
struts guarantee that no dashes-artifacts occur at background of
listings. The \db setnormalprinting is similar.

\inext {setsmallprinting}{\empty}{+-}

The design is projected only with the following colors:
\db Blue, \db Red, \db Brown, \db Green, \db Yellow a \db Black.
If you need other colors you can define more similar macros.

\inext {pdfoutput}{\empty}{+-}

All colors are defined by \db setcmykcolor macro which is empty in DVI
mode but~a proper "\special" is used in PDF\TeX{} mode. It means that
the commands "\Brown" etc. can be used in DVI mode too, but they do
nothing in that mode.
The \db oriBlack macro switches to black color and this macro is never changed.
On the other hand, the "\Black" macro can be redefined in special
environments and we need to return to real black color 
by "\oriBlack" macro at the end of such environment.

The \db rectangle "{<height>}{<depth>}{<width>}{<contents>}"
command creates a rectangle with specified dimensions and contents.
This rectangle is filled by yellow color in PDF mode. 
The same rectangle has only black outline in DVI mode.
Attention: the "<contents>" have to be prefixed by color switch
otherwise it is invisible in PDF version (yellow on yellow). 
The "\rectangle" macro returns back to black color after rectangle 
is created.

\inext {pdfoutput}{\empty}{+-}

The \docbytex{} logo is typeset by \db docbytex macro.

\inext {def\nb docbytex}{\empty}{+-}


\subsec Sections and Subsections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db printsec "{<sec-title>}" and \db printsecbelow macros are
invoked from "\sec" macro. Their main task is to print the title of
the section. You can redefine these implicit macros. 
You can concern with design of section here and you need
not solve other problems (reference to the TOC, numbers, running heads
etc.) which are hidden in "\sec" macro.
 
The following rules are mandatory: The vertical mode have to be
initialized at the begin of the "\printsec" macro. Then you can insert
vertical space and then you can insert the text of title.
The "\makelinks" macro have to be inserted in the horizontal mode here. It
creates the aim of hyperlinks. The "\par" command have to be the last
command of your "\printsec" macro. No more vertical spaces can be
inserted here. The main "\sec" macro inserts another elements below
the text and then it call the second macro "\printsecbelow". The
vertical space below the text is inserted from this macro (probably
protected by "\noberak". The right order of elements in \TeX{}'s
vertical list is: ``box, (whatsit, mark, etc.), penalty, glue''. 
The objects mentioned in the brace here is inserted by "\sec" macro.
You can insert the ``box'' (by "\printsec" macro) and the
``penalty+glue'' (by "\printsecbelow" macro).

There are numerical registers "\secnum" and "\subsecnum" which store the
actual (sub)section number. Moreover you can use the "\ifsavetoc"
test. This is true if the title is printed in table of contents.
If it is false then you can use "\emptynumber" macro instead of
"\the\secnum". 

The "\seclabel" includes the "<label>" of processed section or it is
empty. You can use it for draft printing is you wish to see the labels
(in margins, for example). \docbytex{} doesn't implement this feature
by default.

\ifirst {docby.tex}{def\nb printsec }{\empty}{+-}

The \db printsubsec and \db printsubsecbelow macros does the same
things but subsection is printed. They are invoked by "\subsec" macro.

\inext {def\nb printsubsec }{\empty}{+-}

The \db printpart macro prints the title of part which is enumerated by
uppercase letters. The \db printpartbelow macro inserts the vertical
space below the part title.

\inext {def\nb printpart }{\empty}{+-}

The \db emptynumber is normally used if "\savetocfalse". It prints
nothing by default.

\inext {emptynumber}{\empty}{+-}


\subsec The Title, The Author
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db title "<title>\par" macro reads its parameter "<title>" by
auxiliary macro "\secparam" which ignores the possible space at the
end of this parameter. This parameter is stored into "\sectitle"
tokenlist and internal macro \db iititle is invoked. This macro works
in two different modes (DVI and PDF). The "<title>" is stored into
"\headtitle" macro (in both modes) only if the "\headtitle" is empty,
it means that it it not initialized by user. Then "\iititle"
suppresses the headline printing on the current page by the
"\nohedaline" command. 

\inext {def\nb title}{\empty}{+-}

The "\iititle" macro expands to normal "\centerline" in DVI mode.
On the other hand it creates the yellow rectangle of the width
"\nwidth" in PDF mode.

If the \db projectversion macro is undefined then its default value is
empty.

\inext {ifx\nb project}{\empty}{+-}

The \db author "<author>\par" does the same in both modes: prints the
"<author>" text on the center by boldface font.

\inssdef author


\subsec Headers and Footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} doesn't change the output routine defined by plain\TeX.
It uses the standard plain\TeX{}'s macros "\headline" and "\footline" 
when the design of headers and footers need to be changed.

The default design doesn't do any difference between left page and
right page because we suppose that the document will be read on
monitor and may be printed without duplex.

The \db footline prints the page number on center with "\rectangle".

\inext {footline}{\empty}{+-}

The text of \db headline is changed during document is processed. It
includes only \db normalhead macro by default but if the "\noheadline"
command is used then "\headline" changes its content until one page is printed.

\ilabel[headlinebox] {headlinebox}
\inext {headline}{\empty}{+-}

The "\normalhead" macro stores page link by "\savepglink"
and creates the header by nested "\vbox/\hbox"es. The name of section
("\firstmark") is printed from the left side and the constant
"\headtitle" is printed on the right side.

The \db noheadline macro sets "\headline" to the temporary macro text 
which stores page link and does the change of "\headline" to its
default value. This setting is global because we are inside the output 
routine.

\inssdef noheadline

The \db headtile macro prints the text in right side of header. It is
empty by default but it is changed by "\title" command to the name of
the document. User can define its value manually.

\inext {headtitle}{\empty}{+-}

The auxiliary macro \db headlinebox prints the empty rectangle in DVI
mode and solid yellow rectangle in PDF mode. It is used on the 
line~\cite[headlinebox] for creating of square filled line in the header.

\inext {ifx\nb pdfoutput}{\empty}{+-}


\subsec Printing of the Hyperlink Destinations and Footnote References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The hyperlink destination created by "\dg" or "\dl" macros are printed
highlighted in order to reader can easy find it. The printing is
processed by the macro \db printdg "{<text>}{<word>}{<brackets>}"
where the parameters are the same as in "\iidg" macro described 
in~\cite[ddsl] section.

Only one parameter "<word>" is printed by default. The "<word>" is
printed in rectangle in DVI mode or it is printed in red on solid
yellow rectangle in PDF mode.

\inext {ifx\nb pdfoutput}{\empty}{+-}

The red text is printed by auxiliary macro \db printdginside.
This macro prints only in red color if does not exist the "\api"
destination. On the other hand it prints in red by "\ilink" macro if
the "\api" destination does exist.

\inext {def\nb printdginside}{\empty}{+-}

One item below the footnote rule is printed by 
\db printfnote "{<text>}{<word>}{<brackets>}" macro (the parameters from
"\iidg" macro are here). The "<word>" is printed in red, other
information is printed in black.

The "\specfootnote"~"{<text>}" macro is used here. It sends the
"<text>" to the special footnote. The "\pgref[+<word>]" returns the
page number where the "\api" destination of the "<word>" is or it
returns $-1000$ if "\api" destination does not exist. This number is
stored in "\apinum" and if it is non-negative number then it is
printed as first page number underlined. The list of page numbers
where the "<word>" occurs is printed by 
"\listofpages{<word>}" macro. This macro ignores the number of page
where "\api" destination is. The empty list of page numbers is
detected by zero width of "\box0".

\inext {def\nb printfnote}{\empty}{+-}

\subsec The Index and Table of Contents Item
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db ptocline "{<number>}{<text>}{<pageno>}" command prints the
item about a section or a part in table of contents. The 
\db ptocsubline "{<number>}{<text>}{<pageno>}" does the same with the
item about subsection. There is no substantial differences between these commands
in \docbytex{}'s default design, only one "\indent" more in "\ptocsubline":

\inext {def\nb ptocline}{\empty}{+-}

The \db mydotfill command prints the dots in table of contents so they
are aligned.

The \db ptocentry "<type>{<word>}{<s-word>}" prints one item about
documented word in table of contents. If it is "\api" occurrence of
the "<word>" then "<type>=+" else "<type>=@". The "<s-word>" parameter
is empty but if the "<word>" is declared by "\dl" then "<s-word>"
includes a short variant of the word and "<word>" includes a long
variant of it. We use long variant for hyperlinking and short variant
for printing.

\inext {def\nb ptocentry}{\empty}{+-}

If someone want to print "<text>" before "<word>" or "<braces>" after
"<word>" then he can use a control sequence 
"\csname-<word>\endcsname". The example follows in the next macro
"\printindexentry".

The \db myldots command creates three dots, they are aligned wit
another dots in table of contents.

The \db printindexentry "{<word>}" macro prints an item of the
"<word>" in the index. It starts in vertical mode inside column,
prints the item and it have to switch to vertical mode back by "\par"
command. 

\inext {def\nb printindexentry}{\empty}{+-}

The \db separeright macro stores the "<text>" before the declared word
into the "\tmpa" and the "<braces>" into the "\tmpb". The control
sequence "\csname-<word>\endcsname" is prepared by the "\refdg" macro.
This sequence expands to "<text>\right<braces>".
The page number with the "\dg" (or "\dl") occurrence of the word 
is obtained by "\pgref[@<slovo>]" and the page number with "\api" 
occurrence is obtained by "\pgref[+<word>]". This page number 
is underlined if it does exist.


\subsec The Source Code Listing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The "\ifirst" and "\inext" macros print the required part of source
code. They start with "\bgroup" and calls the \db printiabove
macro. Each line is printed by \db printiline "{<number>}{<text>}" 
macro. They finish by calling of \db printibelow macro and "\egroup"
command at the end. The designer can define these three macros. The
default design makes differences between DVI and PDF mode.

\ilabel [isnameprinted]  {raise8}
\ilabel [isnameprinted2] {pt \nb inputfilename}
\inext {ifx\nb pdfoutput}{\empty}{+-}

The line above with file name is printed in DVI mode by "\leaders"
primitive and \db specrule macro. The line below listing is simple.
In the PDF mode, we set "\setsmallprinting" at the start of listing
and insert a small vertical space.

The "\printline" macro sets the horizontal mode and strut is inserted
here (in DVI mode) followed by box with number of the line. The
interline penalty is 11 in the listing. In PDF mode, the solid 
yellow rectangle is printed by "\rlap". We need to print the filename
above the listing after the yellow rectangle of the first line is
printed. That is the reason why there is the test if first line of the
listing is printed by \db isnameprinted control sequence. It is
"\undefined" by default but if the filename is printed then
"\isnameprinted" is set to "\relax" (see lines~\cite[isnameprinted] 
and~\cite[isnameprinted2]). After the "\egroup" (inserted 
at the end of "\ifirst" or "\inext") the default value of "\isnameprinted"
is restored. This value is "\undefined".  


\subsec [begtt] The {\tt\nb begtt ... \nb endtt} Printing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The "\begtt" establishes a new group and calls the \db printvabove
macro. Next, each printed line is processed by 
\db printvline "{<number>}{<text>}" macro. At the end, 
the \db printvbelow macro is invoked and the group is closed.

The implicit design doesn't print the numbers of lines. We draw only
lines above and below in DVI mode. Moreover, we draw yellow lines in
PDF mode and the yellow lines left and right in each line by "\rlap" macro. 

\inext {ifx\nb pdfoutput}{\empty}{+-} 


\subsec Pictures
%%%%%%%%%%%%%%%%

The pictures are inserted in order to align their left side with the
paragraph indent. The implicit design sets the "\parindent" to
sufficient big value that the result is quite good.
The width of the picture \db figwidth is calculated as
"\hsize" minus "\parindent".

\inext {newdimen\nb figwidth}{\empty}{+-}

DVI mode: The macro \db ifig "<width ratio> <filename> " inserts
the picture from "<filename>.eps" usig the {\tt epsf.tex} macro package.
PDF mode: The macro inserts the picture from "<filename>.pdf" by
pdf\TeX{} primitive commands "\pdfximage", "\pdfrefximage", "\pdflastximage".

\inext {ifx\nb pdfoutput}{\empty}{+-}

The \db figdir includes the directory with the pictures.

\subsec Items
%%%%%%%%%%%%%

The macros for items mentioned in text are simple. The \db begitems
macro starts the items environment and the \db enditems ends it.
The \db itemno register counts the number of the current item and the
\db dbtitem "<mark> " is the global variant of \db item macro.
The "\item" macro is the same as in plain\TeX{} by default but it
changes its behavior inside "\begitems"..."\enditems" environment.

\inext {newcount\nb itemno}{def\nb enditems}{++}


\sec [implementace] For \TeX{} Wizards
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The implementation of \docbytex{} is documented here. All internal
macros of \docbytex{} are listed and commented in this section.
May be, it is not so good idea to redefine these macros unless the
reader want to do his own \docbytex.


\subsec Auxiliary Macros
%%%%%%%%%%%%%%%%%%%%%%%%

The \db dbtwarning macro prints warning on the terminal:

\inext {def\nb dbtwarning}{\empty}{+-}

The macros \db defsec "{<text>}", \db edefsec "{<text>}" and \db undef "{<text>}"
define control sequence "\csname<text>\endcsname".

\inext {def\nb defsec}{\empty}{+-}

You can use the "\undef" macro in following way:

{\def\begtthook{\langleactive\mubytein=1}
\begtt
\undef{<text>}\iftrue <sequence is undefined> \else <sequence is defined> \fi
\endtt
\par}

You have to write "\iftrue" after "\undef{<text>}". There is a
practical reason of this concept: you can use "\undef" test nested
inside another "\if...\fi" conditional.

The \db nb macro expands to normal backslash of catcode 12. You can
use it if you need to search text with this character. The active
tabulator is defined as eight spaces and auxiliary macros
\db obrace, \db cbrace, \db percent, \db inchquote are defined here.

{\catcode`\%=12 \noactive{\nb %} \noactive{[%} }

\inext {catcode}{\empty}{+-}

The \db softinput macro inputs the specified file only if this file
exists. Else the warning is printed.

\inext {def\nb softinput}{\empty}{+-}

The \db setverb macro sets the cactodes of all special characters to
normal~(12).

\inext {def\nb setverb}{\empty}{+-}


\subsec Initialization
%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} prints on the terminal:

\inext {This is DocBy}{\empty}{+-}

The \db dbtversion macro expands to the version of the \docbytex.
It is defined at the begin of the file {\tt docby.tex}. If new version
is released then this definition will be changed.

\inssdef dbtversion

%The csplain mode is detected by "\chyph" control sequence. It
%initializes the Czech hyphenation patterns.
%
%\inext {^^B\nb ifx\nb chyph\nb undefined \nb else}{\empty}{+-}

If "(pdf)csplain" is used then the UTF-8 input is activated by enc\TeX.
Unfortunately this isn't compatible with \docbytex{} which uses 
enc\TeX{} by different way. We need to deactivate the UTF-8 encoding
input. If you need to write something in different language than English
you need to use the 8bit encoding (ISO-8859-2 is usable for Czech 
when "(pdf)csplain" is used).

\inext {utf8off}{\empty}{+-}

The enc\TeX{} mode is detected and initialized:

\inext {encTeX ??}{\empty}{+-}

The \db enctextable "{<word>}{<macrobody>}" command inserts new
item into enc\TeX{} table with the key "<word>". If this key is found
by enc\TeX{} then it is removed from input stream and replaced by
the "\.<word>" macro which expands to "<macrobody>".
For example after "\dg"~"foo" the key "foo" is activated for 
enc\TeX by "\enctextable{foo}{\sword{foo}}" command. If the
"foo" is found in the input stream then it is replaced by
"\sword{foo}".  

The "\enctextable" doesn't store the key to the enc\TeX{} table if it
is included in the list of prohibited words stored in \db owordbuffer.
The words are separated by comma here. They are prohibited because of
"\onlyactive". The "\enctextable" defines only the "\.<word>" sequence
in such situation.

The \db noactive "{<text>}" macro inserts the "<text>" as a key in the
enc\TeX{} table. This key is not removed from input but the 
\db emptysec control sequence is inserted before it. Enc\TeX{} is not
able to remove the key from its table, it is only able to rewrite the
behavior of the transformation process if the key is found. If we need
to deactivate some key by "\noactive" then we rewrite its behavior.

All occurrences of documented words "<word>" is transformed to
\db sword "{<word>}" by enc\TeX{}. The hyperlink is created by this macro:

\inext {def\nb sword}{\empty}{+-}

The \db onlyactive "{<before>}{<word>}{<post>}" command inserts the
"<word>" into the list of prohibited words "\owordbuffer" (only if
this word isn't here already). Enc\TeX{} changes all occurrences of
"<before><word><post>" to "\oword{<before>}{<word>}{<post>}".
Moreover, the "<word>" is deactivated by "\noactive" (may be it was
activated when "\reffile" is read). The 
\db oword "{<before>}{<word>}{<post>}" command prints "<before>" by
normal font, then runs "\.<word>" if it is defined (else prints
"<word>" normally). Finally, it prints "<post>" by normal font.

\inext {def\nb onlyactive}{\empty}{+-}

The DVI/PDF mode is initialized here:

\inext {ifx\nb pdfoutput}{\empty}{+-}


\subsec The {\tt\nb ifirst}, {\tt\nb inext}, {\tt\nb ilabel} Macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db lineno register is the number of the line, \db ttlineno register 
is the number of the line in the "\begtt...\endtt" environment. We use
\db ifcontinue for loop controlling and \db ifskipping for setting
\db skippingfalse and \db skippingtrue.

\inext {newcount\nb lineno}{\empty}{+-}

The \db ifirst "{<filename>}{<from>}{<to>}{<why>}" command analyses
its parameter "<why>" by "\readiparamwhy" and tries to open the file
"<filename>" for reading by "\openin" primitive. If it is unsuccessful
then a warning is printed. Else the "<filename>" is stored to 
\db inputfilename macro and other parameters are analyzed by
"\scaniparam". The "<from>" resp. "<to>" parameter is stored to "\tmpa"
resp. "\tmpb" macro. The "<num>" parameter from "\count=<num>" is
stored to "\tmpA" and "\tmbB" macros. The command "\insinternal"
is invoked with expanded parameters "<from>" and "<to>". The expansion
is done via "\edef"ed macro "\act".

\insdef ifirst 

The \db inext "{<from>}{<to>}{<why>}" macro does the analogical work
as the "\ifirst". The only difference is that the "<filename>" is not
open by "\openin". We suppose that the file is opened already. We are
not sure that this is true and we check it by test of contents of the 
"\inputfilename" macro.

\insdef inext

When the parameters "<from>" and "<to>" are expanded then we want to
suppress all expansions of macros automatically inserted by
enc\TeX{}. This work is done by \db noswords macro.

\inssdef noswords

The \db readiparamwhy reads "+" or "-" characters from "<why>"
parameter and stores them to \db startline and \db stopline
control sequences.

\inssdef readiparamwhy

The \db scaniparam "<param>^^X<out><outnum>" reads "<param>" in
the form "\count=<num> <text>". It stores the "<text>" to the "<out>"
control sequence and "<num>" to the "<outnum>" control sequence.
The prefix "\count=<num>" is optional thus we need to do a little more
work to scan the parameters. This work is realized by auxiliary macros
\db scaniparamA, \db scaniparamB, \db scaniparamC. If the
prefix "\count=<num>" is missing then "<outnum>" is one.

\inssdef scaniparam

The main work (inserting of source code) is done by the macro \db
insinternal with parameters "{<from>}{<to>}".

\ilabel [prvniloop]       {preskakovani}
\ilabel [konec:prvniloop] {ifcontinue \nb repeat}
\ilabel [druhyloop]       {pretisk}
\ilabel [konec:druhyloop] {readnewline \nb repeat}
\ilabel [insinternal:end] {printibelow}
\insdef insinternal

The "\isinternal" macro has two main loops. First one (from 
line~\cite[prvniloop] to~\cite[konec:prvniloop]) reads the lines from
input source file (by the macro "\readnewline"). Each line is stored to
"\etext" macro. This loop finds the occurrence of the "<from>"
parameter and nothing is printed.

The second loop (lines from~\cite[druhyloop] to~\cite[konec:druhyloop])
reads lines from input source file and searches the occurrence of the
"<to>" parameter. The lines are printed by the "\printilineA" macro.

The preliminary work is done before first loop is started:
the catcode, fonts and "\mubytein" setting.
The \db testline macro is defined here with the "<from>" separator.
We will test the existence of "<from>" parameter by it.
More flexible definition of the "\testline" macro is used here because 
of special form of "<from>" parameter (see user documentation in 
the~\cite[vkladani]~section). The end of loop is controlled by 
the "\ifcontinue" condition. The \db nocontinue command runs
the "\continuefalse" but not always. If "\count>1", it means
"\tempnum>1", then the command only decreases the "\tempnum" by~1.

\inssdef nocontinue

The similar preliminary work is done before second loop. The
"\testline" macro is defined again with the "<to>" separator.
The searching process is similar as in the first loop.

The "\ifx+\startline" is a test if user want to print the first line.
The "\ifx+\stopline" is a test if user want to print the last line.

The "\ilabellist" macro tests the occurrence of labels declared by
the "\ilabel" command.

The macro \db returninsinternal "{<text>}{<possible fi>}{<ignore>}"
is more tricky. It is inserted when the end of the source file is
occurred. The macro leaves its loop by the "<ignore>" parameter which
is separated by the "\printibelow" text. Thus the part of the
"\insinternal" macro is skipped to the line~\cite[insinternal:end].
The inserted conditionals have to by closed properly: the "\fi"s are
inserted here from the second parameter. The first parameter "<text>"
includes the warning text if the warning have to be printed to the log
file. If the "<text>" parameter is empty, no warning is printed.

\insdef returninsinternal

The \db readnewline is simple:

\inssdef readnewline

We are working with the line of source file in two versions: noexpanded
line in the "\text" macro and expanded line in the "\etext" macro.
The "\noswords" macro before expanding of the line guarantees that the
"\etext" does not include control sequences created by enc\TeX
(we need not these sequences when we are testing the occurrence of
"<from>" or "<to>" parameter). The noexpanded "\text" version of the 
line (including the enc\TeX{}s sequences) is used when the line is 
printed.

The more intelligence is implemented in the \db printilineA macro:
the empty lines are printed with delay if the nonempty line follows.
We need it because the last empty line have to be unprinted if
"\skippingtrue". The \db lastline macro has three states: "\empty" (at
the begin), "\relax" (after the line is printed), "<line number>" (if
the previous line is empty).

\insdef printilineA

The \db ilabellist macro stores all declarations from 
\db ilabel "[<label>]{<text>}" commands. The empty value of
"\ilabellist" have to be set as default.

\insdef ilabellist

The "\ilabel" macro first expands its parameters (by the "\act" macro)
and calls the internal \db ilabelee macro. This macro adds the
following text to the "\ilabellist":

\def\begtthook{\langleactive\mubytein=1}
\begtt
\expandafter\testilabel\etext\end{<label>}{<text>}
\endtt

The \db testilabel "<line>\end{<label>}{<text>}" command
defines the temporary "\tmp" macro with the "<text>" separator in
order to test if the "<text>" is included in "<line>". If it is true
then the aim of the reference is registered by the "\labeltext" command.

\inext {testilabel}{\empty}{+-}
 
\def\begtthook{}

\subsec Commands {\tt\nb begtt}, {\tt\nb endtt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db begtt and "\endtt" macros are described in ``\TeX{}book 
inside out'' (the book in Czech language) in pages~27--30.
The \db startverb macro reads the following text separated by
the word "\endtt". This text is divided into lines by
"^^M" character of catcode 12. The loop is started by
the \db runttloop macro and the text is separated into lines.
Each line is processed by the "\printvline" macro.
The \db endttloop is performed at the end of the loop. The final work
is done here (the "\printvbelow" macro and the end of the group) and
the next token is scanned by \db scannexttoken macro. If this token
isn't "\par" then the following text is prefixed by "\noindent".
It means that "\begtt"..."\endtt" is ``inside'' the paragraph.

\ifirst {docby.tex}{def\nb begtt }{\empty}{+-}

The number of line globally incremented in "\begtt"..."\endtt" 
is stored in "\ttlineno" register. You can set this
register to zero at each begin of section (for example).

\subsec [ns] The Namespaces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Each name space is connected to its own \db namespacemacro. This is a
macro with one parameter which is declared by "\namespace{<macro body>}".
The "\namespacemacro" is empty by default.

\ifirst {docby.tex}{def\nb namespacemacro}{\empty}{+-}

We need to set a label to each name space. The label is the text
expanded by "\namespacemacro{@!}" and the mark "<nslabel>" is used for
such label in this documentation. There is a little risk that the
"<nslabel>" is ambiguous but I hope that this situation will not occur.

Each name space have to know all local words declared in it in order
to the occurrence of this local word can be referenced to the "\dl"
declaration; the "\dl" declaration can be used after first occurrence
of such word. The enc\TeX{} tables have to be initialised with all 
local words at the start of the name space. The original state of
these tables have to be restored at the end of the name space. We
cannot wait to the "\dl" command but we need to use the "\reffile"
file. It means that the name spaces are inactive in the first \TeX{}'s
run.

The macro "\ns:<nslabel>" includes the list of all locally declared
words in the namespace "<nslabel>" after the "\reffile" file is
read. The list has the following format:

{\def\begtthook{\mubytein=1\langleactive}
\begtt
\locword{<word1>}\locword{<word2>}\locword{<word3>}...
\endtt
\par}

Because the enc\TeX{} table setting is global, we define all namespace
macros globally too. This is the reason why
"\namespace...\endnamespace" is independent of groups in \TeX.

The "\namespacemacro" is defined at the start of the \db namespace
command. The original value of the "\namespacemacro" is stored to
the "\no:<nslabel>" macro in order we are able to restore this value
at the end of the "\namespace...\endnamespace" environment.
Next we define the macro \db locword so that the enc\TeX{} table is
set after invoking of the "\ns:<nslabel>". The "\locword" macro stores
the original meanings of redefined control sequences first.

\inext {def\nb namespace }{^^B\cbrace}{++}

The \db endnamespace command redefines the "\locword" macro so that
the original meaning of redefined sequences are restored.
If the original meaning is ``undefined'' we need to store the "\nword"
to the enc\TeX{} table in order to there is no possibility to clear 
the item from enc\TeX{} table definitely.
The original value of the "\namespacemacro" is restored by the 
"\no:<nslabel>" macro.

\inext {def\nb endnamespace}{^^B\cbrace}{++}

These macros used the \db ewrite sequence which writes the text to the
"\reffile" with delay (in output routine) but the expansion is done
immediately. But the "\nb" control sequence is not expanded.

\inext {def\nb ewrite}{\empty}{+-}

Enc\TeX{} stores the control sequence "\.<word>" instead local
"<word>" at the start of each name space. The "\.<word>" macro expands
to "\lword{<word>}". If the local word occurs the \db lword works as
follows: 

\inext {def\nb lword}{\empty}{+-}

The \db genlongword "<tmp>{<word>}" command creates long version of
the "<word>" from short variant of it and stores this log version to
"<tmp>" macro. The occurrence of the "<word>" is presented by the
parameter of the "\ilink" command and by the long name (unambiguous)
written to the "\reffile". The short variant of the word is printed.

The reading of the "\reffile" is controlled by \db refns "{<nslabel>}"
macro. This control sequence is stored to the file at the begin of the
name space. The second control sequence \db refnsend "{<nslabel>}"
is stored at the end. The items of the type
"\refdg{<text>}{<long-word>}{<brackets>}{<short-word>}"
are stored between these control sequences. We read only the items
with the nonempty "<short-word>" parameter. These items are stored by
"\dl" command.

\inext {def\nb refns}{\empty}{+-}

The "\refns" macro remembers the previous "<nslabel>" which is stored
in \db currns. This value is stored to the "\o:<new nslabel>" and the
"\currns" is redefined as "<new nslabel>". The implicit value of the
"\ns:<nslabel>" is empty. The "\refdg" commands add information to the
"\ns:<nslabel>" buffer (see lines~\cite[ns1]--\cite[ns2] in 
section~\cite[reference]). Finally, the "\refnsend" command returns
the "\currns" macro to the original value before name space was started. 


\subsec The {\tt\nb dg} Command and Friends
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The macros \db dg, \db dl, \db dgn, \db dgh, \db dln, \db dlh
save its name to a "\tmpA" and then they scan parameters by
a \db dgpar. Finally they run the internal version for itself
"\csname ii\tmpA\endcsname".

\inext {def\nb dg}{\count=2 \empty}{+-}

The previous macros prepare the reading of optional parameter. The
main work is done by the \db dparam macro.

\ilabel [managebrackets] {managebrackets}
\ilabel [ii] {csname ii}
\inext {def\nb dparam}{\empty}{+-}


If there is a space after closed bracket "]" then the "#2" parameter
is empty (it is separated by space). The "\dparam" macro runs again in
such case (by \db nextdparam macro which scans the rest of parameters
of the "\dparam"). The space is inserted inside the braces before the
"\dparam" is run again. Now, we can separate the "#2" parameter (it
means the "<word>") to the part before the first comma or period or
colon or semicolon and to the second part with the rest. The first
part is stored to "\tmpa" and the second part (including the separator)
is stored to "\tmpb". This work is done by the macro \db varparam:

\inext {def\nb varparam}{\empty}{+-}

The macro "\varparam<separ>" defines the temporary macro
"\tmp#1<separ>#2 " which is run by "\tmp<word><separ> ". If the 
"#2" is empty then the explicitly written "<separ>" was used as 
separator and the "<word>" does not include the "<separ>". The "\tmpa"
still includes the "<word>" in such case. On the other hand, if the
"<word>" includes "<separ>" then we need to store the rest after the
"<separ>" to "\tmpb" including such "<separ>".  The "#2" parameter includes
"<rest><separ>". The desired work is done by the \db gobblelast macro
with the parameter "<contents of tmpb>\end<separ><rest><separ>". The
"#1" includes the "<rest>" and the new "\tmpb" is filled up by
"<separ><rest><old contents of tmpb>".


At the end of this work, we have the "<word>" in "\tmpa" but it can be
followed by "()". This problem is solved by \db managebrackets macro
which separates these braces if they exist. The braces are stored to 
\db printbrackets in such case.

\inext {def\nb managebrackets}{\empty}{+-}

The \db maybespace macro prints the space after the contents of
"\tmpb" only if the name of the macro used by the user has only two
letters ("\dg", "\dl") and the character "`" follows.

\inext {def\nb maybespace}{\empty}{+-}

The "\dparam" macro changes the original command "\dg*", "\dl*"
respectively to internal variant "\iidg*", "\iidl*"
respectively. This is done on the line~\cite[ii]. Parameters are
expanded before the internal macro is started. Now, we'll concentrate to
the internal macros.

The \db iidg macro inserts the "\sword" to the enc\TeX{} table
(this is redundant because the same work is done when "\reffile" is
read by "\refdg" macro). Next, the "\iidg" macro creates the aim of the
reference in the form "@<word>" and saves
"\refdg{<text>}{<word>}{<brackets>}{}" to the "\reffile".
The highlighted "<word>" is printed by the "\printdg" command and the
footnote is inserted by the "\printfnote" command.

\inext {def\nb iidg }{^^B\cbrace}{++}

The \db iidl 
creates the aim of the reference by "\label [@<long-word>]",
writes the information to the "\reffile" in the format
"\refdg{<text>}{<long-word>}{<brackets>}{<short-word>}" and
prints the "<short-word>" highlighted by "\printdg" command.
It stores nothing to the enc\TeX{} table.
Finally, it inserts the footnote by "\printfnote{<text>}{<long-word>}{<braces>}".

\inext {def\nb iidl }{^^B\cbrace}{++}

The \db iidgh a \db iidlh macros do the same work as the non-"h"
variants. The only difference is that they do not print the word.
The "\printdg" is redefined locally in order to do nothing.

\inext {def\nb iidgh}{\empty}{+-}

The \db iidgn command redefines the "\.<word>" macro which is inserted to
the text by enc\TeX. The result of the expansion will be
"\fword{<text>}{<word>}{<braces>}" instead of the common result
"\sword{<word>}".

\inext {def\nb iidgn}{\empty}{+-}

The tasks of the \db fword macro are: do "\iidgh", print the "<word>"
in red and return the "\.<word>" macro to the normal state.

\inext {def\nb fword}{\empty}{+-}

The \db iidln macro stores the current meaning of the "\.<word>" to
the new control sequence "\;<word>" and redefines the "\.<word>". The
result of the expansion is "\flword{<text>}{<word>}{<braces>}".

\inext {def\nb iidln}{\empty}{+-}


The tasks of the \db flword macro are: do "\iidlh", print "<word>" in
red, return the original meaning of the "\.<word>" (from the 
"\;<word>" storage). If the "\;<word>" is undefined we need to
inactivate the "\.<word>" macro by "\nword{<word>}" because there is
no possibility to remove the item from enc\TeX{} table.

\inext {def\nb flword}{\empty}{+-}


\subsec [specfootnote] The Special Footnotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The footnotes are placed beside each other. There are only words
which are declared on this page by "\dg". Because this concept is
visual incompatible with the ``normal'' footnotes, we deny them:

\inext {let\nb footnote=}{\empty}{+-}

Our special footnotes use the ``insert'' "\footins" declared in
plain\TeX{}. The problem is to estimate the vertical space of one
footnote when these footnotes are beside each other. The dirty trick
from the \TeX{}book (to insert the inserts by percent of the width) is
not used here because the pagebreaks didn't converge in the sequence
of \TeX{} runs. The second run gets the pagenumber lists in the
footnotes but they are not definite because of new pagebreaks. The new
pagebreaks influence new lists of pagenumbers in footnotes and the new
lists influences the new pagebreaks because the widths of
the footnotes are different from previous \TeX{} run. The oscillation
is very common in such case. 

I decided to work only with the average space of the footnotes common
for each of them. This coefficient is the number of the lines of the
footnotes divided by the number of the footnotes. Each footnote
inserts to the vertical list the space of the line hight (10pt)
multiplied by this coefficient. I need to set the "\count\footins"
only. 

In order to guarantee the convergence of this problem, we need to fix
the coefficient (mentioned above) after second \TeX{} run. If this
coefficient is changed in each \TeX{} run then the unconvergence is
very possible. The value of this coefficient after first \TeX{} run is
unusable because the lists of pagenumbers in footnotes are empty at
this state. The implicit coefficient is set to "\count\footins=200"
for first and second \TeX{} run (we suppose five footnotes on the one
line). 

The average coefficient (instead of the width of each footnote) can
produce a little overfull or underfull pages. We need to have the
resource for this situation in "\skip\footins" and we need to
use the vertical glue above and below the footnote rule.

\inext {skip\nb footins}{\empty}{+-}

The \db totalfoocount accumulates the number of the footnotes and the 
\db totalfoodim accumulates the total height of all lines with footnotes.

\inext {newcount\nb totalfoocount}{\empty}{+-}

The \db specfootnote "{<text>}" macro inserts  to the "\footins" one
"\hbox{<text>}" and advances "\totalfoocount" by one.

\inext {def\nb specfootnote}{\empty}{+-} 

I decided to keep the output routine of plain\TeX{} unchanged. It
means that the part of this routine which solves the
footnote printing was needed to change. The "\footnoterule" macro of
plain\TeX{} was redefined. The "\unvbox\footins" separator removes the
same text from the original output routine.

\inext {def\nb footnoterule}{\empty}{+-}

This macro decomposes the vertical list of inserts "\footins" and 
composes them again beside each other in horizontal box~4. The
raggedright parameters are set and the box 4 is unboxed in horizontal
mode ended by "\endgraf". This means that the footnotes are divided to
lines. The "\totalfoodim" is advanced here too.

The "\bye" macro (see the line~\cite[write]) writes the 
"\totalfoocount" and "\totalfoodim" to the "\reffile". The actual
average coefficient is added here too. This information is written
only if the "\indexbuffer" is not empty, it means that (at least) 
the second \TeX{} run is in progress.

This information is read by the 
\db refcoef "{<coef>}{<number>}{<height>}" macro
at the start of the next \TeX{} run. It sets the
average coefficient "\count\footins". The change from implicit value
200 to the new value is done only once. Next \TeX{} runs keep this
value unchanged. The auxiliary macro \db gobblerest removes the digits
after decimal point including the text~"pt".

\inext {def\nb refcoef}{\empty}{+-}

We need to suppress the expansion of some macros in output routine
which are presented in "\write" parameter. These macros are set to
"\relax" meaning in output routine. In order to the headline printing
is done correctly we need to expand "\makehedaline" before the setting
of these macros to relax and we need to store the result of
"\makeheadline" in a box.

\inext {\nb output=}{\empty}{+-}


\subsec [secsec] Section, Subsection, Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The \db secnum, \db subsecnum, \db sectitle and \db ifsavetoc
are declared here. "\savetoc" is true by default.

\ifirst {docby.tex}{newcount\nb secnum}{\empty}{+-}

There is an optional parameter "[<label>]" followed by optional (ignored) space 
when \db sec and \db subsec macros are used. The last token of "<title>" can be 
space too and we need to ignore it. This is reason what the macros are somewhat 
complicated. The name of the macro is stored to \db tmpA and the parameter 
scanning process is started by "\secparam".

\inext {def\nb sec}{\empty}{+-}

The \db secparam reads the optional "[<label>]". If it exists then it 
is stored to \db seclabel macro else "\seclabel" is empty. 
The \db secparamA macro ignores optional space after the "]".
The \db secparamB "<title>\par" macro reads "<title>". The unwanted 
space at the end of the "<title>" is removed by \db nolastspace macro which 
cooperates with the \db setparamC macro. This macro stores the "<title>" 
(without the last space) into "\sectitle" and executes "\iisec" or "\iisubsec".

\inext {def\nb secparam}{\empty}{+-}

The \db iisec macro sets the "\secnum" and "\subsecnum" values and defines
\db makelinks where the hyperlinks are prepared (used by "\printsec").
The "\printsec" macro prints the title of the section.
The information of the type 
"\reftocline"~"{<secnum>}{<title>}{<pagenumber>}"
is stored to "\reffile".
The command "\mark{<secnum> <title>}" is executed and the vertical space
is appended by "\printsecbelow".

\inext {def\nb iisec}{^^B\cbrace}{++}

The \db iisubsec macro is similar as "\iisec".

\inext {def\nb iisubsec}{^^B\cbrace}{++}

The "\part" macro uses the conversion of the \db partnum register to letters.
It is implemented as \db thepart macro.

\inext {newcount\nb partnum}{\empty}{+-}

The \db part macro is implemented by \db iipart and it is similar to "\iisec".

\inext {def\nb part}{\empty}{+-}

\subsec [reference] Links and References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The hyperlinks are solved by \db savelink "[<label>]" and 
\db iilink "[<label>]{<text>}" macros. The "\savelink" stores the 
invisible destination into document raised to the height of
\db linkskip above baselineskip. The "\ilink" (i.e.\ internal link)
is documented in the \cite[krizodkaz] section. The "\savepglink"
saves the numerical destination (page number) which will be used by 
"\pglink" if a page is referred. 

\ifirst {docby.tex}{Odkazy, ref}{\empty}{--}

These macros have special implementation for DVI and PDF modes.
The blue color for links are declared in the "\ilink" macro.
You can change this feature by changing of this macro.

The internal labels for PDF links cannot include backslashes. 
That is the reason why the "\nb" (normal backslash) macro is redefined here.
We expect the unexpanded parameter of "\savelink" and "\ilink" macros. 

The \db savepglink macro (see above) is used by "\headline", this places 
the destination at every page. The \db pglink "<number>" macro reads the 
"<number>" (it is numerical register or number itself) and creates the link
to the page "<number>". The "<number>" is printed in blue color and it is 
clickable. The numerical register is scanned by "\afterassignment" followed by
\db dopglink.

The line "\reflabel"~"{<label>}{<text>}{<page>}"
is stored to "\jobname.ref" file by "\labeltext" macro.
This information is read by \db reflabel macro and stored in
"^^X<label>" and "^^Y<label>" control sequences. These sequences are used by
\db numref a \db pgref.
Note that if the "<text>" is empty (this is a case of documented words for example)
then the control sequence "^^X<label>" is not defined. This saves the 
\TeX{} memory for names of control sequences.

\inext {reflabel}{\empty}{+-}

The \db labeltext "[<label>]{<text>}" stores the desired information
as pronounced above. First, it creates PDF link by "\savelink" macro
and second, it stores data to ".ref" file. The 
\db writelabel "[<label>]{<text>}" us used for this purpose which expands to 
the asynchronous "\write" primitive (in order to save right value of the page number).
We need to expand the "<text>" parameter because "\the\secnum" (or similar data) 
is here. This is a reason why the parameters are switched (the
"<label>" parameter cannot be expanded) and the auxiliary macro
\db writelabelinternal "{<text>}{<label>}" is used. The first part, 
i.e.\ "\writelabel{<text>}" is expanded by "\edef".

\inext {labeltext}{\empty}{+-}

The \db label is defined simply as ``empty'' "\labeltext".

\inext {label}{\empty}{+-}

The \db cite "[<label>]" macro prints the hyperlink. The warning on the 
terminal is printed when "<label>" is misspelled. The macro is 
documented in \cite[krizodkaz] section.

\inext {cite}{\empty}{+-}

The links are solved in \db api "{<word>}" too.
This macro uses "\label[+<word>]" and saves the "<word>" prefixed by
"\refapiword" to "\reffile".

\inext {def\nb api}{\empty}{+-}

The \db apitext is printed alongside the "<word>" in the table of contents and 
the index.

When the \db bye is executed, the information for "\refcoef" (line~\cite[write])
is stored in "\reffile" and the test of "\reffile" data consistence is processed.

\ilabel [texttoc] {text\nb tocbuffer}
\ilabel [vypust] {indexbuffer}
\ilabel [write] {write\nb reffile}
\inext {def\nb bye}{^^B\cbrace}{++}

The test of "\reffile" data consistence is done by following steps.
First the "\reffile" is closed, then the control sequences used in "\reffile" 
are redefined by "\setrefchecking" macro, then the "\reffile" is read again.
Now the macros from "\reffile" do the test itself. If inconsistency occurs then
the "\continuefalse" is executed. We can ask to the result of the test by
"\ifcontinue" conditional. The elaborate check of all automatically generated 
hyperlinks is done after the "\reffile" is read. This check is realised by
"\indexbuffer". Why? See the \db setrefchecking.

\ilabel[jerelax] {=\nb relax}
\inext {def\nb setrefchecking}{\empty}{+-}

The "\refcoef" macro is redefined here: it does nothing.
Next, the new version of the "\reflabel" checks if the reference is in the same 
page as in the last run and if it has the same text.
The new macro "\refuseword" works as its original, only the "-<word>"
control sequences are used instead "w:<word>". These control sequence are
used foe another purpose than during normal processing. First, these sequences
take the "\relax" meaning at line~\cite[jerelax].
Second, the "\," is redefined in order to do the test of equivalence of the
"w:<word>" and "-<word>" sequences. The test is executed by 
"\indexbuffer\relax" at line~\cite[vypust]. If an inconsistency occurs then
the message is printed and macro processing is skipped to \db ignoretorelax.
next, the "\refdg"macro is redefined: it writes data only to "\tocbuffer". 
The other macros from "\reffile" write data to "\tocbuffer" too.
The old contents of "\tocbuffer" is stored to the "\text" and the new one is 
created during "\reffile" reading. We check if the table of contents is changed 
at line~\cite[texttoc].


\subsec Generating of Table of Contents, Index and PDF Outlines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The table of contents (TOC) and index can be printed at various places in the document
(at the begin, end, in the middle\dots). We need to print them correctly
independent of their position. The "\reffile" can be read only at begin of 
the document. After that, it is cleared and reopen to write new information. 
So, we need to store all desired information for TOC or index printing 
during reading of the "\reffile". We are using the "\tocbuffer" and "\indexbuffer"
macros for this. First, these ``buffers'' must be set as empty.
The \db addtext "<text>\to<buffer>" is used for adding new "<text>" to the 
"<buffer>".

\inext {def\nb tocbuffer}{\empty}{+-}

The following commands are used in the \db reffile.

{\def\begtthook{\langleactive\catcode`\!=0\mubytein=1}
\begtt
\reftocline{<number>}{<title>}{<page>}  % about section, subsection for TOC
\refdg{<before>}{<word>}{<after>}{<k-word>}  % about usage of \dg, \dl
\refapiword{<word>}                   % about usage of \api{<word>}
\refuseword{<word>}{<page>}          % about the existence of <word>
\reflabel{<label>}{<text>}{<page>}     % see section !cite[reference], links, references
\refcoef{<coefficient>}{<number>}{<height>}  % see section !cite[specfootnote], spec. notes
\refns{<nslabel>}                     % see section !cite[ns], name spaces
\refnsend{<nslabel>}                  % see section !cite[ns], name spaces
\endtt
\par}

The \db reftocline "{<number>}{<title>}{<pagenumber>}" macro is used for TOC.

\inext {def\nb reftocline}{\empty}{+-}

The information about all sections and subsections are stored in \db tocbuffer gradually.
This buffer includes control sequences \db dotocline "{<number>}{<title>}{<page>}".
The only difference between section and subsection is stored in the "<number>" parameter:
subsection has the "<number>" with a period. This difference is recognised by
the \db istocsec macro.

\inext {def\nb dotocline}{\empty}{+-}

The "\tocbuffer" includes TOC information about sections and subsections. 
Moreover, it includes the data about documented words stored by 
\db refdg a \db refapiword.

\ilabel [right] {right}
\ilabel [ns1] {\nb dl}
\ilabel [ns2] {locword}
\inext {def\nb refdg}{\empty}{+-}

The "\refdg" macro has "{<before>}{<word>}{<after>}{<k-word>}" parameters where
"<before>" is a text before word, "<word>" is a long variant of the word and "<after>"
can include optional braces "()". If the long word differ from short word (when "\dl" is used)
then "<k-word>" includes the short variant of the word else "<k-word>" is empty.
The "\refdg" macro stores its information to "\tocbuffer" and "\indexbuffer" in parallel.
If "<k-word>" is empty then "\sword" is stored to enc\TeX{} table.
If "<k-word>" is nonempty then namespaces are taken into account.
The TOC is created by the \db dotoc macro.

\inext {def\nb dotoc}{\empty}{+-}

The {\bf Index} is created by \db indexbuffer which includes the list of 
all declared words in the document. Each word is sored in the form of
control sequence (this takes minimum \TeX{} memory) and they are separated 
by comma (before sorting) or "\," (after sorting):

{\def\begtthook{\langleactive \sfcode`\:=1000 }
\begtt
before sorting:  \-<word1> , \-<word2> , \-<word3> , \-<word4> , ...
after sorting:   \, \-<wordA> \, \-<wordB> \, \-<wordC> \, \-<wordD> ...
\endtt
\par}

\noindent The "\-<word>" means one control sequence here.
Each control sequence is a macro with the body "<before>\right<after>",
see the \cite[right] line. The index is printed by the \db doindex macro.

\ilabel [calculatedimone] {calculatedimone}
\inext {def\nb doindex }{^^B\cbrace}{++}

The "\calculatedimone" command and the test of "\dimen1" value prepares the 
two columns typesetting, see the section~\cite[dvasloupce].
The "\doindex" begins the "\sec" with the "\titindex" title.
The index printing is started when "\indexbuffer" is nonempty.
The "\indexbuffer" is sorted by "\sortindex" (see section~\cite[abeceda]).
Then the two columns printing is opened by "\begmulti 2" and the "\," 
separator takes the meaning "\doindexentry". 
This macro prints each index entry when "\indexbuffer" expands.

\inext {def\nb doindexentry}{\empty}{+-}

The "\doindexentry" macro removes the "\-" characters from the control
sequence "\-<word>" by the \db ignoretwo, so the "\tmp" includes "<word>" only.
If the "<word>" begins by backslash, it is replaced by "\nb" using 
\db remakebackslash macro. The reason: we needn't the backslash in the
PDF internal labels, see \cite[reference] for more information.
The index entry is finally printed by the "\printindexentry" macro.

When the {\bf PDF outlines} are created, we need to know the number 
of children of each node in the outlines tree. This number is calculated
when "\reffile" is read by \db addbookmark "<node>" macro
(see "\reftocline" and "\refdg" macros). The parameter "<node>"
can be the number of section or the "<section>.<subsection>" pair.
The "<node>" for which we are calculating children is saved in 
\db currb macro. The \db currsecb includes the parent of the "\currb", 
if it exists. The "\bk:<node>" is advanced by one using the 
"\addbookmark" macro.

\inext {def\nb addbookmark}{\empty}{+-}

The \db bookmarks macro opens the group, redefines the "\dotocline"
and "\ptocentry" (i.e.\ macros from "\tocbuffer"), inserts the first
PDF outline with the name of the document and executes the "\tocbuffer".

\inext {def\nb bookmarks}{^^B\cbrace}{++}

The \db setoutline "[<label>]{<text>}{<prefix>}" creates the PDF outline
"<prefix><text>" and the link with "<label>" is activated.
The "\tempnum" register includes the number of children of this PDF outline.

\inext {def\nb setoutline}{\empty}{+-}

The special ``conversion'' macro \db cnvbookmark is used here.
It is nonactive by default. User can set (for example)
"\let\cnvbookmark=\lowercase" for \v c $\to$ c, \v z $\to$ z etc.\
conversions. The "\lccode" setting can be done by "\bookmarkshook".

The text is converted by \db nobraces macro for removing "{}". The macro
\db nobrA is used here too. When we have (for example)
"{\tt text} in \TeX{}" then the "text in TeX" is the result of 
such conversion.


\subsec [abeceda] Sorting by Alphabetical Order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This work is done by "\sortindex" macro. First version implemented 
the bubble sort algorithm but it was slow for large indexes. For example 
sorting of the index of this document has taken circa 2 seconds of computer time.
My son Mirek rewrote the sorting by mergesort algorithm in the second version 
of docByTeX. The previous 52 thousand sorting queries (for an index of the size 
comparable with the index used here) was reduced to 1600 queries, so 
30 times better.

First, we declare the \db ifAleB which 
answers true if $A<B$ (see also "\isAleB" macro below). 
The auxiliary macros \db nullbuf, \db return and \db fif 
are used here. The "\return" macro is used for escaping from various loops
to the "\relax" mark.
The "\fi" are balanced by the "\fif" macro in nested "\if...\fi" 
constructions. This save the number of "\expandafter" commands.

\inext {newif\nb ifAleB}{\empty}{+-}

The \db sortindex macro puts to the input queue the content of the 
whole "\indexbuffer" followed by "\end,\end", the new "\indexbuffer" 
is set as empty and the "\mergesort" macro is executed.

\inext {def\nb sortindex}{^^B\cbrace}{++}

The \db mergesort takes two groups of items repeatedly, each group is sorted 
already. The groups are separated by commas in the input queue. These two groups 
are merged to one sorted group. This process is repeated until "\end" occurs.
One merging of two groups looks like that: suppose for example two
groups "eimn,bdkz," which is merged to one group "bdeikmnz,".
Letters in that example are the whole sorted entries.

At the begin of the process, all groups have only one item. After first pass 
over input queue, the result is the groups with two items. They are saved
back in the "\indexbuffer". Next pass puts the "\indexbuffer" to the input 
queue and creates groups with four items. Next, there are 8~items per group etc.
This process is repeated until only  one sorted group is created 
(line~\cite[konecsortu]) and only "\end" is in the second group.
The "\gobblerest" macro removes the second "\end" from input queue.

\noactive{dvojice}
\ilabel [merge:porovnani] {isAleB}
\ilabel [merge:trojka] {mergesort p1+}
\ilabel [merge:p1] {ifx,}
\ilabel [merge:p2] {fif\nb mergesort\cbrace}
\ilabel [konecsortu] {empty\nb indexbuffer}
\ilabel [napercarky] {napercarky}
\inext {def\nb mergesort }{^^B\cbrace}{++}

{\def\quotehook{\catcode`\<12}
The core of the "\mergesort" is on the 
lines~\cite[merge:porovnani]--\cite[merge:trojka].
The "\mergesort" macro saves first item of the first group to the "#1" parameter,
next items of the first group to the "#2" parameter and the first item of the
second group to the "#3" parameter. If "#1<#3" then we save "#1" to the output 
"\indexbuffer", the "#1" is removed from input queue and "\mergesort" 
is executed again. The cases with empty parameters are solved in the lines
\cite[merge:p1]--\cite[merge:p2]: we need to save the rest of the nonempty group
to the output "\indexbuffer" and go to the next pair of groups.
If the terminal string "\end,\end" is scanned then the next run
of "\mergesort" is executed after "\indexbuffer" is put to the input queue and set 
it to empty value.  
\par}

The sorting of the two items are realized by \db isAleB "<itemA><itemB>"
macro. The items are in the form "\-<wordA>" and "\-<wordB>".
The macro converts these parameters to the strings by "\string" primitive
and expands to "\testAleB"~"<wordA>\relax<wordB>\relax".
The "\lowercase" primitive is executed here because we needn't distinguish
between uppercase/lowercase letters. 

\ilabel [teckanula] {0\nb relax}
%\ilabel [teckajedna] {2.1}
\inext {def\nb isAleB }{^^B\cbrace}{++}

The \db testAleB "<wordA>\relax<wordB>\relax" macro tests if
"<wordA>" precedes "<wordB>". It he first letters are the same, the macro 
is called recursively. The recursion will be truly finished because
different tails are appended to the compared words at line~\cite[teckanula].

\inext {def\nb testAleB}{^^B\cbrace}{++}

The macro \db napercarky inserts "\," separators between items in the sorted
"\indexbuffer".

\inext {def\nb napercarky}{\empty}{+-}


\subsec Merging of the List of the Page Numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Each occurrence of the "<word>" is stored to the "\reffile" as
\db refuseword "{<word>}{<page>}". This macro is processed at 
the begin of the document when "\reffile" is read.

\inext {def\nb refuseword}{^^B\cbrace}{++}

So, the list of the pages where the "<word>" occurs is stored in 
the "\w:<word>" macro. Pages are separated by commas.
The list looks like:

\begtt
2,5,5,10,11,12,12,13,13,13,27
\endtt

We need to convert this list to the format "2, 5, 10--13, 27",
i.e.\ we need to remove double occurrences and to replace 
consecutive lists of pages by intervals in the form "<from>--<to>".
This work is done by \db listofpages "{<word>}" macro which 
puts the list of pages to the input queue terminated by ",0,"
and executes the "\transf" macro.

\inext {def\nb listofpages}{^^B\cbrace}{++}

The "\transf" macro removes the page numbers which are equal to 
\db dgnum or \db apinum. We want to avoid the double occurrence of the main page
and underlined page in the list. These pages are printed separately.
The declaration of the registers follows:

\inext {newcount\nb apinum}{\empty}{+-}

The "\tempnum" is current page number processed in the list and 
"\ifdash" returns true if the interval is opened by "<from>--".
The "\iffirst" returns true if the first page of the list is processed.

The \db transf "<list of pages>,0," executes repeatedly the \db cykltransf macro.

\inext {def\nb transf}{def\nb carka}{++}

The "\cykltransf" macro is a little finite state automaton.
It needs no more comments.


\subsec [dvasloupce] Multicolumn typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The macros for multicolumn printing are borrowed from 
``\TeX{}book inside out'', pages 244--246.

\ilabel [dimen1] {dimen1<2}
\inext {newdimen\nb colsep}{TBN}{++}

One problem is solved in addition. We check the empty space on the 
current page before the section title is printed. This work is done
by \db calculatedimone 
(executed by "\doindex" macro at the line \cite[calculatedimone]).

\inext {def\nb calculatedimone}{\empty}{+-}

\subsec The final settings, catcodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The catcodes are set at the end of the {\tt docby.tex} file.
We add the active category for the {\tt\char`\"} character and we set 
the "_" as a normal character because this character is mostly used in the
identifiers and the catcode 8 of this character causes many problems.

\inext {catcode`\nb_}{\empty}{+-}

The "\everymath" and "\everydisplay" returns the category of "_" to 
the plain\TeX{} meaning (as math index prefix).

The active {\tt\char`\"} character separates the ``inline verbatim'' environment.

\inext {catcode`\nb}{\empty}{+-}

The \db langleactive sets the active catcode for the {\tt<} char. 
So, you can write {\tt<text>} in ``inline verbatim'' and the 
"<text>" is printed.

\inext {def\nb langleactive}{\empty}{+-}

\doindex

\bye


