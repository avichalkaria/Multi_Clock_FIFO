#include "fifo_test.h"

void fifo_test::test_thread ( )
{
 	
	wait ( 200, SC_NS ) ;
	for(unsigned i = 0; i <= 6; i++) { // infinite loop prevent function from reaching its end
	p_in_a = i;
	put_in = 1;
	get_in = 0;
	//put_out.wirte (put_in);
	//get_out.write (get_in);	
	p_out_a.write (p_in_a);
	clock_out.write(SC_LOGIC_0);
	wait(10, SC_NS); // temporary suspension of the function
	clock_out.write(SC_LOGIC_1);
	wait(10, SC_NS);
	}
	
  sc_stop ( ) ;
}

