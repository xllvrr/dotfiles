.PS
# ConnectorsSVG.m4
log_init
include(icsSVG.m4)

svg_font(sans-serif,8.5bp__)
#vg_rot_init(test)
svg_rot_init(ConnectorsSVG)

# ArduinoUno
# "Arduino Uno Rev 3" at last [].Connector.s below
 Ar:  ArduinoLeonardo #with .sw at last [].se+(0.25,0)
  "Arduino Leonardo" at last [].Connector.s below

 RPI: RPi with .sw at last [].se+(0.25,0)
  "Raspberry Pi 4 GPIO" at last [].GPIO.s below

 HD: HDMI_micro with .nw at last [].ne+(0.25,0.5)
  "Micro" rjust at HD.Base.sw+(0,10bp__) "HDMI" rjust

 S: USB_C_Socket with .sw at (HD.e.x+0.25,RPI.s.y)
 "USB-C Socket" at S.Base.s below
 "B12" at S.B12.end above ljust
 "B1" at S.B1.end above ljust
 "A1" at S.A1.end above rjust
 "A12" at S.A12.end above rjust

 command "</g>"

.PE
