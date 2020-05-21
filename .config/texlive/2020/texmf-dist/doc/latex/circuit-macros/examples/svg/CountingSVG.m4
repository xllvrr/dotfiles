.PS
# CountingSVG.m4
gen_init(svg_font(sans-serif,11bp__))

  g = 0.4                          # grid size
  define grid { (($2)*g,-($1)*g) }
  circlerad = 0.1

for i=1 to 4 do { # 66% becomes 66%% in the sprintf string:
  sprintf("svg_it(S`'svg_sub(%g,66%):)",i) ljust at grid(i,-0.5)
  for j=1 to 4 do { if i+j < 8 then {
    sprintf("svg_it(s`'svg_sub(%g%g,66%))",i,j) at grid(i,j) } } }

"." at grid(4.6,0)
"." at grid(4.7,0)
"." at grid(4.8,0)
for i=1 to 3 do { `"..."' at grid(i,5) }
"..." at grid(4,4)

P: grid(1,1)
for k=3 to 5 do {
  for i=1 to k-1 do { if (k%2==1) then { m=i; n=k-i } else { m=k-i; n=i }
    Q: grid(m,n)
    arrow from P to Q chop
    P: Q }
  }

move from grid(1,1)+(-0.5,0.1) \# Adjust bounding box
       to grid(4,4)+(0.5,-0.45)

 command "</g>" # end font
.PE
