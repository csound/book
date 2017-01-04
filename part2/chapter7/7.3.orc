instr 1
 amod1 EnvOsc a(p6*p5),a(p5),0.1,p3,0.1
 amod2 EnvOsc a(p7*p5),a(p5*3),0.2,p3,0.4
 asig   EnvOsc a(p4),amod1+amod2+p5,0.01,p3,0.1
     out asig
endin
schedule(1,0,1,0dbfs/2,440,2.5,1.5)