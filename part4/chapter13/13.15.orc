/*****************************************************
asig Equaliser ain,kmin,kmax,kQ,ifn
ain - input signal
kmin - minimum filter frequency
kmax - maximum filter frequency
kQ - filter Q (cf/bw)
ifn - function table containing the filter gains
*****************************************************/
opcode Equaliser,a,akkkio
 asig,kmin,kmax,
     kQ,ifn,icnt xin
 iend = ftlen(ifn)
 if icnt < iend-1 then
  asig Equaliser asig,kmin,kmax,
                 kQ,ifn,icnt+1
 endif
 print icnt
 kf = kmin*(kmax/kmin)^(icnt/(iend-1))
 xout eqfil(asig,kf,
         kf/kQ,table:k(icnt,ifn))
endop
