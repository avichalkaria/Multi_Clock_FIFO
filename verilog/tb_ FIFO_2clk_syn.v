/////////////////////////////////////////////////////////////////
//       testbench: tb.v
/////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
`include "/home/scf-22/ee577/design_pdk/osu_stdcells/lib/tsmc018/lib/osu018_stdcells.v"

module tb;
//------------Output Ports--------------
wire empty,full;
wire [7:0] data_out;
//------------Input Ports---------------
reg  put,get;
reg  reset,rclk,wclk;
reg  [7:0] data_in;
//-------------------------------------
DFIFO  D1 (rclk, wclk, reset, data_in, put, get, data_out, empty, full); 

initial
begin

rclk =1;
wclk =1; 
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
#500
$finish;


end

always
  #25 rclk=~rclk;
always  
  #2.5 wclk = ~wclk;
endmodule
