/******************************************
asig HybridVerb ain,krvt,kf,kearl,kdiff,irt
ain - input signal
krvt - reverb time
kf - lowpass cutoff factor (0-1)
kearl - level of early reflections
kdiff - level of diffuse reverb
irt - table containing an IR
********************************************/
opcode HybridVerb,a,akkkki
 asig,krvt,kf,
  kearl,kdiff,irf xin
 kscal = 1/(kearl+kdif)
 ilen = ftlen(irf)
 iert = ilen/sr
 arev nreverb asig,krvt,khf
 acnv dconv asig,ilen,irf
 afad expseg 0.001,iert,1,1,1
     xout (acnv*kearl +
           arev*afad*kdif)*kscal
endop
