*Notepad++ for ConTeXt: Lexer and Macro Utilities for editing ConTeXt Documents 
Version 0.98*

This package includes 

I. A plugin for Notepad++ that implements, for the ConTeXt document 
processing system, 
i) a language lexer for semantic highlighting of TeX, LuaTeX, and ConTeXt commands; 
ii) autocompletion of commands with full support for calltips (set in columns); 
iii) tagging and insertion of markup and templates, with support for mnemonic keys. 

II. A color scheme and two complementary Notepad++ themes: Silver 
Twilight Hi and Silver Twilight Lo. 

Notepad++ for ConTeXt is available here: 

https://github.com/luigiScarso/context-npp 
https://github.com/luigiScarso/context-npp/blob/master/install/Npp-for-C 
onTeXt.zip 

The complete Notepad++ for ConTeXt manual and its TeX sources may be 
found in the following directory of Npp-for-ConTeXt.zip: 

/Npp-for-ConTeXt/doc/npp-context-manual.pdf 

It may also be downloaded here: 
https://github.com/luigiScarso/context-npp/tree/master/doc 

Completion of C++ plugin and lexer development was done by the current 
maintainer, Luigi Scarso (ConTeXt Development Team). Original C++ plugin 
and lexer development was done by Dr. Jason Wu (Colorado State 
University). Project vision and development planning (as well as the two 
themes and color scheme) are by Professor Idris Samawi Hamid (Colorado 
State University). 

The Notepad++ for ConTeXt lexer is strongly influence by the plugin 
WebEdit by Alexander Iljin: 
https://sourceforge.net/projects/npp-plugins/files/WebEdit/ 

This plugin aims to support the editing of ConTeXt documents in a number 
of ways. This includes some integration with the standalone distribution 
of ConTeXt. 

(For more information on ConTeXt see 

http://wiki.contextgarden.net/Main_Page 
http://www.pragma-ade.nl/index.htm .) 

This plugin includes a language lexer for semantic highlighting of 
ConTeXt commands; it also includes a system for tagging and inserting of 
markup and templates, with support for mnemonic keys. 

In its first phase of development, the plugin borrowed some ideas and 
implementations from other plugins (notably WebEdit); and, from the 
experience of Professor Hamid, several macros and customizations. In the 
second phase, a significant part of development was devoted to 
translating the xml documentation files of ConTeXt (= the English 
interface files that list and classify commands, see below) into the 
relevant xml configuration files of Notepad++, and to look for an 
efficient way to edit a document while minimizing the need to access the 
documentation. One outcome of this effort is the current autocompletion 
calltip mechanism, which provides columnar representation of the 
documentation for each autocompleted command, and equivalent to that 
provided by setup-en.pdf ("ConTeXt commands EN"). 

(In a ConTeXt distribution it lies at the end of this path: 
/tex/texmf-context/doc/context/documents/general/qrcs/setup-en.pdf) 

One of the fundamental differences between ConTeXt and traditional 
programming languages is the huge quantity of keywords (=commands, 
macros) and parameters (= command arguments) in ConTeXt. Fortunately, 
nearly all of them are described in the interface files of the 
standalone distribution, under 

tex/texmf-context/tex/context/interface/mkiv. 

Here one finds the file context-en.xml, which is constituted by the 
concatenation of all of the the other interface files. 

The build.cmd script, under the /scripts folder of Npp-for-ConTeXt.zip, 
reads context-en.xml and results in two files, i) /Program Files 
(x86)/Notepad++/plugins/Config/ConTeXt.xml, which is used by the ConTeXt 
lexer for Notepad++, and ii) /Program Files 
(x86)/Notepad++/plugins/APIs/context.xml, which is used by the 
autocompletion and calltips mechanism. The build.cmd script is a batch 
script that has to be executed outside Notepad++; under the hood it runs 
the Python2.7 script command_primitives_api.py with the correct command 
line options; if xmllint.exe is installed it checks to make sure that 
the files saved are well-formed. 

