/* An instrument using a function table to control amplitude */

isize = 16384
ifn ftgen 1, 0,  isize,  7, 
     0, isize*0.1, 1,isize*0.8, 1, isize*0.1, 0 
instr 1
 kenv  oscili  p4, 1/p3, 1 
 asig  oscili  kenv, p5
 out  asig
endin
schedule(1,0,10,0dbfs/2,440)
