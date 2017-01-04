instr 1
 Svals[] init 2
 kval init 0
 Svals[0] = "hello"
 Svals[1] = "world"
 kval = kval % 2
 puts Svals[kval],kval+1
 kval +=1
endin
schedule(1,0,2/kr)