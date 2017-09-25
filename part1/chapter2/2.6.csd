/* Setting the 0dbfs to 1 */

<CsoundSynthesizer>
<CsInstruments>
0dbfs=1
instr 1
 out rand(0.5)
endin
schedule(1,0,1)
</CsInstruments>
</CsoundSynthesizer>
