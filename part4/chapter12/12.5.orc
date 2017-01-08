/******************************************
asig Vocoder as,an,kmin,kmax,kq,ibnd
as - excitation signal
an - analysis signal
kmin - lowest band frequency
kmax - highest band frequency
kq - vocoder band Q
ibnd - number of bands
*******************************************/
opcode Vocoder, a, aakkkpp
 as,an,kmin,kmax,kq,ibnd,icnt  xin
 if kmax < kmin then
    ktmp = kmin
    kmin = kmax
    kmax = ktmp
 endif
 if kmin == 0 then 
    kmin = 1
 endif
 if (icnt >= ibnd) goto bank
   abnd   Vocoder as,an,kmin,kmax,kq,ibnd,icnt+1
 bank:
    kfreq = kmin*(kmax/kmin)^((icnt-1)/(ibnd-1))
    kbw = kfreq/kq
    ao VocBand as,an,kfreq,kbw
    amix = ao + abnd
    xout amix
endop
