Bangor University Computer Science Department
Exam Document Class
Cameron Gray <c.gray@bangor.ac.uk>
November 21, 2017

Abstract
Starting with the 2016/17 academic year, the Computer Science department at
Bangor University have moved to LATEX for preparation of examination papers for all
taught courses. This was done for multiple reasons, including the reduction of burden
on support staff.
This package is the embodiment of that effort. It includes all of the elements needed
to produce an examination paper, including examiner’s copies with solutions included.

1 Usage - Class Options

The document class is activated (or loaded) using the usual LATEX command
\documentclass{bangorexam}. The class requires one of the following options to
control which ‘style’ of exam paper is produced.
[ab] - produces a compulsory Section A and an ‘n-from’ Section B exam.  This type defaults to 2 required to match previous behaviour.
[aonly] - produces a single section, all questions compulsory exam.
[nfrom] - produces a single part ‘n-from’ exam.

The ‘answers’ option controls the inclusion of solutions as part of the output.
\documentclass[ab]{bangorexam} - produces the student form of a Section A/B
exam paper.

\documentclass[ab]{bangorexam} - produces the student form of a Section A/B exam paper.
\documentclass[aonly]{bangorexam} - produces the student form of an exam paper where all questions are compulsory.
\documentclass[nfrom]{bangorexam} - produces the student form of an exam paper with a single section but n-from the total questions. \documentclass[ab,answers]{bangorexam} - produces the examiner form of the paper.

2 Usage - Preamble Macros

The class includes several macros that must be added to the document’s preamble. These
set important aspects such as the module code and title.

\school{English name}{Welsh name} The name of the school setting this exam, provided in both English and Welsh.

\module{code}{full name} The code (including the 3-letter prefix) and full name of the module.

\examperiod{resit|s1|s2} Specifies the period of the exam, s1 for January/End of Semester 1, s2 for May/End of Semester 2, or resit for Supplementary exams (Summer Resits).

\timeallowed{hours} The amount of time allowed in hours. This should be the numerical part only, e.g. \timeallowed{1\half} or \timeallowed{3}.

\nfrom{number} The number of compulsory questions from the selection available in the options part of the exam.

3 Usage - Body Macros

Various macros exist to typeset the questions within the exam paper. The macros listed
here are provided to comply with Bangor University’s style and formatting requirements.
Users should not adjust any formatting, font, header, footer, margin other other display
parameters. Please use \emph{} for italic text and \textbf{} for boldface fonts only.
The document class has been designed to support amsmath and amssymb mathematics
typesetting with the conventional font.

\sectiona Only applies when class option ab is active. Begins the compulsory Section A.

\sectionb Only applies when class option ab is active. Begins the student-choice Section B.

\pointsdesc{description}Sets the suffix/descriptive text following a points value. This defaults to an empty string, so 5 points would be rendered as [5]. Setting \pointsdesc{%} would result in [5%].

\guidance{guidance text} Sets a ’guidance’ paragraph at the beginning of all question sections (at the start for two of four or both of section A and B if ab).

\guidancea{guidance text} Sets a ’guidance’ paragraph at the start of section A only.

\guidanceb{guidance text} Sets a ’guidance’ paragraph at the start of section B only.

4 Usage - Environments

There are three key environments questions, parts, and solution. These represent a
numbered sequence of questions, parts and sub-parts of one question, and a solution/answer
for a question respectively.

4.1 Questions Environment

All questions must be set within a questions environment. You may add other items, such
as explanations, images, scenarios etc., in this environment too. The most simple questions environment is as follows:
\begin{questions}
\end{questions}

However, this will not actually produce any output.
Questions must be added with use of the \question macro.

\question[points] Question Text

This macro can only be used within the Questions environment and is used to typeset a
question. The optional argument sets the number of points/marks/percentage awarded for
correct answers. See the \pointsdesc macro for customisation options.
Whenever a new block is started (with \begin{questions}), the numbering begins at
1. (Questions, at present, can only be labelled with Arabic numerals.)

4.2 Parts Environment

Within a question, examiners may wish to have multiple sub-questions (a.k.a parts). This is provided for by the \begin{parts}...\end{parts} environment. Each sub-question
or part is handled with the part macro.

\part[points] Part Text

This macro can only be used within the parts environment and is used to typeset a subquestion. The optional parameter sets the number of points/marks/percentage awarded for
correct answers. See the \pointsdesc macro for customisation options.

The parts environment may only be used within the questions environment, as in the
example below:
\begin{questions}
\question Use the graph in Figure 1 to answer the following:
\begin{parts}
\part Sub-question 1
\part[10] Sub-question 2
\end{parts}
\end{questions}

Whenever a new block is started (with \begin{parts}), the sub-question numbering
begins with a). (Sub-questions, at present, can only be labelled with English letters).

4.3 Solution Environment

Following either a \question or \part, the examiner should include a solution block.
This block/environment will only be included if the answers class option is in effect. (See Class Options for more details). Any standard LaTeX content can be placed in a solution block. A minimal example is below:
\begin{questions}
\question A really hard question.
\begin{solution}
The answer is placed here.
\end{solution}
\end{questions}

5 Usage - Multiple Choice Questions

There are four environments that will allow typesetting of multiple choice selections
depending on the desired layout. All must be used within a Questions or Parts environment.
The first pair present a list of possible responses labelled with letters. The choices
environment presents one choice per line, whereas the horizontalchoices environment
lays out choices in a single paragraph, wrapping lines wherever necessary.
The second pair present tick or check boxes instead of labelled choices. A checkboxes
environment will again typeset options one to a line, and the horizontalcheckboxes
environment will present all options in one paragraph.
Within any of the four environments each choice is typeset using the choice macro. Please
note; there is no points argument for individual choices, this should be handled at the
question or part level.

\choice Choice Text

Typesets a single choice according to which environment it is placed in.
Solutions to multiple choice questions are handled somewhat differently. Instead of a
solutions environment, typeset the correct option using the correctchoice macro.

\correctchoiceChoice Text

Typeset the correct choice based on where the macro is placed. When answers is in effect,
the output of this macro will either highlight the option in boldface, or replace the checkbox with a tick.