.PS
# ParSeries.m4
sinclude(tst.dim)
sinclude(Circuit_macros.dim)
s_init(ParSeries)
cct_init

command "\newcommand{\X}{\enskip}"

setdir_(R)
Ex1: [
P:parallel_(
   `L:inductor(,W); llabel(+,L,-)',
   series_(`R1:resistor; llabel(,R1)',`R2:resistor; llabel(,R2)'),
   `C:capacitor; llabel(,C)' )
  dot(at P.Start); "{\small\sl Start}" at rvec_(0,-3pt__) below ljust
  dot(at P.End); "{\small\sl End}" below ljust
 ]
#showbox_

s_box(``\shortstack[l]{
\tt parallel\_( \char96 L:inductor(,W); llabel(+,L,-)\char39,\\
\X\tt series\_(\char96 R1:resistor; llabel(,R1)\char39,
\char96 R2:resistor; llabel(,R2)\char39),\\
\X\tt \char96 C:capacitor; llabel(,C)\char39\ )}'') with .nw at Ex1.sw+(0,-0.2)
#showbox_(last "")

setdir_(Down)
Ex2: [
P: parallel_(
     series_(
      `R1:resistor; rlabel(,R_1)',
       parallel_(
         series_(`resistor; rlabel(,R_2)',`inductor(,W); rlabel(,L)'),
        `capacitor(,C); rlabel(,C)' ),
     line down dimen_/2 ),
    `Sep=linewid*3/2; V:source; rlabel(+,V,-)' )
 dot(at P.Start); "{\small\sl Start}" below
 dot(at P.End); "{\small\sl End}" below
 ] with .sw at Ex1.se+(0.3,0)
#showbox_

s_box(``\shortstack[l]{\tt setdir\_(Down)\\
\tt parallel\_(\\
\X\tt    series\_(\char96 R1:resistor; rlabel(,R\_1)\char39,\\
\X\X\tt parallel\_(\\
\X\X\X\tt series\_(\char96 resistor; rlabel(,R\_2)\char39,\\
\X\X\X\tt\hphantom{\tt series\_(}%
\char96{}inductor(,W); rlabel(,L)\char39),\\
\X\X\X\tt \char96 capacitor(,C); rlabel(,C)\char39\ ),\\
\X\X\tt line down dimen\_/2),\\
\X\tt \char96 Sep=linewid*3/2; V:source; rlabel(+,V,-)\char39)}
'') with .nw at Ex2.ne+(0.15,0)
#showbox_(last "")

.PE
