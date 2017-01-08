/**********************
asig Mixer kbars[]
kbars[] - drawbar levels(9)
**********************/
opcode Mixer,a,k[]
 kbar[] xin
 asig = 0
 kcnt = 0
 kscl = 0
 while kcnt < 9 do
  asig += gabus[kcnt]*kbar[kcnt]
  gabus[kcnt] = 0
  kscl += kbar[kcnt]
  kcnt += 1
 od
  xout asig*0dbfs/(21+kscl*active:k(1))
endop
