.PS
# MultiplexerSVG.m4
log_init

#                               Font
  textht = textht*0.8
  command "<g font-size=\"50%\" font-family=\"Helvetica\">"
  right_

  Mux(4,M1)
  "`Mux'(4,M1)" at last [].s below
  "svg_it(In0)" at last [].In0.end rjust wid 14bp__
  "svg_it(In1)" at last [].In1.end rjust
  "svg_it(In2)" at last [].In2.end rjust
  "svg_it(In3)" at last [].In3.end rjust
  "svg_it(Out)" at last [].Out.end above
  "svg_it(Sel)" at last [].Sel.end ljust above

  left_; Mux(4,,LNOE) with .c at last [].c+(0.9,0)
  { line right 8bp__ at last [] . 1nd last ""+(-10bp__,4bp__) }
  "`left_; Mux'(4,,LNOE)" at last [].s +(0,-20bp__)
  "svg_it(In0)" at last [].In0.end above
  "svg_it(NOE)" at last [].NOE.end +(4bp__,0) below
  "svg_it(Out)" at last [].Out.end below
  "svg_it(Sel)" at last [].Sel.end rjust below

  right_; Mux(4,,OEBN2) with .c at last [].c+(1.4,0)
  "`Mux'(4,,OEBN2)" at last [].s below
  "svg_it(Sel0)" at last [].Sel0.end rjust
  "svg_it(Sel1)" at last [].Sel1.end ljust
  "svg_it(In0)" at last [].In0.end rjust
  "svg_it(In3)" at last [].In3.end rjust
  "svg_it(OE)" at last [].OE.end rjust

   down_; Mux(8,,L3,,28*L_unit) with .c at last [].c+(1.7,0)
  "`down_; Mux'(8,,L3,,28*L_unit)" at last [].s below wid 162bp__
  "svg_it(Sel0)" at last [].Sel0.end rjust
  "svg_it(Sel2)" at last [].Sel2.end rjust below
  "svg_it(In0)" at last [].In0.end rjust
  "svg_it(In7)" at last [].In7.end ljust wid 14bp__

 command "</g>" # end font
.PE
