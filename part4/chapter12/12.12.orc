/**********************************************
asig  Sawtooth kamp,kfreq,kndx,ifn1,ifn2
kamp - amplitude
kfreq - frequency
kndx - distortion index
ifn1 - transfer function
ifn2 - scaling function
***********************************************/
opcode Sawtooth,a,kkkii
 kamp,kf,kndx,itf,igf xin
 amod oscili 1,kf,-1,0.25
 asq Waveshape kamp*0.5,kf,kndx,-1,itf,igf
        xout asq*(amod + 1)
endop
