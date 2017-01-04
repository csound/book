isize = 16384
ifn ftgen 1, 0,  isize,  7, 
  0, isize*0.1, 1,isize*0.8, 1, isize*0.1, 0 
ifn ftgen  2,0,4,-2,1,1.25,1.5,2

instr 1
   kenv    oscili  p4, 1/p3, 1 
   kpitch  table   phasor:k(p6), 2, 1
   asig    oscili  kenv, p5*kpitch
   out  asig
endin
schedule(1,0,10,0dbfs/2,440,1)