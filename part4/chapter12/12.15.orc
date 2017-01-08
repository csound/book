instr 1
 amod PmOp p6,p5,a(0),0.1,0.1,0.5,0.1
 acar PmOp p4,p5,amod,0.01,0.1,0.9,0.1
     out acar
endin
schedule(1,0,1,0dbfs/2,440,7)
