opcode Delay,a,ai
setksmps 1
asig,idel xin
 kpos init 0
 isize = idel > 1/sr ? round(idel*sr) : 1
 adelay[] init isize
 xout adelay[kpos]
 adelay[kpos] = asig
 kpos = kpos == isize-1 ? 0 : kpos+1
endop
