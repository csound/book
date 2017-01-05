#!/usr/bin/python
import Tkinter as tk
import csnd6       

class Application(tk.Frame):              
 def __init__(self, master=None):
   # setup Csound
   self.cs = csnd6.Csound()
   self.cs.SetOption('-odac')
   if self.cs.CompileOrc('''
       instr 1
        a1 oscili p4, p5
        k1 expseg 1,p3,0.001
        out a1*k1*0dbfs
       endin
      ''') == 0:
    self.cs.Start()
    self.t = csnd6.CsoundPerformanceThread(self.cs)
    self.t.Play()
    # setup GUI
    tk.Frame.__init__(self, master)   
    tk.Frame.config(self, height=200, width=200)
    self.grid(ipadx=50, ipady=25)               
    self.Button = tk.Button(self, text='play',
     command=self.playSound)           
    self.Button.pack(padx=50, pady=50, fill='both')  
    self.master.protocol("WM_DELETE_WINDOW",
     self.quit)
    self.master.title('Beep')

  # called on quit
 def quit(self):
  self.master.destroy()
  self.t.Stop()
  self.t.Join()

   # called on button press
 def playSound(self):
  self.cs.InputMessage('i 1 0 2 0.5 440')    
        
app = Application()                          
app.mainloop() 
