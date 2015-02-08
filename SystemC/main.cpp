#include "systemc.h"
#include "top.h"

#ifdef MTI_SYSTEMC

SC_MODULE_EXPORT(top);

#elif NCSC

NCSC_MODULE_EXPORT(top);

#else

// top level instanced in sc_main for use with OSCI
// reference simulator
int sc_main(int argc, char * argv[])
{
  testbench testbench1("top");
  sc_start();
  return 0;
}

#endif
