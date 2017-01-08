/******************************************
ksig ADSR kmax,iatt,idec,ksus,irel,ktrig
kmax - max amplitude after attack
iatt - attack time
idec - decay time
ksus - sustain amplitude
irel - release time
ktrig - trigger signal
*******************************************/
opcode ADSR,k,kiikik
 kmax,iatt,idec,ksus,irel,ktrig xin
 xtratim irel
 ktime init 0
 kv init 0
 iper = 1/kr
 if (ktrig == 1) then
  ktime = ktime + iper
  if ktime < iatt then
   kt = iatt
   kv = kmax
  else
   kt = idec
   kv = ksus
  endif
 else
  kt = irel/8
  kv = 0
  ktime = 0
 endif
 kenv portk kv, kt
 xout kenv
endop
