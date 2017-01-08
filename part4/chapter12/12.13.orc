/**********************************************
asig  PM kamp,kfc,kfm,kndx
kamp - amplitude
kfc - carrier frequency
kfm - modulation frequency
kndx - distortion index
***********************************************/
opcode PM,a,kkkk
 kamp,kfc,kfm,kndx xin
 acar phasor kfc
 amod oscili kndx/(2*$M_PI),kfm
 apm  tablei acar+amod,-1,1,0.25,1
     xout apm*kamp
endop
