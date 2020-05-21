divert(-1)
#nclude(svg.m4)dnl
#ivert(-1)

#Adjust scale and default lengths
define(`scaledefaults',`
 scale = 1/($1)
 arcrad = arcrad*($1)
 arrowht = arrowht*($1)
 arrowwid = arrowwid*($1)
 boxht = boxht*($1)
 boxrad = boxrad*($1)
 boxwid = boxwid*($1)
 circlerad = circlerad*($1)
 dashwid = dashwid*($1)
 ellipseht = ellipseht*($1)
 ellipsewid = ellipsewid*($1)
 lineht = lineht*($1)
 linewid = linewid*($1)
 moveht = moveht*($1)
 movewid = movewid*($1)
 textht = textht*($1)
 textoffset = textoffset*($1)
 textwid = textwid*($1)
 linethick = linethick*($1)
 maxpsht = maxpsht*($1)
 maxpswid = maxpswid*($1)
')

# Possible defaults for diagrams in mm
define(`SIdefaults',`
 scale = scale*25.4
 arcrad = 5
 arrowht = 2.5
 arrowwid = arrowht/2
 boxht = 12
 boxrad = 0
 boxwid = 18
 circlerad = 5
 dashwid = 1.5
 ellipseht = 12
 ellipsewid = 18
 lineht = 12
 linewid = 12
 moveht = 12
 movewid = 12
 textht = ifsvg(4,0)
 textoffset = 3
 textwid = 0
')

define(`local_init',`
`#' local init begin
 scaledefaults(1.1)
`#' local init end
')

divert(0)dnl
