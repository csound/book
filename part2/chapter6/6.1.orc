gabuss[] init 2

instr 1
 aenv expseg 0.001,0.01,1,p3,0.001
 asig oscili aenv*p4,p5 
 out asig
 gabuss[p6] = asig*0.5 + gabuss[p6]
 schedule(1,0.1,0.3,
          rnd(0.1)*0dbfs,
          500+gauss(100),
          int(rnd(1.99)))
endin
schedule(1,0,0.5,
        0dbfs*0.1,
        500,0)
        
instr 100
 arev reverb gabuss[0],3
 out arev
 gabuss[0] = 0
endin
schedule(100,0,-1)

instr 101
 adel comb gabuss[1],4,0.6
 out adel
 gabuss[1] = 0
endin
schedule(101,0,-1)