/*****************************************************
asig Vibrato  ain,kf,kmin,kmax[,ifn]
ain - input signal
kf - LFO modulation frequency.
kmin - min delay
kmax - max delay
ifn - LFO function table, defaults to sine
*****************************************************/
opcode Vibrato,a,akkkj
 asig,kf,kmin,kmax,ifn xin
 idel = 0.1
 im = 2/sr
 km =  kmin < kmax ? kmin : kmax 
 kmx = kmax > kmin ? kmax : kmin
 kmx = (kmx < idel ? kmx : idel)
 km  = (km >  im ? km : im) 
 kwdth = kmx - km
 amod oscili kwdth,kf,ifn
 amod = (amod + kwdth)/2
 admp delayr idel
 adel deltap3  amod+km 
 delayw asig
 xout adel
endop
