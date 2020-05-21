.PS
# `DemultiplexerSVG.m4'
log_init(svg_font(sans-serif,11*0.8bp__))

  right_

  Demux(4,DM1)
  "`Demux'(4,DM1)" at last [].s below
  "svg_it(Out0)" at last [].Out0.end +(6bp__,6bp__)
  "svg_it(Out3)" at last [].Out3.end +(6bp__,-6bp__)
  "svg_it(In)" at last [].In.end rjust wid 11bp__
  "svg_it(Sel)" at last [].Sel.end ljust above
  left_; Demux(4,,LOE) with .c at last [].c+(1.2,0)
  "`left_; Demux'(4,,LOE)" at last [].s + (0,-20bp__)
  "svg_it(Sel)" at last [].Sel.end rjust
  "svg_it(Out0)" at last [].Out0.end +(-6bp__,6bp__)
  "svg_it(OE)" at last [].OE.end ljust
  "svg_it(In)" at last [].In.end+(0,5bp__) ljust
  right_; Demux(4,,NOEBN2) with .c at last [].c+(1.2,0)
  "(4,,NOEBN2)" at last [].s below
  "svg_it(Sel0)" at last [].Sel0.end rjust
  "svg_it(Sel1)" at last [].Sel1.end ljust
  "svg_it(Out0)" at last [].Out0.end +(5bp__,6bp__)
  "svg_it(Out3)" at last [].Out3.end +(5bp__,6bp__)
  "svg_it(NOE)" at last [].NOE.end rjust
  "svg_it(In)" at last [].In.end above
   down_; Demux(8,,L3,,28*L_unit) with .c at last [].c+(1.8,0)
  "`down_; Demux'(8,,L3,,28*L_unit)" at last [].s+(0,-15bp__) wid 170bp__
  "svg_it(Sel0)" at last [].Sel0.end rjust
  "svg_it(Sel2)" at last [].Sel2.end rjust below
  "svg_it(Out0)" at last [].Out0.end rjust
  "svg_it(Out7)" at last [].Out7.end ljust
  "svg_it(In)" at last [].In.end rjust

  command "</g>" # end font

.PE
