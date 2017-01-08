/******************************************
asig PMOp kamp,kfr,apm,iatt,idec,isus,irel[,ifn]
kamp - amplitude
kfr - frequency
apm - phase modulation input
iatt - attack
idec - decay
isus - sustain
irel - release
ifn - optional wave function table (defaults to sine)
*********************************************/
opcode PMOp,a,kkaiiiij
 kmp,kfr,apm,
    iatt,idec,
    isus,irel,ifn xin
 aph phasor kfr
 a1  tablei aph+apm/(2*$M_PI),ifn,1,0,1
 a2  madsr iatt,idec,isus,irel
     xout  a2*a1*kmp
endop
