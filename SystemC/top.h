#ifndef TOP_H
#define TOP_H

#include "systemc.h"
#include "fifo_test.h"
#include "fifo.h"
#include "sink.h"


SC_MODULE ( top )
{
  fifo_test            test_block  ;
  fifo            	  fifo_block   ;
  sink	              sink_block  ;
  sc_signal< sc_bv<8> > input_chnl_a  ;
  sc_signal <sc_logic> clk_chnl;
  sc_signal< sc_bv<1> > put_chnl;
  sc_signal< sc_bv<1> > get_chnl;
  sc_signal< sc_bv<8> > output_chnl ;
  sc_signal< sc_bv<8> > output_countchnl ;
  sc_signal< sc_bv<1> > output_fullchnl ;
  sc_signal< sc_bv<1> > output_emptychnl ;

  SC_CTOR ( top ) :
    test_block  ( "test_block"  ) ,
    fifo_block   ( "fifo_block"   ) ,
    sink_block  ( "sink_block"  ) ,
    input_chnl_a( "input_chnl_a") ,
	clk_chnl    ( "clk_chnl"), 
    output_chnl ( "output_chnl" ),
	output_countchnl ( "output_countchnl" ),
	output_fullchnl ( "output_fullchnl" ),
	output_emptychnl ( "output_emptychnl" )
  {
  
	test_block.p_out_a (input_chnl_a); 
	fifo_block.p_in_a (input_chnl_a);
	
	test_block.clock_out (clk_chnl); 
	fifo_block.clock (clk_chnl);
	
	test_block.put_out (put_chnl); 
	fifo_block.put (put_chnl);

	test_block.get_out (get_chnl); 
	fifo_block.get (get_chnl);

	fifo_block.p_out (output_chnl);
	sink_block.p_in (output_chnl);
	
	fifo_block.p_count (output_countchnl);
	sink_block.p_count_in (output_countchnl);
	
	fifo_block.full_bar (output_fullchnl);
	sink_block.p_in_full (output_fullchnl);
	
	fifo_block.empty_bar (output_emptychnl);
	sink_block.p_in_empty (output_emptychnl);
  }

} ;

#endif

