divert(-1)
# windows.m4
# This file is used if the CUSTOM=windows.m4 function is turned on in Makefile
define(`windows_')

# To makd NeedDpicTools work,
# change the absolute Windows path to your installation directory:

define(`NeedDpicTools',`if "dpictools" != "1" then {
   copy "D:\Dwight\lib\dpictools.pic" } define(`dfitcurve__') ')

divert(0)dnl
