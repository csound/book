<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giRecPort OSCinit 8756

instr receive_OSC
 kI, kF1, kF2, kCount init 0
 Str = ""
 kGotOne OSClisten giRecPort, "/test/1", "ifsf", 
                          kI, kF1, Str, kF2
 if kGotOne == 1 then
    kCount += 1
    printf {{
OSC message %d received at time %f! 
int = %d, float1 = %f, 
String = '%s', float2 = %f\n
      }},kCount, kCount, date:k(),
         kI, kF1, Str, kF2
 endif
endin

schedule("receive_OSC", 0, 1000)

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
