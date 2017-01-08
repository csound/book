/*********************************
asig Blsum kamp,kfr1,kfr2,ka
kamp - amplitude
kfr1 - frequency 1 (omega)
kfr2 - frequency 2 (theta)
ka - distortion amount
*********************************/
opcode Blsum,a,kkkki
 kamp,kw,kt,ka xin
 kn = int(((sr/2) - kw)/kt)
 aphw phasor kw 
 apht phasor kt
 a1 tablei aphw,-1,1 
 a2 tablei aphw - apht,-1,1,0,1
 a3 tablei aphw + (kn+1)*apht,-1,1,0,1
 a4 tablei aphw + kn*apht,-1,1,0,1
 acos tablei apht,-1,1,0.25,1
 kpw pow ka,kn+1
 ksq = ka*ka
 aden = (1 - 2*ka*acos + ksq)
 asig = (a1 - ka*a2 - kpw*(a3 - ka*a4))/aden
 knorm = sqrt((1-ksq)/(1 - kpw*kpw))
 xout asig*kamp*knorm
endop
