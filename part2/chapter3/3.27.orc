#define  DURATION #p3#
instr 1
   kenv  expon 1, $DURATION, 0.001
   kpit  expon 2, $DURATION, 1
   asig  oscili kenv*ampdbfs(p4),kpit*cpspch(p5)
   out   asig
endin
schedule(1,0,1,-6,8.09)