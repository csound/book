/*************************************
asig Partial kamp,kfreq,ktime,ifa,iff
kamp - amplitude
kfreq - frequency
ktime - envelope time point (0 - 1)
ifa - amplitude function table
iff - frequency function table
**************************************/
opcode Partial,a,kkkii
 ka,kf,kt,ifa,iff xin
 xout(oscili(ka*tablei:k(kt,ifa,1),
            kf*tablei:k(kt,iff,1)))
endop