The Npp-for-ConTeXt.zip ships with versions of Config/ConTeXt.xml and 
APIs/context.xml that take as reference the official ConTeXt that is 
shipped with the TeXLive 2018 distribution (see 
https://www.tug.org/texlive/). So the build.cmd script is useful if the 
user has a different (possibly updated) standalone distribution. 

The switches at command line of command_primitives_api.py are 

usage: command_primitives_api_new.py [-h] [-m MTXCMD] [-i IFCFILE] [-u 
IFCUFILE] [-c CMDFILE] [-p PRIMFILE] [-d CHARDEF] [-r MACROCHARDEFFILE] 

optional arguments: -h, --help show this help message and exit -m 
MTXCMD, --mtxcmd MTXCMD ConTeXt mtxrun program -i IFCFILE, --ifcfile 
IFCFILE ConTeXt XML interface file -u IFCUFILE, --ifcufile IFCUFILE 
ConTeXt XML interface user file -c CMDFILE, --cmdfile CMDFILE ConTeXt 
XML command file -p PRIMFILE, --primfile PRIMFILE ConTeXt primitives.lua 
script -d CHARDEF, --chardef CHARDEF ConTeXt char-def.lua file -r 
MACROCHARDEFFILE, --macrochardeffile MACROCHARDEFFILE ConTeXt 
macro-chardef.lua script 

and the build.cmd sets the following 

-m mtxrun.exe ^ -c 
%CTXDIR%\tex\texmf-context\tex\context\base\mkiv\mult-prm.lua ^ -i 
%CTXDIR%\tex\texmf-context\tex\context\interface\mkiv\context-en.xml ^ 
-d %CTXDIR%\tex\texmf-context\tex\context\base\mkiv\char-def.lua 

The above assumes that the user sets the correct standalone in %CTXDIR%. 
It's important to note that this is the standalone also used by the 
ConTeXt plugin. Usually there is no need to pass --primfile PRIMFILE and 
--macrochardeffile MACROCHARDEFFILE, because they should be generated by 
the python script. The option --ifcufile IFCUFILE is useful if the user 
wants to add the documentation of a set of private macros: in this case 
it's necessary to know the syntax of that documentation, where the 
ConTeXt XML command files are taken as reference. 

Another component introduced in the plugin is the user's macro window, 
enabled with Ctrl+'-'. The idea is to offer to the user a way to quickly 
insert one's most used macros, set and saved under the section entitled 
[Markup] in 

/Roaming/Notepad++/plugins/config/ConTeXt.ini 

The body of the macro to insert must contain a single '|', which is a 
placeholder for the selected text; the macro can be selected with the 
mouse or by hitting the Return key. It may also be selected by typing a 
shortcut key. The Esc key closes the window. For example, if the user 
needs to insert a macro '\framed', as in 

\framed[frame=on]{...} 

(where '...' signifies some text to be operated upon by the command), 
and with a single key 'f' as shortcut, the text to set in ConTeXt.ini is 

(f)\framed[frame=on]{|} 

Note the full parenthesis that enclose the key shortcut - '(f)' in this 
case. The user's macros stored in ConTeXt.ini can be edited from 
Plugin->ConTeXt->Edit Config; once saved it has to be re-loaded with 
Plugin->ConTeXt->Load Config (no need to restart Notepad++). For the 
sake of readability, the string '%n' in the body of the text is 
translated into a newline. The shortcut can be a sequence of A-Za-z0-9 
characters, i.e. (d0) and (sst) are valid shortcuts. But for longer keys 
or keys which require pressing Shift for input, perhaps one will need to 
set a specific delay: This can be done under the [CommandsSetups] 
section of ConTeXt.ini via, e.g., 

usermacro:elapse=500 and or usermacro:elapse_shift=600 

The time is in milliseconds. 

A second mechanism (also adopted from the WebEdit plugin) are tempaltes. 
Under the section of ConTeXt.ini entitled [Templates], there is a list 
of text strings and their replacements: In the edit field of Notepad++ 
the user types <text> and Alt-'\'; <text> is replaced by <replacement>. 
The rules are the same as for those of the user's macros set under 
[Markup]. 

Finally, the standard Notepad++ right-click mechanism offers the usual 
insert text menu. Use 

Plugins - ConTeXt - Update Right-click menu 

to add one's markup macros. 

These ways of inserting markup tags are independent, so it's possible to 
have several ways to insert the same text. However, it's likely that in 
a future release this will be simplified or streamlined. 

