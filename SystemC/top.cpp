#include "top.h"

int sc_main ( int argc, char **argv ) {
  top top1 ( "top1" ) ;
  sc_set_stop_mode(SC_STOP_IMMEDIATE);
  sc_start ( ) ;
  return 0 ;
}

