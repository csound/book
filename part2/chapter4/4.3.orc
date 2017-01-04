instr 1
 asig  in
 fs1 pvsanal asig,2048,256,2048,1
 fs2 pvshift fs1,p4,p5
 ahr pvsynth fs2
 out ahr
endin
schedule(1,0,1,300,400)