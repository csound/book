/******************************************* 
asig ModFM kamp,kfc,kfm,kndx,ifn,imax
kamp - amplitude
kfc - carrier frequency
kfm - modulation frequency
kndx - distortion index
ifn - exp func between 0 and -imax
imax - max  absolute value of exp function
**********************************************/
opcode ModFM,a,kkkkiii
 kamp,kfc,kfm,kndx,iexp,imx xin
 acar oscili kamp,kfc,-1,0.25
 acos oscili 1,kfm,-1,0.25
 amod table -kndx*(acos-1)/imx,iexp,1
           xout acar*amod
endop
