#include <csound.hpp>

int main(int argc, char** argv){  
  Csound  csound; // csound object
  int  error;     // error code

  // compile CSD and start the engine
  error = csound.Compile(argc, argv);

  // performance loop
  while(!error) 
     error = csound.PerformKsmps();

  return 0;
}
