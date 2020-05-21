% apnum.tex -- Arbitrary Precision Numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The documentation, Petr Olsak, 2014, 2015, 2016, 2018

% You can create the pdf version of this documentation by the command
%   pdfcsplain apnum.d
% run this command four times (for the consistence of all cross references)
% If you need to generate the documentation then the packages csplain and docbytex 
% have to be installed in your TeX distribution.

\input utf8off \clearmubyte % use pdfcsplain

\def\projectversion{1.7 Apr 2018}
\def\headtitle{Arbitrary Precision Numbers}

\widowpenalty=10000 
\clubpenalty=10000

\emergencystretch=2em
\hbadness=2200

\showboxbreadth=1500 \showboxdepth=2

\input docby.tex

\setlinecomment{\percent} \noactive{\nb\percent} \noactive{\percent\cbrace}
\noactive{\nb fontdimen}
\noactive{\nb apSIGNa} \noactive{\nb apSIGNb} 
\noactive{\nb apEa} \noactive{\nb apEb}
\noactive{\nb documentclass}

\def\tittoc{Table Of Contents}
\def\titindex{Index}
\def\titversion{version }

\def\db{\dg\nb}
\def\du#1{\api{\nb#1}}%\def\quotehook{\langleactive\let\Blue=\Red \gdef\quotehook{\langleactive}}}
\def\quotehook{\langleactive\obeyspaces}
\bgroup
   \catcode`\[=1 \catcode`]=2 \catcode`\{=12 \catcode`\}=12
   \gdef\obrace[{] \gdef\cbrace[}]
\egroup
\def\indexhook{%
   The bold number is the number of the page where the item is documented.
   Other numbers are pagenumbers of the occurrences of such item.
   The items marked by $\succ$ are mentioned in user documentation.
   \medskip}
