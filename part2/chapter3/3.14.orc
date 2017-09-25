/* A sine wave synthesis instrument, using oscili */

instr 1 
   out(oscili(p4, p5))
endin
schedule(1,0,10,0dbfs/2,440)
