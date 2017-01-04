gifn ftgen 1,0,4,-2,1,2,3,4
instr 1
 iArr[] init ftlen(gifn)
 copyf2array iArr,gifn
 print iArr[0]
 print iArr[1]
 print iArr[2]
 print iArr[3]
endin
schedule(1,0,0)