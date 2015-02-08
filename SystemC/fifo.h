#ifndef FIFO_H
#define FIFO_H

#include "systemc.h"


SC_MODULE ( fifo )
{
  sc_in< sc_bv<8> > p_in_a;	
  sc_in< sc_logic > clock;
  sc_in< sc_bv<1> > put; 
  sc_in< sc_bv<1> > get;
   //sc_signal< sc_lv<16> > B[5];
  sc_out< sc_bv<1> > full_bar; 
  sc_out< sc_bv<1> > empty_bar; 
  sc_out< sc_bv <8> >p_out;
  sc_out< sc_bv <8> >p_count;
  
  sc_uint <8> buffer [16]; // declare 2D

  void update_fifo ( ) ;
  SC_CTOR ( fifo ) :
	p_in_a ("p_in_a"), clock ("clock") , put ("put"), get("get"), full_bar("full_bar"), empty_bar("empty_bar"), p_out ("p_out"), p_count ("p_count")	
  {
    SC_CTHREAD ( update_fifo,clock.pos() ) ;
        //B[0]=18;B[1]=77;B[2]=107;B[3]=77;B[4]=15;
  }

} ;

#endif

