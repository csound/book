opcode hit,a,iiiii
  ihard, ifrq1, iq1, ifrq2, iq2 xin
  ashock  mpulse  3,0 ;; initial impulse
  ; modes of beater-object interaction
  aexc1  mode ashock,ifrq1,iq1
  aexc2  mode ashock,ifrq2,iq2
  aexc   =    ihard*(aexc1+aexc2)/2
  ;"Contact" condition : when aexc reaches 0,
  ; the excitator looses contact with the
  ; resonator, and stops influencing it
  aexc   limit aexc,0,3*ihard
  xout  aexc
endop
