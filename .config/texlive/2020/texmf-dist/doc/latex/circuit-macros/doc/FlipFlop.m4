.PS
# `FlipFlop.m4'
log_init
iflatex(`ifpsfrag(,`latexcommand({\sf)') ')
s_init(Flipflop)
sinclude(Circuit_macros.dim)

[
right_
  { Q1: FlipFlop(D,Q1)
    s_box(``\tt FlipFlop(D,Q1)'') at last [].Chip.s below
    h1 = L_unit*20
    w1 = L_unit*12
    FlipFlop(T,Q2,ht h1 wid w1 fill_(0.9)) with .w at last [].e+(0.25,0)
    s_box(``\shortstack{\tt FlipFlop(T,Q2,\\
      \tt\quad ht h1 wid w1 fill\_(0.9))}'') \
      at (last [].Chip,2nd last [].Chip.s)+(0,-0.25)
    FlipFlop(RS,,,Chip.wid/8) with .w at last [].e+(0.5,0)
    s_box(``\shortstack[l]{\tt FlipFlop(RS,{,},\\
      \tt\quad Chip.wid/8)}'') at last [].sw below ljust
    FlipFlop(JK) with .w at last [].e+(0.5,0)
    s_box(``\tt FlipFlop(JK)'') with .n at last [].PinPR.end
    }
  move down 1.5; right_
  { FlipFlopX(,,:D;E:CK,,:Q;:lg_bartxt(Q))
    s_box(``\shortstack[l]{\tt FlipFlopX(,{,}\\
       \tt\quad:D;E:CK,{,}:Q;:lg\_bartxt(Q))}'') at last [].Chip.s below
    FlipFlopX(,,:T;E:CK,,:Q;) with .Chip.c at last [].e+(1.25,0)
    s_box(``\shortstack[l]{\tt FlipFlopX(,{,}\\
      \tt\quad:T;E:CK,{,}:Q;)}'') at last [].Chip.s below
    FlipFlopX(,,:J;E:CK;:K,N:CLR,:Q;) with .Chip.c at last [].e+(1.25,0)
    s_box(``\shortstack[l]{\tt FlipFlopX(,{,} \\
      \tt\quad:J;E:CK;:K,N:CLR,:Q;)}'') at last [].Chip.s below
    }
]

if 0 then {
[
# Redrawn from
# https://tex.stackexchange.com/questions/521724/how-could-i-write-this-in-a-more-exportable-way

 for_(0,4,1,`
  Q: FlipFlopX(ifelse(m4x,0,`fill_(0.95)'),,
      :Q:PinQ; :lg_bartxt(Q):PinNQ,
      :CLR:PinCLR,
      :J:PinJ; E::PinCK; :K:PinK,
      :PRST:PinPRST,
      0) with .PinCK at Here
  ifelse(m4x,0,
   `S: source(right_ sourcerad_*2 at Q.Chip,U)
    line from S.start to Q.PinCK')
  T: Q.PinQ-(Q.Chip.wid/2,0)
  arrow from Q.PinQ to T then up Q.Chip.ht/2; { "$Q_`'m4x$" above }
  ifelse(m4x,4,,`arrow from T to (T,Q.PinCK) then left Q.Chip.wid/2')
  ')
] with .nw at last [].sw+(0,-0.5)
}

  iflatex(ifpsfrag(,`latexcommand(})'))
.PE
