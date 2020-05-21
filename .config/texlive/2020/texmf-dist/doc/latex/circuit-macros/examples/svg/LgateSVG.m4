divert(-1)
# LgateSVG.m4
###########################################################################

define(`And',`GenLogGate(AND,$@)')
define(`Nand',`GenLogGate(NAND,$@)')
define(`Or',`GenLogGate(OR,$@)')
define(`Nor',`GenLogGate(NOR,$@)')
define(`Xor',`GenLogGate(XOR,$@)')
define(`Nxor',`GenLogGate(NXOR,$@)')
define(`Not',`GenLogGate(NOT,$@)')

define(`GenLogGate',`[ pushdef(`m4nargs',0)dnl
  #                               Count the arguments and draw the gate
  Loopover_(`a',`define(`m4nargs',incr(m4nargs))',shift($@))dnl
  G: ifelse(`$1',NOT,`NOT_gate()',`$1_gate(m4nargs)')
  Out: G.Out
  T: (G.In1.x-2*L_unit,G.y)
  #                               Sublayer gates with centre at the height of G
  SubLayer: [ pushdef(`m4_nct',0)
    pushdef(`m4glayer')dnl
    Loopover_(`arg',
     `define(`m4_nct',incr(m4_nct))dnl
    #                             Stack the input label or draw a sublayer gate
      pushdef(`m4InNames')dnl
      Gate`'m4_nct: ifelse(patsubst(substr(arg,0,1),`[a-zA-Z]',`&'),&,
       `[ In`'arg: ifdef(`MarkLogInputs',`"arg" above',Here)
          pushdef(`m4InNames',In`'arg)dnl
          Out: Here ] ht 2*L_unit',
       `arg') ifelse(m4_nct,1,,`with .ne at last [].se+(0,-L_unit)')
      ifdef(`MarkSubLayers',
       `{ box wid last [].wid ht last [].ht at last [] }')
      #                           Prepend gate name to labels
      m4LogPromote(Gate`'m4_nct)',
      shift($@)) dnl
      #                           Promote gate labels to Sublayer block
    pushdef(`m4InNames') m4LogLabel()
    MidOut: 0.5 between Gate`'eval((m4_nct+1)/2).Out \
      and Gate`'eval((m4_nct+2)/2).Out
    popdef(`m4_nct')dnl
    ] with .MidOut at T+(-m4nargs*L_unit,0) # end SubLayer
  ifdef(`MarkSubLayers',
   `{ box wid last [].wid ht last [].ht at last [] }')
  #                               Promote sublayer labels to outer block
  pushdef(`m4glayer') m4LogPromote(SubLayer) dnl
  pushdef(`m4InNames') m4LogLabel() dnl
  #                               Draw the connecting lines
  define(`m4hhv',`(m4nargs-1)/2')dnl
  for_(1,m4nargs,1,`
    line from G.In`'m4x \
      left G.In`'m4x.x-T.x+(m4hhv-abs(m4x-m4hhv-1))*L_unit \
      then up SubLayer.Gate`'m4x.Out.y-G.In`'m4x.y \
      then to SubLayer.Gate`'m4x.Out')
  popdef(`m4nargs') dnl
  ]')

#                                 Manage names of sublayer inputs
define(`m4LogPromote',`ifelse(m4InNames,,`popdef(`m4InNames')',
 `pushdef(`m4glayer',m4InNames:$1)
  popdef(`m4InNames') m4LogPromote($1)') ')dnl

define(`m4LogLabel',`ifelse(m4glayer,,`popdef(`m4glayer')',
 `define(`m4BaseIn',`substr(m4glayer,0,index(m4glayer,:))')dnl
  m4glayer.m4BaseIn
  pushdef(`m4InNames',m4BaseIn) popdef(`m4glayer') m4LogLabel()') ')dnl

#                                 Clear a name stack
define(`stack_del',`ifelse($1,`$1',,`popdef(`$1')$0($@)')')

###########################################################################
divert(0)dnl
.PS
log_init(svg_font(sans-serif,11bp__))
#define(`MarkLogInputs')

define(`bbelow',`with .nw at last [].sw+(0,-0.2)')

  define(`MarkLogInputs')
Ex1:Or(x1,q,`Or(y1,z1)',`Or(z3,u,v,`Or(w,r)',x2,y2,z2,m)')
 `"Or(x1,q,`Or(y1,z1)',`Or(z3,u,v,`Or(w,r)',x2,y2,z2,m)')"' \
     at Ex1.se+(-0.4,-0.2)
  undefine(`MarkLogInputs')

  line from Ex1.Inx1 to (Ex1.w,Ex1.Inx1)-(L_unit,0)
  line from Ex1.Inx2 to (Here,Ex1.Inx2) then to Here; dot
  line to Here-(2*L_unit,0); Inx: "x" above

  line from Ex1.Iny1 to (Ex1.w,Ex1.Iny1)-(2*L_unit,0)
  line from Ex1.Iny2 to (Here,Ex1.Iny2) then to Here; dot
  line to Here-(2*L_unit,0); Iny: "y" above

  line from Ex1.Inz1 to (Ex1.w,Ex1.Inz1)-(3*L_unit,0)
  {line from Ex1.Inz3 to (Ex1.Inz3,Ex1.Inz1); dot}
  line from Ex1.Inz2 to (Here,Ex1.Inz2) then to Here; dot
  line to Here-(2*L_unit,0); Inz: "z" above

Ex2: And(`Not(A)',B,C,`Nor(A2,D)') with .nw at Ex1.Out+(0.75,0.2)
  line right 3*L_unit from Ex2.Out
  "svg_it(ABC(A+D))" above ljust at Ex2.G.nw
    line right 0.1 at last ""+(0.1,0.16)
    line right 0.35 at last ""+(0.55,0.16)
  line from Ex2.InA2 to (Ex2.InA2,Ex2.InA); dot
  line to Ex2.InA chop -3*L_unit chop 0
  "svg_it(A)" rjust at last line.start
  "svg_it(B)" rjust at Ex2.InB
  "svg_it(C)" rjust at Ex2.InC
  "svg_it(D)" rjust at Ex2.InD
  `"And(`Not(A)',B,C,`Nor(A2,D)')"' wid 2.1 with .w at Ex2.sw-(0,0.2)
  `"line from Ex2.InA2 to (Ex2.InA2,Ex2.InA); dot"' wid 3.2 \
     with .w at last "".w+(0,-0.2)
  `"line to Ex2.InA chop -3*L_unit chop 0"' wid 2.60 \
      with .w at last "".w+(0,-0.2)
  `"\"A\" rjust at last line.start"' wid 1.6 with .w at last "".w+(0,-0.2)
  `"\"B\" rjust at Ex2.InB; \"C\" rjust at Ex2.InC"' wid 2.7 with .w \
    at last "".w+(0,-0.2)

Ex3: Or(`And(A1,C1)',`And(B1,`Not(C2)')',`And(`Not(A2)',B2,C3)') \
  with .nw at Ex1.sw+(0,-0.4)
  line right 3*L_unit from Ex3.Out
  line from Ex3.InB2 to (Ex3.InA2,Ex3.InB2)+(-2*L_unit,0) \
    then up Ex3.InB1.y-Ex3.InB2.y; dot
  line from Ex3.InB1 to Here chop 0 chop -2*L_unit; B: "svg_it(B)" rjust
  line from Ex3.InA2 to (Ex3.InA2,Ex3.InA1); dot
  line from Ex3.InA1 to (B,Here) ; "svg_it(A)" rjust
  line from Ex3.InC2 to (Ex3.InC2,Ex3.InC1) then to Ex3.InC1
  dot(at Ex3.InC2); line to (B,Here); "svg_it(C)" rjust
  dot(at ((Ex3.InC2)+(-2*L_unit,0),Ex3.InC2))
  line to (Here,Ex3.InC3) then to Ex3.InC3
  "svg_it(AC+BC+ABC)" above ljust at Ex3.G.nw
    line right 0.1 at last ""+(0.5,0.16)
    line right 0.1 at last ""+(0.73,0.16)
  `"Or(`And(A1,C1)',`And(B1,`Not(C2)')',`And(`Not(A2)',B2,C3)')"' \
    at (B,Ex3.s)+(0,-0.2) ljust

# define(`MarkSubLayers')
Ex4: And(`Or(`Nand(`Or(A,B)',C)',D)',E) with .w at Ex3.e+(1.25,0)
  "svg_it(A)" rjust at Ex4.InA
  "svg_it(B)" rjust at Ex4.InB
  line from Ex4.InC to (Ex4.InA,Ex4.InC); "svg_it(C)" rjust
  line from Ex4.InD to (Ex4.InA,Ex4.InD); "svg_it(D)" rjust
  line from Ex4.InE to (Ex4.InA,Ex4.InE); "svg_it(E)" rjust
  line right 3*L_unit from Ex4.Out
  "svg_it((D+(A+B)C)E)" above ljust at Ex4.G.nw
    line right 0.5 at last ""+(0.6,0.16)
  `"And(`Or(`Nand(`Or(A,B)',C)',D)',E)"' at Ex4.sw+(0,-0.2) ljust
# undefine(`MarkSubLayers')

stack_del(`m4InNames') # clear the name stack in case other diagrams need it
# extend the bounding box
move from Ex1.nw+(-0.35,0.1) to Ex4.Out+(1,-0.65)

command "</g>" # end font
.PE
