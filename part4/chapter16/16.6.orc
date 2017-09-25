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

opcode ring,a,aiiii
  aexc, ifrq1, iq1, ifrq2, iq2  xin
  ares1  mode aexc,ifrq1,iq1
  ares2  mode aexc,ifrq2,iq2
  ares   =    (ares1+ares2)/2
  xout aexc+ares
endop

instr 1
  astrike  hit  ampdb(68),80, 8, 180, 3
  aout  ring astrike, 440, 60, 630, 53
  out  aout
endin
