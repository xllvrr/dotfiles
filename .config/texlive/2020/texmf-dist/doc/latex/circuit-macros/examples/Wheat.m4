.PS
# `Wheat.m4'
gen_init

boxwid = boxht

for j = 0 to 7 do {
  for i = 0 to 7 do {
    box fill_((i+j)%2) at (j*boxwid,-i*boxwid)
    x = 2^(j+8*i)
    if (i+j)%2==0 then { command "{\white" } else { command "{\black" }
    if x < 10000 then { sprintf("\Large$%g$",x) at last box } \
    else { y = int(log(x))
           sprintf("{\Large$%g$}$\cdot 10^{%g}$",round_(x/(10^y)),y) \
             at last box }
    command "}"
    }
  }

.PE
