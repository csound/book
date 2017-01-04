instr 1
 iArr[] fillarray p6,p7,p8,p9
 amod oscil 1,2,iArr 
 aout oscili p4,p5*amod
         out aout
endin
schedule(1,0,2,0dbfs/2,440,1,2,1.5,1.25)
schedule(1,2,2,0dbfs/2,440,1,1.5,2,1.25)
schedule(1,4,2,0dbfs/2,440,1,1.5,1.25,2)
schedule(1,6,2,0dbfs/2,440,1,1.25,1.5,2)