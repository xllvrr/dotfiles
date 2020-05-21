.PS
# SwitchesSVG.m4
cct_init(svg_font(sans-serif,11bp__,2bp__))
textoffset = 3bp__

movewid = 0.25
# Row 1
  right_; {
    lswitch; {S:"svg_tt(`lswitch')" at last [].s+(0,-10bp__)}
    move right_
    lswitch(,,O); {"svg_tt(`(,,O)')" at (last [],S)}
    move right_
    lswitch(,,C); {"svg_tt(`(,,C)')" at (last [],S)}
    move right_
    lswitch(,,DA); {"svg_tt(`(,,DA)')" at (last [],S)}
    move right_
    lswitch(,,dDO); {"svg_tt(`(,,dDO)')" at (last [],S)}
    move right_
    lswitch(,,uDC); {"svg_tt(`(,,uDC)')" at (last [],S)}
    }
# Row 2
  move down; right_; {
    lswitch(,,K); {S:"svg_tt(`(,,K)')" at last [].s+(0,-10bp__)}
    move right_
    lswitch(,,KD); {"svg_tt(`(,,KD)')" at (last [],S)}
    move right_
    lswitch(,,KOD); {"svg_tt(`(,,KOD)')" at (last [],S)}
    move right_
    lswitch(,,KCD); {"svg_tt(`(,,KCD)')" at (last [],S)}
    move right_
    bswitch; {"svg_tt(``bswitch'')" at (last [],S)}
    move right_
    bswitch(,,C); {"svg_tt(`(,,C)')" at (last [],S)}
    }
# Row 3
  move down; right_; {
    D: dswitch(,,); {S: "svg_tt(`dswitch(,,)')" at last [].s+(0,-10bp__)}
    thinlines_
    { spline <- from 0.25 along_(D) up 0.1 then up 0.05 left 0.1
      {"svg_tt(`W')" rjust}
      spline <- from D.c+(0,m4sc*2) up 0.1 then up 0.05 left 0.1
      {"svg_tt(`B')" rjust }}
    thicklines_
    move right_
    D: dswitch(,,WdBK); {"svg_tt(`(,,WdBK)')" at (last [],S)+(0,-4bp__)}
    thinlines_
    { spline <- from tr_xy(0,-2) up 0.1 then up 0.10 left 0.1
      {"svg_tt(`dB')" rjust}
      spline <- from tr_xy(4,-2) right 0.1 then right 0.05 up 0.15
      {"svg_tt(`K')" above }}
    thicklines_
    move right_
    dswitch(,,WBmdDK); {"svg_tt(`(,,WBmdDK)')" at (last [],S)}
    move right_
    dswitch(,,WBKTr); {"svg_tt(`(,,WBKTr)')" at (last [],S)}
    move right_
    dswitch(,,WdBL); {"svg_tt(`(,,WdBL)')" at (last [],S+(0,-4bp__))}
    move right_
    dswitch(,,WBCo); {"svg_tt(`(,,WBCo)')" at (last [],S)}
    }
# Row 4
  move down; right_; {
    dswitch(,,WBKCo); {S: "svg_tt(`(,,WBKCo)')" at last [].s+(0,-10bp__)}
    move right_
    dswitch(,,WBCb); {"svg_tt(`(,,WBCb)')" at (last [],S)}
    move right_
    dswitch(,,WBDI); {"svg_tt(`(,,WBDI)')" at (last [],S)}
    move right_
    dswitch(,,WBSd); {"svg_tt(`(,,WBSd)')" at (last [],S)}
    move right_
    dswitch(,,WBFDI); {"svg_tt(`(,,WBFDI)')" at (last [],S)}
    move right_
    dswitch(,,WBFSd); {"svg_tt(`(,,WBFSd)')" at (last [],S)}
    }
# Row 5
  move down moveht*5/4; right_; {
    dswitch(,,WBTh); {S: "svg_tt(`(,,WBTh)')" at last [].s+(0,-10bp__)}
    move right_
    dswitch(,,WBKC); {"svg_tt(`(,,WBKC)')" at (last [],S)}
    move right_
    dswitch(,,WBM); {"svg_tt(`(,,WBM)')" at (last [],S)}
    move right_
    dswitch(,,WBCO); {"svg_tt(`(,,WBCO)')" at (last [],S)}
    move right_
    dswitch(,,WBMP); {"svg_tt(`(,,WBMP)')" at (last [],S)}
    move right_
    dswitch(,,WBoKCP); {"svg_tt(`(,,WBoKCP)')" at (last [],S)}
    }
# Row 6
  move down moveht*5/4; right_; {
    dswitch(,,WBCY); {S: "svg_tt(`(,,WBCY)')" at last [].s+(0,-10bp__)}
    move right_
    dswitch(,,WBCZ); {"svg_tt(`(,,WBCZ)')" at (last [],S)}
    move right_
    dswitch(,,WBCE); {"svg_tt(`(,,WBCE)')" at (last [],S)}
    move right_
    dswitch(,,WBRH); {"svg_tt(`(,,WBRH)')" at (last [],S)}
    move right_
    dswitch(,,WBRdH); {"svg_tt(`(,,WBRdH)')" at (last [],S)}
    move right_
    dswitch(,,WBRHH); {"svg_tt(`(,,WBRHH)')" at (last [],S)}
    }
# Row 7
  move down moveht*5/4; right_; {
    move down 2bp__; right_
    dswitch(,,WBPr); {S: "svg_tt(`(,,WBPr)')" at last [].s+(0,-10bp__)}
    move right_
    dswitch(,,WBPrT); {S: "svg_tt(`(,,WBPrT)')" at last [].s+(0,-10bp__)}
    move down_ 6bp__ then right_
    dswitch(,,WBPrM); {S: "svg_tt(`(,,WBPrM)')" at last [].s+(0,-10bp__)}
    }
# Row 8
  move down; right_; {
    dswitch(,,WBMMR); {S: "svg_tt(`(,,WBMMR)')" at last [].s+(0,-10bp__)}
    move right_
    dswitch(,,WBMM); {"svg_tt(`(,,WBMM)')" at (last [],S)}
    move right_
    dswitch(,,WBMR); {"svg_tt(`(,,WBMR)')" at (last [],S)}
    move right_
    dswitch(,,WBEL); {"svg_tt(`(,,WBEL)')" at (last [],S)}
    move right_
    dswitch(,,WBLE); {"svg_tt(`(,,WBLE)')" at (last [],S)}
    move right_
    dswitch(,,WBoKEL); {"svg_tt(`(,,WBoKEL)')" at (last [],S)}
    }

 command "</g>')" # end font
.PE