\def\nn#1 {\noactive{\nb#1}}
\def\inumref[#1]{\ilink[#1]{\numref[#1]}}
\def\M{M\sb{\rm op}}

\def\cnvbookmark#1{\lowercase{\lowercase{#1}}}
{\obeyspaces\global\let =\ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\centerline{\tt apnum.tex}

\title Arbitrary Precision Numbers

\author Petr Ol\v s\'ak

\centerline{\ulink[ftp://math.feld.cvut.cz/olsak/makra/]%
                  {ftp://math.feld.cvut.cz/olsak/makra/}}

\dotoc \bookmarks

\sec User's Documentation

This macro file "apnum.tex" implements addition, subtraction,
multiplication, division, power to an integer and other calculation 
($\sqrt x$, $e^x$, $\ln x$, $\sin x$, $\arctan x$, \dots) with
``large numbers'' with arbitrary number of decimal digits. The numbers 
are in the form:

\begtt
<sign><digits>.<digits>
\endtt
%
where optional "<sign>" is the sequence of "+" and/or "-". The nonzero number is
treated as negative if and only if there is odd number of "-" signs. 
The first part or second part of decimal "<digits>" (but no both) can be empty.
The decimal point is optional if second part of "<digits>" is empty.

There can be unlimited number of digits in the operands. Only \TeX{} main
memory or your patience during calculation with very large numbers are your
limits. Note, that the "apnum.tex" implementation includes a lot of
optimization and it is above 100 times faster (on large numbers) than the
implementation of the similar task in the package "fltpoint.sty". And the
"fp.sty" doesn't implements arbitrary number of digits. The extensive
technical documentation can serve as an inspiration how to do \TeX{} macro
programming.


\subsec [eval] Evaluation of Expressions

After "\input apnum" in your document you can use the macro 
\du{evaldef}"\evaldef<sequence>{<expression>}". 
It gives the possibility for comfortable calculation. The "<expression>" can
include numbers (in the form described above) combined by "+", "-", "*", "/"
and "^" operators and by possible brackets "()" in an usual way. The result
is stored to the "<sequence>" as a ``literal macro''. Examples:

\begtt
\evaldef\A {2+4*(3+7)}  
   % ... the macro \A includes 42
\evaldef\B {\the\pageno * \A}  
   % ... the macro \B includes 84
\evaldef\C {123456789000123456789 * -123456789123456789123456789}
   % ... \C includes -15241578765447341344197531849955953099750190521
\evaldef\D {1.23456789 + 12345678.9 - \A}
   % ... the macro \D includes 12345596.13456789
\evaldef\X {1/3}
   % ... the macro \X includes .3333333333333333333
\endtt
%
The limit of the number of digits of the division result can be set by 
\du{apTOT}"\apTOT" and \du{apFRAC}"\apFRAC" registers. 
First one declares maximum calculated digits in total 
and second one declares maximum of digits after decimal point. The
result is limited by both those registers. If the "\apTOT" is negative,
then its absolute value is treated as a ``soft limit'': all digits before
decimal point are calculated even if this limit is exceeded. The digits
after decimal point are not calculated when this limit is reached. 
The special value "\apTOT=0" means that the calculation is limited 
only by "\apFRAC". Default values are "\apTOT=0" and "\apFRAC=20".

The operator "^" means the powering, i.~e.\ "2^8" is "256". The exponent have
to be an integer (no decimal point is allowed) and a relatively small
integer is assumed.

The scanner of the "\evaldef" macro reads (roughly speaking) the "<expression>" 
in the form ``operand binary-operator operand binary-operator etc.''
without expansion.
The spaces are not significant in the "<expression>". The operands are:

\begitems
\item * numbers (in the format "<sign><digits>.<digits>") or 
\item * numbers in scientific notation (see the section \inumref[sci]) or
\item * sequences "<sign>\the<token>" or "<sign>\number<token>" or
\item * any other single "<token>" optionally preceded by "<sign>" and 
   optionally followed by a  sequence of parameters enclosed in braces, for
   example "\A" or "\B{<text>}" or "-\C{<textA>}{<textB>}". This case has 
   two meanings:
\begitems
\item * numeric constant defined in a ``literal macro'' 
        ("\def\A{42}", "\evaldef\A{13/15}") or
\item * ``function-like'' macro which returns a value after processing. 
\enditems
\enditems

The "apnum.tex" macro file provides the following ``function-like'' macros
allowed to use them as an operand in the "<expression>": 
\begitems
\item * \du{ABS}"\ABS {<value>}" for absolute value, 
\item * \du{SGN}"\SGN {<value>}" returns sign of the "<value>",
\item * \du{iDIV}"\iDIV {<dividend>}{<divisor>}" for integer division,
\item * \du{iMOD}"\iMOD {<dividend>}{<divisor>}" for integer remainder,
\item * \du{iFLOOR}"\iFLOOR {<value>}" for rounding the number to the integer,
\item * \du{iFRAC}"\iFRAC {<value>}" for fraction part of the "\iFLOOR",
\item * \du{FAC}"\FAC {<integer value>}" for factorial,
\item * \du{BINOM}"\BINOM {<integer above>}{<integer below>}" for binomial coefficient,
\item * \du{SQRT}"\SQRT {<value>}" for square root of the "<value>",
\item * \du{EXP}"\EXP {<value>}" applies exponential function to "<value>",
\item * \du{LN}"\LN {<value>}" for natural logarithm of the "<value>",
\item * \du{SIN}\du{COS}\du{TAN}"\SIN {<value>}", "\COS {<value>}", "\TAN {<value>}"
        for $\sin x$, $\cos x$ and $\tan x$ functions,
\item * \du{ASIN}\du{ACOS}\du{ATAN}"\ASIN {<value>}", "\ACOS {<value>}", "\ATAN {<value>}"
        for $\arcsin x$, $\arccos x$ and $\arctan x$ functions,
\item * \du{PI}\du{PIhalf}"\PI", "\PIhalf" for constants $\pi$ and $\pi/2$.
\enditems

The arguments of all these functions can be a
nested "<expressions>" with the syntax like in the "\evaldef" macro. 
Example:

\begtt
\def\A{20}
\evaldef\B{ 30*\SQRT{ 100 + 1.12*\the\widowpenalty } / (4-\A) }
\endtt
%
Note that the arguments of the ``function-like'' macros are enclosed by normal
\TeX{} braces "{}" but the round brackets "()" are used for re-arranging of the
common priority of the "+", "-", "*", "/" and "^" operators.
The macros "\SQRT", "\EXP", "\LN", "\SIN", "\COS", "\TAN", "\ASIN", "\ACOS",
"\ATAN" use "\apTOT" and "\apFRAC" registers similar like during division.

The "\PI" and "\PIhalf" are ``function-like'' macros without parameters.
They returns the constant with "\apFRAC" digits after decimal point.

Users can define their own ``function-like'' macros, see the section
\inumref[pgm].

\medskip

The output of "\evaldef\foo{<expression>}" processing is stored, of course,
to the ``literal macro'' "\foo". But there are another outputs like side
effect of the processing:

\begitems
\item * The \du{OUT}"\OUT" macro includes exactly the same result as "\foo".
\item * The \du{apSIGN}"\apSIGN" register includes the value "1" or "0"
        or "-1" respectively dependent on the fact that the output is positive, zero
or negative. 
\item * The \du{apE}"\apE" register is equal to the decimal exponent when
scientific number format is used (see the next section~\inumref[sci]). 
\enditems

For example, you can
compare long numbers using "\apSIGN" register (where direct usage of "\ifnum"
primitive may cause arithmetic overflow):

\begtt
\TEST {123456789123456789} > {123456789123456788} \iftrue OK \else KO \fi
\endtt
The "\TEST" macro is defined like:

\begtt
\def\TEST#1#2#3#4{\evaldef\tmp{#1-(#3)}\ifnum\apSIGN #2 0 }
\endtt

The "apnum.tex" macros do not provide the evaluation of the "<expression>"
at the expansion level only. There are two reasons. First, the macros can be
used in classical \TeX{} only with Knuth's plain \TeX{} macro. No e\TeX{} is
needed. And the expansion-only evaluation of any expression isn't possible
in classical \TeX. Second reason is the speed optimization 
(see the section~\inumref[tests]). Anyway, users
needn't expansion-only evaluation. They can write "\evaldef\a{<expression>}"
"\edef\foo{...\a...}" instead of "\edef\foo{...<expression>...}". There is
only one case when this ``pre-processing'' trick cannot be used: while
expansion of the parameters of asynchronous "\write" commands. But you can
save the "<expression>" unexpanded into the file and you can read the file
again in the second step and do "\evaldef" during reading the file.


\subsec [sci] Scientific Notation of Numbers

The macro "\evaldef" is able
to operate with the numbers written in the notation:

\begtt
<sign><digits>.<digits>E<sign><digits>
\endtt
%
For example "1.234E9" means $1.234\cdot 10^9$, i.~e.\ "1234000000" or 
the text "1.234E-3" means ".001234". The decimal exponent (after the "E"
letter) have to be in the range $\pm\,2\,147\,483\,647$ because 
we store this value in normal \TeX{} register. 

The "\evaldef<sequence>{<expression>}" operates with mantissa and exponent
separately if there are operands with scientific notation. It outputs the
result in the scientific notation if the result have non-zero exponent.

The \du{evalmdef}"\evalmdef<sequence>{<expression>}" does the same as "\evaldef" 
but only mantissa is saved in the output "<sequence>" and in the "\OUT" macro. 
The exponent is stored in the "\apE" register in such case. 
You can define the macro which shows the complete result after "\evalmdef"
calculation, for example:

\begtt
\def\showE#1{\message{#1\ifnum\apE=0 \else*10^\the\apE\fi}}
\endtt

Suppose "\evalmdef\foo{<expression>}" is processed and the complete result is
$R={}$"\foo*10^\apE". There are two possibilities how to save such complete
result $R$ to the "\foo" macro: use "\apEadd\foo" or "\apEnum\foo". Both
macros do nothing if "\apE=0". Else the \du{apEadd}"\apEadd<sequence>" macro adds
"E<exponent>" to the "<sequence>" macro and \du{apEnum}"\apEnum<sequence>" moves
the decimal point to the new right position in the "<sequence>" macro or
appends zeros. The "\apE" register is set to zero after the macro "\apEadd" or
"\apEnum" is finished. Example:

\begtt
\evalmdef\foo{ 3 * 4E9 }    % \foo is 12, \apE=9
\apEadd\foo                 % \foo is 12E+9
\evalmdef\foo{ 7E9 + 5E9 }  % \foo is 12, \apE=9
\apEnum\foo                 % \foo is 12000000000
\endtt

There are another usable macros for operations with scientific numbers.

\begitems
\item * \du{apROLL}"\apROLL <sequence>{<shift>}" \dots the "<sequence>" is assumed to
   be a macro with the number. The decimal point of this number is
   shifted right by "<shift>" parameter, i.~e.\ the result is multiplied by
   "10^<shift>". The "<sequence>" is redefined by this result. 
   For example the "\apEnum\A" does "\apROLL\A{\apE}".
\item * \du{apNORM}"\apNORM <sequence>{<num>}"
   \dots the "<sequence>" is supposed to be a macro with "<mantissa>" and it
   will be redefined. The number "<mantissa>*10^\apE" (with current value of
   the "\apE" register) is assumed.
   The new mantissa saved in the "<sequence>" is the ``normalized mantissa'' of
   the same number. The "\apE" register is corrected so the ``normalized
   mantissa''"*10^\apE" gives the same number.
   The "<num>" parameter is the number of non-zero digits before the decimal
   point in the outputted mantissa. If the parameter "<num>"
   starts by dot following by integer (for example "{.2}"), then the
   outputted mantissa has "<num>" digits after decimal point.
   For example "\def\A{1.234}\apE=0" "\apNORM\A{.0}" defines "\A" as "1234"
   and "\apE=-3". 
\item * The \du{apROUND}"\apROUND <sequence>{<num>}" 
   rounds the number, which is included in
   the macro "<sequence>" and redefines "<sequence>" as rounded number. 
   The digits after decimal point at the position greater than "<num>" are ignored
   in the rounded number. The decimal point is removed, if it is the right
   most character in the "\OUT". The ignored part is saved to the "\XOUT" macro
   without trailing right zeros. 
\enditems

Examples of "\apROUND" usage:

\begtt
\def\A{12.3456}\apROUND\A{1}   % \A is "12.3",    \XOUT is "456"
\def\A{12.3456}\apROUND\A{9}   % \A is "12.3456", \XOUT is empty
\def\A{12.3456}\apROUND\A{0}   % \A is "12",      \XOUT is "3456"
\def\A{12.0000}\apROUND\A{0}   % \A is "12",      \XOUT is empty
\def\A{12.0001}\apROUND\A{2}   % \A is "12",      \XOUT is "01"
\def\A{.000010}\apROUND\A{2}   % \A is "0",       \XOUT is "001"
\def\A{-12.3456}\apROUND\A{2}  % \A is "-12.34",  \XOUT is "56"
\def\A{12.3456}\apROUND\A{-1}  % \A is "10",      \XOUT is "23456"
\def\A{12.3456}\apROUND\A{-4}  % \A is "0",       \XOUT is "00123456"
\endtt

The following example saves the result of the "\evalmdef" in scientific
notation with the mantissa with maximal three digits after decimal point and one
digit before.

\begtt
\evalmdef\X{...}\apNORM\X{1}\apROUND\X{3}\apEadd\X
\endtt

The macros "\apEadd", "\apEnum", "\apROLL", "\apNORM" and "\apROUND" redefine the macro
"<sequence>" given as their first argument. They are not ``function-like''
macros and they cannot be used in an "<expression>".
The macro "<sequence>" must be the number in the format
"<simple sign><digits>.<digits>" where "<simple sign>" is one minus or none
and the rest of number has the format described in the first paragraph of
this documentation. The scientific notation isn't allowed here. This format
of numbers is in accordance with the output of the "\evalmdef" macro.

The build in function-like macros "\SGN", "\iDIV", \dots "\SIN", "\COS", "\ATAN" etc.\
don't generate the result in scientific form regardless of its argument is in 
scientific form or not. But there are exceptions: "\ABS" and "\SQRT" returns 
scientific form if the argument is in this form. And "\EXP" returns scientific 
form if the result is greater than $10^{K+1}$ or less than $10^{-K-1}$ where 
$K={}$\du{apEX}"\apEX". The default value of this register is "\apEX=10".


\subsec [pgm] Notes for macro programmers

If you plan to create a ``function-like'' macro which can be used as an
operand in the "<expression>" then observe that first token in the
macro body must be "\relax". This tells to the "<expression>" scanner that
the calculation follows. The result of this calculation must be saved into
the "\OUT" macro and into the "\apSIGN" register. 

Example. The "\ABS" macro for the absolute value is defined by:

\ilabel [abs:eval]    {evalmdef}
\ifirst{apnum.tex} {ABS}{^^B\cbrace}{+-}

\begtt
Usage: \evaldef\A{ 2 - \ABS{3-10} }%  \A includes -5.
\endtt 

Note, that "\apSIGN" register is corrected by final routine of the expression scanner
according the "\OUT" value. But setting "\apSIGN" in your macro is
recommended because user can use your macro directly outside of "\evaldef".

If the result of the function-like macro needs to be expressed by scientific
notation then you have two possibilities: use ``{\tt E}'' notation in the
"\OUT" macro and keep "\apE" register zero. Or save the matissa only to the
"\OUT" macro and set the value of the exponent into the "\apE" register. The
second possibility is preferred and used by build in function-like macros.
Note the "\ABS" definition above: the "\evalmdef" in the line~\cite[abs:eval] 
keeps only mantissa in 
the "\OUT" macro and the "\apE" register is set by "\evalmdef" itself.

The "\evaldef\foo{<expression>}" is processed in two steps. The
"<expression>" scanner converts the input to the macro call of the 
\du{apPLUS}"\apPLUS", \du{apMINUS}"\apMINUS", \du{apMUL}"\apMUL", 
\du{apDIV}"\apDIV" or \du{apPOW}"\apPOW" macros with two
parameters. They do addition, subtraction, multiplication, division and
power to the integer. These macros are processed in the second step. 
For example:

\begtt
\evaldef\A{ 2 - 3*8 }      converts the input to:
\apMINUS{2}{\apMUL{3}{8}}  and this is processed in the second step.
\endtt

The macros "\apPLUS", "\apMINUS", "\apMUL", "\apDIV" and "\apPOW" behave
like normal ``function-like'' macros with one important exception: they
don't accept general "<expression>" in their parameters, only single operand
(see section~\inumref[eval]) is allowed.

If your calculation is processed in the loop very intensively
than it is better to save time of such calculation and to avoid the
"<expression>" scanner processing (first step of the "\evaldef"). 
So, it is recommended to use directly the
Polish notation of the expression as shown in the second line in the example 
above. See section~\inumref[fce] for more inspirations.

The output of the "\apPLUS", "\apMINUS", "\apMUL", "\apDIV" and "\apPOW" macros is
stored in "\OUT" macro and the registers "\apSIGN" and "\apE" are set
accordingly.

The number of digits calculated by "\apDIV" macro is limited by the
"\apTOT" and "\apFRAC" registers as described in the section~\inumref[eval].
There is another result of "\apDIV" calculation stored in the \du{XOUT}"\XOUT" macro.
It is the remainder of the division. Example:

\begtt
\apTOT=0 \apFRAC=0 \apDIV{1234567892345}{2}\ifnum\XOUT=0 even \else odd\fi
\endtt
%
You cannot apply "\ifodd" primitive on ``large numbers'' directly
because the numbers may be too big. 

If you set something locally inside your ``function-like'' macro, then such
data are accessible only when your macro is called outside of "\evaldef". Each
parameter and the whole "\evaldef" is processed inside a \TeX{} group, so
your locally set data are inaccessible when your macro is used inside another
``function-like'' parameter or inside "\evaldef". The "\XOUT" output is set
locally by "\apDIV" macro, so it serves as a good example of this feature:

\begtt
{\apDIV{1}{3}            ... \XOUT is .00000000000000000001 }
                         ... \XOUT is undefined
\evaldef{1/3}            ... \XOUT is undefined 
\apPLUS{1}{\apDIV{1}{3}} ... \XOUT is undefined  
\endtt

The macro "\apPOW{<base>}{<exponent>}" calculates the power to the integer
exponent. A slight optimization is implemented here so the usage of "\apPOW"
is faster than repeated multiplication. The decimal non-integer exponents are not
allowed. Use "\EXP" and "\LN" macros if you need to calculate non-integer
exponent:

\begtt
\def\POWER#1#2{\relax \EXP{(#2)*\LN{#1}}}
\endtt
%
Note that both parameters are excepted as an "<expression>". Thus the "#2" is 
surrounded in the rounded brackets.

Examples of another common ``function-like'' macros:

\begtt
\evaldef\degcoef{PI/180}
\def\SINdeg#1{\relax \SIN{\degcoef*(#1)}}
\def\COSdeg#1{\relax \COS{\degcoef*(#1)}}
\def\SINH#1{\relax \evaldef\myE{\EXP{#1}}\evaldef\OUT{(\myE-1/\myE)/2}}
\def\ASINH#1{\relax \LN{#1+\SQRT{(#1)^2+1}}}
\def\LOG#1{\relax \apLNtenexec \apDIV{\LN{#1}}{\apLNten}}
\endtt

In another example, we implement the field "\F{<index>}" as an
``function-like'' macro. User can set values by "\set\F{<index>}={<value>}"
and then these values can be used in an "<expression>".

\begtt
\def\set#1#2#3#4{\evaldef\index{#2}\evaldef\value{#4}%
   \expandafter\edef\csname \string#1[\index]\endcsname{\value}}
\def\F#1{\relax % function-like macro
   \evaldef\index{#1}%
   \expandafter\ifx\csname \string\F[\index]\endcsname\relax
      \def\OUT{0}% undefined value
   \else
      \edef\OUT{\csname \string\F[\index]\endcsname}%
   \fi
}
\set \F{12/2} = {28+13}
\set \F{2*4} = {144^2}
\evaldef\test { 1 + \F{6} } \message{result=\test}
\endtt
%
As an exercise, you can implement linear interpolation of known values.

The final example shows, how to implement  
the macro "\usedimen{<dimen>}{<unit>}". It is ``function-like'' macro, 
it can be used in the "<expression>" and it returns the
"<decimal number>" with the property "<dimen>=<decimal number><unit>".

\begtt
\def\usedimen #1#2{\relax  % function-like macro
   \def\OUT{0}%            % default value, if the unit isn't known
   \csname dimenX#2\endcsname{#1}}
\def\dimenXpt #1{\apDIV{\number#1}{65536}}
\def\dimenXcm #1{\apDIV{\number#1}{1864682.7}}
\def\dimenXmm #1{\apDIV{\number#1}{186468.27}}
%... etc.
\evaldef\a{\usedimen{\hsize}{cm}} % \a includes 15.91997501773358008845
\endtt
%
Note that user cannot write "\usedimen\hsize{cm}" without braces because
this isn't the syntactically correct operand (see section~\inumref[eval]) and the
"<expression>" scanner is unable to read it.

\subsec Printing expressions

\TeX{} was designed for printing. The "apnum.tex" provides common syntax of
"<expressions>" (given in section \inumref[eval]) which can be used for
both: for {\it evaluating\/} or for {\it printing}. Printing can be done
using \du{eprint}"\eprint{<expression>}{<declaration>}" macro. The
"<declaration>" part declares locally what to do with ``variables'' or with
your ``function-like'' macros. You can insert your local "\def"'s or
"\let"'s here because the "<declaration>" is executed in the group before
the "<expression>" is printed. The "\eprint" macro must be used in math mode
only. Example:

\begtt
\def\printresult#1{$$\displaylines{
  \eprint{#1}\vars = \cr = \eprint{#1}\nums = \cr 
   = \apFRAC=8 \evaldef\OUT{#1}\OUT, \cr
  \nums x = \X, \quad y = \Y.
}$$}

\def\X{-.25} \def\Y{18.11}
\def\vars{\def\X{x}\def\Y{y}\let\apMULop=\relax}  
\def\nums{\corrnum\X \corrnum\Y}
\printresult
{-(\X-\SQRT{\Y^2+1}) + -((\Y*\X+1)/2) + \SIN{\X+\PIhalf} + 2*\COS{\Y}}
\endtt
generates the result:
$$
  \displaylines{
   - \left(x-\sqrt{y^2+1}\right) + \left(- {yx+1\over 2}\right) 
   + \sin\!\left( x+{\pi\over2}\right) + 2 \cos y = \cr
  =  - \left(-0.25-\sqrt{18.11^2+1}\right) + 
     \left(- {18.11\cdot(-0.25)+1\over 2}\right) 
   + \sin\!\left( -0.25+{\pi\over2}\right) + 2\cdot \cos 18.11 = \cr
  = 22.5977863, \cr
  x = -0.25, \quad y = 18.11
}
$$
This example prints the given "<expression>" in two forms: with 
``variables as variables'' first and with ``variables as constants'' second.
The "<declaration>" is prepared in the "\vars" macro for the first 
form and in the "\nums" macro for the second.

Note that "\eprint" macro re-calculates the occurrences of round brackets but
keeps the meaning of the "<expression>".
For example "(a+b)/c" is printed as "{a+b\over c}" (without brackets) and 
"6*-(a+b)" is printed as "6\cdot(-(a+b))" (new brackets pair is added). 
Or "\SIN{x}" is printed as "\sin x" (without brackets) but "\SIN{x+1}" 
is printed as "\sin(x+1)" (with brackets). And "\SIN{x}^2" is printed as 
"\sin^2 x".

You can do \du{apMULop}"\let\apMULop=\," or "\let\apMULop=\relax" in the
"<declaration>" part if you need not to print any operator for multiplying.
The default setting is "\let\apMULop=\cdot". Another possibility is to set
"\let\apMULop=\times".

The macro \du{corrnum}"\corrnum<token>" corrects the number saved in 
the "<token>" macro if it is in the form 
"[<minus>].<digits>" (i.~e.\ without digits before decimal point).
Then zero is added before decimal point. Else nothing is changed.

Warning. The first parameter of "\eprint" (i.~e.\ the "<expression>"), must
be directly expression without any expansion steps. For example, you cannot
define "\def\foo{<expression>}" and do "\eprint{\foo}{}" but you can do
"\expandafter\eprint\expandafter{\foo}{}".

The macro "\eprint" has its own intelligence about putting brackets. If you 
need to put or remove brackets somewhere where the intelligence of "\eprint" 
is different from your opinion, you can create your function-like macros 
"\BK{<expression>}" and "\noBK{<expression>}". They evaluate the 
"<expression>" when using "\evaldef".  
The "\BK" prints the "<expression>" with brackets and 
"\noBK" prints it without brackets when using "\eprint".

\begtt
\def\BK#1{\relax \evaldef\OUT{#1}}  \let\noBK=\BK
\def\apEPj{\def\BK##1{\left(\eprint{##1}{}\right)}%
           \def\noBK##1{\eprint{##1}{}}}
Now $\eprint{3+\BK{\SIN{1}}^2}{}$ prints $3+(\sin 1)^2$.
\endtt

Note that "\apEPj" macro is an initial hook of "\eprint" 
(it is run inside group before processing of the second parameter of "\eprint").  

\subsec [tests] Experiments

The following table shows the time needed for calculation of randomly
selected examples. The comparison with the package "fltpoint.sty" is shown.
The symbol $\infty$ means that it is out of my patience.

\bigskip
\noindent\hfil\vbox{\baselineskip=13pt
\halign{&\ \hfil#\hfil\ \cr
 input & \# of digits in the result & time spent by {\tt apnum.tex} & 
                                      time spent by {\tt fltpoint.sty}\cr
\noalign{\smallskip\hrule\smallskip}
  200!  &  375  & 0.33 sec  & 173 sec \cr
  1000! &  2568 & 29 sec   & $\infty$ \cr
  $5^{17^2}$ &  203 & 0.1 sec & 81 sec \cr
  $5^{17^3}$ &  3435 & 2.1 sec  & $\infty$ \cr
  $1/17$   & 1000  &  0.13 sec  & 113 sec \cr
  $1/17$   & 100000 & 142 sec   & $\infty$ \cr
}}


\sec The Implementation

\subsec Name Convention, Version, Counters

The internal control sequence names typically used in "apnum.tex" have the form 
"\apNAMEsuffix", but there are exceptions. The control sequences mentioned
in the section~\inumref[eval] (user's documentation) have typically more natural names.
And the internal counter registers have  names "\apnumA", "\apnumB",
"\apnumC" etc. 

The code starts by the greeting. The \db apVERSION includes the version of this software.

\ifirst{apnum.tex} {apVERSION}{\empty}{+-}

We declare auxiliary counters and one Boolean variable.

\inext{newcount}{\empty}{+-}

The counters \db apSIGN , \db apE , \db apTOT, \db apFRAC and \db apEX
are declared here:

\inext{newcount}{\empty}{+-}

Somebody sometimes sets the "@" character to the special catcode. But we
need to be sure that there is normal catcode of the "@" character.

\inext{catcode}{}{++}


\subsec Evaluation of the Expression

Suppose the following expression "\A+\B*(\C+\D)+\E" as an example.

The main task of the "\evaldef\x{\A+\B*(\C+\D)+\E}" is to prepare the macro
"\tmpb" with the content (in this example)
"\apPLUS{\apPLUS{\A}{\apMUL{\B}{\apPLUS{\C}{\D}}}}{\E}" and to execute the "\tmpb"
macro.

The expression scanner adds the "\limits" at the end of the expression and
reads from left to right the couples ``operand, operator''. For our example:
"\A+", "\B*", "\C+", "\D+" and "\E\limits". The "\limits" operator has the
priority 0, plus, minus have priority 1, "*"~and~"/" have priority 2 and "^"
has priority 3. The brackets are ignored, but each occurrence of the opening
bracket "(" increases priority by 4 and each occurrence of closing bracket
")" decreases priority by~4. The scanner puts each couple including its
current priority to the stack and does a test at the top of the stack. The
top of the stack is executed if the priority of the top operator is less or
equal the previous operator priority. For our example the stack is only
pushed without execution until "\D+" occurs. Our example in the stack looks
like:

\begtt
   \D + 1  1<=5 exec:  
   \C + 5         {\C+\D} + 1  1<=2 exec:
   \B * 2             \B  * 2     {\B*{\C+\D}} + 1  1<=1 exec:
   \A + 1             \A  + 1              \A  + 1   {\A+{\B*{\C+\D}}} + 1
bottom  0           bottom  0          bottom    0               bottom  0
\endtt
%
Now, the priority on the top is greater, then scanner pushes next couple and
does the test on the top of the stack again.

\begtt
            \E \limits 0  0<=1   exec:
 {\A+{\B*{\C+\D}}}  +  1       {{\A+{\B*{\C+\D}}}+\E} \end 0   0<=0 exec: 
             bottom    0                           bottom  0         RESULT
\endtt
Let $p_t$, $p_p$ are the priority on the top and the previous
priority in the stack. Let $v_t$, $v_p$ are operands on the top and in the
previous line in the stack, and the same notation is used for operators
$o_t$ and $o_p$. If $p_t\le p_p$ then: pop the stack twice, create composed
operand $v_n=v_p \, o_p \, v_t$ and push $v_n$, $o_t$, $p_t$. Else 
push new couple ``operand, operator'' from the expression scanner. 
In both cases try to execute the top of the stack again. 
If the bottom of the stack is reached then the last operand is the result.

The \db evaldef and \db evalmdef macros are protected by 
"\relax". It means that it can be used
inside an "<expression>" as a ``function-like'' macro, but I don't imagine
any usual application of this. The "\apEVALa" is executed.

\inext{evaldef}{evalmdef}{++}

The macro \db apEVALa "{<final-step>}<sequence>{<expression>}" runs the evaluation of the
expression in the group. The base priority is initialized by "\apnumA=0",
then "\apEVALb<expression>\limits" scans the expression and saves the
result in the form "\apPLUS{\A}{\apMUL{\B}{\C}}" (etc.) into the "\tmpb" macro. This
macro is executed. The group is finished by "\apEND" macro, which keeps the
"\OUT", "\apSIGN" and "\apE" values unchanged. Then "<final-step>" is executed and
finally, the defined "<sequence>" is set equivalent to the \db OUT macro.

\inext{apEVALa}{}{++}

The scanner is in one of the two states: reading operand or reading operator.
The first state is initialized by \db apEVALb which follows to the
"\apEVALc". The \db apEVALc reads one token and switches by its value.
If the value is a "+" or "-" sign, it is assumed to be the part of the 
operand prefix. Plus sign is ignored (and "\apEVALc" is run again), 
minus signs are accumulated into "\tmpa".

The auxiliary macro \db apEVALd runs the following tokens to the "\fi", but
first it closes the conditional and skips the rest of the macro "\apEVALc".

\ilabel [eval:the]    {ifx\nb the}
\ilabel [eval:number] {ifx\nb number}
\ilabel [eval:num]    {apTESTdigit}
\ilabel [eval:nonum]  {apEVALg}
\inext{apEVALb}{def\nb apEVALd}{++}

If the next token is opening bracket, then the global priority is increased
by 4 using the macro \db apEVALe. Moreover, if the sign before bracket
generates the negative result, then the new multiplication (by $-1$) 
is added using "\apEVALp" to the operand stack.

\inext{apEVALe}{^^B\cbrace}{++}

If the next token is "\the" or "\number" primitives (see lines \cite[eval:the] and
\cite[eval:number]), then one following token is
assumed as \TeX{} register and these two tokens are interpreted as an operand. 
This is done by \db apEVALf. The operand is packed to the "\tmpb" macro.

\inext{apEVALf}{}{++}

If the next token is not a number (the "\apTESTdigit#1\iftrue" results like
"\iffalse" at line~\cite[eval:num]) then we save 
the sign plus this token to the "\tmpb" 
at line~\cite[eval:nonum] 
and we do check of the following token by "\futurelet". The \db
apEVALg is processed after that. The test is performed here if the following
token is open brace (a macro with parameter). If this is true then this
parameter is appended to "\tmpb" by \db apEVALh and the test about the
existence of second parameter in braces is repeated by next "\futurelet". 
The result of this loop is stored into "\tmpb" macro which includes 
"<sign>" followed by "<token>" followed by all
parameters in braces. This is considered as an operand.

\inext{apEVALg}{def\nb apEVALh}{++}

If the next token after the sign is a digit or a dot (tested in "\apEVALc"
by "\apTESTdigit" at line~\cite[eval:num]), then there are two cases. The
number includes the "E" symbol as a first symbol (this is allowed in
scientific notation, mantissa is assumed to equal to one). The "\apEVALk"
is executed in such case. Else the "\apEVALn" starts the reading the
number. 

The first case with "E" letter in the number is solved by macros \db apEVALk
and \db apEVALm. The number after "E" is read by "\apE=" and this number is
appended to the "\tmpb" and the expression scanner skips to "\apEVALo".

\inext{apEVALk}{def\nb apEVALm}{++}

The second case (there is normal number) is processed by the macro \db
apEVALn. This macro reads digits (token per token) and saves them to the
"\tmpb". If the next token isn't digit nor dot then the second state of the
scanner (reading an operator) is invoked by running "\apEVALo".
If the "E" is found then the exponent is read to "\apE" and it is processed by 
"\apEVALm".

\inext{apEVALn}{^^B\cbrace}{++}

The reading an operator is done by the \db apEVALo macro. This is more
simple because the operator is only one token. Depending on this token the
macro \db apEVALp "<operator><priority>" pushes to the stack (by
the macro "\apEVALpush") the value from "\tmpb", the "<operator"> and the priority 
increased by "\apnumA" (level of brackets). 

If there is a problem (level of brackets less than zero, level of brackets not
equal to zero at the end of the expression, unknown operator) we print an
error using "\apEVALerror" macro.

The "\apNext" is set to "\apEVALb", i.~e.\ scanner returns back to the state of
reading the operand. But exceptions exist: if the ")" is found then
priority is decreased and the macro "\apEVALo" is executed again. 
If the end of the "<expression>" is found then the loop is ended by
"\let\apNext=\relax".

\inext{apEVALo}{\count=2 ^^B\cbrace}{++}

The \db apEVALstack macro includes the stack, three items
"{<operand>}{<operator>}{<priority>}" per level. Left part of the macro
contents is the top of the stack. The stack is initialized with empty 
operand and operator and with priority zero. The dot here is only the ``total
bottom'' of the stack.

\inext{apEVALstack}{}{++}

The macro \db apEVALpush "{<operand>}{<operator>}{<priority>}" pushes its
parameters to the stack and runs "\apEVALdo<whole stack>@" to do the
desired work on the top of the stack.

\inext{apEVALpush}{^^B\cbrace}{++}

Finally, the macro 
\db apEVALdo "{<vt>}{<ot>}{<pt>}{<vp>}{<op>}{<pp>}<rest of the stack>@"
performs the execution described at the beginning of this section. The new
operand "<vn>" is created as "<op>{vp}{vt}", this means
"\apPLUS{<vp>}{<vt>}" for example. The operand is not executed now, only the
result is composed by the normal \TeX{} notation. If the bottom of the stack
is reached then the result is saved to the "\tmpb" macro. This macro is
executed after group by the "\apEVALa" macro.

\inext{apEVALdo}{^^B\cbrace}{++}

The macro \db apEVALerror "<string>" prints an error message. We decide to
be better to print only "\message", no "\errmessage". The "\tmpb" is
prepared to create "\OUT" as "??" and the "\apNext" macro is set in order to skip
the rest of the scanned "<expression>".

\inext{apEVALerror}{^^B\cbrace}{++}

The auxiliary macro \db apTESTdigit "<token>\iftrue" tests, if the given token is
digit, dot or "E" letter.

\inext{apTESTdigit}{^^B\cbrace}{++}


\subsec Preparation of the Parameter

All operands of "\apPLUS", "\apMINUS", "\apMUL", "\apDIV" and "\apPOW" macros are
preprocessed by "\apPPa" macro. This macro solves (roughly speaking) the
following tasks:

\begitems
\item * It partially expands (by "\expandafter") the parameter while "<sign>" is read.
\item * The "<sign>" is removed from parameter and the appropriate "\apSIGN"
   value is set.
\item * If the next token after "<sign>" is "\relax" then the rest of the
   parameter is executed in the group and the results "\OUT", "\apSIGN" and
  "\apE" are used.
\item * Else the number is read and saved to the parameter.
\item * If the read number has the scientific notation "<mantissa>E<exponent>"
  then only "<mantissa>" is saved to the parameter and "\apE" is set as
  "<exponent>". Else "\apE" is zero.
\enditems

The macro \db apPPa "<sequence><parameter>" calls 
\db apPPb "<parameter>@<sequence>" and starts reading the 
"<parameter>". The result will be stored to the "<sequence>". 

Each token from "<sign>" is processed by three "\expandafter"s (because
there could be "\csname...\endcsname"). It means that the
parameter is partially expanded when "<sign>" is read. The "\apPPb" macro
sets the initial value of "\tmpc" and "\apSIGN" and executes the macro 
\db apPPc "<parameter>@<sequence>".

\inext{apPPa}{def\nb apPPd}{++}

The "\apPPc" reads one token from "<sign>" and it is called recursively
while there are "+" or "-" signs. If the read token is "+" or "-" then 
the \db apPPd closes conditionals and executes "\apPPc" again. 

If "\relax" is found then the rest of parameter is executed by the
\db apPPe. The macro ends by \db apPPf "<result>@" and this macro
reverses the sign if the result is negative and removes the minus sign 
from the front of the parameter.

\inext{apPPe}{def\nb apPPf}{++}

The \db apPPg "<parameter>@" macro is called when the "<sign>" was processed
and removed from the input stream. The main reason of this macro is to
remove trailing zeros from the left and to check, if there is the zero value
written for example in the form "0000.000". When this macro is started then
"\tmpc" is empty. This is a flag for removing trailing zeros. They are simply
ignored before decimal point. The "\apPPg" is called again by \db apPPh
macro which removes the rest of "\apPPg" macro and closes the conditional.
If the decimal point is found then next zeros are accumulated to the "\tmpc".
If the end of the parameter "@" is found and we are in the ``removing zeros
state'' then the whole value is assumed to be zero and this is processed by
"\apPPi @". If another digit is found (say 2) then there are two
situations: if the "\tmpc" is non-empty, then the digit is appended to the
"\tmpc" and the "\apPPi<expanded tmp>" is processed (say "\apPPi .002")
followed by the rest of the parameter. Else the digit itself is stored to
the "\tmpc" and it is returned back to the input stream (say "\apPPi"~"2")
followed by the rest of the parameter.

\inext{apPPg}{def\nb apPPh}{++}

The macro \db apPPi "<parameter without trailing zeros>@<sequence>"
switches to two cases: if the execution of the parameter was processed then
the "\OUT" doesn't include "E" notation and we can simply define
"<sequence>" as the "<parameter>" by the \db apPPj macro. This saves the
copying of the (possible) long result to the input stream again. 

If the executing of the parameter was not performed, then we need to test
the existence of the "E" notation of the number by the \db apPPk macro. We
need to put the "<parameter>" to the input stream and to use \db apPPl to
test these cases. We need to remove unwanted "E" letter by the \db apPPm macro.

\inext{apPPi}{def\nb apPPm}{++}

The \db apPPn "<param>" macro does the same as "\apPPa\OUT{<param>}", 
but the minus sign is returned back to the "\OUT" macro if the result is
negative. 

\inext{apPPn}{}{++}

The \db apPPab "<macro>{<paramA>}{<paramB>}" is used for parameters of 
all macros "\apPLUS", "\apMUL" etc. It
prepares the "<paramA>" to "\tmpa", "<paramB>" to "\tmpb", the sign and
"<decimal exponent>" of "<paramA>" to the "\apSIGNa" and "\apEa", the same
of "<paramB>" to the "\apSIGNa" and "\apEa". Finally, it executes the
"<macro>".

\inext{apPPab}{^^B\cbrace}{++} 

The \db apPPs "<macro><sequence>{<param>}" prepares parameters for "\apROLL",
"\apROUND" and "\apNORM" macros. It saves the "<param>" to the "\tmpc" macro, 
expands the "<sequence>" and runs the macro
\db apPPt \unskip~"<macro><expanded sequence>.@<sequence>". The macro "\apPPt"
reads first token from the "<expanded sequence>" to "#2". If "#2" is minus
sign, then "\apnumG=-1". Else
"\apnumG=1". Finally the "<macro><expanded sequence>.@<sequence>"
is executed (but without the minus sign in the input stream).
If "#2" is zero then \db apPPu "<macro><rest>.@<sequence>" is executed. If
the "<rest>" is empty, (i.~e.\ the parameter is simply zero) then "<macro>"
isn't executed because there in nothing to do with zero number as a parameter of 
"\apROLL", "\apROUND" or "\apNORM" macros.

\inext{apPPs}{\count=2 ^^B\cbrace}{++}


\subsec Addition and Subtraction

The significant part of the optimization in "\apPLUS", "\apMUL", "\apDIV" and
"\apPOW" macros
is the fact, that we don't treat with single decimal digits but with their
quartets. This means that we are using the numeral system with the base
10000 and we calculate four decimal digits in one elementary operation. The
base was chosen $10^4$ because the multiplication of such numbers gives
results less than $10^8$ and the maximal number in the \TeX{} register
is about $2\cdot10^9$. We'll use the word ``Digit'' (with capitalized D) in
this documentation if this means the digit in the numeral system with base
10000, i.~e.\ one Digit is four digits.
Note that for addition we can use the numeral system with the base $10^8$
but we don't do it, because the auxiliary macros "\apIV*" for numeral system of the
base $10^4$ are already prepared.

Suppose the following example (the spaces between Digits are here only for
more clarity).

\begtt
  123 4567 8901 9999         \apnumA=12 \apnumE=3 \apnumD=16
+                 22.423     \apnumB=0  \apnumF=2 \apnumC=12
--------------------------
sum in reversed order and without transmissions:
               {4230}{10021}{8901}{4567}{123}  \apnumD=-4
sum in normal order including transmissions:
  123 4567 8902 0021.423
\endtt

In the first pass, we put the number with more or equal Digits before decimal
point above the second number. There are three Digits more in the example.
The "\apnumC" register saves this information (multiplied by 4). The first
pass creates the sum in reversed order without transmissions between Digits. 
It simply copies the "\apnumC/4" Digits from the first number to the result in reversed
order. Then it does the sums of Digits without transmissions. The "\apnumD"
is a relative position of the decimal point to the edge of the calculated
number.

The second pass reads the result of the first pass, calculates transmissions and
saves the result in normal order. 

The first Digit of the operands cannot include four digits. The number of
digits in the first Digit is saved in "\apnumE" (for first operand) and in
"\apnumF" (for second one). The rule is to have the decimal point between
Digits in all circumstances.

The \db apPLUS and \db apMINUS macros prepare parameters using "\apPPab" and execute "\apPLUSa":

\inext{apPLUS}{apMINUS}{++}

The macro \db apPLUSa does the following work:

\ilabel[plus:apE]   {apEa}
\ilabel[plus:DIGa]  {apDIG\nb tmpa}
\ilabel[plus:DIGb]  {apDIG\nb tmpb}
\ilabel[plus:moda]  {-\nb apnumE}
\ilabel[plus:modb]  {-\nb apnumF}
\ilabel[plus:apnC]  {apnumC=}
\ilabel[plus:xA]    {apSIGNa}
\ilabel[plus:xB]    {apSIGNb}
\ilabel[plus:sg]    {apSIGN=}
\ilabel[plus:xAm]   {PLUSxA-}
\ilabel[plus:ba]    {apPLUSg}
\ilabel[plus:bb]    {apnumC=-}
\ilabel[plus:G]     {apnumG=0}
\ilabel[plus:next]  {apNext=}
\ilabel[plus:X]     {apnumX=0}
\ilabel[plus:fa]    {00123}
\ilabel[plus:fb]    {apPLUSy}

\begitems
\item * It gets the operands in "\tmpa" and "\tmpb" macros using the "\apPPab".
\item * If the scientific notation is used and the decimal 
  exponents "\apEa" and "\apEb" are not equal then the decimal point of one
  operand have to be shifted (by the macro "\apPLUSxE" at line~\cite[plus:apE]).
\item * The digits before decimal point are calculated for both operands by
  the "\apDIG" macro. The first result is saved to "\apnumA" and the second
  result is saved to "\apnumB". The "\apDIG" macro removes decimal point (if
  exists) from the parameters (lines~\cite[plus:DIGa] and~\cite[plus:DIGb]).
\item * The number of digits in the first Digit is calculated by "\apIVmod"
  for both operands. This number is saved to "\apnumE" and "\apnumF". This
  number is subtracted from "\apnumA" and "\apnumB", so these
  registers now includes multiply of four
  (lines~\cite[plus:moda] and~\cite[plus:modb]).
\item * The "\apnumC" includes the difference of Digits before the decimal
  point (multiplied by four) of given operands
  (line~\cite[plus:apnC]).
\item * If the first operand is negative then the minus sign is inserted to
  the \db apPLUSxA macro else this macro is empty. The same for the second 
  operand and for the macro \db apPLUSxB is done
  (lines~\cite[plus:xA] and~\cite[plus:xB]).
\item * If both operands are positive, then the sign of the result "\apSIGN"
  is set to one. If both operands are negative, then the sign is set to $-1$.
  But in both cases mentioned above we will do (internally) addition, so the
  macros "\apPLUSxA" and "\apPLUSxB" are set to empty. 
  If one operand is negative and second positive then we will do
  subtraction. The "\apSIGN" register is set to zero and
  it will set to the right value later
  (lines~\cite[plus:sg] to~\cite[plus:xAm]).
\item * The macro "\apPLUSb<first op><first dig><second op><second dig><first Dig>" 
  does the calculation of the first pass. The "<first op>" has to have more
  or equal Digits before decimal point than "<second op>". This is reason why 
  this macro is called in two variants dependent on the value "\apnumC".
  The macros "\apPLUSxA" and "\apPLUSxB" (with the sign of the operands) are
  exchanged (by the "\apPLUSg") if the operands are exchanged
  (lines~\cite[plus:ba] to~\cite[plus:bb]).
\item * The "\apnumG" is set by the macro "\apPLUSb" to the sign of the
  first nonzero Digit. It is equal to zero if there are only zero Digits after
  first pass. The result is zero in such case and we do nothing more
  (line~\cite[plus:G]).
\item * The transmission calculation is different for addition and
  subtraction. If the subtraction is processed then the sign of the result
  is set (using the value "\apnumG") and the "\apPLUSm" for transmissions is
  prepared. Else the "\apPLUSp" for transmissions is prepared as the "\apNext" macro
  (line~\cite[plus:next])
\item * The result of the first pass is expanded in the input stream and the 
  "\apNext" (i.~e.\ transmissions calculation) is activated at line~\cite[plus:X]. 
\item * if the result is in the form ".000123", then the decimal point and
  the trailing zeros have to be inserted. Else the trailing zeros from the
  left side of the result have to be removed by "\apPLUSy". This macro adds
  the sign of the result too
  (lines~\cite[plus:fa] to~\cite[plus:fb])
\enditems 

\inext{apPLUSa}{^^B\cbrace}{++}

The macro \db apPLUSb "<first op><first dig><second op><second dig><first Dig>"
starts the first pass. The "<first op>" is the first operand (which have
more or equal Digits before decimal point). The "<first dig>" is the number
of digits in the first Digit in the first operand. The "<second op>" is the
second operand and the "<second dig>" is the number of digits in the first
Digit of the second operand. The "<first Dig>" is the number of Digits
before decimal point of the first operand, but without the first Digit and
multiplied by~4.

The macro"\apPLUSb" saves the second operand to "\tmpd" and appends the
$4-{}$"<second dig>" empty parameters before this operand in order to 
read desired number of digits to the first Digit of this oparand.
The macro "\apPLUSb" saves the first operand to the input queue after
"\apPLUSc" macro. It inserts the appropriate number of empty parameters (in
"\tmpc") before this operand in order to read the right number of digits in
the first attempt. It appends the "\apNL" marks to the end in order to
recognize the end of the input stream. These macros expands simply to zero
but we can test the end of input stream by "\ifx".

The macro "\apPLUSb" calculates the number of digits before decimal point
(rounded up to multiply by 4) in "\apnumD" by advancing "<first DIG>" by~4.
It initializes "\apnumZ" to zero. If the first nonzero Digit will be found
then "\apnumZ" will be set to this Digit in the "\apPLUSc" macro.

\inext{apPLUSb}{^^B\cbrace}{++}

The macro \db apPLUSc is called repeatedly. It reads one Digit from input
stream and saves it to the "\apnumY". Then it calls the \db apPLUSe, which
reads (if it is allowed, i.~e.\ if "\apnumC"{\tt\char`<}"=0") one digit from 
second operand "\tmpd" by the "\apIVread" macro. 
Then it does the addition of these digits and saves the result
into the "\OUT" macro in reverse order.

Note, that the sign "\apPLUSxA" is used when "\apnumY" is read and the sign
"\apPLUSxB" is used when advancing is performed. This means that we are
doing addition or subtraction here.

If the first nonzero Digit is reached, then the macro \db apPLUSh sets the
sign of the result to the "\apnumG" and (maybe) exchanges the "\apPLUSxA"
and "\apPLUSxB" macros (by the \db apPLUSg macro) 
in order to the internal result of the subtraction will be always non-negative.

If the end of input stream is reached, then "\apNext" (used at line~\cite[plus:nn])
is reset from its original value "\apPLUSc" to the \db apPLUSd where the
"\apnumY" is simply set to zero. The reading from input stream is finished.
This occurs when there are more Digits after decimal point in the second
operand than in the first one. If the end of input stream is reached and the
"\tmpd" macro is empty (all data from second operand was read too) then the
\db apPLUSf macro removes the rest of input stream and the first pass of the
calculation is done.

\ilabel[plus:nn]  {apNext^^E}
\inext{apPLUSc}{def\nb apPLUSh}{++}

Why there is a complication about reading one parameter from input stream
but second one from the macro "\tmpd"? This is more faster than to save both
parameters to the macros and using "\apIVread" for both because the
"\apIVread" must redefine its parameter. You can examine that this
parameter is very long.

The \db apPLUSm "<data>@" macro does transmissions calculation when
subtracting. The "<data>" from first pass is expanded in the input stream.
The "\apPLUSm" macro reads repeatedly one Digit from the "<data>" until the
stop mark is reached. The Digits are in the range $-9999$ to $9999$. If the
Digit is negative then we need to add $10000$ and set the transmission value
"\apnumX" to one, else "\apnumX" is zero. When the next Digit is processed then
the calculated transmission value is subtracted. The macro "\apPLUSw" writes
the result for each Digit "\apnumA" in the normal (human readable) order.

\inext{apPLUSm}{^^B\cbrace}{++}


The \db apPLUSp "<data>@" macro does transmissions calculation when
addition is processed. It is very similar to"\apPLUSm", but Digits are in
the range $0$ to $19998$. If the Digit value is greater then $9999$ then we
need to subtract $10000$ and set the transmission value "\apnumX" to one,
else "\apnumX" is zero.

\inext{apPLUSp}{^^B\cbrace}{++}

The \db apPLUSw writes the result with one Digit (saved in "\apnumA") to the
"\OUT" macro. The "\OUT" is initialized as empty. If it is empty (it means
we are after decimal point), then we need to write all four digits by
"\apIVwrite" macro (including left zeros) but we need to remove right zeros
by "\apREMzerosR". If the decimal point is reached, then it is saved to the
"\OUT". But if the previous "\OUT" is empty (it means there are no digits
after decimal point or all such digits are zero) then "\def\OUT{\empty}"
ensures that the "\OUT" is non-empty and the ignoring of right zeros are
disabled from now.

\inext{apPLUSw}{^^B\cbrace}{++}

The macro \db apPLUSy "<expanded OUT>@" removes left trailing zeros from the
"\OUT" macro and saves the possible minus sign by the \db apPLUSz macro.

\inext{apPLUSy}{def\nb apPLUSz}{++} 

The macro \db apPLUSxE uses the "\apROLLa" in order to shift the decimal
point of the operand. We need to set the same decimal exponent in scientific
notation before the addition or subtraction is processed.

\inext{apPLUSxE}{^^B\cbrace}{++}

\subsec Multiplication

Suppose the following multiplication example: "1234*567=699678".

\def\begtthook{\lccode`~=`\ \lowercase{\def~{\ }}}
\begtt
      Normal format:            |       Mirrored format:
             1  2  3  4  *      |       4  3  2  1  *
                5  6  7         |       7  6  5
       ----------------         |      -----------------
*7:          7 14 21 28         | *7:  28 21 14  7
*6:       6 12 18 24            | *6:     24 18 12  6
*5:    5 10 15 20               | *5:        20 15 10  5
       ----------------         |      -----------------
       6  9  9  6  7  8         |       8  7  6  9  9  6
\endtt

This example is in numeral system of base 10 only for simplification, the
macros work really with base 10000.
Because we have to do the transmissions between Digit positions
from right to left in the normal format and because it is more natural for
\TeX{} to put the data into the input stream and
read it sequentially from left to right, we use the mirrored format in our
macros. 

The macro \db apMUL prepares parameters using "\apPPab" and executes "\apMULa"

\inext{apMUL}{}{++}

The macro \db apMULa does the following:

\ilabel[mul:apE]   {apE}
\ilabel[mul:sgn]   {apSIGN}
\ilabel[mul:sgn0]  {apSIGN=0}
\ilabel[mul:diga]  {apDIG\nb tmpa}
\ilabel[mul:digb]  {apnumD=}
\ilabel[mul:ba]    {apIVmod}
\ilabel[mul:bb]    {tmpc}
\ilabel[mul:b]     {*.}
\ilabel[mul:ca]    {tmpb^^E}
\ilabel[mul:cb]    {apMULc}
\ilabel[mul:d]     {apMULd}
\ilabel[mul:g]     {apMULg}
\ilabel[mul:z]     {0-}
\ilabel[mul:zz]    {tmpa\nb OUT}

\begitems
\item * It gets the parameters in "\tmpa" and "\tmpb" preprocessed using
   the "\apPPab" macro.
\item * It evaluates the exponent of ten "\apE" which is usable when 
   the scientific notation of numbers is used
   (line~\cite[mul:apE]).
\item * It calculates "\apSIGN" of the result
  (line~\cite[mul:sgn]).
\item * If "\apSIGN=0" then the result is zero and we will do nothing more
  (line~\cite[mul:sgn0]).
\item * The decimal point is removed from the parameters by
  "\apDIG<param><register>". The "\apnumD" includes the number of digits
  before decimal point (after the "\apDIG" is used) and the
  "<register>" includes the number of digits in the rest. The "\apnumA"
  or "\apnumB" includes total number of digits in the parameters "\tmpa" or
  "\tmpb" respectively. The "\apnumD" is re-calculated: it saves the number
  of digits after decimal point in the result
  (lines~\cite[mul:diga] to~\cite[mul:digb]).
\item * 
  Let $A$ is the number of total digits in the "<param>" and let 
  $F=A \mathrel{\rm mod} 4$, but if $F=0$ then reassign it to $F=4$. Then $F$
  means the number of digits in the first Digit. This calculation
  is done by "\apIVmod<A><F>" macro. All another Digits will have four digits.
  The "\apMULb<param>@@@@" is able to read four digits, next four digits
  etc. We need to insert appropriate number of empty parameters before the "<param>".
  For example "\apMULb{}{}{}<param>@@@@" reads first only one digit from "<param>",
  next four digits etc. The appropriate number of empty parameters are prepared in
  the "\tmpc" macro
  (lines~\cite[mul:ba] to~\cite[mul:bb]).
\item * The "\apMULb" reads the "<paramA>" (all Digits) and 
  prepares the "\OUT" macro in the special interleaved format
  (described below). The format is finished by "*." in the line~\cite[mul:b]. 
\item * Analogical work is done with the second parameter "<paramB>". But this
  parameter is processed by "\apMULc", which reads Digits of the parameter
  and inserts them to the "\tmpa" in the reversed order
  (lines~\cite[mul:ca] to~\cite[mul:cb]).
\item * The main calculation is done by "\apMULd<paramB>@", which reads Digits
  from "<paramB>" (in reversed order) and does multiplication of the
  "<paramA>" (saved in the "\OUT") by these Digits
  (line~\cite[mul:d]).
\item * The "\apMULg" macro converts the result "\OUT" to the human
  readable form
  (line~\cite[mul:g]).
\item * The possible minus sign and the trailing zeros of results of the
  type ".00123" is prepared by "\apADDzeros\tmpa" to the "\tmpa" macro.
  This macro is appended to the result in the "\OUT" macro 
  (lines~\cite[mul:z] to~\cite[mul:zz]).
\enditems

\inext{apMULa}{^^B\cbrace}{++}

We need to read the two data streams when the multiplication of the "<paramA>"
by one Digit from "<paramB>" is performed and the partial sum is
actualized. First: the digits of the "<paramA>" and second: the partial sum.
We can save these streams to two macros and read one piece of information
from such macros at each step, but this si not effective because the whole
stream have to be read and redefined at each step. For \TeX{} is more
natural to put one data stream to the input queue and to read pieces of
infromation thereof. Thus we interleave both
data streams into one "\OUT" in such a way that one element of data from first
stream is followed by one element from second stream and it is followed by second
element from first stream etc. Suppose that we are at the end of $i-th$ line
of the multiplication scheme where we have the partial sums $s_n, s_{n-1},
\ldots, s_0$ and the Digits of "<paramA>" are $d_k, d_{k-1}, \ldots, d_0$.
The zero index belongs to the most right position in the mirrored format.
The data will be prepared in the form:

\begtt
. {s_n} {s_(n-1)}...{s_(k+1)} * {s_k} {d_(k-1)}...{s_1} {d_1} {s_0} {d_0} *
\endtt
%
For our example (there is a simplification: numeral system of base 10 is
used and no transmissions are processed), after second line (multiplication by 6 and 
calculation of partial sums) we have in "\OUT":

\begtt
. {28} * {45} {4} {32} {3} {19} {2} {6} {1} *
\endtt
%
and we need to create the following line during calculation of next line
of multiplication scheme:

\begtt
. {28} {45} * {5*4+32} {4} {5*3+19} {3} {5*2+6} {2} {5*1} {1} *
\endtt
%
This special format of data includes two parts. After the starting dot,
there is a sequence of sums which are definitely calculated. This sequence
is ended by first "*" mark. The last definitely calculated sum follows this
mark. Then the partial sums with the Digits of "<paramA>" are interleaved
and the data are finalized by second "*". If the calculation processes the
the second part of the data then the general task is to read two data
elements (partial sum and the Digit) and to write two data elements (the new
partial sum and the previous Digit). The line calculation starts by copying
of the first part of data until the first "*" and
appending the first data element after "*". Then the "*" is written and the
middle processing described above is started.

The macro \db apMULb "<paramA>@@@@" prepares the special format of the macro
"\OUT" described above where the partial sums are zero. It means:

\begtt
* . {d_k} 0 {d_(k-1)} 0 ... 0 {d_0} *
\endtt
%
where $d_i$ are Digits of "<paramA>" in reversed order.

The first ``sum'' is only dot. It will be 
moved before "*" during the first line processing.
Why there is such special ``pseudo-sum''? The "\apMULe" with the parameter 
delimited by the first "*" is used in the context 
"\apMULe.{<sum>}*" during the third line processing
and the dot here protects from removing the braces around the first real sum. 

\inext{apMULb}{^^B\cbrace}{++}

The macro \db apMULc "<paramB>@@@@" reads Digits from "<paramB>" and saves
them in reversed order into "\tmpa". Each Digit is enclosed by \TeX{} braces
"{}".

\inext{apMULc}{}{++}

The macro \db apMULd "<paramB>@" reads the Digits from "<paramB>"
(in reversed order),
uses them as a coefficient for multiplication stored in "\tmpnumA" and
processes the "\apMULe <special data format>" for each such coefficient.
This corresponds with one line in the multiplication scheme.

\inext{apMULd}{^^B\cbrace}{++}

The macro \db apMULe "<special data format>" copies the first part of data
format to the "\OUT", copies the next element after first "*", appends "*"
and does the calculation by "\apMULf". The \db apMULf is recursively
called. It reads the Digit to "#1" and the partial sum to the "#2" and
writes "{\appnumA*#1+#2}{#1}" to the "\OUT" (lines~\cite[mul:f1] to~\cite[mul:f2]). 
If we are at the end of data, then
"#2" is "*" and we write the "{\apnumA*#1}{#1}" followed by ending "*" to the
"\OUT" (lines~\cite[mul:f3] to~\cite[mul:f4]). 

\ilabel[mul:f1] {2^^E}
\ilabel[mul:f2] {expandafter\nb apMULf}
\ilabel[mul:f3] {ifx*}
\ilabel[mul:f4] {fi*}
\ilabel[mul:f5] {MULf0}
\inext{apMULe}{^^B\cbrace}{++}

\noindent
There are several complications in the algorithm described above. 

\begitems
\item * The result isn't saved directly to the "\OUT"
  macro, but partially into the macros "\apOUT:<num>", as described in the
  section~\inumref[aux] where the "\apOUTx" macro is defined.
\item * The transmissions between Digit positions are calculated.
  First, the transmission value "\apnumX" is set to zero in the "\apMULe".
  Then this value is subtracted from the calculated value "\apnumB" and 
  the new transmission is calculated using the "\apIVtrans" macro
  if "\apnumB"${}\ge10000$. This macro modifies "\apnumB" in order it is right
  Digit in our numeral system.
\item * If the last digit has nonzero transmission, then the calculation
  isn't finished, but the new pair "{<transmission>}{0}" is added to the
  "\OUT". This is done by recursively call of "\apMULf" at line~\cite[mul:f5].
\item * The another situation can be occurred: the last pair has both values 
  zeros. Then we needn't to write this zero to the output. This is solved by
  the test "\ifnum\the\apnumB#1=0" at line~\cite[mul:f4].
\enditems

The macro \db apMULg "<special data format>@" removes the first dot
(it is the "#1" parameter) and prepares the "\OUT" to writing the result in
reverse order, i.~e. in human readable form. The next work is done by
"\apMULh" and "\apMULi" macros. The \db apMULh repeatedly reads the first part of the
special data format (Digits of the result are here) until the first "*" 
is found. The output is stored by
"\apMULo<digits>{<data>}" macro. If the first "*" is found then the 
\db apMULi macro repeatedly reads the triple 
"{<Digit of result>}{<Digit of A>}{<next Digit of result>}" and saves the first
element in full (four-digits) form by the "\apIVwrite" if the third element
isn't the stop-mark "*". Else the last Digit (first Digit in the human
readable form) is saved by "\the", because we needn't the trailing zeros
here. The third element is put back to the input stream but it is ignored by
\db apMULj macro when the process is finished.

\inext{apMULg}{def\nb apMULj}{++}

The \db apMULo "<digits>{<data>}" appends "<data>" to the "\OUT" macro.
The number of digits after decimal point "\apnumD" is decreased by the
number of actually printed digits "<digits>". If the decimal point is to be
printed into "<data>" then it is performed by the \db apMULt macro.

\inext{apMULo}{def\nb apMULt}{++}

\subsec Division

Suppose the following example:

\begtt
    <paramA> : <paramB>        <output>
        12345:678 = [12:6=2]   2   (2->1)
2*678  -1356 
        -1215 <0 correction!   1
        12345 
1*678   -678    
         5565       [55:6=8]    9  (9->8)
9*678   -6102
         -537 <0 correction!    8
         5565
8*678   -5424
          1410      [14:6=2]     2
2*678    -1356
           0540     [05:6=0]      0
0*678        -0
            5400    [54:6=8]       9 (2x correction: 9->8, 8->7)
             ...
                    12345:678 = 182079...      
\endtt
 
We implement the division similar like pupils do it in the school (only the
numeral system with base 10000 instead 10 is actually used, but we keep with
base 10 in our illustrations). At each step of the operation, we get first
two Digits from the dividend or remainder (called partial dividend or
remainder) and do divide it by the first nonzero Digit of the divisor (called partial
divisor). Unfortunately, the resulted Digit cannot be the definitive value
of the result. We are able to find out this after the whole divisor is
multiplied by resulted Digit and compared with the whole remainder. We
cannot do this test immediately but only after a lot of following
operations (imagine that the remainder and divisor have a huge number of Digits).

We need to subtract the remainder by the multiple of the divisor at each
step. This means that we need to calculate the transmissions from the Digit
position to the next Digit position from right to left (in the scheme
illustrated above). Thus we need to reverse the order of Digits
in the remainder and divisor. We do this reversion only once at the
preparation state of the division and we interleave the data from the
divisor and the dividend (the dividend will be replaced by the remainder,
next by next remainder etc.). 

The number of Digits of the dividend can be much greater than the number of
Digits of the divisor. We need to calculate only with the first part of
dividend/remainder in such case. We need to get only one new Digit from the
rest of dividend at each calculation step. The illustration follows:

\begtt
...used dividend.. | ... rest of dividend ...    | .... divisor ....
1234567890123456789 7890123456789012345678901234 : 1231231231231231231
 xxxxxxxxxxxxxxxxxx 7 <-  calculated remainder
  xxxxxxxxxxxxxxxxx x8 <- new calculated remainder
   xxxxxxxxxxxxxxxx xx9 <- new calculated remainder   etc.
\endtt

We'll interleave only the ``used dividend'' part with the divisor at the
preparation state. We'll put the ``rest of dividend'' to the input stream in
the normal order. The macros do the iteration over calculation steps and
they can read only one new Digit from this input stream if they need it.
This approach needs no manipulation with the (potentially long) ``rest of the
dividend'' at each step. If the divisor has only one Digit (or comparable small Digits)
then the algorithm has only linear complexity with respect to the number of
Digits in the dividend.

The numeral system with the base 10000 brings a little problem: we are
simply able to calculate the number of digits which are multiple of four. But
user typically wishes another number of calculated decimal digits. We cannot
simply strip the trailing digits after calculation because the user needs to
read the right remainder. This is a reason why we calculate the number of 
digits for the first Digit of the result. All another
calculated Digits will have four digits. We need to prepare the first
``partial dividend'' in order to the $F$ digits will be calculated first.
How to do it? Suppose the following illustration of the first two Digits in the 
``partial remainder'' and ``partial divisor'':

\begtt
0000 7777 : 1111 = 7    .. one digit in the result
0007 7778 : 1111 = 70   .. two digits in the result
0077 7788 : 1111 = 700  .. three digits in the result
0777 7888 : 1111 = 7000 .. four digits in the result
7777 8888 : 1111 = ???? .. not possible in the numeral system of base 10000
\endtt
%
We need to read $F-1$ digits to the first Digit and four digits to the
second Digit of the ``partial dividend''. But this is true only if the
dividend is ``comparably greater or equal to'' divisor. The word
``comparably greater'' means that we ignore signs and the decimal point in
compared numbers and we assume the decimal points in the front of both
numbers just before the first nonzero digit. It is obvious that if the
dividend is ``comparably less'' than divisor then we need to read $F$ digits
to the first Digit.

The macro \db apDIV runs \db apDIVa macro which 
uses the "\tmpa" (dividend) and "\tmpb" (divisor)
macros and does the following work:

\ilabel[div:0]    {SIGNb=0}
\ilabel[div:sgn]  {SIGN=}
\ilabel[div:a0]   {SIGNa=0}
\ilabel[div:ape]  {apE=}
\ilabel[div:diga] {apDIG}
\ilabel[div:digb] {advance\nb apnumD}
\ilabel[div:comp] {DIVcomp}
\ilabel[div:ifap] {ifapX}
\ilabel[div:ca]   {apnumC=}
\ilabel[div:cb]   {ifnum\nb apnumC}
\ilabel[div:h]    {advance\nb apnumH}
\ilabel[div:F]    {apIVmod}
\ilabel[div:rb]   {apIVread\nb tmpb}
\ilabel[div:ra]   {apIVreadX}
\ilabel[div:rc]   {apIVread\nb tmpa}
\ilabel[div:xa]   {apDIVxA}
\ilabel[div:xb]   {apDIVxB}
\ilabel[div:xout] {edef\nb XOUT}
\ilabel[div:outa] {edef\nb OUT}
\ilabel[div:outb] {apADDzeros}
\ilabel[div:z]    {apnumZ=}
\ilabel[div:next] {apNext=}
\ilabel[div:add]  {apnumZ=\nb apnumD}
\ilabel[div:rema] {apDIVv}
\ilabel[div:remb] {apROLLa}

\begitems
\item * If the divisor "\tmpb" is equal to zero, print error and do nothing more
  (line~\cite[div:0]).
\item * The "\apSIGN" of the result is calculated
  (line~\cite[div:sgn]).
\item * If the dividend "\tmpa" is equal to zero, then "\OUT" and "\XOUT" are
  zeros and do nothing more
  (line~\cite[div:a0]).
\item * Calculate the exponent of ten "\apE" when scientific notation is used
  (Line~\cite[div:ape]).
\item * The number of digits before point are counted by "\apDIG" macro
  for both parameters. The difference is saved to "\apnumD" and this is the
  number of digits before decimal point in the result (the exception is
  mentioned later). The "\apDIG" macro removes the decimal point and
  (possible) left zeros from its parameter and saves the result to the 
  "\apnumD" register
  (lines~\cite[div:diga] to~\cite[div:digb]).
\item * The macro "\apDIVcomp<paramA><paramB>" determines if the "<paramA>"
  is ``comparably greater or equal'' to "<paramB>". The result is stored in
  the boolean value "apX". We can ask to this by
  the "\ifapX<true>\else<false>\fi" construction 
  (line~\cite[div:comp]).
\item * If the dividend is ``comparably greater or equal'' to the divisor,
  then the position of decimal point in the result "\apnumD" has to be shifted by one
  to the right. The same is completed with "\apnumH" where the position of
  decimal point of the remainder will be stored
  (line~\cite[div:ifap]).
\item * The number of desired digits in the result "\apnumC" is calculated
  (lines~\cite[div:ca] to~\cite[div:cb]).
\item * If the number of desired digits is zero or less than zero then do nothing more
  (line~\cite[div:cb]).
\item * Finish the calculation of the position of decimal point in the
  remainder "\apnumH"
  (line~\cite[div:h]).
\item * Calculate the number of digits in the first Digit "\apnumF"
  (line~\cite[div:F]).
\item * Read first four digits of the divisor by the macro
  "\apIVread<sequence>". Note that this macro puts trailing
  zeros to the right if the data stream "<param>" is shorter than four
  digits. If it is empty then the macro returns zero. The returned value is saved 
  in "\apnumX" and the "<sequence>" is redefined by new value of 
  the "<param>" where the read digits are removed
  (line~\cite[div:rb]).
\item * We need to read only "\apnumF" (or "\apnumF"${}-1$) digits from the
  "\tmpa". This is done by the "\apIVreadX" macro at line~\cite[div:ra].
  The second Digit of the ``partial dividend'' includes four digits and it
  is read by "\apIVread" macro at line~\cite[div:rc].
\item * The ``partial dividend'' is saved to the "\apDIVxA" macro and 
  the ``partial divisor'' is stored to the "\apDIVxB" macro. Note, that
  the second Digit of the ``partial dividend'' isn't expanded by simply
  "\the", because when "\apnumX=11" and "\apnumA=2222" (for example), then
  we need to save "22220011". These trailing zeros from left are written by
  the "\apIVwrite" macro
  (lines~\cite[div:xa] to~\cite[div:xb]). 
\item * The "\XOUT" macro for the currently computed remainder is
  initialized. The special
  interleaved data format of the remainder "\XOUT" is described below
  (line~\cite[div:xout]).
\item * The "\OUT" macro is initialized. 
  The "\OUT" is generated as literal macro. First possible "<sign>", then digits.
  If the number of effective digits before decimal point "\apnumD" is
  negative, the result will be in the form ".000123" and we need to add the zeros
  by the "\apADDzeros" macro
  (lines~\cite[div:outa] to~\cite[div:outb]). 
\item * The registers for main loop are initialized. The "\apnumE" 
  signalizes that the remainder of the partial step is zero and we can stop
  the calculation. The "\apnumZ" will include the Digit from the input
  stream where the ``rest of dividend'' will be stored
  (line~\cite[div:z]).
\item * The main calculation loop is processed by the "\apDIVg" macro
  (line~\cite[div:next]).
\item * If the division process stops before the position of the decimal
  point in the result (because there is zero remainder, for example) then we
  need to add the rest of zeros by "\apADDzeros" macro. This is actual for the
  results of the type "1230000"
  (line~\cite[div:add]). 
\item * If the remainder isn't equal to zero, we need to extract the digits
  of the remainder from the special data formal to the human readable
  form. This is done by the "\apDIVv" macro. The decimal point is inserted
  to the remainder by the "\apROLLa" macro
  (lines~\cite[div:rema] to~\cite[div:remb]).
\enditems

\inext{apDIVa}{^^B\cbrace}{++}

The macro \db apDIVcomp "<paramA><paramB>" provides the test if the
"<paramA>" is ``comparably greater or equal'' to "<paramB>". Imagine 
the following examples:

\begtt
123456789 : 123456789 = 1
123456788 : 123456789 = .99999999189999992628
\endtt
%
The example shows that the last digit in the operands can be important for
the first digit in the result. This means that we need to compare whole
operands but we can stop the comparison when the first difference in the
digits is found. This is lexicographic ordering. Because we don't assume
the existence of e\TeX{} (or another extensions), we need to do this
comparison by macros. We set the "<paramA>" and "<paramB>" to the "\tmpc" and
"\tmpd" respectively. The trailing "\apNL"s are appended. 
The macro \db apDIVcompA reads first 8 digits from
first parameter and the macros \db apDIVcompB reads first 8 digits from
second parameter and does the comparison. If the numbers are equal then the
loop is processed again.

\inext{apDIVcomp}{\count=3 ^^B\cbrace}{++}

The format of interleaved data with divisor and remainder is described here.
Suppose this partial step of the division process:

\begtt
  R0    R1    R2    R3  ...    Rn        :   d1 d2 d3 ... dn  = ...A...
   @ -A*d1 -A*d2 -A*d3  ... -A*dn                [ R0 R1 : d1 = A ]
   0    N0    N1    N2  ...    N(n-1) Nn
\endtt 

The $R_k$ are Digits of the remainder, $d_k$ are Digits of the divisor. The
$A$ is calculated Digit in this step. The calculation of the Digits of the new 
remainder is hinted here. We need to do this from right to left because of
the transmissions. This implies, that the interleaved format of "\XOUT" is
in the reverse order and looks like 

\begtt
 dn  Rn  ...  d3  R3  d2  R2  d1  R1  @  R0
\endtt
%
for example for "<paramA>=1234567893", "<paramB>=454502" (in the human readable form) 
the "\XOUT" should be "{200}{9300}{4545}{5678}@{1234}" (in the special format).
The Digits are separated by \TeX{} braces "{}".
The resulted digit for this step is $A=12345678/1415=2716$. 

The calculation of the new remainder takes $d_k$, $R_k$, $d_{k-1}$ for each
$k$ from $n$ to $0$ and creates the Digit of the new remainder $N_{k-1} = R_k -
A\cdot d_k$ (roughly speaking, actually it calculates transmissions too) and
adds the new couple $d_{k-1}$~$N_{k-1}$ to the new version of "\XOUT" macro.
The zero for $N_{-1}$ should be reached. If it is not completed then a
correction of the type $A\mathrel{:=}A-1$ have to be done and the
calculation of this step is processed again.

The result in the new "\XOUT" should be (after one step is done):

\begtt
 dn  Nn  ...  d3  N3  d2  N2  d1  N1  @  N0
\endtt
%
where $N_n$ is taken from the ``rest of the dividend'' from the input stream.

The initialization for the main loop is done by \db apDIVg macro. It reads
the Digits from "\tmpa" (dividend) and "\tmpb" macros (using "\apIVread")
and appends them to the "\XOUT" in described data format. This initialization 
is finished when the "\tmpb" is empty. If the "\tmpa" is not empty in such
case, we put it to the input stream using "\expandafter\apDIVh\tmpa"
followed by four "\apNL"s (which simply expands zero digit) followed by
stop-mark. The "\apDIVh" reads one Digit from input stream. 
Else we put only the stop-mark to the input stream and run the
"\apDIVi". The "\apNexti" is set to the "\apDIVi", so the macro "\apDIVh" will
be skipped forever and no new Digit is read from input stream. 

\inext{apDIVg}{^^B\cbrace}{++}

The macro \db apDIVh reads one Digit from data stream (from the rest of the
dividend) and saves it to the "\apnumZ" register. If the stop-mark is
reached (this is recognized that the last digit is the "\apNL"), 
then "\apNexti" is set to "\apDIVi", so the "\apDIVh" is never
processed again.

\inext{apDIVh}{^^B\cbrace}{++}

The macro \db apDIVi contains the main loop for division calculation. The
core of this loop is the macro call "\apDIVp<data>" which adds next digit
to the "\OUT" and recalculates the remainder. 

The macro "\apDIVp" decreases the "\apnumC" register (the desired digits in the
output) by four, because four digits will be calculated in the next step.
The loop is processed while "\apnumC" is positive. The "\apnumZ" (new Digit
from the input stream) is initialized as zero and the "\apNexti" runs the
next step of this loop. This step starts from "\apDIVh" (reading one digit
from input stream) or directly the "\apDIVi" is repeated. If the remainder
from the previous step is calculated as zero ("\apnumE=0"), then we stop
prematurely. The \db apDIVj macro is called at the end of the loop because
we need to remove the ``rest of the dividend'' from the input stream. 

\inext{apDIVi}{def\nb apDIVj}{++}

The macro \db apDIVp "<interleaved data>@" does the basic setting 
before the calculation through the
expanded "\XOUT" is processed. The \db apDIVxA includes the ``partial
dividend'' and the \db apDIVxB includes the ``partial divisor''.
We need to do
"\apDIVxA" over "\apDIVxB" in order to obtain the next digit in the output.
This digit is stored in "\apnumA". 
The "\apnumX" is the transmission value, the "\apnumB", "\apnumY" will be the
memory of the last two calculated Digits in the remainder. The "\apnumE"
will include the maximum of all digits of the new remainder. If it is equal to
zero, we can finish the calculation.

The new interleaved data will be stored to the "\apOUT:<num>" macros in
similar way as in the "\apMUL" macro. This increases the speed of the
calculation. The data "\apnumO", "\apnumL" and "\apOUTl" for this purpose 
are initialized.

The "\apDIVq" is started and the tokens "0\apnumZ" are appended to the input
stream (i.~e.\ to the expanded "\XOUT". This zero will be ignored and the
"\apnumZ" will be used as a new $N_n$, i.~e.\ the Digit from the ``rest of the
dividend''.

\inext{apDIVp}{^^B\cbrace}{++}

The macro \db apDIVq $\langle d_k\rangle\,\langle R_k\rangle\,\langle d_{k-1}\rangle$ 
calculates the Digit of the new remainder $N_{k-1}$ 
by the formula $N_{k-1} = - A\cdot d_k +R_k - X$ where $X$ is the
transmission from the previous Digit. If the result is negative, we need to
add minimal number of the form $X\cdot 10000$ in order the result is
non-negative. Then the $X$ is new transmission value.
The digit $N_k$ is stored in the "\apnumB"
register and then it is added to "\apOUT:<num>" in the order $d_{k-1}\, N_{k-1}$.
The "\apnumY" remembers the value of the previous "\apnumB".
The $d_{k-1}$ is put to the input stream back in order it would be read by
the next "\apDIVq" call. 

If $d_{k-1}={}$"@" then we are at the end of the remainder calculation and
the "\apDIVr" is invoked.

\inext{apDIVq}{^^B\cbrace}{++}

The \db apDIVr macro does the final work after the calculation of new
remainder is done. It tests if the remainder is OK, i.~e.\ the transmission
from the $R_1$ calculation is equal to $R_0$. If it is true then new Digit
"\apnumA" is added to the "\OUT" macro else the "\apnumA" is decreased (the
correction) and the calculation of the remainder is run again.

If the calculated Digit and the remainder are OK, then we do following:
\begitems
\item * The new "\XOUT" is created from "\apOUT:<num>" macros using
   "\apOUTs" macro.
\item * The "\apnumA" is saved to the "\OUT". This is done with care.
   If the "\apnumD" (where the decimal point is measured from the actual
   point in the "\OUT") is in the interval $[0, 4)$ then the decimal point
   have to be inserted between digits into the next Digit. This is done by
   "\apDIVt" macro. If the remainder is zero ("\apnumE=0"), then the right
   trailing zeros are removed from the Digit by the "\apDIVu" and the shift
   of the "\apnumD" register is calculated from the actual digits.
   All this calculation is done in "\tmpa" macro. The last step is adding
   the contents of "\tmpa" to the "\OUT".
\item * The "\apnumD" is increased by the number of added digits.
\item * The new ``partial dividend'' is created from "\apnumB" and
   "\apnumY".
\enditems

\inext{apDIVr}{^^B\cbrace}{++}

The \db apDIVt macro inserts the dot into digits quartet (less than four
digits are allowed too) by the "\apnumD" value. This value is assumed in the
interval $[0, 4)$. The expandable macro "\apIVdot<shift><data>" is used for
this purpose. The result from this macro has to be expanded twice.

\inext{apDIVt}{}{++}

The \db apDIVu macro removes trailing zeros from the right and removes the
dot, if it is the last token of the "\tmpa" after removing zeros. It uses
expandable macros "\apREMzerosR<data>" and "\apREMdotR<data>".

\inext{apDIVu}{}{++}

The rest of the code concerned with the division does an extraction of the
last remainder from the data and this value is saved to the \db XOUT macro in
human readable form. The \db apDIVv macro is called repeatedly on the
special format of the "\XOUT" macro and the new "\XOUT" is created. 
The trailing zeros from right are ignored by the \db apDIVw.

\inext{apDIVv}{\empty}{+-}


\subsec Power to the Integer

The \db apPOW macro does the power to the integer exponent only. The \db
apPOWx is equivalent to "\apPOW" and it is used in "\evaldef" macro for the "^"
operator. If you want to redefine the meaning of the "^" operator then
redefine the "\apPOWx" sequence.

\inext{apPOWx}{}{++}

We can implement the power to the integer as repeated multiplications. This
is simple but slow. The goal of this section is to present the power to the
integer with some optimizations.

Let $a$ is the base of the powering computation and $d_1, d_2, d_3, \dots,
d_n$ are binary digits of the exponent (in reverse order). Then 
$$
  p = a^{1\,{d_1}+2\,{d_2}+2^2\,{d_3}+\cdots+2^{n-1}\,{d_n}} =
  (a^1)^{d_1}\cdot(a^2)^{d_2}\cdot(a^{2^2})^{d_3}\cdot (a^{2^{n-1}})^{d_n}.
$$
If $d_i=0$ then $z^{d_i}$ is one and this can be omitted from the queue of 
multiplications. If $d_i=1$ then we keep $z^{d_i}$ as $z$ in the queue.
We can see from this that the $p$ can be computed by the
following algorithm:

\begtt
(* "a" is initialized as the base, "e" as the exponent *)
p := 1;  
while (e>0) {
   if (e%2) p := p*a;
   e := e/2;
   if (e>0) a := a*a;
}
(* "p" includes the result *)
\endtt

The macro \db apPOWa does the following work.

\ilabel[pow:sgna] {SIGNa=}
\ilabel[pow:sgnb] {SIGNb=}
\ilabel[pow:ea]   {non-integer}
\ilabel[pow:eb]   {output?}
\ilabel[pow:ape]  {apE=\nb apEa}
\ilabel[pow:odd]  {ifodd}
\ilabel[pow:dig]  {apDIG\nb tmpa}
\ilabel[pow:aa]   {apIVmod}
\ilabel[pow:ab]   {ifcase}
\ilabel[pow:ba]   {apMULb}
\ilabel[pow:bb]   {*.\nb OUT}
\ilabel[pow:p]    {1*}
\ilabel[pow:rev]  {apREV}
\ilabel[pow:b]    {apPOWb}
\ilabel[pow:g]    {apPOWg}
\ilabel[pow:outa] {-\nb OUT}
\ilabel[pow:outb] {apROLLa}
\ilabel[pow:r]    {apDIVa}

\begitems
\item * After using "\apPPab" the base parameter is saved in "\tmpa" and the 
   exponent is saved in "\tmpb".
\item * In trivial cases, the result is set without any computing
   (lines~\cite[pow:sgna] and~\cite[pow:sgnb]).
\item * If the exponent is non-integer or it is too big then the error
   message is printed and the rest of the macro is skipped by the "\apPOWe"
   macro
   (lines~\cite[pow:ea] to~\cite[pow:eb]).
\item * The "\apE" is calculated from "\apEa" (line~\cite[pow:ape]).
\item * The sign of the result is negative only if the "\tmpb" is odd and
   base is negative
  (line~\cite[pow:odd]).
\item * The number of digits after decimal point for the result
  is calculated and saved to "\apnumD". The total number of digits of the
  base is saved to "\apnumC".
  (line~\cite[pow:dig]).
\item * The first Digit of the base needn't to include all four digits, but
  other Digits do it. The similar trick as in "\apMULa" is used here
  (lines~\cite[pow:aa] to~\cite[pow:ab]).
\item * The base is saved in interleaved reversed format (like in
  "\apMULa") into the "\OUT" macro by the "\apMULb" macro. Let it be the 
  $a$ value from our algorithm described above
  (lines~\cite[pow:ba] and~\cite[pow:bb]).
\item * The initial value of $p=1$ from our algorithm is set in interleaved
  format into "\tmpc" macro
  (line~\cite[pow:p]).
\item * The main loop described above is processed by "\apPOWb" macro.
  (line~\cite[pow:b]).
\item * The result in "\tmpc" is converted into human readable form by the
  "\apPOWg" macro and it is stored into the "\OUT" macro
  (line~\cite[pow:g]).
\item * If the result is negative or decimal point is needed to print then
  use simple conversion of the "\OUT" macro (adding minus sign) or using
  "\apROLLa" macro
  (lines~\cite[pow:outa] and~\cite[pow:outb]).
\item * If the exponent is negative then do the $1/r$ calculation,
  where $r$ is previous result
  (line~\cite[pow:r]).
\enditems

\inext{apPOWa}{^^B\cbrace}{++}

The macro \db apPOWb is the body of the loop in the algorithm described above. 
The code part after "\ifodd\apnumE" does "p := p*a". In order to do this, we need
to convert "\OUT" (where "a" is stored) into normal format using "\apPOWd".
The result is saved in "\tmpb". Then the multiplication is done by "\apMULd"
and the result is normalized by the "\apPOWn" macro. Because "\apMULd"
works with "\OUT" macro, we temporary set "\tmpc" to "\OUT".

The code part after "\ifnum\apnumE"{\tt\char`<}"0" does "a := a*a" using the "\apPOWt"
macro. The result is normalized by the "\apPOWn" macro.

\inext{apPOWb}{^^B\cbrace}{++}

The macro \db apPOWd "<initialized interleaved reversed format>" extracts the
Digits from its argument and saves them to the "\tmpb" macro.

\inext{apPOWd}{^^B\cbrace}{++}

The \db apPOWe macro skips the rest of the body of the "\apPOWa" macro to the
"\relax". It is used when "\errmessage" is printed.

\inext{apPOWe}{}{++}

The \db apPOWg macro provides the conversion from interleaved reversed format to 
the human readable form and save the result to the "\OUT" macro.
It ignores the first two elements from the format and runs \db apPOWh.

\inext{apPOWg}{^^B\cbrace}{++}

The normalization to the initialized interleaved format of the "\OUT" is done
by the \db apPOWn "<data>@" macro. The \db apPOWna reads the first part of
the "<data>" (to the first "*", where the Digits are non-interleaved. The
\db apPOWnn reads the second part of "<data>" where the Digits of the result
are interleaved with the digits of the old coefficients. We need to set the
result as a new coefficients and prepare zeros between them for the new 
calculation. The dot after the first "*" is not printed (the zero is printed
instead it) but it does not matter because this token is simply ignored
during the calculation.

\inext{apPOWn}{def\nb apPOWnn}{++}

The powering to two ("\OUT:=\OUT^2") is provided by the \db apPOWt "<data>"
macro. The macro \db apPOWu is called repeatedly for each "\apnumA="Digit from the
"<data>". One line of the multiplication scheme is processed by the \db apPOWv "<data>"
macro. We can call the "\apMULe" macro here but we don't do it because a slight 
optimization is used here. You can try to multiply the number with digits "abcd" by itself
in the mirrored multiplication scheme. You'll see that first line includes
"a^2 2ab 2ac 2ad", second line is intended by two columns and includes "b^2 2bc 2bd",
next line is indented by next two columns and includes "c^2 2cd" and the last line is
intended by next two columns and includes only "d^2". Such calculation is slightly
shorter than normal multiplication and it is implemented in the "\apPOWv" macro.

\inext{apPOWt}{\empty}{+-}

\subsec apROLL, apROUND and apNORM Macros

The macros \db apROLL , \db apROUND and \db apNORM are implemented by
"\apROLLa", "\apROUNDa" and "\apNORMa" macros with common format of the
parameter text: "<expanded sequence>.@<sequence>" where "<expanded
sequence>" is the expansion of the macro "<sequence>" (given as first
parameter of "\apROLL", "\apROUND" and "\apNORM", but without optionally
minus sign. If there was the minus sign then "\apnumG=-1" else "\apnumG=1".
This preparation of the parameter "<sequence>" is done by the "\apPPs"
macro. The second parameter of the macros "\apROLL", "\apROUND" and
"\apNORM" is saved to the "\tmpc" macro.

\db apROLLa "<param>.@<sequence>" shifts the decimal point of the
"<param>" by "\tmpc" positions to the right (or to the left, if
"\tmpc" is negative) and saves the result to the "<sequence>" macro.
The "\tmpc" value is saved to the "\apnumA" register and the "\apROLLc" is
executed if we need to shift the decimal point to left. Else "\apROLLg" is
executed.

\inext{ROLLa}{ROLLc}{++}

The \db apROLLc "<param>.@<sequence>" shifts the decimal point to left
by the "-\apnumA" decimal digits.
It reads the tokens from the input stream until the dot is found
using \db apROLLd macro.
The number of such tokens is set to the "\apnumB" register and tokens 
are saved to the "\tmpc" macro. 
If the dot is found then \db apROLLe does the following: if the number of
read tokens is greater then the absolute value of the "<shift>", then  
the number of positions from the most left digit of the number to the
desired place of the dot is set to the "\apnumA" register a the dot is
saved to this place by "\apROLLi<parameter>.@<sequence>". Else the new number looks
like ".000123" and the right number of zeros are saved to the "<sequence>" using
the "\apADDzeros" macro and the rest of the input stream (including expanded 
"\tmpc" returned back) is appended to the macro "<sequence>" by the 
\db apROLLf "<param>.@" macro. 

\inext{apROLLc}{def\nb apROLLf}{++}

The \db apROLLg "<param>.@<sequence>" shifts the decimal point to the right by
"\apnumA" digits starting from actual position of the input stream.
It reads tokens from the input stream by the \db apROLLh and saves them to the
"\tmpd" macro where the result will be built. 
When dot is found the \db apROLLi is processed. It reads next
tokens and decreases the "\apnumA" by one for each token. It ends (using
"\apROLLj\apROLLk") when "\apnumA" is equal to zero.
If the end of the input stream is reached (the "@" character) then the zero
is inserted before this character (using "\apROLLj\apROLLi0@"). This
solves the situations like "123",~"<shift>=2",~$\to$~"12300".

\ilabel[rol:g1]  {0-}
\inext{apROLLg}{^^B\cbrace}{++} 

The "\apROLLg" macro initializes "\apnumB=1" if the "<param>" doesn't begin
by dot. This is a flag that all digits read by "\apROLLi" have to be saved. 
If the dot begins, then the number can look like ".000123" (before moving
the dot to the right) and we need to
ignore the trailing zeros. The "\apnumB" is equal to zero 
in such case and this is set to "1" if here is first non-zero digit. 

The \db apROLLj macro closes the conditionals and runs its parameter
separated by "\fi". It skips the rest of the "\apROLLi" macro too.

\inext{apROLLj}{}{++}

The macro \db apROLLk puts the decimal point to the "\tmpd" at current
position (using "\apROLLn") if the input stream is not fully read. Else it
ends the processing. The result is an integer without decimal digit in such
case.

\inext{apROLLk}{^^B\cbrace}{++}

The macro \db apROLLn reads the input stream until the dot is found. 
Because we read now the digits after a
new position of the decimal point we need to check situations of the type
"123.000" which is needed to be written as "123" without decimal point. 
This is a reason of a little complication. We save all digits to the "\tmpc"
macro and calculate the sum of such digits in "\apnumB" register. If this
sum is equal to zero then we don't append the ".\tmpc" to the "\tmpd".
The macro "\apROLLn" is finished by the \db apROLLo "@<sequence>" macro, which removes
the last token from the input stream and defines "<sequence>" as "\tmpd".

\inext{apROLLn}{def\nb apROLLo}{++}

The macro \db apROUNDa "<param>.@<sequence>" rounds the number given in the
"<param>". The number of digits after decimal point "\tmpc" is saved to
"\apnumD". If this number is negative then "\apROUNDe" is processed
else the \db apROUNDb reads the "<param>" to the decimal point and saves  
this part to the "\tmpc" macro. The "\tmpd" macro (where the rest after
decimal point of the number will be stored) is initialized to empty and the 
\db apROUNDc is started. This macro reads one token
from input stream repeatedly until the number of read tokens is equal to
"\apnumD" or the stop mark "@" is reached. All tokens are saved to "\tmpd".
Then the \db apROUNDd macro reads the rest of the "<param>", saves it to the
"\XOUT" macro and defines "<sequence>" (i.~e.\ "#2") as the rounded number.

\inext{apROUNDa}{\count=3 ^^B\cbrace}{++}

The macro \db apROUNDe solves the ``less standard'' problem when rounding to
the negative digits after decimal point "\apnumD", i.~e.\ we need to set
"-\apnumD" digits before decimal point to zero. The solution is to remove
the rest of the input stream, use "\apROLLa" to shift the decimal point left
by "-\apnumD" positions, use "\apROUNDa" to remove all digits after decimal
point and shift the decimal point back to its previous place.

\inext{apROUNDe}{^^B\cbrace}{++}

The macro \db apNORMa redefines the "<sequence>" in order to remove minus
sign because the "\apDIG" macro uses its parameter without this sign. Then
the \db apNORMb "<sequence><parameter>@" is executed where the dot in the
front of the parameter is tested. If the dot is here then the "\apDIG" macro measures
the digits after decimal point too and the \db apNORMc is executed (where
the "\apROLLa" shifts the decimal point from the right edge of the number).
Else the "\apDIG" macro doesn't measure the digits after decimal point and the
\db apNORMd is executed (where the "\apROLLa" shifts the decimal point from 
the left edge of the number).

\inext{apNORMa}{\count=3 ^^B\cbrace}{++}

The macro \db apEadd "<sequence>" adds "E" in scientific format into "<sequence>" macro 
and \db apEnum "<sequence>" normalizes the number in the "<sequence>". After 
processing these macros the "\apE" register is set to zero.

\inext{apEadd}{\empty}{+-}


\subsec [aux] Miscelaneous Macros

The macro \db apEND closes the "\begingroup" group, but keeps the values of
"\OUT" macro and "\apSIGN", "\apE" registers.

\inext{apEND}{^^B\cbrace}{++}

The macro \db apDIG "<sequence><register or relax>" reads the content of
the macro "<sequence>" and counts the number of digits in this macro before
decimal point and saves it to "\apnumD" register. If the macro "<sequence>" 
includes decimal point then it is redefined with the same content but without
decimal point. The numbers in the form ".00123" are replaced by "123" 
without zeros, but "\apnumD=-2" in this example.
If the second parameter of the "\apDIG" macro is
"\relax" then the number of digits after decimal point isn't counted. Else
the number of these digits is stored to the given "<register>". 

The macro "\apDIG" is developed in order to do minimal operations over a
potentially long parameters. It assumes that "<sequence>" includes a number
without "<sign>" and without left trailing zeros. This is true after
parameter preparation by the "\apPPab" macro.

The macro "\apDIG" prepares an incrementation in "\tmpc" if the second
parameter "<register>" isn't "\relax". It initializes "\apnumD" and "<register>".
It runs \db apDIGa "<data>..@<sequence>" which increments the "\apnumD" until
the dot is found. Then the "\apDIGb" is executed (if there are no digits
before dot) or the "\apDIGc" is called (if there is at least one digit
before dot). The \db apDIGb ignores zeros immediately after dot. The \db
apDIGc reads the rest of the "<data>" to the "#1" and saves it to the
"\tmpd" macro. It runs the counter over this "<data>" \db apDIGd "<data>@"
only if it is desired ("\tmpc" is non-empty). Else the "\apDIGe" is
executed. The \db apDIGe "<dot or nothing>@<sequence>" redefines
"<sequence>" if it is needed. Note, that "#1" is empty if and only if the
"<data>" include no dot (first dot was reached as the first dot from
"\apDIG", the second dot from "\apDIG" was a separator of "#1" in "\apDIGc"
and there is nothing between the second dot and the "@" mark. The
"<sequence>" isn't redefined if it doesn't include a dot. Else the sequence
is set to the "\tmpd" (the rest after dot) if there are no digits before dot.
Else the sequence is redefined using expandable macro \db apDIGf.

\inext{apDIG}{def\nb apDIGf}{++}

The macro \db apIVread "<sequence>" reads four digits from 
the macro "<sequence>", sets "\apnumX" as the Digit consisting from read digits and
removes the read digits from "<sequence>".
It internally expands "<sequence>", adds the "\apNL" marks and runs
\db apIVreadA macro which sets the "\apnumX" and redefines "<sequence>".

The usage of the \db apNL as a stop-marks has the advantage: they act as
simply zero digits in the comparison but we can ask by "\ifx" if this 
stop mark is reached. The "#5" parameter of "\apIVreadA" is separated by
first occurrence of "\apNL", i.~e.\ the rest of the macro "<sequence>" is
here.

\inext{apNL}{def\nb apIVreadA}{++}

The macro \db apIVreadX "<num><sequence>" acts similar as
"\apIVread<sequence>", but only "<num>" digits are read. The "<num>" is
expected in the range 0 to 4. The macro prepares the appropriate number of empty
parameters in "\tmpc" and runs "\apIVreadA" with these empty parameters
inserted before the real body of the "<sequence>".

\inext{apIVreadX}{^^B\cbrace}{++}

The macro \db apIVwrite "<num>" expands the digits from "<num>" register.
The number of digits are four. If the "<num>" is less than "1000" then left
zeros are added.

\inext{apIVwrite}{}{++}

The macro \db apIVtrans calculates the transmission for the next Digit.
The value (greater or equal 10000) is assumed to be in "\apnumB". The new
value less than 10000 is stored to "\apnumB" and the transmission value is
stored in "\apnumX". The constant \db apIVbase is used instead of literal 10000
because it is quicker.

\inext{apIVbase}{^^B\cbrace}{++}

The macro \db apIVmod "<length><register>" sets "<register>" to the number
of digits to be read to the first Digit, if the number has "<length>" digits
in total. We need to read all Digits with four digits, only first Digit can
be shorter.

\inext{apIVmod}{}{++}

The macro \db apIVdot "<num><param>" adds the dot into "<param>". Let
$K={}$"<num>" and $F$ is the number of digits in the "<param>". 
The macro expects that $K\in[0,4)$ and $F\in(0,4]$.
The macro inserts the dot after $K$-th digit
if $K<F$. Else no dot is inserted.
It is expandable macro, but two full expansions are needed.
After first expansion the result looks like 
"\apIVdotA<dots><param>....@" where
"<dots>" are the appropriate number of dots. Then the \db apIVdotA reads
the four tokens (maybe the generated dots), ignores the dots while printing
and appends the dot after these four tokens, if the rest "#5" is non-empty. 

\inext{apIVdot}{^^B\cbrace}{++}

The expandable macro \db apNUMdigits "{<param>}" expands (using the \db
apNUMdigitsA macro) to the number of
digits in the "<param>". We assume that maximal number of digits will be
four.

\inext{apNUMdigits}{\empty}{+-}

The macro \db apADDzeros "<sequence>" adds "\apnumZ" zeros to the macro
"<sequence>".

\inext{apADDzeros}{^^B\cbrace}{++}

The expandable macro \db apREMzerosR "{<param>}" removes right trailing zeros from the
"<param>". It expands to "\apREMzerosRa<param>@0@!". The
macro \db apREMzerosRa reads all text terminated by "0@" to "#1". This
termination zero can be the most right zero of the "<param>" (then "#2" is
non-empty) or "<param>" hasn't such zero digit (then "#2" is empty). If "#2"
is non-empty then the "\apREMzerosRa" is expanded again in the recursion.
Else \db apREMzerosRb removes the stop-mark "@" and the expansion is
finished.

\inext{apREMzerosR}{def\nb apREMzerosRb}{++}

The expandable macro \db apREMdotR "{<param>}" removes right trailing dot from
the "<param>" if exists. It expands to \db apREMdotRa and works similarly as
the "\apREMzerosR" macro.

\inext{apREMdotR}{def\nb apREMdotRa}{++}

The \db apREMfirst "<sequence>" macro removes the first token from the
"<sequence>" macro. It can be used for removing the ``minus'' sign from the
``number-like'' macros.

\inext{apREMfirst}{\empty}{+-}

The writing to the "\OUT" in the "\apMUL", "\apDIV" and "\apPOW" macros is optimized, which 
decreases the computation time with very large numbers ten times and more.
We can do simply "\edef\OUT{\OUT<something>}" instead of

\begtt
\expandafter\edef\csname apOUT:\apOUTn\endcsname
                 {\csname apOUT:\apOUTn\endcsname<something>}%
\endtt
%
but "\edef\OUT{\OUT<something>}" is typically processed very often 
over possibly very long macro (many thousands of tokens). 
It is better to do "\edef" over more short macros "\apOUT:0", "\apOUT:1", etc.
Each such macro includes only 7 Digits pairs of the whole "\OUT". 
The macro \db apOUTx is invoked each 7 digit (the "\apnumO" register is
decreased).
It uses "\apnumL" value which is the "<num>" part of the next "\apOUT:<num>"
control sequence. The "\apOUTx" defines this "<num>" as \db apOUTn and 
initializes "\apOUT:<num>" as
empty and adds the "<num>" to the list \db apOUTl.
When the creating of the next "\OUT" macro is definitely finished, the "\OUT" macro is
assembled from the parts "\apOUT:0", "\apOUT:1" etc.\ by the macro 
\db apOUTs \unskip~"<list of numbers><dot><comma>". 

\inext{apOUTx}{def\nb apOUTs}{++}

If a ``function-like'' macro needs a local counters then it is recommended
to enclose all calculation into a group "\apINIT" ... "\apEND". The
\db apINIT opens the group and prepares a short name "\do" and the macro
"\localcounts<counters>;". The typical usage is:

\begtt
\def\MACRO#1{\relax \apINIT % function-like macro, \apINIT
   \evaldef\foo{#1}%        % preparing the parameter
   \localounts \N \M \K ;%  % local \newcount\N \newcount\M \newcount\K
   ...                      % calculation 
   \apEND                   % end of \apINIT group
}
\endtt 

Note that "\localcounts" is used after preparing the parameter using "\evaldef" 
in odrer to avoid name conflict of local declared ``variables'' and ``variables''
used in "#1" by user.

The "\apINIT" sets locally \db localcounts to be equivalent to \db apCOUNTS.
This macro increases the top index of allocated counters "\count10" 
(used in plain \TeX) locally
and declares the counters locally. It means that if the group is closed then 
the counters are deallocated and top index of counters "\count10" is returned 
to its original value.

\inext{apINIT}{^^B\cbrace}{++}

The macro \db do "<sequence>=<calculation>;" allows to write
the calculation of Polish expressions more synoptic:

\begtt
\do \X=\apPLUS{2}{\the\N};%    % is equivalent to:
\apPLUS{2}{\the\N}\let\X=\OUT  
\endtt

The "\do" macro is locally set to be equivalent to \db apEVALxdo .

\inext{apEVALxdo}{\empty}{+-}

The \db apRETURN macro must be followed by "\fi". It skips the rest of the
block "\apINIT"..."\apEND" typically used in ``function-like'' macros.
The \db apERR "{<text>}" macro writes "<text>" as error message and returns
the processing of the block enclosed by "\apINIT"..."\apEND". User can
redefine it if the "\errmessage" isn't required. 

\inext{apRETURN}{\empty}{+-}

The \db apNOPT macro removes the "pt" letters after expansion of "<dimen>"
register. This is usable when we do a classical "<dimen>" calculation, see
TBN page~80. Usage: "\expandafter\apNOPT\the<dimen>".

\inext{apNOPT}{\empty}{+-}

The \db loop macro from plain \TeX{} is redefined here in more convenient
way. It does the same as original "\loop" by D. Knuth but moreover, it
allows the construction "\if...\else...\repeat".

\inext{loop}{\empty}{+-}


\subsec [fce] Function-like Macros

The implementation of function-like macros \db ABS , \db SGN , \db iDIV ,
\db iMOD , \db iFLOOR , \db iFRAC are simple.

\inext{ABS}{\empty}{+-}

The \db FAC macro for {\bf factorial} doesn't use recursive call because the
\TeX{} group is opened in such case and the number of levels of \TeX{} group
is limited (to 255 in my computer). But we want to calculate more factorial
than only 255!.

\inext{FAC}{^^B\cbrace}{++}

The \db BINOM "{"$a$"}{"$b$"}" is {\bf binomial coefficient} defined by
$$
  {a \choose b} = {a! \over b!\,(a-b)! } = {a\,(a-1)\cdots(a-b+1) \over b!}
  \quad \hbox{for integer } b > 0, \quad {a \choose 0} = 1.
$$
We use the formula where $(a-b)!$ is missing in numerator and denominator
(second fraction) because of time optimization. Second advantage of such formula
is that $a$ need not to be integer. 
That is the reason why the "\BINOM" isn't defined simply as

\begtt
\def\BINOM#1#2{\relax \evaldef{ \FAC{#1} / (\FAC{#2} * \FAC{(#1)-(#2)} }}
\endtt

The macro "\BINOM" checks if $a$ is integer. If it is true then we choose
"\C" as minimum of $b$ and $a-b$. Then we calculate factorial of "\C" in the
denominator of the formula (second fraction). And nominator includes "\C"
factors. If $a$ is non-negative integer and $a<b$ then the result is zero
because one zero occurs between the factors in the nominator. Thus we give the
result zero and we skip the rest of calculation. If $a$ is non-integer, then
"\C" must be $b$. The "\step" macro (it generates the factors in the
nominator) is prepared in two versions: for $a$ integer we use 
"\advance\A by-1" which is much faster than "\apPLUS\paramA{-1}" used for $a$
non-integer.

\inext{BINOM}{^^B\cbrace}{++}

{\bf The square root} is computed in the macro \db SQRT "{"$a$"}" using Newton's
approximation method. This method solves the equation $f(x)=0$ (in this case
$x^2-a = 0$) by following way. Guess the initial value of the result $x_0$.
Create tangent to the graph of $f$ in the point $[x_0, f(x_0)]$ using the
knowledge about $f'(x_0)$ value.
The intersection of this line with the axis $x$ is the new approximation of
the result~$x_1$. Do the same with $x_1$ and find $x_2$, etc. If you apply
the general Newton method to the problem $x^2-a=0$ then you get the formula
$$
  \hbox{choose } x_0 \hbox{ as an initial guess,}\quad \hbox{iterate: } 
  x_{n+1} = {1\over2}\left(x_n + {a\over x_n}\right)
$$
If $|x_{n+1}-x_n|$ is sufficiently small we stop the processing. In
practice, we stop the processing, if the "\OUT" representation of $x_{n+1}$
rounded to the "\apFRAC" is the same as the previous representation of 
$x_n$, i.~e.\ "\ifx\Xn\OUT" in \TeX{} language. Amazingly, we need only about
four iterations for 20-digits precision and about seven iterations for 50-digits
precision, if the initial guess is good chosen. 

The rest of the work in the "\SQRT" macro is about the right choose of the
initial guess (using "\apSQRTr" macro) and about shifting the decimal point 
in order to set the $a$ value into the interval $[1,100)$. The decimal point 
is shifted by "-\M" value. After calculation is done, the decimal point is 
shifted by "\M/2" value back. If user know good initial value then he/she
can set it to \db apSQRTxo macro. The calcualtion of initial value $x_0$ is
skipped in such case.

\inext{SQRT}{^^B\cbrace}{++}

Note that if the input $a<1$, then we start the Newton's method with $b$. It
is the value $a$ with shifted decimal point, $b\in[1,100)$. On the other
hand, if $a\ge1$ then we start the Newton's method directly with $a$,
because the second derivative $(x^2)''$ is constant so the speed of Newton's
method is independent on the value of $x$. And we need to calculate the
"\apFRAC" digits after the decimal point.

The macro \db apSQRTr "<number>" excepts "<number>" in the interval
$[1,100]$ and makes a roughly estimation of square root of the "<number>" in
the "\OUT" macro. It uses only classical "<dimen>" calculation, it doesn't
use any "apnum.tex" operations. The result is based on the linear approximation
of the function $g(x)=\sqrt{x}$ with known exact points $[1,1], [4,2],
[9,3], \ldots, [100,10]$. Note, that the differences between $x_i$ values of
exact points are $3,5,7,\ldots,19$. The inverted values of these differences
are pre-calculated and inserted after "\apSQRTra" macro call.

The \db apSQRTra macro operates repeatedly for $i=1,\ldots,10$ until
"\dimen0"${}=x\string<x_i$.
Then the \db apSQRTrb is executed. We are in the situation 
"\dimen0"${}= x \in[x_{i-1},x_i),\quad g(x_i) = i,\quad 
g(x_{i-1}) = i-1$ and the calculation of
"\OUT"${}= g(x_{i-1}) + (x-x_{i-1})/(x_i-x_{i-1})$ is performed.
If $x\in[1,4)$ then the linear approximation is worse. So, we calculate additional 
linear correction in "\dimen1" using the pre-calculated value 
$\sqrt 2 - 1.33333 \mathrel{\mathop{=}\limits^.} 0.08088$ here. 

\inext{apSQRTr}{\count=2 ^^B\cbrace}{++}

{\bf The exponential function} $e^x$ is implemented in the \db EXP macro using
Taylor series at zero point:
$$
  e^x = 1 + {x\over 1!} + {x^2\over 2!} + {x^3\over 3!} + \cdots
$$
If $x\in(0,1)$ then this series converges relatively quickly. 

The macro "\EXP" takes its argument. If it is negative, remember this fact,
remove minus sign and do "\OUT=1/\OUT" in final step. Now, the argument is
positive always. If the argument is ``big'' (greater or equal than 4, 
tested by "\testBig") then "\apEXPb" macro is used for evaluating.
Else "\apEXPa" macro evaluates the exponential.

\inext{EXP}{^^B\cbrace}{++}

The \db apEXPa macro supposes input argument (saved in "\OUT" macro) 
in the interval $[0,4)$. 
If the argument is greater than~1, do argument = argument/2
and increase $K$ register. Do this step in the loop until argument${}<1$.
Then calculate $e^x$ using Taylor series mentioned above.
After "\OUT" is calculated then we do "\OUT=\OUT"$^2$ in the loop $K$ times, 
because $e^{2x} = (e^x)^2$. Note that $K\le2$ in all cases.

The Taylor series is processed using the folloving variables: "\S" is total
sum, "\Sn" is the new addition in the $n$-th step. If "\Sn" is zero (in
accordance to the "\apFRAC" register) then we stop the calculation.

\inext{apEXPa}{^^B\cbrace}{++}

The macro \db apTAYLOR is ready for general usage in the form:

\begtt
\def\S{...}\def\Sn{...}\N=... % setting initial values for N=0
\loop
   ...                        % auxiliary calculation
   \do\Sn=\apDIV{...}{...};%  % calculation of new addition \Sn 
                              % (division must be the last activity)
   \apTAYLOR \iftrue \repeat  % does S = S + Sn and finishes if Sn = 0
\endtt

\inext{apTAYLOR}{}{++}

If the argument (saved i the "\OUT" macro) is greater or equal 4 then
\db apEXPb macro is executed. The $d=\lfloor x/\ln 10\rfloor$ is 
calculated here.
This is the number of decimal digits in the result before the decimal point.
The result is in the form 
$$
  e^x =  e^{x\,-\,d\,\cdot\,\ln 10} \cdot 10^d.
$$
The argument of the exponential function is less than $\ln 10 \doteq 2.3$ 
for this case, so we can call the "\EXP" macro recursively. 
And the result is returned in scientific form if $d\ge{}$"\apEX".

\inext{apEXPb}{^^B\cbrace}{++}

{\bf The logarithm function} $\ln x$ (inverse to $e^x$) is implemented in
\db LN macro by Taylor series in the point zero of the $\arg\tanh$ function:
$$
  \ln x = 2\,\arg\tanh {x-1\over x+1} = 
  2\left({x-1\over x+1} + {1\over3}\left(x-1\over x+1\right)^3 
  + {1\over5}\left(x-1\over x+1\right)^5 + \cdots \right). 
$$
This series converges quickly when x is approximately equal to one. The idea
of the macro "\LN" includes the following steps:

\begitems
\item * Whole calculation is in the group "\apINIT"..."\apEND". Enlarge the
   "\apFRAC" numeric precision by three digits in this group.
\item * Read the argument "\X" using "\evaldef".
\item * If the argument is non positive, print error and skip the next
   processing.
\item * If the argument is in the interval $(0,1)$, set new argument as
   1/argument and remember the ``minus'' sign for the calculated
   "\OUT", else the "\OUT" remains to be positive. This uses the identity
   $\ln(1/x) = -\ln x$.
\item * shift the decimal point of the argument by $M$ positions left in order to
   the new argument is in the interval $[1,10)$. 
\item * Let $x\in[1,10)$ be the argument calculated as mentioned before. 
   Calculate roughly estimated $\widetilde{\ln x}$ using "\apLNr"
   macro. This macro uses linear interpolation of the function $\ln x$
   in eleven points in the interval $[1,10]$.
\item * Calculate $A = x / \exp(\widetilde{\ln x})$. The result is
   approximately equal to one, because $\exp(\ln x) = x$.
\item * Calculate $\ln A$ using the Taylor series above.
\item * The result of $\ln x$ is equal to $\ln A + \widetilde{\ln x}$,
   because $x = A\cdot \exp(\widetilde{\ln x})$ and $\ln (ab) = \ln a + \ln b$.
\item * The real argument is in the form $x\cdot 10^M$, so "\OUT"
   is equal to $\ln x + M\cdot \ln(10)$ because $\ln (ab) = \ln a + \ln b$
   and $\ln(10^M) = M\ln(10)$. The $\ln(10)$ value with desired
   precision is calculated by "\apLNtenexec" macro. This macro saves its
   result globally when firstly calculated and use the calculated result when
   the "\apLNtenexec" is called again.
\item * Round the "\OUT" to the "\apFRAC" digits.
\item * Append ``minus'' to the "\OUT" if the input argument was in the
   interval $(0,1)$.
\enditems

\inext{LN}{^^B\cbrace}{++}

The macro \db apLNtaylor calculates $\ln A$ for $A\approx 1$ using Taylor 
series mentioned above.

\inext{apLNtaylor}{^^B\cbrace}{++}

The macro \db apLNr finds an estimation $\widetilde{\ln x}$ for $x\in [1,10)$
using linear approximation of $\ln x$ function.
Only direct "<dimen>" and "<count>" calculation with \TeX{} registers is used,
no long numbers "apnum.tex" calculation. The $\ln x_i$ is pre-calculated for
$x_i = i$, $i\in\{1,2,3,4,5,6,7,8,9,10\}$ and the values are inserted after the
"\apLNra" macro call. The input value $x$ is set as "\dimen0".

The \db apLNra "{<valueA>}{<valueB>}" macro reads the pre-calculated values 
repeatedly in the loop. The
loop ends if "\apnumC" (i.~e.~$x_i$) is greater than $x$. Then we know that
$x\in[x_{i-1},x_i)$. The linear interpolation is 
$$ 
  \widetilde{\ln x} = f(x_{i-1})+\bigl(f(x_i)-f(x_{i-1})\bigr)\,(x-x_{i-1}),
$$
where $f(x_{i-1})={}$"<valueA>", $f(x_i)={}$"<valueB>" and $x={}$"\dimen0".
The rest of the pre-calculated values is skipped by processing "\next" to "\relax".

The pre-calculated approximation of $\ln 10$ is saved in the macro \db apLNrten
because we use it at more places in the code.

\inext{apLNr}{3025}{++}

The \db apLNtenexec macro calculates the $\ln 10$ value with the precision
given by "\apFRAC". The output is prepared to the \db apLNten macro. The
"\apLNtenexec" saves globally the result to the macro "\""LNten:<apFRAC>" in
order to use it if the value is needed again. This saves time. 

\inext{apLNtenexec}{^^B\cbrace}{++}

The constant $\pi$ is saved in the \db apPIvalue macro initially with 30 
digits. If user needs more digits (using "\apFRAC"${}>30$) then the
"\apPIvalue" is recalculated and the \db apPIdigits is changed appropriately.

\inext{apPIvalue}{apPIdigits}{++}

The macro \db apPIexec prepares the $\pi$ constant with "\apFRAC" digits 
and saves it to the \db apPI macro. And $\pi/2$ constant with "\apFRAC" digits
is saved to the \db apPIhalf macro.
The "\apPIexec" uses macros "\""apPI:<apFRAC>" and "\""apPIh:<apFRAC>" where
desired values are usually stored. If the values are not prepared here then
the macro "\apPIexecA" calculates them.

\inext{apPIexec}{^^B\cbrace}{++}

The macro \db apPIexecA creates the $\pi$ value with "\apFRAC" digits 
using the "\apPIvalue", which is rounded if
"\apFRAC"${}\string<{}$"\apPIdigits". The "\apPIhalf" is calculated from
"\apPI". Finally the macros "\""apPI:<apFRAC>" and "\""apPIh:<apFRAC>" are
saved globally for saving time when we need such values again.

\inext{apPIexecA}{^^B\cbrace}{++}

If "\apFRAC"${}>{}$"\apPIdigits" then
new "\apPIvalue" with desired decimal digits is generated using \db apPIexecB
macro. The Chudnovsky formula is used:
$$
  \pi = {53360\cdot \sqrt{640320} \over S}, \quad
  S = \sum_{n=0}^\infty 
    {(6n)!\,(13591409 + 545140134\,n) \over (3n)!\,(n!)^3\,(-262537412640768000)^n }
$$
This converges very good with 14 new calculated digits per one step where
new $S_n$ is calculated. Moreover, we use the identity:
$$
  F_n = 
  {(6n)!\over (3n)!\,(n!)^3\,(-262537412640768000)^n},\quad
  F_n = F_{n-1}\cdot{8\,(6n-1)\,(6n-3)\,(6n-5) \over n^3\, (-262537412640768000)}
$$
and we use auxiliary integer constants $A_n, B_n, C_n$ with following
properties:
$$
  \displaylines{A_0=B_0=C_0=1, \cr
  A_n=A_{n-1}\cdot 8\,(6n-1)\,(6n-3)\,(6n-5),\quad
  B_n=B_{n-1}\cdot n^3, \quad C_n=C_{n-1}\cdot (-262537412640768000), \cr
  F_n = {A_n \over B_n C_n}, \cr
  S_n = {A_n\,(13591409 + 545140134\,n) \over B_n C_n}
  }
$$

\inext{apPIexecB}{^^B\cbrace}{++}

The macros for users \db PI and \db PIhalf are implemented as
``function-like'' macros without parameters. 

\inext{PI}{PIhalf}{++}

The macros \db SIN and \db COS use the Taylor series
$$
\displaylines{
   \sin x = x - {x^3\over 3!} + {x^5\over 5!} - {x^7\over 7!} + \cdots \cr
   \cos x = 1 - {x^2\over 2!} + {x^4\over 4!} - {x^6\over 6!} + \cdots
}
$$
These series converge good for $|x|<1$. The main problem is to shift the
given argument $x\in{\bf R}$ to the range $[0,1)$ before the calculation of
the series is started. This task is done by \db apSINCOSa macro, the common
code for both, "\SIN" and "\COS" macros.

The macro "\apSINCOSa" does the following steps:

\begitems
\item * It advances "\apFRAC" by three and evaluates the argument.
\item * Note, that the macro "\apSINCOSx" means "\apSINx" or "\apCOSx" depending on the
        given task.
\item * The macro "\signK" includes "1". It can be recalculated to "-1"
        later.
\item * If the argument is zero then
        the result is set and next computation is skipped. This test 
        is processed by "\apSINCOSo\apCOSx".
\item * If the argument is negative then remove minus and save "\sign".
        This "\sign" will be applied to the result. 
        The "\sign" is always "+" when "\COS" is calculated. This
        folows the identities $\sin(-x) = - \sin x$ and $\cos(-x) = \cos x$.
\item * The "\apFRAC" is saved and "\apTOT=0".
\item * The "\apPIexec" is processed. The "\apPI" and
        "\apPIhalf" are ready after such processing.
\item * After "\X" div "\apPI" (rounded to integer) we have "\K" in "\OUT",
        where $"\X"=x' + "\K"\cdot \pi$ and $x'\in[0,\pi)$.
        We set "\X" := $x'$ because of the identities 
        $\sin x = (-1)^k \sin(x+k\pi)$, $\cos x = (-1)^k \cos(x+k\pi)$.
        The sign $(-1)^k$ is saved to "\signK" macro.
\item * If the $x'$ is zero then the result is set by "\apSINCOSo\apCOSx"
        and the rest of calculating is skipped.
\item * The $|"\X" - \pi/2|$ is saved to "\XmPIh" macro.
\item * If $"\X"\in (\pi/4, \pi/2)$ then $x'= "\XmPIh"$. We use identities
        $\sin x = \cos(\pi/2-x)$, $\cos x = \sin(\pi/2-x)$. Set $"\X"=x'$. 
        The meaning of "\apSINCOSx" ("\apSINx" or "\apCOSx") is flipped in such case.
\item * If the $x'$ is zero then the result is set by "\apSINCOSo\apSINx"
        and the rest of calculating is skipped.
\item * Now $"\X"\in(0,\pi/4)$, i.~e.\ $|"\X"|<1$ and we can use Taylor
        series. The "\apSINCOSx" (i.~e.\ "\apSINx" or "\apCOSx") macro initializes 
        the computation of Taylor series mentioned above.
        The $"\XX"="\X"^2$ is prepared. The Taylor series is processed in the loop
        as usually.
\item * The the sign of the output is "\sign\signK". 
\item * If the sign of the result is negative, the ``minus'' is added to the
        "\OUT". 
\enditems

\inext{SIN}{^^B\cbrace}{++} 

The macros \db apSINx and \db apCOSx initialize the calculation
of the Taylor series.

\inext{apSINx}{apCOSx}{++}

The \db apSINCOSo "<sequence>" macro is used three times in the
"\apSINCOSa". It tests if the current result is zero. If it is true then the
"\OUT" is set as zero or it is set to "\signK" 
(if processed function is equal to the "<sequence>").

\inext{apSINCOSo}{}{++}

The macro \db TAN uses the identity $\tan x = \sin x / \cos x$
and calculates the denominator first. If it is zero then "\apERR" prints
``out of range'' message else the result is calculated.

\inext{TAN}{^^B\cbrace}{++}

The macro \db ATAN calculates the inverse of tangens using series
$$
\arctan{1\over x} = {x\over 1+x^2} + {2\over3} {x\over (1+x^2)^2}
   + {2\over3}{4\over5} {x\over (1+x^2)^3}
   + {2\over3}{4\over5}{6\over7} {x\over (1+x^2)^4} + \cdots
$$
This converges relatively good for $|x|>1$. I was inspired by
the Claudio Kozick\'y's semestral work from the course ``Typography and \TeX'' at \v CVUT
in Prague. 

The macro "\ATAN" takes the argument $x$ and uses identity 
$\arctan(-x)=-\arctan(x)$ when $x$ is negative. If $x>1$
then the identity
$$
  \arctan(x) = {\pi\over2} - \arctan{1\over x}
$$
is used and $\arctan(1/x)$ is calculated by "\apATANox" macro using the series
above. Else the argument is re-calculated $x:=1/x$ and the "\apATANox" is
used. When $x=1$ then the "\apPIhalf/2" is returned directly.

\inext{ATAN}{^^B\cbrace}{++}

The macro \db apATANox calculates $\arctan(1/x)$ using series mentioned
above.

\inext{apATANox}{^^B\cbrace}{++}

The macros \db ASIN and \db ACOS for functions
$\arcsin(x)$ and $\arccos(x)$ are implemented using following identities:
$$
  \arcsin(x) = \arctan {x\over\sqrt{1-x^2}}, \qquad
  \arccos(x) = {\pi\over2} - \arcsin(x)
$$

\inext{ASIN}{ACOS}{++}

\subsec Printing expressions

The \db eprint "{<expression>}{<declaration>}" macro 
works in the group "\bgroup...\egroup". This means that the result in math
mode is math-Ord atom. The macro interprets the "<expression>" 
in the first step like "\evaldef". This is done by "\apEVALb#1\limits". 
The result is stored in the "\tmpb" macro in Polish notation. 
Then the internal initialization is processed in "\apEPi" and user-space
initialization is added in "\apEPj" and "#2". Then "\tmpb" is processed. The \db apEPe can
do something end-game play but typically it is "\relax". 

\inext{eprint}{^^B\cbrace}{++}

The \db apEPi macro replaces the meaning of all macros typically used in
Polish notation of the expression. The original meaning is ``to evaluate'',
the new meaning is ``to print''. The macro "\apEPi" is set to "\relax" in the
working group because nested "<expressions>" processed by nested "\eprint"s
need not to be initialized again.

There is second initialization macro \db apEPj (similar to the "\apEPi")
which is empty by default. 
Users can define their own function-like functions and they can put the
printing initialization of such macros here.

\inext{apEPi}{def\nb apEPj}{++}

All parameters are processed in new group (excepts individual constants). 
For example we have
"\apPLUS{a}{\apDIV{b}{c}}" in the "\tmpb". Then the 
"a+{\apDIV{b}{c}}" is processed and thus "a+{b\over c}" is printed. 
As noted above, the outer group is set by "\eprint" macro itself. 

When we process the "\tmpb" with the output of the "<expression>"
interpreter then the original positions of the round brackets are definitively 
lost. We must to print these brackets if it is required by usual math syntax. 
For example "\apPLUS{1}{-2}" must be printed as "1+(-2)".
But "\apPLUS{1}{2}" must be printed as "1+2". So, we print 
all parameters using "\apEPp{<parameter>}{<a><b><c><d>}". 
This macro decides if the parameter will be surrounded by brackets or not.
So, the ``printing'' meaning of "\apPLUS" (or "\apMINUS" respectively) 
and prepared in \db apEPplus (or \db apEPminus respectively) looks like:

\inext{apEPplus}{apEPminus}{++}

The usage of "\apEPp{<parameter>}{<a><b><c><d>}" has the
following meaning:

\begitems
\item * if "<a>" is "!" and the "<parameter>" is a negative constant or 
        a "-<expression>" or
\item * if "<b>" is "!" and main operator $\M$ of the "<parameter>" is "+" or "-" or
\item * if "<c>" is "!" and main operator $\M$ of the "<parameter>" is "*" or
\item * if "<d>" is "!" and main operator $\M$ of the "<parameter>" is "/" or "^"
\enditems
\noindent then "\apEPp" prints brackets around the "<parameter>" using 
"\left(<parameter>\right)". 
Else it doesn't use brackets around the "<parameter>" (but the "<parameter>" 
itself is printed in a group unless it is single element: constant, variable).

The rule for the parameter "<a>" has the exception: if "<a>" is "?" and the
"<parameter>" is a negative constant or a "-<expression>", then brackets are 
not used if and only if this is ``very first parameter'', it means that 
the "<parameter>" is first:
\begitems
\item * at beginning of the whole "<expression>" given as an argument 
        of "\eprint" or
\item * immediately after an opening bracket or
\item * at beginning of a numerator or a denominator in a fraction or
\item * at beginning of an exponent.        
\enditems

For example "-1+1" is preprocessed as "\apPLUS{-1}{1}" and printed as "-1+1"
because first parameter has "<a>" equal to "?" and we are at beginning of
the expression. But "1+-1" is preprocessed as
"\apPLUS{1}{-1}" and printed as "1+(-1)" because second parameter has "<a>"
equal to "!". The "2*(-1+5)" is printed as "2\cdot(-1+5)" because "-1" is 
``very first parameter'' after opening bracket.
Another examples: "-1+-1+-1" is printed as "-1+(-1)+(-1)",
"a+b*c" is printed as "a+b\cdot c" (without brackets), The "1-(2+3)" is
printed ``as is'' but "1+(2+3)" is printed as "1+2+3".

The question about to be ``very first parameter'' is controlled by the value of 
\db apEPx macro. It is started as "." and it is replaced by "!" whenever "<a>" is "!". 
It is reverted to "." when open bracket is printed.

The unary minus in the cases like "-(a+b)" are transformed 
to "\apMUL{-1}{\apPLUS{a}{b}}"
by the "<expression>" interpreter. But we don't need
to print "-1\cdot(a+b)". So, the printing version of "\apMUL" stored in the
macro \db apEPmul have an exception. First, we do the test, if "#1" is equal
to "-1". If this is true, then we print only the unary minus (no whole "-1\cdot").
Else we print the whole first parameter (enclosed in braces if its $\M$ is "+" or "-").
The first case has two sub-cases: if "\apEPx" is "!" (it means that it is not 
``very first parameter'' then brackets are used around "-<expression>".

The second parameter is enclosed in brackets if its $\M$ is "+" or "-".

\inext{apEPmul}{^^B\cbrace}{++}

The \db apEPdiv macro used for printing "\apDIV" is very easy. We needn't to set
the outer group here because each parameter is enclosed in the group. We
need not to add any round brackets here because fraction generated by
"\over" is self explanatory from priority point of view.
If you need to redefine "\apEPdiv" with the operator "/" instead "\over"
then you need to redefine "\apEPmul" too because you must enclose parameters with
$\M="\apDIV"$ by brackets in such case.

\inext{apEPdiv}{}{++}

The \db apEPpow macro used for printing "^" includes another speciality.
When the base (the first "<parameter>") is a function-like macro "\SIN", "\COS"
etc. then we need to print "\SIN{X}^2" as "\sin^2 x".
The test if the base is such special functions-like macro is
performed by "\apEPpowa{<base>}\end{<exponent>}". If this is true then
"\apEPpowa" saves the "<exponent>" to the temporary macro \db apEPy 
and only "<base>" is processed (the "\apEPy" is printed inside this
processing) else "\apEPy" is empty and the "<base>" enclosed
in brackets is followed by "^{<exponent>}". Note that the "<base>" isn't
enclosed by brackets only if the "<base>" is single and positive operand.

\inext{apEPpow}{^^B\cbrace}{++}

The \db apEPpowa and \db apEPpowb macros detect the special 
function-like macro "\SIN", "\COS"
etc. by performing one expansion step on the tested "<base>". If the first
"<token>" is "\apEPf" then the special function-like macro is detected.
Note that "\SIN", "\COS" etc. are defined as "\apEPf" in the "\apEPi" macro.

\inext{apEPpowa}{apEPy}{++}

The functions like "\SIN{<expression>}" are printed by
\db apEPf "{<name>}{<expression>}". First, the "\mathop{<name>}\nolimits" is
printed. If "\apEPy" is non-empty then the exponent is printed by
"^{\apEPy}". Finally, the nested "<expression>" is printed by the nested
"\eprint". 

\inext{apEPf}{^^B\cbrace}{++}

The space-correction macro \db apEPk is set to remove the "\thinmuskip" 
after "\mathop". This will be processed only if the "\left(" follows: we want 
to print "\sin\apEPk\left(<expression>\right)" because this gives the same result as
"\sin(<expression>)". On the other hand we don't use "\apEPk" when simple "\sin x"
is printed without brackets.

By default the "<expression>" (this is an argument of common function-like 
macros "\SIN", "\COS", "\EXP" etc.) will be printed in brackets 
(see the default "\next" definition
where closing bracket is printed by "\apEPe" macro used after expanded "\tmpb"). 
But if 
\begitems
\item * the "<expression>" is single non-negatie object 
  (a constant or a variable without unary minus) or
\item * the "<expression>" is a fraction of the form "{<nominator>\over<denominator>}"
\enditems

\noindent then no brackets are printed around the "<expression>".

This rule is implemented by the usage of 
"\expandafter"\db apEPb in the "<declaration>" part of "\eprint" 
(in the code of "\apEPf" above). It
expands the following "\tmpb" (the result of the expression scanner) and
checks the first token and the following parameter. 
Note that the "<expression>" scanner generates "\apPPn{<operand>}" if and
only if the whole "<expression>" is a single operand.

\inext{apEPb}{^^B\cbrace}{++}

The meaning of \db apEPp "{<parameter>}{<a><b><c><d>}" is
explained above, see the text where "\apEPplus" is introduced.
Now, we focus to the implementation of this feature. The auxiliary macro
\db apEPa "<first token><rest>\end{<normal>}{<bracket>}<a><b><c><d>" 
is used twice: 
before processing the "<parameter>" and after processing. The "\apEPa"
inserts the "<normal>" or "<bracket>" depending on the condition described
above where $\M$ (or unary "-" when "<parameter>" is negative constant) 
is equal to the "<first token>". 

\inext{apEPp}{^^B\cbrace}{++}

If we have variables like "\def\X{-17}" and the expression looks like 
"1+\X" and the constants stored in the varaibales must to be printed 
then we have "\apPLUS{1}{\X}" after expression scanner and we need 
to print "1+(-17)".
So we need to try to expand the "<paramter>" and to test if there is the
unary "-" as a "<first-tok>". This is done by 
\db apEPd "<first-tok><rest>\end{<group-type>}{<else-part>}{<dot-or-exclam>}".

\inext{apEPd}{}{++}

The \db apMULop is used as an operation mark for multiplying. 
It is "\cdot" by default but user can change this.

\inext{apMULop}{}{++}

The single operand like "2.18" or "\X" or "\FAC{10}" is processed directly
without any additional material. User can define ``variables'' as desired.
The function-like macros provided by "apnum.tex" is initialized in "\apEPi"
macro and the ``printing macros'' \db apEPabs, \db apEPfac, \db apEPbinom,
\db apEPsqrt, \db apEPexp, \db apEPsgn, \db apEPdivmod, \db apEPidiv, \db
apEPimod, \db apEPifloor, \db apEPifrac are defined here. The trick with
"\expandafter\apEPb" in the declaration part of the nested "\eprint" was
explained above. Users can re-define these macros if they want.

\inext{apEPabs}{apEPifrac}{++}

The \db corrnum "<token>" macro expects "<token>" as a macro with number.
It adds zero before decimal point if the sequence of "<digits>" before
decimal point is empty. It uses a macro \db apEPc which works at expansion
level. First, the occurrence of the "-" is tested. If it is true then "-" is
expanded and the "\apEPc" is called again. Else the zero is added if the
first token is dot (this means if the "<digits>" before dot is empty).

\inext{corrnum}{\empty}{+-}


\subsec Conclusion

This code is here only for backward compatibility with old versions of 
"apnum.tex". Don't use these sequences if you are implementing an internal
feature because users can re-define these sequences.

\inext{PLUS}{\empty}{+-}

Here is my little joke. Of course, this macro file works in La\TeX{} without
problems because only \TeX{} primitives (from classical \TeX) and the "\newcount"
macro are used here.
But I wish to print my opinion about La\TeX. I hope that this doesn't matter
and La\TeX{} users can use my macro because a typical La\TeX{} user doesn't
read a terminal nor ".log" file.

\inext{documentclass}{\empty}{+-}

\doindex
\bye

