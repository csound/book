/* Normal distribution of error pitch */

0dbfs = 1
instr 1
   kerr gauss  10
   aout oscili 0.8, 440+kerr
   outs aout
endin
instr 2
   kerr1 gauss 10
   kerr2 gauss 10
   a0   oscili 0.3, 440
   a1   oscili 0.3, 440+kerr1
   a2   oscili 0.3, 440+kerr2
   outs   a0+a1+a2
endin
schedule(1,0,1)
schedule(2,1,1)
