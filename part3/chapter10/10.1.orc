instr send_OSC
 kSend = int(times:k())+1
 kInt = int(random:k(1,10))
 String = "Hello anywhere"
 kFloat1 = random:k(0,1)
 kFloat2 = random:k(-1,0)
 OSCsend kSend, "127.0.0.1", 8756, 
       "/test/1", "ifsf", 
      kInt, kFloat1,   String, kFloat2
 printf {{
OSC message %d sent at time %f!
int = %d, float1 = %f, 
String = '%s', float2 = %f\n
}},
 kSend, kSend, date:k(), 
 kInt, 
 kFloat1, String, 
 kFloat2
endin
schedule("send_OSC",0,1000)