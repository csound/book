/****************************
kflag StreamAnal asig,ifa,iff,isize
asig - input signal
ifa - amplitude function table
iff - frequency function table
isize - number of amp/freq pairs
*****************************/
opcode StreamAnal,k,aiii
 asig,ifa,iff,is xin
 fsig pvsanal asig,is*2,is/4,is*2,1
 xout pvsftw(fsig,ifa,iff)
endop
