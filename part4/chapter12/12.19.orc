/******************************************* 
asig ModForm kamp,kfo,kfc,kbw,ifn,imax
kamp - amplitude
kfo - fundamental frequency
kfc - formant centre frequency
kbw - bandwidth
ifn - exp func between 0 and -imax
imax - max absolute value of exp function
**********************************************/
opcode ModForm,a,kkkkii
 kamp,kfo,kfc,kbw,ifn,itm  xin
 ioff = 0.25 
 itab = -1
 icor = 4.*exp(-1)
 ktrig changed kbw
 if ktrig == 1 then
  k2 = exp(-kfo/(.29*kbw*icor)) 
  kg2 = 2*sqrt(k2)/(1.-k2)
  kndx = kg2*kg2/2.
 endif
 kf = kfc/kfo
 kfin = int(kf)
 ka = kf  - kfin
 aph   phasor kfo
 acos tablei aph, 1, 1, 0.25, 1
 aexp table kndx*(1-acos)/itm,ifn,1
 acos1 tablei aph*kfin, itab, 1, ioff, 1
 acos2 tablei aph*(kfin+1), itab, 1, ioff, 1
 asig = (ka*acos2 + (1-ka)*acos1)*aexp
 xout asig*kamp
endop
