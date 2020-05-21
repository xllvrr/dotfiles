% Rotbox.m4
.PS
gen_init
#nclude(dpictools.pic)

[
  Point_(-10)
  rotbox(boxwid/2,,thick 2)
  Point_(30)
  rotbox(,,shaded "green" outlined "blue",r=0.1) at last []+vec_(boxwid,0)
  "r=0.1" at last []
  move to last [].ne
  Point_(0)
  [[]; for_(2,8,2, `rotbox(,,dashed,t=m4x/10) at last []+vec_(boxwid*1.1,0)
    sprintf("t=%g",m4x/10) at last [] ') ] with .nw at last [].ne+(0.1,0)
  [[]; for_(10,16,2, `rotbox(,,dashed,t=m4x/10) at last []+vec_(boxwid*1.1,0)
    sprintf("t=%g",m4x/10) at last [] ') ] with .nw at last [].sw+(0,-0.1)
]

.PE
