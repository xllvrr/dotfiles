.PS
# randomSVG.m4
gen_init(svg_font(sans-serif,9bp__))
NeedDpicTools

################################################################
#                                   hscale(right length,nlabels,
#                                     minlabel,maxlabel,[T][N])
  define(`hscale',`[ define(`hs_nl',`ifelse(`$2',,5,`$2')')
    A: line `$1' ; Start: A.start; End: A.end
    td = 1/(hs_nl-1)*A.len/5
    define(`hs_ud',`ifinstr(`$5',T,down,up)')
#                                   Major tics
    for i=1 to hs_nl-2 do { line hs_ud graphsize/20 thick 0.4 \
      from i/(hs_nl-1) between A.start and A.end }
#                                   Minor tics
    for i=0 to hs_nl-2 do { Ts: i/(hs_nl-1) between A.start and A.end
      for j=1 to 4 do { line thick 0.4 hs_ud graphsize/20/2 from Ts+(j*td,0) } }
#                                   Labels
    ifinstr(`$5',N,,`for_(0,eval(hs_nl-1),1,
     `Ts: m4x/(hs_nl-1) between A.start and A.end
      s_box("%g",`$3'+m4x/(hs_nl-1)*(`$4'-(`$3'))) \
        at Ts ifelse(`$5',T,above,below)') ')
    ]')
#                                   vscale(up length,nlabels,
#                                     minlabel,maxlabel,[R][N] )
  define(`vscale',`[ define(`vs_nl',`ifelse(`$2',,5,`$2')')
    A: line `$1' ; Start: A.start; End: A.end
    td = 1/(vs_nl-1)*A.len/5
    define(`vs_lr',`ifinstr(`$5',R,left,right)')
#                                   Major tics
    for i=1 to vs_nl-2 do { line vs_lr graphsize/20 thick 0.4 \
      from i/(vs_nl-1) between A.start and A.end }
#                                   Minor tics
    for i=0 to vs_nl-2 do { Ts: i/(vs_nl-1) between A.start and A.end
      for j=1 to 4 do { line thick 0.4 vs_lr graphsize/20/2 from Ts+(0,j*td) } }
#                                   Labels
    ifinstr(`$5',N,,`for_(0,eval(vs_nl-1),1,
     `Ts: m4x/(vs_nl-1) between A.start and A.end
      s_box("%g",`$3'+m4x/(vs_nl-1)*(`$4'-(`$3'))) \
        at Ts ifelse(`$5',R,ljust,rjust)')')
    ]')
#                                   f_gauss(x,mean,stddev)
  define f_gauss`{ std_gauss(($1-($2))/($3))/($3) }'
  define std_gauss`{ expe(-($1)^2/2)/sqrt(twopi_) }'
################################################################

[
  n = 2000
  stddev = 0.25
  graphsize = 2

  B: box wid graphsize ht graphsize ; { move left 0.4 from B.w }
#                                   Gemerate n Gaussian random numbers
  randn(z,n,0,stddev) 
  m = 0
  for i=1 to n-1 by 2 do { m +=1; x[m] = z[i]; y[m] = z[i+1]
    dot(at B+(x[m],y[m]))
 }

  hscale(right B.wid,5,-1,1) with .Start at B.sw
  hscale(right B.wid,5,-1,1,TN) with .Start at B.nw
  vscale(up B.ht,5,-1,1) with .Start at B.sw
  vscale(up B.ht,5,-1,1,RN) with .Start at B.se

  N: box invis wid B.wid ht B.ht with .sw at B.nw+(0,graphsize/10)
  nb = 20
  binmax = n/5*0.5
  dx = N.wid/nb
  histbins(x,m,-1,1,nb,hbin)
  for i=0 to nb-1 do { line up hbin[i]/binmax * N.ht \
    from N.sw+((0.5+i)*dx,0) thick dx/(1bp__) outlined "gray" }
  box wid N.wid ht N.ht at N 
# vscale(up N.ht,5,0,1) with .Start at N.sw

  E: box invis wid B.wid ht B.ht with .sw at B.se+(graphsize/10,0)
  nb = 20
  binmax = n/5*0.5
  dy = E.ht/nb
  histbins(y,m,-1,1,nb,vbin)
  for i=0 to nb-1 do { line right vbin[i]/binmax * E.wid \
    from E.sw+(0,(0.5+i)*dy) thick dy/(1bp__) outlined "gray" }
  box wid E.wid ht E.ht at E 
# hscale(right E.wid,5,0,1) with .Start at E.sw

ng = 16
for i=0 to ng do { x = i/ng*N.wid
  U: x,(f_gauss(x,N.wid/2,stddev)*m*dx)/binmax*N.ht
  X[i]: N.sw+U
  Y[i]: E.nw+(U.y,-U.x) }
 fitcurve(X,ng)
 fitcurve(Y,ng)

]
#showbox_

command "</g>"
.PE
