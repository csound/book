opcode Convolution,a,ai
 setksmps 1
 ain,irt xin
 ilen = ftlen(irt)
 acnv = 0
 kk = ksmps
 a1 delayr (ilen-1)/sr
 while kk < ilen do
   acnv += deltapn(kk)*table(kk,1)
   kk += 1
 od
 delayw ain 
 xout acnv + ain*table(0,1)
endop
