seed 0
giCount init 0
instr Create_Sender
 kCreate metro randomh:k(1,5,1,3)
 schedkwhen kCreate,0,0,"Sender",0,p3
endin
schedule("Create_Sender",0,2.5)

instr Sender
 giCount += 1
 S_chn sprintf "channel_%d", giCount
 schedule "Receiver",0,p3,giCount
 chnset randomh:k(1,100,1,3),S_chn
endin

instr Receiver
 kGet chnget sprintf("channel_%d",p4)
 if changed(kGet)==1 then
  printks "time = %.3f, channel_%d = %d\n",0,times:k(),p4,kGet
 endif
endin