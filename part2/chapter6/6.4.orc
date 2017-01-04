instr Sound
 aenv linen p4, 0.01,p3,0.1
 asrc oscili aenv, p5
 out asrc
 chnmix asrc*p6, "reverb"
endin
schedule("Sound",0,0.5, 0dbfs/4, 400, 0.1)
schedule("Sound",1,0.5, 0dbfs/4, 500, 0.2)
schedule("Sound",2,0.5, 0dbfs/4, 300, 0.4)

instr Reverb
  asig chnget "reverb"
  arev reverb asig, 3
         out arev
  chnclear "reverb"
endin
schedule("Reverb",0,-1)