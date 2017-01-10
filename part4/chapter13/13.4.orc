/*************************************************
asig Reverb ain,krvt,kf,imin,imax
ain - input audio
krvt - reverb time
kf - low-pass frequency cutoff
imin - min comb delay time
imax - max comb delay time
*************************************************/
opcode Reverb,a,akkii
 asig,krvt,kf,imin,imax xin
 idel[] DelayTimes imin,imax
 ac1 CombF  asig,krvt,kf,idel[0]
 ac2 CombF  asig,krvt,kf,idel[1]
 ac3 CombF  asig,krvt,kf,idel[2]
 ac4 CombF  asig,krvt,kf,idel[3]
 ap1 alpass ac1+ac2+ac3+ac4,0.07,0.007
 ap2 alpass ap1,0.05,0.005
 xout ap2
endop
