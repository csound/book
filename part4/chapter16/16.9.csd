<CsoundSynthesizer>
<CsInstruments>
giN = 1024
ginitf = ftgen(0,0,giN,7,0,giN/2,1,giN/2,0)
gimass = ftgen(0,0,giN,-7,1,giN,1)
gimatr = ftgen(0,0,giN^2,7,0,giN^2,0)
gicntr = ftgen(0,0,giN,-7,0,giN,2)
gidmpn = ftgen(0,0,giN,-7,0.7,giN,0.9)
givelc = ftgen(0,0,giN,-7,1,giN,0)
gitrjc = ftgen(0,0,giN,-7,0,giN/2,giN-1,giN/2,0)

instr 1
 ii init 0
 while ii < giN-1 do
   tabw_i 1,ii*giN+ii+1,gimatr
   tabw_i 1,(ii+1)*giN+ii,gimatr
   ii += 1
 od
 asig init 0
 scanu ginitf,1/p6,
       givelc,gimass,
       gimatr,gicntr,gidmpn,
       1,.1,.1,-.01,0,0,
       0,0,asig,1,1
 a1  scans p4,p5,gitrjc,1,3
    out a1
endin
schedule(1,0,10,0dbfs/20,220,100)

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
