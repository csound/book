opcode Count,k,i
  ival xin
  kval init ival
  print ksmps
  kval += 1
  printk2 kval
  xout kval
endop

instr 1
 kval Count 0,p4
 printf "Count output = %d\n",kval,kval
endin
schedule(1,0,1/kr,1)
schedule(1,1/kr,1/kr,2)
schedule(1,2/kr,1/kr,5)