.PS
# Floor.m4
gen_init
  s = 0.25
  s60 = s*sqrt(3)/2
  c60 = s/2
  ni = 9
  nj = 6
  cellw = 3*s
  cellh = 2*s60
  B:box wid nj*cellw ht ni*cellh shaded rgbstring(0,1,0)
  
  for i=1 to ni do {
    for j=1 to nj do {
      line shaded rgbstring(0,0,1) \
        from B.sw+((j-1)*cellw,(i-1)*cellh) \
        right c60 up s60 then right 2*s then up s60 right c60 then left s \
        then down cellh left 2*c60 then left s
      line shaded rgbstring(1,0,0) \
        from B.sw+((j-1)*cellw,i*cellh) \
        right s then down cellh right 2*c60 then right s then up s60 left c60 \
        then left 2*s then left c60 up s60
      }
    }
.PE
