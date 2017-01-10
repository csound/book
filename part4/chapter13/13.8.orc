/*****************************************************
asig Flanger ain,kf,kmin,kmax,kg
ain - input signal
kf - LFO modulation frequency.
kmin - min delay
kmax - max delay
kg - feedback gain
*****************************************************/
opcode Flanger,a,akkkk
 setksmps 2
 asig,kf,kmin,kmax,kg xin
 idel = 0.01
 im = 1/kr
 km =  kmin < kmax ? kmin : kmax 
 kmx = kmax > kmin ? kmax : kmin
 kmx = (kmx < idel ? kmx : idel)
 km  = (km >  im ? km : im) 
 kwdth = kmx - km
 amod oscili kwdth,kf
 amod = (amod + kwdth)/2
 admp delayr idel
 afln deltap3  amod+km
 delayw asig + afln*kg
 xout afln
endop
