.PS
# Connectors
log_init
include(ics.m4)

# ArduinoUno
# "{\sf Arduino Uno Rev 3}" at last [].Connector.s below
 Ar:  ArduinoLeonardo #with .sw at last [].se+(0.25,0)
  "{\sf Arduino Leonardo}" at last [].Connector.s below

 RPI: RPi with .sw at last [].se+(0.25,0)
  "{\sf Raspberry Pi 4 GPIO}" at last [].GPIO.s below

 HD: HDMI_micro with .nw at last [].ne+(0.25,0.5)
  "\sf Micro" rjust at HD.Base.sw+(-2bp__,10bp__) "\sf HDMI" rjust

 S: USB_C_Socket with .sw at (HD.e.x+0.25,RPI.s.y)
 "\sf USB-C Socket" at S.Base.s below
 "\sf B12" at S.B12.end above ljust
 "\sf B1" at S.B1.end above ljust
 "\sf A1" at S.A1.end above rjust
 "\sf A12" at S.A12.end above rjust

.PE
