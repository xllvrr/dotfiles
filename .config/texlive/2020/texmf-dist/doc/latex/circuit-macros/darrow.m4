divert(-1)
  darrow.m4                     Macros for double lines and arrows

* Circuit_macros Version 9.3, copyright (c) 2020 J. D. Aplevich under      *
* the LaTeX Project Public Licence in file Licence.txt. The files of       *
* this distribution may be redistributed or modified provided that this    *
* copyright notice is included and provided that modifications are clearly *
* marked to distinguish them from this distribution.  There is no warranty *
* whatsoever for these files.                                              *


`Notes: these macros have been reworked (Jan 2013) so that dlthick is the
  total outside width, consistent with solid lines and arrows, and to add
  the !- and -! half-linethick line caps to simplify butting to boxes.

  Some of these macros have uncomfortably many arguments for specifying
  options, so wrappers beginning with upper-case letters (Dline, Darrow, Darc)
  are provided and implement key=val;key=val... option specifications.
'

=============================================================================
define(`darrow_')
ifdef(`libgen_',,`include(libgen.m4)divert(-1)')

                                Default width (thickness) of double lines
define(`dlthick',`(0.08*scale+lthick)')
#efine(`dlinewid',`dlthick')    Obsolete, keep for a while for compatibility.

                               `ELement fill color (default white)
                                e.g. define(`dfillcolor',`1,0.84,0')
                                Obsolete:
                                command "\definecolor{gold}{rgb}{1,0.84,0}"
                                define(`dfillcolor',gold)'
define(`dfillcolor',`1,1,1')

define(`dfillgrey',1)          `fill shade for gpic'
define(`darcrad',`dlthick*2')  `default darc radius'

                               `Default length:'
ifdef(`elen_',,`define(`elen_',linewid*3/2)')
=============================================================================

                               `deleminit_(linespec,len,dlinethick)
                                dline initialization'
define(`deleminit_',`define(`m4dlthk',ifelse(`$3',,dlthick,`$3'))dnl
  rpoint_(ifelse(`$1',,`to rvec_(ifelse(`$2',,linewid,`$2'),0)',`$1')) ')


                               `above, below, ljust, rjust but displaced
                                by dlthick/2 eg "string" dabove(at position)'
define(`dabove',`above ifelse(`$1',,`at Here',`$1')+(0,dlthick/2)')
define(`dbelow',`below ifelse(`$1',,`at Here',`$1')-(0,dlthick/2)')
define(`dljust',`ljust ifelse(`$1',,`at Here',`$1')+(dlthick/2,0)')
define(`drjust',`rjust ifelse(`$1',,`at Here',`$1')-(dlthick/2,0)')

               `dline(linespec,start truncation,end truncation,dlthick, ends )
                  ends= blank, x-x, -x, x-, where x means ! or |'
define(`dline',`deleminit_(`$1',,`$4')
  M4DL: line from last line.start to last line.end \
    chop ifelse(`$2',,0,m4dlthk/2) chop ifelse(`$3',,0,m4dlthk/2)
  ifelse(rgbstring(1,1,1),"",,
   `{line thick m4dlthk/(1bp__) from M4DL.start to M4DL.end }
    {line thick m4dlthk/(1bp__)-2*linethick outlined rgbstring(dfillcolor) \
     from M4DL.start \
      ifinstr(`$5',|-,`+vec_(lthick,0)',`$5',!-,`+vec_(lthick/2,0)') \
      to M4DL.end \
      ifinstr(`$5',-|,`-vec_(lthick,0)',`$5',-!,`-vec_(lthick/2,0)') }')
  ifgpic(`M4dV: vec_(0,m4dlthk/2-lthick/2); shade(dfillgrey,
    {line from M4DL.start+(M4dV.x,M4dV.y) to M4DL.end+(M4dV.x,M4dV.y)}
    {line from M4DL.start-(M4dV.x,M4dV.y) to M4DL.end-(M4dV.x,M4dV.y)})')
   line invis from M4DL.start to M4DL.end')

               `Dline(linespec,params)
                 params is a semicolon-separated list of items:
                   S truncate at start by dline thickness/2
                   E truncate at end by dline thickness/2
                   thick=val   (total thicknes, ie width)
                   ends= x-x or -x or x- where x is ! or |
                   |- closed end with full-width line
                   !- closed end with half-width line
                eg Dline(from A to B,E;ends=|-)'
define(`Dline',
 `setkey_(`$2',thick,dlthick)
  setkey_(`$2',ends)pushdef(`m4ends',substr(m4ends,1,eval(len(m4ends)-2)))
  dline(`$1',ifinstr(`$2',S,t),ifinstr(`$2',E,t),m4thick,m4ends)
  popdef(`m4ends')popdef(`m4ends')popdef(`m4thick')
  ')

                               `dleft(at position,dlthick) Turn left,
                                leaving current location at exit of corner'
define(`dleft',`deleminit_(,ifelse(`$2',,dlthick,`$2'),`$2')
  ifelse(`$1',,,`move to substr(`$1',eval(index(`$1',t)+1))-vec_(m4dlthk/2,0)')
  { line thick m4dlthk/(1bp__) to rvec_(m4dlthk,0) }
  ifelse(rgbstring(1,1,1),"",,
   `line thick m4dlthk/(1bp__)-2*linethick outlined rgbstring(dfillcolor) \
      to rvec_(m4dlthk/2,0) then to rvec_(m4dlthk/2,m4dlthk/2)')
  ifgpic(`{line from rvec_(0,m4dlthk/2-lthick/2) to rvec_(0,m4dlthk/2-lthick/2)}
   {line from rvec_(m4dlthk-lthick/2,m4dlthk/2) \
     to rvec_(m4dlthk-lthick/2,-m4dlthk/2+lthick/2) then \
     to rvec_(0,-m4dlthk/2+lthick/2)}
   move to rvec_(m4dlthk/2,m4dlthk/2)')
   rp_ang = rp_ang+pi__/2')
                               `dright(at position,dlthick) Turn right,
                                leaving current location at exit of corner'
define(`dright',`deleminit_(,ifelse(`$2',,dlthick,`$2'),`$2')
  ifelse(`$1',,,`move to substr(`$1',eval(index(`$1',t)+1))-vec_(m4dlthk/2,0)')
  { line thick m4dlthk/(1bp__) to rvec_(m4dlthk,0) }
  ifelse(rgbstring(1,1,1),"",,
   `line thick m4dlthk/(1bp__)-2*linethick outlined rgbstring(dfillcolor) \
      to rvec_(m4dlthk/2,0) then to rvec_(m4dlthk/2,-m4dlthk/2)')
  ifgpic(`{line from rvec_(0,-m4dlthk/2+lthick/2) \
                  to rvec_(0,-m4dlthk/2+lthick/2)}
   {line from rvec_(m4dlthk-lthick/2,-m4dlthk/2) \
     to rvec_(m4dlthk-lthick/2,m4dlthk/2-lthick/2) then \
     to rvec_(0,m4dlthk/2-lthick/2)}
   move to rvec_(m4dlthk/2,-m4dlthk/2)')
   rp_ang = rp_ang-pi__/2')

                               `dturn(arg,dlthick) 
                                Turn arg relative degrees ccw'
define(`dturn',`deleminit_(,ifelse(`$2',,dlthick,`$2'),`$2')
[S: Here
  deg = ifelse(`$1',,0,`$1')
  c = cosd(deg); s = sind(deg); sgn = sign(deg); r = (dlthick-lthick)/2
  A: S+vec_(lthick/2*abs(s),sgn*r)
  B: A+vec_(vscal_(lthick/2*abs(s),c,s))
  C: S+vec_(0, sgn*r)
  if deg==0 then {t = 0} else { t = (1-c)/s } # t = tan(deg/2)
  D: A+vec_(vscal_(r*2,sgn*t,-sgn))
  E: B+vec_(vscal_(r*2,sgn*s,-sgn*c))
  F: S+vec_(0,-sgn*r)
  T: 0.5 between A and D
  X: 0.5 between B and E
  ifelse(rgbstring(1,1,1),"",,
   `line thick r*2/(1bp__) outlined rgbstring(dfillcolor) \
      from S to T then to X')
  ifgpic(`m4tmpth = linethick; linethick=0
    shade(dfillgrey,`line from C to A then to B; line from E to D then to F')
    linethick = m4tmpth')
  line from C to A then to B
  line from E to D then to F
#{"A" at A;"B" at B;"C" at C;"D" at D;"E" at E; "F" at F;"T" at T;"X" at X}
  `$3'] with .S at Here
  move to last [].X
  ifelse(`$1',,,`Point_(`$1'+rp_ang*rtod_)') ')

                `darrow(linespec, start truncation, end truncation, dlthick,
                   arrow wid, arrow ht, terminals)
                 terminals is blank or x-, ->, x->, <-, <-x, <-> where x is
                   ! for closed end with half-width line or
                   | for closed end with full-width line'
define(`darrow',`deleminit_(`$1',,`$4')
  ifelse(ifinstr(`$7',<->,,`$7',<-,T),T,
   `define(`m4dx',`ifinstr(`$7',|,|,`$7',!,!)'->)dnl
    M4DA: line invis from last line.end to last line.start \
      chop ifelse(`$3',,0,m4dlthk/2) chop ifelse(`$2',,0,m4dlthk/2)
      rp_ang = rp_ang+pi__',
   `define(`m4dx',`$7')dnl
    M4DA: line invis from last line.start to last line.end \
      chop ifelse(`$2',,0,m4dlthk/2) chop ifelse(`$3',,0,m4dlthk/2)')
  [ C: M4DA.c; S: M4DA.start; E: M4DA.end
    w = ifelse(`$5',,m4dlthk*3/2,`$5')
    h = ifelse(`$6',,m4dlthk,`$6')
    d = sqrt((w/2)^2+h^2)
    p = d/w*lthick
    V: vec_(0,m4dlthk/2-lthick/2)
    T: vec_(h-lthick/2,0)
    P: vec_(p,0)
    Vt: vec_(0,w/2/h * (h-lthick/2-p))
    W: vec_(lthick/2,0)
    X: ifinstr(`$7',<->,C,m4dx,!,S,m4dx,|,S+(W.x,W.y),S)
  ifgpic(`shade(dfillgrey,') line dnl
  ifelse(rgbstring(1,1,1),"",,`shaded rgbstring(dfillcolor)') from dnl
    ifinstr(m4dx,|,`X to X+(V.x,V.y) then',`X+(V.x,V.y)') to \
    E-(T.x,T.y)+(V.x,V.y) then to E-(T.x,T.y)+(Vt.x,Vt.y) \
    then to E-(P.x,P.y) \
    then to E-(T.x,T.y)-(Vt.x,Vt.y) then to E-(T.x,T.y)-(V.x,V.y) \
    then to dnl
    ifinstr(m4dx,<-,
     `S+(T.x,T.y)-(V.x,V.y) then to S+(T.x,T.y)-(Vt.x,Vt.y) \
      then to S+(P.x,P.y) \
      then to S+(T.x,T.y)+(Vt.x,Vt.y) then to S+(T.x,T.y)+(V.x,V.y) \
      then to X+(V.x,V.y)',
    m4dx,|,
     `X-(V.x,V.y) then to X',
    m4dx,!,
     `S-(V.x,V.y); line thick linethick/2 from S+(W.x/2,W.y/2)-(V.x,V.y) \
        to S+(W.x/2,W.y/2)+(V.x,V.y)
      line from S+(V.x,V.y) to X+(V.x,V.y)',
     `X-(V.x,V.y)') ifgpic(`)')
  ] with .C at M4DA.c
  ifelse(ifinstr(`$7',<->,,`$7',<-,T),T,
   `rp_ang = rp_ang-pi__
    arrow invis from M4DA.end to M4DA.start',
   `arrow invis from M4DA.start to M4DA.end')
')

               `Darrow(linespec,params)
                 params is a semicolon-separated list of items:
                   S truncate at start by dline thickness/2
                   E truncate at end by dline thickness/2
                   thick=val   (total thicknes, ie width)
                   wid=val     (arrowhead width)
                   ht=val      (arrowhead height)
                   ends= -> or x-> or <- or <-x or <-> where x is | or ! 
                   |- closed end with full-width line
                   !- closed end with half-width line
                eg Darrow(from A to B,E;ends=<-|)'
define(`Darrow',
 `setkey_(`$2',thick,dlthick)
  setkey_(`$2',wid,dlthick*3/2)
  setkey_(`$2',ht,dlthick)
  setkey_(`$2',ends)pushdef(`m4ends',substr(m4ends,1,eval(len(m4ends)-2)))
  darrow(`$1',ifinstr(`$2',S,t),ifinstr(`$2',E,t),m4thick,m4wid,m4ht,m4ends)
popdef(`m4ends')popdef(`m4ends')popdef(`m4ht')popdef(`m4wid')popdef(`m4thick')')

                          `dtee([L|R],dlthick) Construct tee with tail right,
                           left, or back along current direction, leaving
                           current location at tee centre; eg
                           dline(right_,,t); dtee(R);
                           { darrow(down_,t) }; darrow(right_,t)'
define(`dtee',`deleminit_(,ifelse(`$2',,dlthick,`$2'),`$2')
  move to last line.c
  ifelse(`$1',L,`rp_ang = rp_ang-pi_/2',`$1',R,`rp_ang = rp_ang+pi_/2')
  ifelse(rgbstring(1,1,1),"",,
   `{line thick dlthick/(1bp__) from rvec_(-m4dlthk/2,0) to rvec_(m4dlthk/2,0)}
    {line thick dlthick/(1bp__)-2*linethick outlined rgbstring(dfillcolor) \
       to rvec_(-m4dlthk/2,0) }
    {line thick dlthick/(1bp__)-2*linethick outlined rgbstring(dfillcolor) \
      from rvec_(0,-m4dlthk/2) to rvec_(0,m4dlthk/2) } ')
  ifgpic(`m4tmpth = linethick; linethick=0; shade(dfillgrey,
    {line from rvec_(-m4dlthk/2, m4dlthk/2) to rvec_( m4dlthk/2, m4dlthk/2)}
    {line from rvec_( m4dlthk/2,-m4dlthk/2) to rvec_(-m4dlthk/2,-m4dlthk/2)})
    linethick = m4tmpth') ')

                                Close off line end: `dend([at position])'
define(`dend',`deleminit_(,lthick)
 ifelse(`$1',,,`move to substr(`$1',eval(index(`$1',at)+2))')
 {line from rvec_(0,-dlthick/2) to rvec_(0,dlthick/2)}
 move to rvec_(lthick/2,0) ')

                `darc(center pos, radius, start radians, end radians, dlthick,
                      arrow wid, arrow ht, symbols )  draw CCW arc
                 symbols= x-, -x, x-x, ->, x->, <-, <-x, <->
                 where x is | or ! ; arrowheads for dpic only '
define(`darc',`[ C: (0,0)
  dlth=ifelse(`$5',,dlthick,`$5')
  w = ifelse(`$6',,dlth*1.75,(`$6'))
  h = ifelse(`$7',,dlth,(`$7'))
  r = ifelse(`$2',,darcrad,`($2)')
  p = sqrt((w/2)^2+h^2)/(w/2)*lthick
  as = ifelse(`$3',,rp_ang-pi__/2,`$3')
  tas = as ifinstr(`$8',<-,`+ p/r')
  ae = ifelse(`$4',,as+pi__/2,`$4')
  tae = ae ifinstr(`$8',<-,`- p/r')
  S: (rect_(r,as)); TS: (rect_(r,tas))
  E: (rect_(r,ae)); TE: (rect_(r,tae))
  arc thick dlth/(1bp__) wid w ht h dnl
   ifinstr(`$8',<-,<-`'ifinstr(`$8',->,>),`$8',->,->) from S to E with .c at C
  ifelse(rgbstring(1,1,1),"",,
   `arc thick dlth/(1bp__)-linethick*2 wid (h-p-lthick)/h*w ht h-p-lthick \
      colored rgbstring(dfillcolor) \
      ifinstr(`$8',<-,<-`'ifinstr(`$8',->,>),`$8',->,->) \
      from TS to TE rad r with .c at C')
  ifinstr(`$8',|-,`X: (vscal_(lthick/2,-sin(as),cos(as)))
    line from C+(rect_(r+dlthick/2-lthick/2,as))+(X.x,X.y) to \
              C+(rect_(r-dlthick/2+lthick/2,as))+(X.x,X.y)',
  `$8',!-,`X: (vscal_(lthick/4,-sin(as),cos(as)))
    line thick linethick/2 \
      from C+(rect_(r+dlthick/2-lthick/4,as))+(X.x,X.y) to \
           C+(rect_(r-dlthick/2+lthick/4,as))+(X.x,X.y)')
  ifinstr(`$8',-|,`X: (vscal_(lthick/2,-sin(ae),cos(ae)))
    line from C+(rect_(r+dlthick/2-lthick/2,ae))-(X.x,X.y) to \
              C+(rect_(r-dlthick/2+lthick/2,ae))-(X.x,X.y)',
  `$8',!-,`X: (vscal_(lthick/4,-sin(ae),cos(ae)))
    line thick linethick/2 \
      from C+(rect_(r+dlthick/2-lthick/4,ae))-(X.x,X.y) to \
           C+(rect_(r-dlthick/2+lthick/4,ae))-(X.x,X.y)')
# { "S" at S; "E" at E; "C" at C; "TS" at TS; "TE" at TE }
  rp_ang := ae+pi__/2
  ] with ifelse(`$1',,.S at Here,.C at `$1')
  move to last [].E
  ')

                `Darc(center pos, radius, start radians, end radians, params)
                 draw CCW arc
                 params is a semicolon-separated list of items:
                   thick=val   (total thicknes, ie width)
                   wid=val     (arrowhead width)
                   ht=val      (arrowhead height)
                   ends= x-, -x, x-x, ->, x->, <-, <-x, <-> where x is ! or |
                     < and > work for dpic only
                   |- closed end with full-width line
                   !- closed end with half-width line
                eg Darc(C,r,ang1,ang2,ends=<-|)'
define(`Darc',
 `setkey_(`$5',thick,dlthick)
  setkey_(`$5',wid,dlthick*1.75)
  setkey_(`$5',ht,dlthick)
  setkey_(`$5',ends)pushdef(`m4ends',substr(m4ends,1,eval(len(m4ends)-2)))
  darc(`$1',`$2',`$3',`$4',m4thick,m4wid,m4ht,m4ends)
popdef(`m4ends')popdef(`m4ends')popdef(`m4ht')popdef(`m4wid')popdef(`m4thick')')

divert(0)dnl
