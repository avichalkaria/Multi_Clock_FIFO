
module FIFO_expwidth ( clk, reset, data_in, put, get, data_out, fillcount, 
        empty, full );
  input [31:0] data_in;
  output [31:0] data_out;
  output [3:0] fillcount;
  input clk, reset, put, get;
  output empty, full;
  wire   empty_a, full_a, empty_b, full_b;

  FIFO F1 ( .p1(clk), .p2(reset), .p3(data_in[31:16]), .p4(put), .p5(get), 
        .p6(data_out[31:16]), .p7(fillcount), .p8(empty_a), .p9(full_a) );
  FIFO F2 ( .p1(clk), .p2(reset), .p3(data_in[15:0]), .p4(put), .p5(get), .p6(
        data_out[15:0]), .p7(fillcount), .p8(empty_b), .p9(full_b) );
  OR2X2 U1 ( .A(full_a), .B(full_b), .Y(full) );
  OR2X2 U2 ( .A(empty_a), .B(empty_b), .Y(empty) );
endmodule

