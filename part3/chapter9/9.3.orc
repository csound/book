instr 1
 k1 metro 1
 if k1 > 0 then
  kn = 60+rnd:k(12)
  kv = 60+birnd:k(40)
  printf "NOTE %d %d\n", kn, kn, kv
  midion 1,kn,kv 
 endif
endin