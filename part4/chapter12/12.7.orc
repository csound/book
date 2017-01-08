/*********************************
asig Blp kamp,kfreq
kamp - amplitude
kfreq - fundamental frequency
**********************************/
opcode Blp,a,kki
  setksmps 1
  kamp,kf  xin
  kn = int(sr/(2*kf))
  kph phasor kf/2
  kden tablei kph,-1,1
  if kden != 0 then
      knum tablei kph*(2*kn+1),-1,1,0,1
      asig = (kamp/(2*kn))*(knum/kden - 1)
   else
   asig = kamp
  endif
  xout asig
endop
