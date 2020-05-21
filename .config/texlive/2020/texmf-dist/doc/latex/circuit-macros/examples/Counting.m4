.PS
# Counting.m4
gen_init

  g = 0.4                          # grid size
  define grid { (($2)*g,-($1)*g) }
  circlerad = 0.1

for i=1 to 4 do {
  sprintf(`"$S_%g$:"',i) ljust at grid(i,-0.5)
  for j=1 to 4 do { if i+j < 8 then {
    sprintf(`"$s_{%g%g}$"',i,j) at grid(i,j) } } }

"$\vdots$" at grid(4.75,0)
for i=1 to 3 do { `"$\cdots$"' at grid(i,5) }
"$\cdots$" at grid(4,4)

P: grid(1,1)
for k=3 to 5 do {
  for i=1 to k-1 do { if (k%2==1) then { m=i; n=k-i } else { m=k-i; n=i }
    Q: grid(m,n)
    arrow from P to Q chop
    P: Q }
  }

.PE
