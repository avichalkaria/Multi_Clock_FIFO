module DFIFO (rclk, wclk, reset, data_in, put, get, data_out, empty, full); 

//----------parameters--------------

parameter ADDR_WIDTH = 3;
parameter DEPTH_P2 = 1 << ADDR_WIDTH;
parameter WIDTH = 8;

//-----------------------------------

input [WIDTH-1:0] data_in;
input put, get, reset, rclk,wclk;  
output empty, full; 
output [WIDTH-1 :0] data_out;

reg empty,full;
reg [WIDTH-1:0]data_out;
reg [WIDTH-1:0] double_clock_fifo [DEPTH_P2-1:0];

parameter zeroes  = 4'b0000;
parameter A1_zeroes = 4'b1000;
//----------------------------------------

//---------addtional registers------------

reg [ADDR_WIDTH : 0] rd_ptr;
reg [ADDR_WIDTH : 0] wr_ptr;
wire [ADDR_WIDTH : 0] rd_ptr_ss; 
wire [ADDR_WIDTH : 0] wr_ptr_ss;
reg [ADDR_WIDTH : 0] rd_ptr_gray;
reg [ADDR_WIDTH : 0] wr_ptr_gray;
reg [ADDR_WIDTH : 0] rd_ptr_gray_s;
reg [ADDR_WIDTH : 0] rd_ptr_gray_ss;
reg [ADDR_WIDTH : 0] wr_ptr_gray_s;
reg [ADDR_WIDTH : 0] wr_ptr_gray_ss;

reg [ADDR_WIDTH : 0] next_rd_ptr;
reg [ADDR_WIDTH : 0] next_wr_ptr;

wire [ADDR_WIDTH : 0] depth_rd;
wire [ADDR_WIDTH : 0] depth_wr;

reg full_int;
reg empty_int;
// not defined wenq renq

assign wr_ptr_ss [3] = wr_ptr_gray_ss [3];
assign wr_ptr_ss [2] = wr_ptr_gray_ss [3] ^ wr_ptr_gray_ss [2];
assign wr_ptr_ss [1] = wr_ptr_gray_ss [3] ^ wr_ptr_gray_ss [2] ^ wr_ptr_gray_ss [1];
assign wr_ptr_ss [0] = wr_ptr_gray_ss [3] ^ wr_ptr_gray_ss [2] ^ wr_ptr_gray_ss [1] ^ wr_ptr_gray_ss [0];

assign rd_ptr_ss [3] = rd_ptr_gray_ss [3];
assign rd_ptr_ss [2] = rd_ptr_gray_ss [3] ^ rd_ptr_gray_ss [2];
assign rd_ptr_ss [1] = rd_ptr_gray_ss [3] ^ rd_ptr_gray_ss [2] ^ rd_ptr_gray_ss [1];
assign rd_ptr_ss [0] = rd_ptr_gray_ss [3] ^ rd_ptr_gray_ss [2] ^ rd_ptr_gray_ss [1] ^ rd_ptr_gray_ss [0];

assign depth_rd = wr_ptr_ss - rd_ptr;
assign depth_wr = wr_ptr - rd_ptr_ss;

always @ (depth_wr)
	begin
		if (depth_wr == 4'b1000) begin
		full_int <= 1'b1;
		end
		else begin
		full_int <= 1'b0;
		end
	end
	
always @ (depth_rd)
	begin
		if (depth_rd == 4'b0000) begin
		empty_int <= 1'b1; 
		end
		else begin
		empty_int <= 1'b0;
		end
	end

always @ (posedge rclk)
	begin
	if (reset == 1'b1) begin
		rd_ptr <= zeroes;
		wr_ptr_gray_s <= zeroes;
		wr_ptr_gray_ss <= zeroes;
	end
	else begin
		if ((empty_int == 1'b0) && (get == 1'b1)) begin
		data_out <= double_clock_fifo[rd_ptr[ADDR_WIDTH-1 : 0]];
		rd_ptr <= rd_ptr + 1;
		next_rd_ptr = rd_ptr + 1;
		end
		
		rd_ptr_gray [0] <= next_rd_ptr [0] ^ next_rd_ptr [1];
		rd_ptr_gray [1] <= next_rd_ptr [1] ^ next_rd_ptr [2];
		rd_ptr_gray [2] <= next_rd_ptr [2] ^ next_rd_ptr [3];
		rd_ptr_gray [3] <= next_rd_ptr [3];
		
		wr_ptr_gray_s <= wr_ptr_gray;
		wr_ptr_gray_ss <= wr_ptr_gray_s;
	end	
	empty <= empty_int;
	end	

always @ (posedge wclk)
	begin
	if (reset == 1'b1) begin
		wr_ptr <= zeroes;
		rd_ptr_gray_s <= zeroes;
		rd_ptr_gray_ss <= zeroes;
	end
	else begin
		if ((full_int == 1'b0) && (put == 1'b1)) begin
		double_clock_fifo[wr_ptr[ADDR_WIDTH-1 : 0]] <= data_in;
		wr_ptr <= wr_ptr + 1;
		next_wr_ptr = wr_ptr + 1;
		end
		
		wr_ptr_gray [0] <= next_wr_ptr [0] ^ next_wr_ptr [1];
		wr_ptr_gray [1] <= next_wr_ptr [1] ^ next_wr_ptr [2];
		wr_ptr_gray [2] <= next_wr_ptr [2] ^ next_wr_ptr [3];
		wr_ptr_gray [3] <= next_wr_ptr [3];
		
		rd_ptr_gray_s <= rd_ptr_gray;
		rd_ptr_gray_ss <= rd_ptr_gray_s;
	end	
	full <= full_int;
	end		
endmodule

