/**************************************************
ares,asin Residual ain,kthresh,isize,ifcos
ares - residual output
asin - sinusoidal output
kthr - analysis threshold
isize - DFT size
ihop - hopsize
ifcos - function table containing a cosine wave
**************************************************/
opcode Residual, aa, akiii
 ain,kthr,isiz,ihsiz,ifcos  xin 
 idel = isiz-ihsiz*(isiz/(2*ihsiz)-1)
 ffr,fphs pvsifd   ain, isiz, ihsiz, 1
 ftrk partials ffr, fphs,kthr, 1, 1, 500
 aout sinsyn   ftrk, 2, 500, ifcos 
 asd  delayr   idel/sr
 asig deltapn  idel
      delayw   ain
 aenv linsegr  0,idel/sr,0,1/sr,1,1,1
 xout aout*aenv-asig,aout
endop
