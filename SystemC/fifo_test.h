#ifndef FIFO_TEST_H
#define FIFO_TEST_H

#include "systemc.h"

SC_MODULE ( fifo_test )
{   
  sc_signal< sc_bv<8> > p_in_a ;
  sc_signal< sc_bv<1> > put_in ;
  sc_signal< sc_bv<1> > get_in ;
  //sc_signal< sc_logic > clock;

  sc_out< sc_bv<8> > p_out_a ;
  sc_out< sc_logic > clock_out;
  sc_out< sc_bv<1> > put_out;
  sc_out< sc_bv<1> > get_out; 	
  
  void test_thread ( ) ;

  SC_CTOR ( fifo_test ) :
    p_out_a ( "p_out_a" ), clock_out ( "clock_out" ), put_out ("put_out"), get_out ("get_out")
  {
    
	SC_THREAD ( test_thread ) ;
  }

} ;

#endif

