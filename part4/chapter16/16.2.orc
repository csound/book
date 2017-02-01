/**********************
asig Ap ain,ic
ain - input signal
ic - all-pass coefficient
********************/
opcode Ap,a,ai
 setksmps 1
 asig,ic xin
 aap init 0
 aap = ic*(asig - aap) + delay1(asig)
 xout aap
endop

/**********************
asig String kamp,ifun,ils,ipos,ipk
kamp - amplitude
ifun - fundamental freq
ils - loss factor
ipos - pluck position
ipk - pickup position
********************/
opcode String,a,kiii
 kamp,ifun,ipos,ipk xin
 aap init 0
 idel = 1/ifun
 ides = sr*idel
 idtt = int(ides-0.5)
 ifrc = ides - (idtt + 0.5)
 ic = (1-ifrc)/(1+ifrc)
 kcnt line 0, p3, p3
 if kcnt < idel then
  ainit linseg 0,ipos*idel/2,-1,
              (1-ipos)*idel,1,
              ipos*idel/2,0
 else
  ainit=0
 endif
 awg delayr idtt/sr
 apick1 deltap idel*(1-ipk)
 apick2 deltap idel*ipk
 afdb = Ap((awg + delay1(awg))*0.5, ic)
        delayw  afdb+ainit
      xout (apick1+apick2)*kamp
endop
