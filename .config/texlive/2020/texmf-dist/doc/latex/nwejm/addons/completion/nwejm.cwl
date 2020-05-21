# mode: nwejm.cls
# denisbitouze, 23.12.2015
#
#include:class-book
#include:latex-document
#include:latex-mathsymbols
#include:tex
#include:xparse
#include:l3keys2e
#include:nag
#include:graphicx
#include:adjustbox
#include:tcolorbox
#include:csquotes
#include:array
#include:booktabs
#include:mathtools
#include:ntheorem
#include:rsfso
#include:esvect
#include:kpfonts
#include:translations
#include:babel
#include:varioref
#include:subcaption
#include:tocvsec2
#include:etoc
#include:microtype
#include:datetime2
#include:enumitem
#include:biblatex
#include:hyperref
#include:hypcap
#include:bookmark
#include:glossaries
#include:cleveref
#
# Document class
#keyvals:\documentclass/nwejmart
french
english
ngerman
dutch
#endkeyvals
#
# Cover and title pages
#
# Title, etc.
\title{title}#n
\title[short title]{title}#n
\subtitle{%<subtitle%>}#n*
\subtitle[%<short subtitle%>]{%<subtitle%>}#n*
#
# Author
\author{%<Last name%>, %<First name%>}#n
\author[affiliation={%<affiliation%>}]{%<Last name%>, %<First name%>}#n
\author[affiliation=[%<affiliation's tag%>]{%<affiliation%>}]{%<Last name%>, %<First name%>}#n
\author[affiliationtagged={%<affiliation's tag%>}]{%<Last name%>, %<First name%>}#n
#
# Dates
\dates{received=%<yyyy%>-%<mm%>-%<dd%>,accepted=%<yyyy%>-%<mm%>-%<dd%>,online=%<yyyy%>-%<mm%>-%<dd%>}#n
#
# Math commands
\N#m
\Z#m
\D#m
\Q#m
\R#m
\C#m
\K#m
\arccosh#m
\arcsin#m
\arcsinh#m
\arctan#m
\arctanh#m
\Argch#m
\Argsh#m
\Argth#m
\ch#m
\cotan#m
\curl#m
\dif#m
\Div#m
\grad#m
\E#m
\I#m
\rot#m
\sh#m
\supp#m
\th#m
\norm#m
\lnorm#m
\llnorm#m
\lpnorm#m
\supnorm#m
\abs#m
\prt#m
\brk#m
\brc#m
\leqgeq#m
\lrangle#m
\set{%<set self-contained definition%>}#m
\set{%<set definition%>}[%<such that...%>]#m
\begin{axiom}
\begin{assertions}
\begin{conjecture}
\begin{corollary}
\begin{definition}
\begin{example}
\begin{hypotheses}
\begin{proposition}
\begin{lemma}
\begin{notation}
\begin{proof}
\begin{remark}
\begin{theorem}
#
\begin{axiom*}
\begin{assertions*}
\begin{conjecture*}
\begin{corollary*}
\begin{definition*}
\begin{example*}
\begin{hypotheses*}
\begin{proposition*}
\begin{lemma*}
\begin{notation*}
\begin{proof*}
\begin{remark*}
\begin{theorem*}
#
\end{axiom}
\end{assertions}
\end{conjecture}
\end{corollary}
\end{definition}
\end{example}
\end{hypotheses}
\end{proposition}
\end{lemma}
\end{notation}
\end{proof}
\end{remark}
\end{theorem}
#
\end{axiom*}
\end{assertions*}
\end{conjecture*}
\end{corollary*}
\end{definition*}
\end{example*}
\end{hypotheses*}
\end{proposition*}
\end{lemma*}
\end{notation*}
\end{proof*}
\end{remark*}
\end{theorem*}
#
\begin{description*}
\begin{enumerate*}
\begin{itemize*}
#
\end{description*}
\end{enumerate*}
\end{itemize*}
# Miscellaneous commands
\keywords{%<list of keywords%>}#n
\msc{%<list of MSCs%>}#n
\nwejm#n
\nwejm*#n*
\century{%<(positive or negative) integer%>}#n
\century*{%<(positive or negative) integer%>}#n*
\aside{%<interpolated clause%>}#n
\aside*{%<interpolated clause%>}#n
\acknowledgements{%<acknowledgments%>}#n
\ie#n
\ie*#n*
\Ie#n
\Ie*#n*
\NewPairedDelimiter#n
\articlesetup#n
\BinaryOperators#n
#
\editorinchief{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\editor{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\fieldseditor{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\managingeditor{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\classdesigner{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\computerengineer{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\classmaintainer{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\fontdesigner{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\graphicdesign{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\computerassistance{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\secretary{%<Last name%>, %<First name%>}{%<affiliation%>}{%<country%>}{%<email%>}#n
\issuesetup{number=%<positive integer%>}#n
\journalsetup {publisher=%<publisher%>,address={%<address%>},phone=%<phone%>,email=%<email%>,url=%<url%>,issn=%<issn%>,isbn=%<isbn%>}#n
\inputarticle{file}#i
\inputarticle[path]{file}#i
\fontdesignertext{text}#n
\graphicdesigntext{text}#n
