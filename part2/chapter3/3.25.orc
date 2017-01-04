instr 1
   kerr gauss  10
   aout oscili 0.8, 440+kerr
   outs aout
endin
instr 2
   kerr1 gauss 10
   kerr2 gauss 10
   a0   oscili 0.6, 440
   a1   oscili 0.6, 440+kerr1
   a2   oscili 0.6, 440+kerr2
   outs   a0+a1+a2
endin