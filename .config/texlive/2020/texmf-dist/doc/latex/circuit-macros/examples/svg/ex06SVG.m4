.PS
# ex06SVG.m4
gen_init(svg_font(font-family="Times" font-style="italic",11bp__))

F: box invis wid 1.6i ht 1.8i
E: box invis wid F.wid ht F.ht
G: box invis wid 1i ht F.ht

 ell = F.ht-0.6i
 r = 0.3i
 offset = 8bp__
 hatch = 0.1i
 dhs = hatch * sqrt(2)
 qmell = F.ht - ell
 kwid = F.wid-qmell-r

 box wid G.e.x-F.w.x ht F.ht with .sw at F.sw thick linethick*3/2
 Loopover_(`B',
  `line from B.ne to B.se thick linethick*3/2
   B`'T: B.se + (-qmell,qmell)
   line from (B.w,B`'T) to B`'T chop 0 chop -offset
   line from B`'T up ell chop -offset chop 0
   line from B`'T + (-r,0) up ell
   line dashed from B`'T to B.se
   "svg_fsize(0,110)" at B`'T + (-r/2,ell/2)
   "svg_fsize(0,110)" at B`'T + (qmell/2,ell/2)
   "t" at (B`'T,B.n) + (-offset/2,offset)
   thinlines_
   arrow <-> from B.nw+(0,offset*2/3) right B.wid-qmell-r "k" above
   for x = hatch to B`'T.x-B.w.x-r by hatch do {line down ell from B.nw+(x,0)}
   for y = dhs to qmell by dhs do {line up y right y from (B.w,B`'T)+(0,-y)}
   for x = y-qmell to B.wid-qmell*2 by dhs do {
     line up qmell right qmell from B.sw+(x,0) }
   for x = last line.start.x-B.w.x+dhs to B.wid by dhs do {
     line up (B.wid-x)/2 right (B.wid-x)/2 from B.sw+(x,0) }
   thicklines_
  ',F,E)

 line from (G.w,ET) right G.wid
 line from ET + (0,r) left ET.x-E.w.x

 thinlines_
 for y = hatch to r by hatch do { line left r from ET+(0,r-y) }
 for x = dhs to G.wid by dhs do {
   line left x down x from G.nw+(x,0) }
 for y=x-G.wid to G.ht-G.wid by dhs do {
   line left G.wid down G.wid from G.ne+(0,-y) }
 for x = y-(G.ht-G.wid) to G.wid by dhs do {
   line right G.wid-x up G.wid-x from G.sw+(x,0) }
 arrow <-> up r with .c at ET+(offset*2/3,r/2) "r" ljust
 thicklines_

 "q" at F.sw + (-offset,offset/3)
 "l" at (F.w,FT) + (-offset,offset/3)

 "n+p+m" at G.ne + (0,offset)
 
 Loopover_(`B',`"B" ht 0.12 below at B.s+(0,-2bp__)',F,E,G)

# Adjust the bounding box without using s_box:
 move from F.nw+(-12bp__,21bp__) to G.se+(20bp__,-15bp__)

 command "</g>" # end font
.PE
