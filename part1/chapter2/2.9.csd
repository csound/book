/* Setting ksmps to 64 */

<CsoundSynthesizer>
<CsInstruments>
ksmps = 64
instr 1
 out oscili(1000,440)
endin
schedule(1,0,1)
</CsInstruments>
</CsoundSynthesizer>
