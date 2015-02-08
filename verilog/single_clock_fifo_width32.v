module FIFO_expwidth (clk, reset, data_in, put, get, data_out, fillcount, empty, full);

parameter ADDR_WIDTH = 3;
parameter DEPTH_P2 = 1 << ADDR_WIDTH;
parameter WIDTH = 32;

input [WIDTH-1 : 0] data_in;
input  put, get, reset, clk;
output [WIDTH-1 : 0] data_out;
output [ADDR_WIDTH : 0]fillcount;
output empty, full;

reg empty;
reg [ADDR_WIDTH : 0]fillcount;
wire [ADDR_WIDTH : 0]fillcount_a;
wire [ADDR_WIDTH : 0]fillcount_b;
wire empty_a,empty_b;
wire full;
wire [WIDTH-1:0]data_out;
wire [WIDTH/2 -1 :0]data_out_a;
wire [WIDTH/2 -1 :0] data_out_b;
wire [WIDTH/2 -1 :0]data_in_a;
wire [WIDTH/2 -1 :0] data_in_b;

FIFO F1 (clk, reset, data_in_a, put, get, data_out_a, fillcount_a, empty_a, full_a);
FIFO F2 (clk, reset, data_in_b, put, get, data_out_b, fillcount_b, empty_b, full_b);

assign data_out = {data_out_a,data_out_b};
assign data_in_a = data_in[(WIDTH-1) : (WIDTH/2)];
assign data_in_b = data_in[(WIDTH/2-1):0];
//assign empty = empty_a | empty_b;
assign full = full_a | full_b;

always @ (empty_b,empty_a)

begin
empty <= empty_b | empty_a;
end

always @(fillcount_a,fillcount_b)
begin
if (fillcount_a != 0) begin
fillcount <= fillcount_a;
end
else 
fillcount <= fillcount_b;
end 

endmodule