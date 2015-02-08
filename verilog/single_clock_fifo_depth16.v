module FIFO_explength (clk, reset, data_in, put, get, data_out, fillcount, empty, full);

parameter ADDR_WIDTH = 4;
parameter DEPTH_P2 = 1 << ADDR_WIDTH;
parameter WIDTH = 8;

//-----------------------------------


input [WIDTH-1 : 0]data_in; 
input put, get, reset, clk;
output [WIDTH-1 : 0]data_out;
output [ADDR_WIDTH : 0] fillcount;
output  empty, full;

//-------------------------------------

reg empty,full;
wire [WIDTH-1:0]data_out;
reg [ADDR_WIDTH : 0] fillcount_reg;
reg [ADDR_WIDTH : 0] wr_ptr;
reg [ADDR_WIDTH : 0] rd_ptr;

reg put_a,put_b;
reg get_a,get_b;
reg [WIDTH-1:0]data_in_a;
reg [WIDTH-1:0]data_in_b;
wire [WIDTH-1:0]data_out_a;
wire [WIDTH-1:0]data_out_b;

wire [ADDR_WIDTH-1 : 0] fillcount_a;
wire [ADDR_WIDTH-1 : 0] fillcount_b;
wire empty_a, empty_b;
wire full_a, full_b;

//reg count;

FIFO F1 (clk, reset, data_in_a, put_a, get_a, data_out_a, fillcount_a, empty_a, full_a);
FIFO F2 (clk, reset, data_in_b, put_b, get_b, data_out_b, fillcount_b, empty_b, full_b);


reg full_int;
reg empty_int;

parameter zeroes  = 5'b00000;
parameter A1_zeroes = 5'b10000;
//---------------------------------------

//assign fillcount = wr_ptr - rd_ptr;
assign fillcount = fillcount_a + fillcount_b;

assign  empty_a = (reset==1) ?   1'b1 : empty_a ; 
assign  empty_b = (reset==1) ?   1'b1 : empty_a ; 
assign  full_a = (reset==1) ?   1'b0 : full_a ; 
assign  full_b = (reset==1) ?   1'b0 : full_b ; 

assign data_out = (rd_ptr <= 4'b1001) ? data_out_a : data_out_b;

always @ (fillcount)
begin

fillcount_reg <= fillcount;
empty_int = 1'b0;
full_int = 1'b0;

	if (fillcount == zeroes) begin
	empty_int = 1'b1;
	end
	if (fillcount == A1_zeroes) begin
	full_int = 1'b1;
	end
	
end
always @ (posedge clk)
begin
	if (reset == 1'b1) begin
		put_a = 1'b0;
		put_b = 1'b0;
		get_a = 1'b0;
		get_b = 1'b0;
		wr_ptr <= 0;
		rd_ptr <= 0;
		//count = 0;

	end
	else begin
		empty = empty_int;
		full = full_int;
		if ((full_int == 1'b0) && (put == 1'b1)) begin
			if (wr_ptr < 4'b1000) begin
				data_in_a = data_in;
				put_a = 1'b1;
				put_b = 1'b0;
				get_a = 1'b0;
				get_b = 1'b0;
				wr_ptr <= wr_ptr + 1;
				if (wr_ptr == 5'b10000 ) begin
				wr_ptr <= 0;
				end	
			end
			else begin
				data_in_b = data_in;
				put_a = 1'b0;
				put_b = 1'b1;
				get_a = 1'b0;
				get_b = 1'b0;
				wr_ptr <= wr_ptr + 1;
				if (wr_ptr == 5'b10000 ) begin
				wr_ptr <= 0;
				end	
			end
		//if (wr_ptr == 5'b10000 ) begin
			//wr_ptr <= 0;
		//end	
		//fifo[wr_ptr] <= data_in;
		end
		if ((empty_int == 1'b0) && (get == 1'b1)) begin
			if (rd_ptr < 4'b1000) begin
				//data_out = data_out_a;
				put_a = 1'b0;
				put_b = 1'b0;
				get_a = 1'b1;
				get_b = 1'b0;
				rd_ptr <= rd_ptr + 1;
				if (rd_ptr == 5'b10000 ) begin
				rd_ptr <= 0;
				end	
			end
			else begin
				//data_out = data_out_b;
				put_a = 1'b0;
				put_b = 1'b0;
				get_a = 1'b0;
				get_b = 1'b1;
				rd_ptr <= rd_ptr + 1;
				if (rd_ptr == 5'b10000 ) begin
				rd_ptr <= 0;
				end	
				//count = 0;
			end
		//data_out <= fifo[rd_ptr];
		//if (rd_ptr == 5'b10000 ) begin
			//rd_ptr <= 0;
		//end	
		end
	end	

end



endmodule