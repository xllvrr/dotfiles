----------------------------------------------------------------
signchart --- v1.01 2016/02/12
E-mail: anthonywmottaz@gmail.com
Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt
----------------------------------------------------------------

The signchart package provides you with the ability to create
beautifully typeset sign charts.

Refer to the documentation for usage instructions. Suggestions
for improvement can be sent to the email address above.

------------------ INSTALLATION INSTRUCTIONS -------------------
Copy the 'signchart.dtx' file to a temporary location, then
from a terminal run the following command twice:
pdflatex signchart.dtx
Then we need to create the index. Run the command:
makeindex -s gind.ist signchart
and then run pdflatex twice more.

Finally, you need to move the 'signchart.sty' to folders that
are searched by your TeX distribution.
----------------------------------------------------------------
