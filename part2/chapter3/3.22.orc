/* Linen envelope processor example */

instr 1
   kenv  linen  ampdbfs(p4),p6,p3,p7
   asig  oscili  kenv, cpspch(p5)
   out  asig
endin
schedule(1,0,10,-6,8.09,0.01,0.1)
