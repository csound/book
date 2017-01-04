giArr[] fillarray 1,2,3,4
instr 1
 ifn ftgen 0,0,lenarray(giArr),2,0
 copya2ftab giArr,ifn
 print table(0,ifn)
 print table(1,ifn)
 print table(2,ifn)
 print table(3,ifn)
endin
schedule(1,0,0)