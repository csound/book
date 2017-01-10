/********************************************
al,ar FDN asig,kg,kf,idel
al,ar - left and right outs
asig - input
kg - gain
kf - low-pass cutoff freq  
idel - delay size factor
********************************************/
opcode FDN,aa,akki
 aflt[] init 4
 amix[] init 4
 adel[] init 4
 il[] fillarray .75,.5,.5,.25
 ir[] fillarray .25,.5,.5,.75
 idel[] fillarray 0.023,0.031,0.041,0.047
 imatrix[][] init 4,4
 imatrix[0][0] = 0
 imatrix[0][1] = 1
 imatrix[0][2] = 1
 imatrix[0][3] = 0
 imatrix[1][0] = -1
 imatrix[1][1] = 0
 imatrix[1][2] = 0
 imatrix[1][3] = -1
 imatrix[2][0] = -1
 imatrix[2][1] = 0
 imatrix[2][2] = 0
 imatrix[2][3] = 1
 imatrix[3][0] = 0
 imatrix[3][1] = 1
 imatrix[3][2] = -1
 imatrix[3][3] = 0

 asig,kg,kf,id  xin 
 idel = idel*id
 kg *= $M_SQRT1_2
 ki = 0
 while ki < 4 do
  kj = 0
  amix[ki] = asig
  while kj < 4 do
   amix[ki] = amix[ki]+aflt[kj]*imatrix[ki][kj]*kg 
   kj += 1
  od
  ki += 1 
 od
 adel[0] delay amix[0],idel[0]
 aflt[0] tone adel[0],kf
 adel[1] delay amix[1],idel[1]
 aflt[1] tone adel[1],kf
 adel[2] delay amix[2],idel[2]
 aflt[2] tone adel[2],kf
 adel[3] delay amix[3],idel[3]
 aflt[3] tone adel[3],kf 
 al = 0
 ar = 0
 kj = 0
 while kj < 4 do
  al += aflt[kj]*il[kj]
  ar += aflt[kj]*ir[kj]
  kj += 1
 od
 xout al, ar
endop
