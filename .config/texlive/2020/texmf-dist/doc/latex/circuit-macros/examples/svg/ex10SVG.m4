.PS
# ex10.m4
cct_init(svg_font(sans-serif,11bp__))

[
  dt = 360/5
  r = 0.75

  N0: dot(at (Rect_(r,90)))
  N1: dot(at (Rect_(r,(90-dt))))
  N2: dot(at (Rect_(r,(90-2*dt))))
  N3: dot(at (Rect_(r,(90-3*dt))))
  N4: dot(at (Rect_(r,(90-4*dt))))

  line from N0 to N1 then to N2 then to N3 then to N4 then to N0
  L14: line from N1 to N4
  L24: line from N2 to N4
  C02: crossover(from N0 to N2,,L14)
  C13: crossover(from N1 to N3,,C02,L24)
  C03: crossover(from N0 to N3,,L14,L24)
  ]

[
move right 0.5
   up_
setrgb(255,0,0)
Q1: bi_tr(,R)                            # Q1 upward with base to the right
   llabel(,Q`'svg_sub(1))
   resetrgb                        # Label to left of last []
setrgb(0,0,255)
Q2: bi_tr with .C at Q1.C+(elen_*7/4,0)  # Q2 with base to left
   rlabel(,Q`'svg_sub(2))
   resetrgb
   move right 0.5

   ground(at Q1.E)
   ground(at Q2.E)

   line right_ dimen_/3 from Q1.B        # Extend the base conductors
B1: Here
   line left_ dimen_/3 from Q2.B
B2: Here

   resistor(up_ elen_*0.75 from Q1.C); llabel(,R`'svg_sub(L)) # Load resistors
   line to (Q2.C,Here) "svg_it(V`'svg_sub(svg_norm(cc)))" below
   resistor(down_ to Q2.C); llabel(,R`'svg_sub(L))

   move to Q1.C+(0,dimen_/5)
   { resistor(right_ to (B1,Here)); llabel(,R`'svg_sub(1))
X: line to B2 }                          # Label the line to be jumped
   resistor(from (Q2.C,Here) left_ to (B2,Here)); rlabel(,R`'svg_sub(1))
   crossover(to B1,R,X)

   resistor(down_ elen_*0.75); rlabel(,R`'svg_sub(2))   # Bias resistors
   {"svg_it(-V`'svg_sub(svg_norm(cc)))" rjust}
   line to (B2,Here)
   resistor(up_ to B2); rlabel(,R`'svg_sub(2))
  ] with .sw at last [].se+(0.75,0)

 command "</g>" # end font

.PE
