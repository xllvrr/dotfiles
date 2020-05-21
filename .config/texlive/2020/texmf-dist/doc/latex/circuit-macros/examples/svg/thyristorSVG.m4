.PS
# `thyristorSVG.m4'
cct_init(svg_font(sans-serif,11bp__,1.5bp__))

define labels { {
   "$1"  $2 at last[].$1
   "$3" $4 at last[].$3
   "$5" $6 at last[].$5
   "$7" $9 at (last[].s+(0,$8)) } }

down_
Row1: [
  {thyristor
   labels(A,above,K,below,G,ljust,`thyristor',-0.25,wid 0.75) }

  move right 0.50 ; down_
  {thyristor(,B)
   labels(T1,above,T2,below,G,below ljust,`...(,B)',-0.35) }

  move right 0.50 ; down_
  {thyristor(down_ dimen_*0.8,BR)
   labels(T1,above,T2,below,G,below rjust,`...(,BR)',-0.22) }

  move right 0.60 ; down_
  {thyristor(,BE)
   labels(T1,above,T2,below,G,below ljust,`...(,BE)',-0.35) }

  move right 0.50 ; down_
  {thyristor(,A) at (Here,last [])
   labels(A,above,K,below,G,ljust,`...(,A)',-0.35) }

  move right 0.50 ; down_
  {thyristor(,F) at (Here,last [])
   labels(A,above,K,below,G,ljust,`...(,F)',-0.22) }

  move right 0.65 ; down_
  {thyristor(,BRE)
   labels(T1,above,T2,below,G,below rjust,`...(,BRE)',-0.35) }

  move right 0.75 ; down_
  {thyristor(,UARE) at (Here,last [])
   labels(A,above,K,below,G,rjust below,`...(,UARE)',-0.22) }

  move right 0.50 ; down_
  {thyristor(,AV,G: G+(0.1,0.1)) at (Here,last [])
   thinlines_
   spline -> from last[].G left 0.05 then left 0.05 down 0.1
   thicklines_
   labels(A,above,K,below,G,ljust,`...(,AV)',-0.35) }

  move right 0.50 ; down_
  {thyristor(,IEC)
   labels(A,above ljust,K,below ljust,G,ljust,`...(,IEC)',-0.22) }
  ]
Row2: [
  down_
  {thyristor(,UAH)
   labels(A,rjust above,K,rjust below,G,ljust,`...(,UAH)',-0.35,wid 0.65) }

  move right 0.55 ; down_
  {thyristor(,N) at (Here,last [])
   labels(A,above,K,below,Ga,rjust,`...(,N)',-0.22) }

  move right 0.55 ; down_
  {thyristor(,UANRE) at (Here,last [])
   labels(A,above,K,below,Ga,ljust above,`...(,UANRE)',-0.35) }
  move right 0.55 ; down_
  {thyristor(,SCR) at (Here,last [])
   labels(A,above,K,below rjust,G,below ljust,`...(,SCR)',-0.22) }

  move right 0.55 ; down_
  {thyristor(,SCRE) at (Here,last [])
   labels(A,above,K,below,G,ljust below,`...(SCRE)',-0.35) }

  move right 0.65 ; down_
  {thyristor(,SCRRE) at (Here,last [])
   labels(A,above,K,below,G,rjust below,`...(SCRRE)',-0.22) }

  move right 0.55 ; down_
  {thyristor(,SCS) at (Here,last [])
   labels(A,above,K,below,G,ljust,`...(SCS)',-0.35) }
  { "Ga" rjust above at last[].Ga }

  move right 0.55 ; down_
  {thyristor(,SCSE) at (Here,last [])
   labels(A,above,K,below,G,ljust below,`...(SCSE)',-0.22) }
  { "Ga" rjust above at last[].Ga }

  move right 0.65 ; down_
  {thyristor(,SUSE) at (Here,last [])
   labels(A,above,K,below,G,rjust,`...(SUSE)',-0.35) }

  move right 0.65 ; down_
  {thyristor(,SBSE) at (Here,last [])
   labels(T1,above,T2,below,G,rjust,`...(SBSE)',-0.22,wid 50bp__) }

  ] with .nw at Row1.sw + (0,-0.20)

Twoterms: [ right_
  { scr(,,Q) ; `"scr(,,Q)"' at last [].e ljust}
  { "Q.G" at Q.G above }

  move down 0.4; right_
  { scs(,,Q2) ; `"scs(,,Q2)"' at last [].e ljust }
  { "Q2.G" at Q2.G above }
  { "Q2.Ga" at Q2.Ga below }
  ] with .nw at Row2.sw+(0,-0.2)

  [ right_
  { sus(,RE,Q3) ; `"sus(,RE,Q3)"' at last [].e ljust}
  { "Q3.G" at Q3.G above }

  move right_ 1.2 from last line.end
  { sbs(,E,Q4) ; `"sbs(,E,Q4)"' at last [].e ljust}
  { "Q4.G" at Q4.G below }
  ] with .w at last [].e+(1.0,0)

 command "</g>" # end font
.PE
