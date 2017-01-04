opcode Count,k,i
 setksmps 1
 ival xin
 kval init ival
 print ksmps
 kval += 1
 printk2 kval
 xout kval
endop

instr 1
 setksmps 2
 kval Count 0
 printf "Count output = %d\n",kval,kval
endin
schedule(1,0,1/kr)