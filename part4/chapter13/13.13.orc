/*****************************************************
asig AP ain,kfr,kbw
ain - input signal
kfr - centre frequency
kbw - bandwitdth
*****************************************************/
opcode AP,a,akk
 setksmps 1
 asig,kfr,kbw  xin
 ad[] init 2
 kR = exp(-$M_PI*kbw/sr)
 kw = 2*cos(kfr*2*$M_PI/sr)
 kR2 = kR*kR
 aw = asig + kR*kw*ad[0] - kR2*ad[1]
 ay = aw - (kw/kR)*ad[0] + (1/kR2)*ad[1]
 ad[1] = ad[0]
 ad[0] = aw
 xout ay
endop
