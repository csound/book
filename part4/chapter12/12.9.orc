/*********************************
asig NBlsum kamp,kfr1,kfr2,ka
kamp - amplitude
kfr1 - frequency 1 (omega)
kfr2 - frequency 2 (theta)
ka - distortion amount
*********************************/
opcode NBlsum,a,kkkk
 kamp,kw,kt,ka  xin
 aphw phasor kw
 apht phasor kt
 a1 tablei aphw,-1,1 
 a2 tablei aphw - apht,itb,1,0,1
 acos tablei apht,-1,1,0.25,1
 ksq = ka*ka
 asig = (a1 - ka*a2)/(1 - 2*ka*acos + ksq)
 knorm = sqrt(1-ksq)
 xout asig*kamp*knorm
endop
