/* Setting the sr to 48,000 Hz */

<CsoundSynthesizer>
<CsInstruments>
sr = 48000
instr 1
 out oscili(1000,440)
endin
schedule(1,0,1)
</CsInstruments>
</CsoundSynthesizer>
