/*****************************************************
asig Phaser ain,kfr,kmin,kmax,kQ
ain - input signal
kfr - LFO frequency
kmin - minimum centre frequency
kmax - maximum centre frequency
kQ - filter Q (cf/bw)
*****************************************************/
opcode Phaser,a,akkkk
 as,kfr,kmin,kmax,kQ xin
 km =  kmin < kmax ? kmin : kmax 
 kmx = kmax > kmin ? kmax : kmin
 km = km > 0 ? km : 0
 kmx = kmx < sr/2 ? kmx : sr/2
 kwdth = kmax/4 - km
 kmd oscili kwdth,kfr
 kmd = km + (kmd + kwdth)/2 
 as1 AP as,kmd,kmd/kQ 
 as2 AP as1,kmd*2,kmd*2/kQ
 as3 AP as2,kmd*4,kmd*4/kQ
 xout as3+as
endop
