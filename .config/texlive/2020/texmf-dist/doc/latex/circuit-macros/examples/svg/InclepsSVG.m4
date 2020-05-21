.PS
# InclepsSVG.m4 : Illustrating one way to import and overwrite jpg in svg
#                 A bit messy, but it works.  This file has to be processed
#                 by m4 in the usual way and then twice by dpic, eg
# m4 svg.m4 SVGconfig.m4 InclepsSVG.m4 > InclepsSVG.pic
# dpic -v InclepsSVG.pic > InclepsSVG.svg
# dpic -v InclepsSVG.pic > InclepsSVG.svg

# The double processing is needed because svg coordinates are to the right
# and down. We have to store the coordinates of the nw corner and use them
# on the second pass.

divert(-1)
######################################################################
# Macros to simplify inclusion and positioning of raster image files such
# as png or jpg or files with mime type of "image/svg+xml"

                          `svg_init_include([Unique_name])
                           Put this (once) before all drawing commands
                           in the diagram.  It opens a [] block for the
                           total diagram and creates the file
                           Unique_name.dim (default SVGinsertTemp.dim).'
define(`svg_init_include',
`define(`M4IP_uniq',`ifelse(`$1',,SVGinsertTemp,`$1')')dnl
 M4IP_NW: (0,0); m4IP_nw = 0; m4IP_lth = lthick
 sh "touch M4IP_uniq.dim"
 copy "M4IP_uniq.dim"
 [ M4IP_NW: M4IP_NW; { move to M4IP_NW } ')

                          `svg_include(filename, wid, ht, [position],[attrib])
                           Insert bitmap at specified position; also create
                             an invis box of the same size and location.
                            arg1= path to image file
                            arg2= picture width in drawing units
                            arg3= picture height in drawing units
                            arg4= position attribute e.g.
                             Pic: svg_include(Incl.jpg,2,3, with .sw at (1,4))
                            arg5= additional svg image attributes in the sprintf
                             string, e.g.
   clip-path=\"polygon(5%% 0%%, 100%% 0%%, 100%% 100%%, 5%% 100%%)\" (distances
   in percent to top-left, top-right, bottom-right, bottom-left clip corners,
   or in pixels) '
define(`svg_include',`box invis wid `$2' ht `$3' `$4'
define(`m4xpx',`(last box.w.x-M4IP_NW.x+m4IP_lth/2)/(1px__)')dnl
define(`m4ypx',`(M4IP_NW.y-last box.n.y+m4IP_lth/2)/(1px__)')dnl
define(`m4wdpx',`(`$2')/(1px__)')dnl
define(`m4htpx',`(`$3')/(1px__)')dnl
if m4IP_nw then { command sprintf(\
 "<image x=\"%g\" y=\"%g\" width=\"%g\" height=\"%g\"dnl
  xlink:href=\"`$1'\" `$5' />", m4xpx,m4ypx,m4wdpx,m4htpx) } ')

                          `svg_end_include
                           Put this before .PE after all drawing commands.
                           It closes the [] block and writes to Unique_name.dim'
define(`svg_end_include',`] with .M4IP_NW at M4IP_NW
  print sprintf("m4IP_nw=1; m4IP_lth=%g; M4IP_NW:(%g,%g)",lthick,\
    last [].w.x+3*m4IP_lth/2, last [].n.y+3*m4IP_lth/2) > "M4IP_uniq.dim"
  undefine(`M4IP_uniq') ')

######################################################################
divert(0)dnl

darrow_init
svg_init_include


#                          This jpg is 242 px x 321 px
  Picture: svg_include(Incl.jpg, 242px__, 321px__, with .w at (1,0))

  define(`backarrow',`darrow(`$1',,,2pt__,6pt__,6pt__,<-|)')
  thinlines_
  backarrow( from boxcoord(Picture,0.4,0.95) up 0.4 right 0.7 )
    "Basket" wid 0.45 with .w at Here+(2bp__,0)
  backarrow( from boxcoord(Picture,0.9,0.41) up 0.2 right 0.5 )
    "Ball" wid 0.3 with .w at Here+(2bp__,0)
  backarrow( from boxcoord(Picture,0.85,0.32) up 0.2 right 0.5 )
    "Star" wid 0.3 with .w at Here+(2bp__,0)
    "Player" wid 0.43 with .w at last "".w+(0,-0.15)

#for i=3 to 1 by -1 do {
#  Picture: svg_include(Incl.jpg, i/4*242px__, i/4*321px__,
#   with .nw at last box.nw+(0.125,-0.25)) }

#  P2: svg_include(Incl.jpg, 242px__, 321px__,
#   with .w at Picture.e+(1.25,0),
#   clip-path=\"polygon(30 0, 100%% 0%%, 100%% 100%%, 30 321)\" )

svg_end_include

.PE
