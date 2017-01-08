opcode Func,a,a
 asig xin
       xout 1/(1+asig^2)
endop

/************************************** 
asig PAF kamp,kfun,kcf,kfshift,kbw
kamp - amplitude
kfun - fundamental freq
kcf - centre freq
kfshift - shift freq 
kbw - bandwidth
***************************************/
opcode PAF,a,kkkkki
  kamp,kfo,kfc,kfsh,kbw  xin
  kn = int(kfc/kfo)
  ka = (kfc - kfsh - kn*kfo)/kfo
  kg = exp(-kfo/kbw)
  afsh phasor kfsh
  aphs phasor kfo/2
  a1 tablei 2*aphs*kn+afsh,-1,1,0.25,1
  a2 tablei 2*aphs*(kn+1)+afsh,-1,1,0.25,1
  asin tablei aphs, 1, 1, 0, 1
  amod Func 2*sqrt(kg)*asin/(1-kg)
  kscl = (1+kg)/(1-kg)
  acar = ka*a2+(1-ka)*a1
  asig = kscl*amod*acar
         xout asig*kamp
endop
