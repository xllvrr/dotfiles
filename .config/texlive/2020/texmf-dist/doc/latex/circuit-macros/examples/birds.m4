.PS
gen_init
scale = 50
linethick = 2*linethick

define bird {[
  line shaded "$1" from (0,0) to \
  (10,-5) to (19,8) to  (35,7) to  (38,-12)+(0,2) to (60,0) to\
  (75,23) to (80,40) to (52,37)+(2,2) to (74,50) to  (52,50) to \
  (60,60) to (38,48)+(0,2) to (35,67) to (19,68) to (10,55) to \
  (0,60) to  (-8,50) to (14,50) to (-8,37)+(2,2) to (20,40) to \
  (15,23) to (0,0)
E: (80,40)
W: (20,40)
N: (19,68)
S: (19,8)
  line outlined "gray" from (35,15) down 10 right 25
  line outlined "gray" from (40,20) right 25 down 8
  line outlined "gray" from (42,25) right 28 down 6
  line outlined "gray" from (40,30) right 32 down 4
  circle outlined "gray" rad 1 at (1,55)
  circle outlined "gray" rad 4 at (24,55)
]}

  ncols = 4
  nrows = 4
  right
  for i=0 to nrows-1 do {
    for j=0 to ncols-1 do { move to (j*60,-i*60)
      if (i+j)%2==0 then { bird(black) } else { bird(white) }
      }
    }

.PE
