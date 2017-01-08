/********************************************* 
asig Asfm kamp,kfc,kfm,kndx,kR,ifn,imax
kamp - amplitude
kfc - carrier frequency
kfm - modulation frequency
kndx - distortion index
ifn - exp func between 0 and -imax
imax - max absolute value of exp function
**********************************************/
opcode Asfm,a,kkkkkii
 kamp,kfc,kfm,knx,kR,ifn,imax
 kndx = knx*(kR+1/kR)*0.5
 kndx2 = knx*(kR-1/kR)*0.5 
 afm oscili kndx/(2*$M_PI),kfm
 aph phasor kfc
 afc tablei aph+afm,ifn,1,0,1
 amod oscili kndx2, kfm, -1, 0.25
 aexp tablei -(amod-abs(kndx2))/imx, ifn, 1
         xout kamp*afc*aexp
endop
