#ifndef SINK_H
#define SINK_H

#include "systemc.h"

SC_MODULE ( sink )
{
  sc_in< sc_bv<8> > p_in ;
  sc_in< sc_bv<8> > p_count_in ;
  sc_in< sc_bv<1> > p_in_full ;
  sc_in< sc_bv<1> > p_in_empty ;
  void sink_method ( ) ;

  SC_CTOR ( sink ) :
    p_in ( "p_in" )
  {
    SC_METHOD ( sink_method ) ;
      sensitive << p_in ;
      dont_initialize ( ) ;
  }

} ;

#endif

