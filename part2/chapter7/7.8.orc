opcode Leaky,a,ak
 setksmps 1
 asum init 0
 asig,kfac xin
 asum = asig + asum*kfac
 xout asum
endop

instr 1
 a1 rand p4 
 out Leaky(a1,0.99)
endin
schedule(1,0,1,0dbfs/20)