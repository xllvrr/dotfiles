.PS
# ex17.m4
cct_init

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

[                              # an exercise of the `parallel_' macro:
  down_                        # for labelling
  Point_(-80)                  # skew current direction

  parallel_(Sep=1.75*dimen_;
    parallel_(
     `capacitor(,C); rlabel(,,C_2)',
     `resistor; llabel(,R_2)' ),
    parallel_(
     `resistor; rlabel(,R_1); move to rvec_(-dimen_/5,0)
                 inductor(,W); rlabel(,L_1)',
     `reversed(`source',to rvec_(elen_,0),V,sourcerad_*2.5); rlabel(,v_s)' )
    )

] with .sw at last [].se+(elen_,0)
.PE
