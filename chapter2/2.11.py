import csnd6
import sys

csound = csnd6.Csound()
args  = csnd6.CsoundArgVList()
for arg in sys.argv: args.Append(arg)

error = csound.Compile(args.argc(), args.argv())

while (not error):
    error = csound.PerformKsmps()
