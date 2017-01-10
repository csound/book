/*****************************************************
irn IR ifn
irn - impulse response output function table number
ifn - amplitude response function table number
*****************************************************/
opcode IR,i,i
 ifn xin
 iflen2 = ftlen(ifn)
 iflen = 2*iflen2
 iSpec[] init iflen2
 icnt init 0
 copyf2array iSpec,ifn
 iIR[] rifft r2c(iSpec)
 irn ftgen 0,0,iflen,7,0,iflen,0
 while icnt < iflen2 do
    itmp = iIR[icnt]
    iIR[icnt] = iIR[icnt + iflen2]
    iIR[icnt + iflen2] = itmp
    icnt +=1
 od
 copya2ftab iIR,irn
 xout irn
endop

/*****************************************************
asig FIR ain,ifn
ain - input audio
ifn - amplitude response function table number
*****************************************************/
opcode FIR,a,ai
 asig,ifn xin
 irn IR ifn
 xout dconv(asig,ftlen(irn),irn)
endop
