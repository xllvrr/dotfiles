.PS
# Switches.m4
cct_init

define(`Below',`at last [].s+(0,-10bp__)')

movewid = 0.25
# Row 1
  right_; {
    lswitch; {S:"\tt ls{}witch" Below}
    move right_
    lswitch(,,O); {"\tt (,{,}O)" at (last [],S)}
    move right_
    lswitch(,,C); {"\tt (,{,}C)" at (last [],S)}
    move right_
    lswitch(,,DA); {"\tt (,{,}DA)" at (last [],S)}
    move right_
    lswitch(,,dDO); {"\tt (,{,}dDO)" at (last [],S)}
    move right_
    lswitch(,,uDC); {"\tt (,{,}uDC)" at (last [],S)}
    }
# Row 2
  move down; right_; {
    lswitch(,,K); {S:"\tt (,{,}K)" Below}
    move right_
    lswitch(,,KD); {"\tt (,{,}KD)" at (last [],S)}
    move right_
    lswitch(,,KOD); {"\tt (,{,}KOD)" at (last [],S)}
    move right_
    lswitch(,,KCD); {"\tt (,{,}KCD)" at (last [],S)}
    move right_
    bswitch; {"\tt `bswitch'" at (last [],S)}
    move right_
    bswitch(,,C); {"\tt (,{,}C)" at (last [],S)}
    }
# Row 3
  move down; right_; {
    D: dswitch(,,); {S: "\tt ds{}witch(,{},)" Below}
    thinlines_
    { spline <- from 0.25 along_(D) up 0.1 then up 0.05 left 0.1
      {"\tt W" rjust}
      spline <- from D.c+(0,m4sc*2) up 0.1 then up 0.05 left 0.1
      {"\tt B" rjust }}
    thicklines_
    move right_
    D: dswitch(,,WdBK); {"\tt (,{,}WdBK)" at (last [],S)+(0,-4bp__)}
    thinlines_
    { spline <- from tr_xy(0,-2) up 0.1 then up 0.10 left 0.1
      {"\tt dB" rjust}
      spline <- from tr_xy(4,-2) right 0.1 then right 0.05 up 0.15
      {"\tt K" above }}
    thicklines_
    move right_
    dswitch(,,WBmdDK); {"\tt (,{,}WBmdDK)" at (last [],S)}
    move right_
    dswitch(,,WBKTr); {"\tt (,{,}WBKTr)" at (last [],S)}
    move right_
    dswitch(,,WdBL); {"\tt (,{,}WdBL)" at (last [],S+(0,-4bp__))}
    move right_
    dswitch(,,WBCo); {"\tt (,{,}WBCo)" at (last [],S)}
    }
# Row 4
  move down; right_; {
    dswitch(,,WBKCo); {S: "\tt (,{,}WBKCo)" Below}
    move right_
    dswitch(,,WBCb); {"\tt (,{,}WBCb)" at (last [],S)}
    move right_
    dswitch(,,WBDI); {"\tt (,{,}WBDI)" at (last [],S)}
    move right_
    dswitch(,,WBSd); {"\tt (,{,}WBSd)" at (last [],S)}
    move right_
    dswitch(,,WBFDI); {"\tt (,{,}WBFDI)" at (last [],S)}
    move right_
    dswitch(,,WBFSd); {"\tt (,{,}WBFSd)" at (last [],S)}
    }
# Row 5
  move down moveht*5/4; right_; {
    dswitch(,,WBTh); {S: "\tt (,{,}WBTh)" Below}
    move right_
    dswitch(,,WBKC); {"\tt (,{,}WBKC)" at (last [],S)}
    move right_
    dswitch(,,WBM); {"\tt (,{,}WBM)" at (last [],S)}
    move right_
    dswitch(,,WBCO); {"\tt (,{,}WBCO)" at (last [],S)}
    move right_
    dswitch(,,WBMP); {"\tt (,{,}WBMP)" at (last [],S)}
    move right_
    dswitch(,,WBoKCP); {"\tt (,{,}WBoKCP)" at (last [],S)}
    }
# Row 6
  move down moveht*5/4; right_; {
    dswitch(,,WBCY); {S: "\tt (,{,}WBCY)" Below}
    move right_
    dswitch(,,WBCZ); {"\tt (,{,}WBCZ)" at (last [],S)}
    move right_
    dswitch(,,WBCE); {"\tt (,{,}WBCE)" at (last [],S)}
    move right_
    dswitch(,,WBRH); {"\tt (,{,}WBRH)" at (last [],S)}
    move right_
    dswitch(,,WBRdH); {"\tt (,{,}WBRdH)" at (last [],S)}
    move right_
    dswitch(,,WBRHH); {"\tt (,{,}WBRHH)" at (last [],S)}
    }
# Row 7
  move down moveht; right_; {
    move down_ 2bp__; right_
    dswitch(,,WBPr); {S: "\tt (,{,}WBPr)" Below}
    move right_
    dswitch(,,WBPrT); {S: "\tt (,{,}WBPrT)" Below}
#   move right_
#   Proxim; {S: "\tt Pro{}xim" Below}
#   move right_
#   Magn; {S: "\tt Mag{}n" Below}
    move down_ 6bp__ then right_
    dswitch(,,WBPrM); {S: "\tt (,{,}WBPrM)" Below}
    }
# Row 8
  move down; right_; {
    dswitch(,,WBMMR); {S: "\tt (,{,}WBMMR)" Below}
    move right_
    dswitch(,,WBMM); {"\tt (,{,}WBMM)" at (last [],S)}
    move right_
    dswitch(,,WBMR); {"\tt (,{,}WBMR)" at (last [],S)}
    move right_
    dswitch(,,WBEL); {"\tt (,{,}WBEL)" at (last [],S)}
    move right_
    dswitch(,,WBLE); {"\tt (,{,}WBLE)" at (last [],S)}
    move right_
    dswitch(,,WBoKEL); {"\tt (,{,}WBoKEL)" at (last [],S)}
    }
.PE
