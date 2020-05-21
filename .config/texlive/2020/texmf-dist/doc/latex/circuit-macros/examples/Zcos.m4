.PS
# Zcos.m4
gen_init
NeedDpicTools

# define f1 { ee = expe(8*x*`$1'*(x^2 - (`$1')^2));
#   $2 = ee + 1/ee + 2*cos(2*x^4 + 2*(`$1')^4 - 12*x^2*(`$1')^2) - 4;
#   }

# alternative: |cos(z^4)| = 1
  define f1 { Z: (x,$1)
    Z4: Zprod(Zprod(Z,Z),Zprod(Z,Z))
    $2 = zabs(Zcos(Z4)) - 1
    }

  ni = 200
  for i=10 to ni do { x = i/ni*3
    findroot( f1, 0, 0.2, 1e-8, y )
    P[i-10]: x,y }
  np = ni-10

  for deg=0 to 359 by 45 do {
    for i=0 to np do { Z[i]: rot_(P[i].x,P[i].y,deg*dtor_) }
    fitcurve(Z,np,thick 2 outlined "blue")
    for i=0 to np do { Z[i]: rot_(P[i].x,-P[i].y,deg*dtor_) }
    fitcurve(Z,np,thick 2 outlined "blue")
    }

.PE
