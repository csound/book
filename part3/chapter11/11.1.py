import csnd6

cs = csnd6.Csound()
cs.SetOption('-odac')
if cs.CompileOrc('''
instr 1
 a1 oscili p4, p5
 out a1
endin
schedule(1,0,2,0dbfs,440)
''') == 0:
  cs.Start()
  t = csnd6.CsoundPerformanceThread(cs)
  t.Play()
  while(t.isRunning() == 1):
    pass
