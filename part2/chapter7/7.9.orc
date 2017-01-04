opcode Recurse,0,io
iN,icnt xin
if icnt >= iN-1 igoto cont
   Recurse iN,icnt+1  
cont:
  printf_i "Instance no: %d\n",1,icnt+1
endop

instr 1
 Recurse 5
endin
schedule(1,0,0)