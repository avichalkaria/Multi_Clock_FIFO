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
FIFO_explength F1 (clk, reset, data_in, put, get, data_out, fillcount, empty, full);

initial
begin

clk =1;

reset =1;

#20

reset = 0;
   put = 1'b1;
   get = 1'b0;
   data_in=8'b00000001;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00000010;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00000011;
   #5;
    put = 1'b1;
   get = 1'b0;
   data_in=8'b00000100;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00000101;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00000110;
   #5;
      put = 1'b1;
   get = 1'b0;
   data_in=8'b00000111;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00001000;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00001001;
   #5;
    put = 1'b1;
   get = 1'b0;
   data_in=8'b00001010;
   #5;
   put = 1'b1;
   get = 1'b0;
   data_in = 8'b00001011;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00001100;
   #5;
   put = 1'b1;
   get = 1'b0;
   data_in=8'b00001101;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00001110;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00001111;
   #5;
    put = 1'b1;
   get = 1'b0;
   data_in=8'b00010000;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00010001;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00100010;
   #5;
      put = 1'b1;
   get = 1'b0;
   data_in=8'b00010011;
   #5;
   put = 1'b1;
   get = 1'b0;
   data_in = 8'b00010100;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00010101;
   #5;
    put = 1'b1;
   get = 1'b0;
   data_in=8'b00010110;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00010111;
   #5;
   put = 1'b1;
   get = 'b0;
   data_in = 8'b00011000;
   #5;
   put = 1'b0;
   get = 1'b1;

#500
$finish;


end

always
  #2.5 clk=~clk;
endmodule
