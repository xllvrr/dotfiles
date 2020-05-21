.PS
# Series.m4
cct_init

[
  setdir_(Right)
  resistor; llabel(,R); capacitor; llabel(,C);
  inductor; llabel(,L)
]
[

  pushdef(`elen_',dimen_)
  resistor; llabel(,R); capacitor; llabel(,C);
  inductor; llabel(,L)
  popdef(`elen_')
] with .nw at last [].sw + (0,-0.15)

[
  resistor; llabel(,R)
  capacitor( right_ dimen_/4); llabel(,C)
  inductor; llabel(,L)
] with .nw at last [].sw + (0,-0.15)

.PE
