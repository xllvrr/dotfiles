.PS
# GrayCode.m4
gen_init

  outer = 4
  inner = 0.75
  nbits = 10

C: circle diam outer
  circle diam inner at C
  sectors = 2^nbits
  lthk = (outer-inner)/2/nbits
  for bit = 1 to nbits do {
    for is = 2^(bit-1) to sectors by 2^(bit+1) do {
      startang = is/sectors*360
      endang = min(startang+(2^bit)/sectors*360,360)
      arcd(C,outer/2-(bit-0.5)*lthk,startang,endang) thick lthk/(1bp__)
      }
    }
.PE
