.PS
# Sinus.m4
cct_init
s_init(Sinus)
sinclude(tst.dim)
sinclude(Circuit_macros.dim)

define(`phsource',`source($1,
#`Set angle to 0, draw sinusoid, restore angle'
 m4smp_ang = rp_ang; rp_ang = 0
 sinusoid(m4h/2,twopi_/(m4h),
  ifelse(`$2',,,`($2)/360*2*pi_+')pi_/2,-m4h/2,m4h/2) with .Origin at Here
 rp_ang = m4smp_ang,
$3,$4,$5)')

phsource(,120)
s_box(`{\tt phsourc{}e(,120)}') with .e at last line.end+(0,-0.2) 
.PE
