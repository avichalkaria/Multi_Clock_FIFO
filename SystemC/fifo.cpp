#include "fifo.h"

void fifo::update_fifo()
{
	unsigned int i = 0;
	sc_int<8> temp_val;
	sc_int<8> count_val;
	sc_int<1> put_val;
	sc_int<1> get_val;
	sc_int<1> full_val;
	sc_int<1> empty_val;
	sc_int<8> out_val;
	
	sc_int<4> wr_ptr_val;
	sc_int<4> rd_ptr_val;
	sc_int<8> b;
	
	while (true){
		wait ();
		put_val = put.read().to_int() ;
		get_val = get.read().to_int() ;
		full_val = full_bar.read().to_int() ;
		empty_val = empty_bar.read().to_int() ;
		
		
			if ((put_val = 1) && (full_val == 0)) {
				temp_val = p_in_a.read() ;
				buffer[wr_ptr_val] = temp_val;	
				b = buffer[wr_ptr_val];
				wr_ptr_val = wr_ptr_val + 1;
				if (wr_ptr_val == 16){
				wr_ptr_val = 0;
				}
				
			}
			
			else if ((get_val = 1) && (empty_val == 0)) {
				temp_val = buffer[rd_ptr_val];
				rd_ptr_val = rd_ptr_val + 1;
				if (rd_ptr_val == 16){
				rd_ptr_val = 0;
				}
			}	
		count_val = wr_ptr_val - rd_ptr_val ;	
		if (count_val == 16 ) {
		full_val = 1;
		empty_val = 0;
		}
		else if (count_val == 0) {
		full_val =0;
		empty_val = 0;
		}
		else {
		full_val = 0;
		empty_val = 0;
		}
		//b = B[i];
		//temp_val = in_val * b;
		//out_val = out_val + temp_val;	
		i++;
		p_count.write (count_val - 1);
		
		p_out.write (temp_val);	
	}	
	
}	