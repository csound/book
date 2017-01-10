/*****************************************************
asig Chorus ain,kf,kmin,kmax
ain - input signal
kf - noise generator frequency
kmin - min delay
kmax - max delay
*****************************************************/
opcode Chorus,a,akkk
 asig,kf,kmin,kmax xin
 idel = 0.1
 im = 2/sr
 km =  kmin < kmax ? kmin : kmax 
 kmx = kmax > kmin ? kmax : kmin
 kmx = (kmx < idel ? kmx : idel)
 km  = (km >  im ? km : im) 
 kwdth = kmx - km
 amod randi kwdth,kf,2,1
 amod = (amod + kwdth)/2
 admp delayr idel
 adel deltap3  amod+km 
 delayw asig
 xout adel + asig
endop
