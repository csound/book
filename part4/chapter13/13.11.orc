/*****************************************************
asig Doppler ain,kpos,imax
ain - input signal
kpos - absolute source distance in meters
imax - maximum source distance
*****************************************************/
opcode Doppler,a,aki
 asig,kp,imax xin
 ic = 344
 admp delayr  imax/ic
 adop deltap3 a(kp)/ic
 kscal = kp > 1 ? 1/kp : 1
 delayw asig*kscal
 xout adop
endop
