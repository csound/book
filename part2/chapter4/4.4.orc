instr 1
 kvals[] init 3
 kndx init 0
 kvals[0] = 1
 kvals[1] = 2
 kvals[2] = 3
 printk2 kvals[kndx]
 kndx = (kndx + 1) % lenarray(kvals)
endin
schedule(1,0,.1)