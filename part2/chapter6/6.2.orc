idur = 5
isamps = round(idur*sr/ksmps)*ksmps
gifn ftgen 0,0,-isamps,2,0

instr 1
 kpos init 0
 asig inch 1
 tablew asig,a(kpos),gifn
 kpos += ksmps
 kpos = kpos == ftlen(gifn) ? 0 : kpos
endin
schedule(1,0,-1)

instr 2
 kpos init ftlen(gifn)
 asig table a(kpos),gifn
 kpos -= ksmps 
 kpos = kpos == 0 ? ftlen(gifn) : kpos
 out asig
endin
schedule(2,0,-1)