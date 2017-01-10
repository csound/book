opcode allpass,a,aki
setksmps 1
asig,kg,idel xin
 isize = idel > 1/sr ? int(idel*sr) : 1
 adelay[] init isize
 kpos init 0
 ay = asig + adelay[kpos]*kg
 xout adelay[kpos] - kg*ay
 adelay[kpos] = ay
 kpos = kpos == isize-1 ? 0 : kpos+1
endop
