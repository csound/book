/**********************************************
asig  Waveshape kamp,kfreq,kndx,ifn1,ifn2
kamp - amplitude
kfreq - frequency
kndx - distortion index
ifn1 - transfer function
ifn2 - scaling function
***********************************************/
opcode Waveshape,a,kkkiii
 kamp,kf,kndx,itf,igf xin
 asin oscili 0.5*kndx,kf
 awsh tablei asin,itf,1,0.5
 kscl tablei kndx,igf,1
 xout awsh*kamp*kscl
endop
