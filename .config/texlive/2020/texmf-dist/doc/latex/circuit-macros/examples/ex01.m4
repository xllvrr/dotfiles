.PS
# ex01.m4
cct_init
  linewid = linewid*1.5     # let's make the circuit elements bigger than usual
  define(`elen_',linewid)   # but not longer
  del = elen_/4             # a spacing parameter

  Vin: source(up_ elen_ + 2*del); llabel(-,v_s,+)

  switch(right_ elen_,,C); rlabel(,t = 0,)
  resistor; llabel(,47\`,'\Omega,); b_current(i_R\strut,above rjust)

  line right_ elen_/2 then down_ del
  parallel_(`inductor(,W); llabel(,L,); b_current(\>`'i_L)',
            `capacitor(,C); rlabel(+,v_C,-); llabel(,,\;C)')
  line to (Here,Vin.start) then to Vin.start

  arcd(last []+(4pt__,0),del,30,330) <- ; "$i_2$" at last arc
  arcd(Vin.c+(4*del,0),2*del,30,330) <- ; "$i_1$" at last arc

.PE
