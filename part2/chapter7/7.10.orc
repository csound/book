opcode Factorial,i,ip
 iN,icnt xin
 ival = iN
 if icnt >= iN-1 igoto cont
   ival Factorial iN,icnt+1  
 cont:
  xout  ival*icnt
endop

instr 1
 print Factorial(5)
endin
schedule(1,0,0)