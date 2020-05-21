% Byte.m4
.PS
gen_init(svg_font(sans-serif,11bp__))
boxht = 0.2
boxwid = 3.5

define leftlabel { {"$1" at last box.w ljust} }

down_
Lab[0]: box; leftlabel( B0STDISBL (reset pin is enabled) )
Lab[1]: box; leftlabel( WDTON (WDT not always on) )
Lab[2]: box; leftlabel( SPIEN (allow serial programming) )
Lab[3]: box; leftlabel( CKOPT (full output swing) )
Lab[4]: box; leftlabel( EESAVE (don't preserve EEPB0OM over chip erase) )
Lab[5]: box; leftlabel( BOOTSZ1 )
Lab[6]: box; leftlabel( BOOTSZ0 )
Lab[7]: box; leftlabel( BOOTB0ST (boot reset vector at 0x0000) )

boxwid = boxht
left_
B0:box "1" with .e at Lab[0].nw + (0.75,0.5)
  box "0"
  box "0"
  box "1"
  box "0"
  box "0"
  box "1"
  box "1"
  box wid 2*boxht "0xc9"

for i=0 to 7 do {
  spline -> ht arrowht*0.7 from B0.s-(i*boxht,0) down boxht/4 \
    then to Lab[0].nw-((i+1)*boxht/2,0) \
    then down Lab[0].nw.y-Lab[i].y then to Lab[i].w
  }

 command "</g>" # end font
.PE
