opcode FDelay,a,aki
setksmps 1
asig,kg,idel xin
 kpos init 0
 isize = idel > 1/sr ? round(idel*sr) : 1
 adelay[] init isize
 kg = abs(kg) < 1 ? kg : 0
 ay = asig + adelay[kpos]*kg
 xout adelay[kpos]
 adelay[kpos] = ay
 kpos = kpos == isize-1 ? 0 : kpos+1
endop
