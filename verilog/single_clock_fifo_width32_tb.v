/////////////////////////////////////////////////////////////////
//       testbench: tb.v
/////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
`include "/home/scf-22/ee577/design_pdk/osu_stdcells/lib/tsmc018/lib/osu018_stdcells.v"

module tb;
//------------Output Ports--------------
wire empty,full;
wire [3:0] fillcount;
wire [31:0] data_out;
//------------Input Ports---------------
reg  put,get;
reg  reset,clk;
reg  [31:0] data_in;
//-------------------------------------
FIFO_expwidth  F1 (clk, reset, data_in, put, get, data_out, fillcount, empty, full); 

initial
begin

clk =1;

reset =1;

#20

reset = 0;
   put = 1'b1;
   get = 1'b0;
   data_in=32'hAAAAAAAA;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 32'hBBBBBBBB;
   #5;
   put = 1'b0;
   get = 1'b1;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 32'hCCCCCCCC;
   #5;
   put = 1'b0;
   get = 1'b1;
#50
$finish;


end

always
  #2.5 clk=~clk;
endmodule
