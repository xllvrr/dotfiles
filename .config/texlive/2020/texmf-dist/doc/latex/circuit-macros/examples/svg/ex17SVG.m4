.PS
# ex17SVG.m4
cct_init(svg_font(sans-serif,11bp__,0bp__))

[
nrows = 4
ncols = 9
linewid = linewid*0.6          # everything smaller
define(`elen_',linewid)        # shorter default length

   for j = 1 to nrows do {
      { for i = 1 to ncols do {
           Point_(-120) resistor
           Point_(   0) inductor
           Point_( 120) capacitor
           if i < ncols then {Point_(0) diode} }
        }
      Point_(-120) move to rvec_(elen_,0)
      { for i = 1 to ncols do {
            Point_(-60) capacitor
            Point_( 60) resistor }
         }
      Point_(-60) move to rvec_(elen_,0)
      }
   Point_(0) for i = 1 to ncols-1 do { inductor }
]

[
  down_
  Point_(-80)

  parallel_(Sep=1.75*dimen_;
        parallel_(`capacitor(,C); rlabel(,,C`'svg_sub(2))',
                  `resistor; llabel(,R`'svg_sub(2))' ),
        parallel_(`resistor; rlabel(,R`'svg_sub(1)); move to rvec_(-dimen_/5,0)
                     inductor(,W); rlabel(,L`'svg_sub(1))',
                  `reversed(`source',to rvec_(elen_,0),V,sourcerad_*2.5)
                    rlabel(,v`'svg_sub(s))' )
        )
  move left 0.2 from last [].w
] with .sw at last [].se+(elen_,0)

 command "</g>" # end font
.PE
