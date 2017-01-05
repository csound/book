opcode Scale, k, kkkkk
 kVal, kInMin, kInMax, kOutMin, kOutMax xin
 kValOut = (((kOutMax - kOutMin) / (kInMax - kInMin)) * 
                   (kVal - kInMin)) + kOutMin
 xout kValOut
endop

giPort OSCinit 12002

instr 1

 ;initialize variables and receive OSC
 kx1, kx2, kx3, kx4 init 0
 kPing OSClisten giPort, "/Proc/xpos", "ffff",  kx1, 
                             kx2, kx3, kx4
 
 ;scale x-values to MIDI note numbers
 km1 Scale kx1, 0, 640, 72, 84
 km2 Scale kx2, 0, 640, 72, 84
 km3 Scale kx3, 0, 640, 66, 78
 km4 Scale kx4, 0, 640, 66, 78
 
 ;change volume according to distance 1-2 and 3-4
 kdb12 = -abs(km1-km2)*2 - 16
 kdb12 port kdb12, .1
 kdb34 = -abs(km3-km4)*2 - 16
 kdb34 port kdb34, .1
 
 ;produce sound and output
 ax1 poscil ampdb(kdb12), cpsmidinn(km1)
 ax2 poscil ampdb(kdb12), cpsmidinn(km2)
 ax3 poscil ampdb(kdb34), cpsmidinn(km3)
 ax4 poscil ampdb(kdb34), cpsmidinn(km4)
 
 ax = ax1 + ax2 + ax3 + ax4
 
 kFadeIn linseg 0, 1, 1
 
 out ax*kFadeIn, ax*kFadeIn
 
endin
schedule(1,0,1000)