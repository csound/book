/**************************************************
asig PVS kMags[],kFreqs[],kflg,isize,ihop
kMags[] - input magnitudes
kFreqs[] - input frequencies
kflg - new frame flag (1=process new frame)
isize - DFT size
ihop - hopsize
**************************************************/
opcode PVS,a,k[]k[]kii
 kMags[],kFr[],kfl,isize,ihop xin
 iolaps init isize/ihop
 ifac = ihop*2*$M_PI/sr;
 iscal = sr/isize
 krow init 0
 kOla[] init isize
 kOut[][] init iolaps,isize
 kPhs[] init isize/2+1
 if kfl == 1 then
  kk = 0
  while kk < isize/2 do
    kFr[kk] = (kFr[kk] - kk*iscal)*ifac
    kk += 1
  od
  kPhs = kFr + kPhs
  kSpec[] pol2rect kMags,kPhs
  kRow[] rifft kSpec
  kWin[] window kRow, krow*ihop
  kOut setrow kWin, krow
  kOla = 0
  kk = 0
  until kk == iolaps do
   kRow getrow kOut, kk
   kOla = kOla + kRow
   kk += 1
  od
  krow = (krow+1)%iolaps
 endif
 xout shiftout(kOla)/iolaps
endop
