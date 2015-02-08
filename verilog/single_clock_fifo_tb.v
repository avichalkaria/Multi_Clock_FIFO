/////////////////////////////////////////////////////////////////
//       testbench: tb.v
/////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
module tb;
//------------Output Ports--------------
wire empty,full;
wire [4:0] fillcount;
wire [7:0] data_out;
//------------Input Ports---------------
reg  put,get;
reg  reset,clk;
reg  [7:0] data_in;
//-------------------------------------
FIFO  F1 (clk, reset, data_in, put, get, data_out, fillcount, empty, full); 

initial
begin

clk =1;

reset =1;

#20

reset = 0;
   put = 1'b1;
   get = 1'b0;
   data_in=8'b11111111;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00000000;
   #5;
   put = 1'b0;
   get = 1'b1;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b10101010;
   #5;
   put = 1'b0;
   get = 1'b1;
#50
$finish;


end

always
  #2.5 clk=~clk;
endmodule
