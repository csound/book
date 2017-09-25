/* Setting the kr to 441Hz */

<CsoundSynthesizer>
<CsInstruments>
kr = 441
instr 1
 out oscili(1000,440)
endin
schedule(1,0,1)
</CsInstruments>
</CsoundSynthesizer>
