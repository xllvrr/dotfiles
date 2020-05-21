.PS
# CrowSVG.m4
#`Illustrates shadebox and custom crowfoot line termination'
gen_init(svg_font(sans-serif,11bp__))

# Custom macros --------------------------

#                                   `crowline(linespec,wid,ht)'
define(`crowline',
 `line `$1'
  M4_E: last line.end
  crow_wd = ifelse(`$2',,`(arrowwid*8/5)',`$2')
  crow_ht = ifelse(`$3',,`(1.5*crow_wd)',`$3')
  M4_P: vperp(last line); M4_P: (M4_P.x*crow_wd,M4_P.y*crow_wd)
  M4_X: crow_ht/lin_leng(last line) between M4_E and last line.start 
  ifdpic(
   `spline 0.4 from M4_E+M4_P to M4_X+M4_P then to M4_X-M4_P then to M4_E-M4_P',
   `spline from M4_E+(M4_P.x,M4_P.y) to M4_X+(M4_P.x,M4_P.y) \
      then to M4_X-(M4_P.x,M4_P.y) then to M4_E-(M4_P.x,M4_P.y)') ')

define(`custombox',
 ``$1': shadebox(box `$2',3)
  "`$1'" at last box.n above
  boxtext(shift(shift($@)))')

define boxtext {
  for i=1 to $+ do { move to last box.nw+(3pt__,-(2+i*11)pt__);
    exec sprintf("\"$%g\" ljust",i) }
  }

# ----------------------------

  boxwid = boxwid*1.15
  boxsep = boxwid/2

  custombox(Class,ht boxht*1.7,
   `classkey, class_type, class_desc')

  custombox(Product,ht Class.ht with .nw at Class.ne+(boxsep,0),
   `classkey, prodkey, prod_name, pkg_type')

  custombox(Sales,ht boxht*2.75 with .nw at Product.ne+(boxsep*2,13pt__),
   `perkey, classkey, prodkey, storekey, promokey, quantity, dollars')

  custombox(Period,ht Sales.ht with .nw at Sales.ne+(boxsep*2,0),
   `perkey, date, day, week, month, qtr, year')

  custombox(Market,ht Sales.ht with .nw at Class.sw+(0,-boxsep*3/2),
   `perkey, date, day, week, month, qtr, year')

  custombox(Store,ht boxht*3.2 with .sw at (Product.w,Market.s),
  `storekey, mktkey, store_type, store_name, street, city, state, zip')

  custombox(Promotion,ht Market.ht with .sw at (Period.w,Market.s),
   `promokey, promo_type, promo_desc, value, start_date, end_date')

  move to Class.ne+(0,-10pt__); crowline(to (Product.w,Here))

  move to Product.ne+(0,-10pt__); crowline(to (Sales.w,Here))
  move to last line.start+(0,-crow_wd*2.5); crowline(to (Sales.w,Here))
T: last line.c+(0,-crow_wd*2.5)

  move to Period.nw+(0,-10pt__); crowline(to (Sales.e,Here),,1.75*crow_wd)
Q: (last line.c,0.35 between Sales.se and Sales.ne)

  move to Market.ne+(0,-10pt__); crowline(to (Store.w,Here))
  move to Store.ne+(0,-10pt__); line to (T,Here) then to T
  crowline(to (Sales.w,Here))

  move to Promotion.nw+(0,-10pt__); line to (Q,Here) then to Q
  crowline(to (Sales.e,Here),,1.75*crow_wd)

 command "</g>" # end font
.PE
