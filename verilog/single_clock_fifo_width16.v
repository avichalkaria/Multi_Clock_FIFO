
module FIFO (clk, reset, data_in, put, get, data_out, fillcount, empty, full); 

//----------parameters--------------

parameter ADDR_WIDTH = 3;
parameter DEPTH_P2 = 1 << ADDR_WIDTH;
parameter WIDTH = 16;

//-----------------------------------

input [WIDTH-1:0] data_in;
input put, get, reset, clk; 
output [ADDR_WIDTH : 0] fillcount; 
output empty, full; 
output [WIDTH-1 :0] data_out;

reg empty,full;
reg [WIDTH-1:0]data_out;
reg [WIDTH-1:0] fifo [DEPTH_P2-1:0];

//----------------------------------------
// ------------additional registers-------

reg [ADDR_WIDTH : 0]rd_ptr;
reg [ADDR_WIDTH : 0]wr_ptr;

//reg [ADDR_WIDTH : 0]depth;
reg putq;
reg getq;
reg full_int;
reg empty_int;

parameter zeroes  = 4'b0000;
parameter A1_zeroes = 4'b1000;
// ---------------------------------------

assign fillcount = wr_ptr - rd_ptr;

always @ (fillcount)
begin

empty_int <= 1'b0;
full_int <= 1'b0;

	if (fillcount == zeroes) begin
	empty_int <= 1'b1;
	end
	if (fillcount == A1_zeroes) begin
	full_int <= 1'b1;
	end
	
end
always @ (posedge clk)
begin
	if (reset == 1'b1) begin
		wr_ptr <= zeroes;
		rd_ptr <= zeroes;
	end
	else begin
		empty <= empty_int;
		full <= full_int;
		if ((full_int == 1'b0) && (put == 'b1)) begin
		fifo[wr_ptr[ADDR_WIDTH-1 : 0]] <= data_in;
		wr_ptr <= wr_ptr + 1;
		end
		if ((empty_int == 1'b0) && (get == 1'b1)) begin
		data_out <= fifo[rd_ptr[ADDR_WIDTH-1 : 0]];
		rd_ptr <= rd_ptr + 1;
		end
	end	

end



endmodule