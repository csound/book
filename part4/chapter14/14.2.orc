/**************************************************
kMags[],kFreqs[],kflg PVA asig,isize,ihop
kMags[] - output magnitudes
kFreqs[] - output frequencies
kflg - new frame flag (1=new frame available)
asig - input signal
isize - DFT size
ihop - hopsize
**************************************************/
opcode PVA,k[]k[]k,aii
 asig,isize,ihop xin
 iolaps init isize/ihop
 kcnt init 0
 krow init 1
 kIn[] init isize
 kOlph[] init isize/2 + 1
 ifac = (sr/(ihop*2*$M_PI))
 iscal = (2*$M_PI*ihop/isize)
 kfl = 0
 kIn shiftin asig
 if kcnt == ihop then
   kWin[] window kIn,krow*ihop
   kSpec[] rfft kWin
   kMags[] mags kSpec
   kPha[] phs kSpec
   kDelta[] = kPha - kOlph
   kOlph = kPha
   kk = 0
   kDelta unwrap kDelta
   while kk < isize/2 do
    kPha[kk] = (kDelta[kk] + kk*iscal)*ifac
    kk += 1
   od   
   krow = (krow+1)%iolaps
   kcnt = 0
   kfl = 1
 endif
 xout kMags,kPha,kfl
 kcnt += ksmps
endop
