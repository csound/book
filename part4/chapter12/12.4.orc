/************************
asig VocBand as,an,kfreq,kbw
as - excitation signal
an - analysis signal
kfreq - band frequency
kbw - bandwidth
*************************/
opcode VocBand,a,aakk
 as,an,kf,kbw xin
 xout(balance(butterbp(
              butterbp(as,kf,kbw),kf,kbw),
              butterbp(
              butterbp(an,kf,kbw),kf,kbw)))
endop
