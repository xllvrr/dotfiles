.PS
# Crow.m4
#`Illustrates shadebox and custom crowfoot line termination; uses s_box'
gen_init
s_init(Crow)
sinclude(tst.dim)

# Custom macros --------------------------

#                                   `crowline(linespec,wid,ht)'
define(`crowline',
 `line `$1'
  M4_E: last line.end
  crow_wd = ifelse(`$2',,`(arrowwid*8/5)',`$2')
  crow_ht = ifelse(`$3',,`(1.5*crow_wd)',`$3')
  M4_P: vperp(last line,crow_wd)
  M4_X: crow_ht/lin_leng(last line) between M4_E and last line.start 
  ifdpic(
   `spline 0.4 from M4_E+M4_P to M4_X+M4_P then to M4_X-M4_P then to M4_E-M4_P',
   `spline from M4_E+(M4_P.x,M4_P.y) to M4_X+(M4_P.x,M4_P.y) \
      then to M4_X-(M4_P.x,M4_P.y) then to M4_E-(M4_P.x,M4_P.y)') ')

define(`custombox',
 ``$1': shadebox(box `$2',3)
  s_box({\sf `$1'}) at last box.n above
  boxtext(`$3')')

define(`boxtext',`s_box(\parbox{%gpt}{\sf `$1'},int(last box.wid/(1pt__))) \
  with .nw at last box.nw +(5pt__,-5pt__) ')

# ----------------------------

  boxwid = boxwid*1.15
  boxsep = boxwid/2

  custombox(Class,ht boxht*1.7,
   `classkey\\ class\_type\\ class\_desc')

  custombox(Product,ht Class.ht with .nw at Class.ne+(boxsep,0),
   `classkey\\ prodkey\\ prod\_name\\ pkg\_type')

  custombox(Sales,ht boxht*2.75 with .nw at Product.ne+(boxsep*2,13pt__),
   `perkey\\ classkey\\ prodkey\\ storekey\\ promokey\\ quantity\\ dollars')

  custombox(Period,ht Sales.ht with .nw at Sales.ne+(boxsep*2,0),
   `perkey\\ date\\ day\\ week\\ month\\ qtr\\ year')

  custombox(Market,ht Sales.ht with .nw at Class.sw+(0,-boxsep*3/2),
   `perkey\\ date\\ day\\ week\\ month\\ qtr\\ year')

  custombox(Store,ht boxht*3.2 with .sw at (Product.w,Market.s),
  `storekey\\ mktkey\\ store\_type\\ store\_name\\ street\\ city\\ state\\ zip')

  custombox(Promotion,ht Market.ht with .sw at (Period.w,Market.s),
   `promokey\\ promo\_type\\ promo\_desc\\ value\\ start\_date\ end\_date')

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

.PE
