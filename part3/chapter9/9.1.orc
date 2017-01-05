instr 1
 kcps cpsmidib 2 
 iamp ampmidi 0dbfs
 kcf midictrl 1,2,5
 out linenr(moogladder(
       vco2(iamp,kcps,10),
       kcf*(kcps +
       linenr(kcps,0.1,0.1,0.01)),
       0.7), 0.01,0.1,0.01)
endin
