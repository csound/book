instr 1
 S1 = p4
 S2 sprintf {{ 
 This is p4: \"%s\". 
 It is a string with %d characters.\n
 }}, S1, strlen(S1)
 prints S2
endin
schedule(1,0,0, "Hello World !!!")