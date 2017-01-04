opcode ButtBP,a,akkio
 asig,kf,kbw,iN,icnt xin
 if icnt >= iN-1 goto cont
   asig ButtBP asig,kf,kbw,iN,icnt+1
 cont:
   xout butterbp(asig,kf,kbw) 
endop

instr 1
 a1 rand p4
 a2 ButtBP a1,1500,100,4
 out a2
endin
schedule(1,0,1,0dbfs/2)