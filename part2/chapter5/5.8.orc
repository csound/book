seed 0
instr 1
 k1 expon  1,p3,0.001
 a1 oscili p4,p5
 out a1*k1
 schedule(1,.1,.5,
    linrand(0dbfs/10),
    750+linrand(500)) 
endin
schedule(1,0,1,0dbfs/4,300)