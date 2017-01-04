instr 1
 k1 expsegr 1,1,0.001,0.1,0.001
 a1 oscili p4*k1,cpspch(p5)
 out a1
endin
schedule(1,0,-1,0dbfs/2,8.00)
schedule(-1,1,1,0dbfs/2,8.00)