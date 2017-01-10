/*****************************************************
asig PitchShifter ain,kp,kdel,ifn[,imax]
ain - input signal
kp - pitch shift factor (interval ratio)
kdel - delay mod width
ifn - window (envelope) to cut discontinuities
imax - optional max delay (defaults to 1 sec)
*****************************************************/
opcode PitchShifter,a,akkip
 asig,kp,kdel,ifn,imax xin
 kfm = (kp-1)/kdel
 amd1 phasor -kfm
 amd2 phasor -kfm,0.5
 admp delayr imax
 atp1 deltap3 amd1*kdel
 atp2 deltap3 amd2*kdel
 delayw asig
 xout atp1*tablei:a(amd1,ifn,1) +
     atp2*tablei:a(amd2,ifn,1)
endop
