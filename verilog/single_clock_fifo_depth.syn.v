
module FIFO_explength_DW01_inc_1 ( A, SUM );
  input [4:0] A;
  output [4:0] SUM;
  wire   carry_4_, carry_3_, carry_2_;

  HAX1 U1_1_3 ( .A(A[3]), .B(carry_3_), .YC(carry_4_), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry_2_), .YC(carry_3_), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry_2_), .YS(SUM[1]) );
  XOR2X1 U1 ( .A(carry_4_), .B(A[4]), .Y(SUM[4]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module FIFO_explength_DW01_inc_0 ( A, SUM );
  input [4:0] A;
  output [4:0] SUM;
  wire   carry_4_, carry_3_, carry_2_;

  HAX1 U1_1_3 ( .A(A[3]), .B(carry_3_), .YC(carry_4_), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry_2_), .YC(carry_3_), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry_2_), .YS(SUM[1]) );
  XOR2X1 U1 ( .A(carry_4_), .B(A[4]), .Y(SUM[4]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module FIFO_explength ( clk, reset, data_in, put, get, data_out, fillcount, 
        empty, full );
  input [7:0] data_in;
  output [7:0] data_out;
  output [4:0] fillcount;
  input clk, reset, put, get;
  output empty, full;
  wire   put_a, get_a, empty_a, full_a, put_b, get_b, full_b, n29, n37, n38,
         n39, n40, n41, n82, n83, n84, n85, n86, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, add_50_carry_1_,
         add_50_carry_2_, add_50_carry_3_, n180, n181;
  wire   [7:0] data_in_a;
  wire   [7:0] data_out_a;
  wire   [3:0] fillcount_a;
  wire   [7:0] data_in_b;
  wire   [7:0] data_out_b;
  wire   [3:0] fillcount_b;
  wire   [4:0] rd_ptr;
  wire   [4:0] wr_ptr;

  FIFO F1 ( .p1(clk), .p2(reset), .p3(data_in_a), .p4(put_a), .p5(get_a), .p6(
        data_out_a), .p7(fillcount_a), .p8(empty_a), .p9(full_a) );
  FIFO F2 ( .p1(clk), .p2(reset), .p3(data_in_b), .p4(put_b), .p5(get_b), .p6(
        data_out_b), .p7(fillcount_b), .p8(empty_a), .p9(full_b) );
  DFFPOSX1 rd_ptr_reg_0_ ( .D(n179), .CLK(clk), .Q(rd_ptr[0]) );
  DFFPOSX1 rd_ptr_reg_1_ ( .D(n178), .CLK(clk), .Q(rd_ptr[1]) );
  DFFPOSX1 rd_ptr_reg_4_ ( .D(n177), .CLK(clk), .Q(rd_ptr[4]) );
  DFFPOSX1 get_a_reg ( .D(n176), .CLK(clk), .Q(get_a) );
  DFFPOSX1 data_in_b_reg_0_ ( .D(n175), .CLK(clk), .Q(data_in_b[0]) );
  DFFPOSX1 full_reg ( .D(n174), .CLK(clk), .Q(full) );
  DFFPOSX1 wr_ptr_reg_0_ ( .D(n173), .CLK(clk), .Q(wr_ptr[0]) );
  DFFPOSX1 wr_ptr_reg_1_ ( .D(n172), .CLK(clk), .Q(wr_ptr[1]) );
  DFFPOSX1 wr_ptr_reg_2_ ( .D(n171), .CLK(clk), .Q(wr_ptr[2]) );
  DFFPOSX1 wr_ptr_reg_3_ ( .D(n170), .CLK(clk), .Q(wr_ptr[3]) );
  DFFPOSX1 wr_ptr_reg_4_ ( .D(n169), .CLK(clk), .Q(wr_ptr[4]) );
  DFFPOSX1 put_b_reg ( .D(n168), .CLK(clk), .Q(put_b) );
  DFFPOSX1 empty_reg ( .D(n167), .CLK(clk), .Q(empty) );
  DFFPOSX1 get_b_reg ( .D(n166), .CLK(clk), .Q(get_b) );
  DFFPOSX1 put_a_reg ( .D(n165), .CLK(clk), .Q(put_a) );
  DFFPOSX1 data_in_a_reg_7_ ( .D(n164), .CLK(clk), .Q(data_in_a[7]) );
  DFFPOSX1 data_in_a_reg_6_ ( .D(n163), .CLK(clk), .Q(data_in_a[6]) );
  DFFPOSX1 data_in_a_reg_5_ ( .D(n162), .CLK(clk), .Q(data_in_a[5]) );
  DFFPOSX1 data_in_a_reg_4_ ( .D(n161), .CLK(clk), .Q(data_in_a[4]) );
  DFFPOSX1 data_in_a_reg_3_ ( .D(n160), .CLK(clk), .Q(data_in_a[3]) );
  DFFPOSX1 data_in_a_reg_2_ ( .D(n159), .CLK(clk), .Q(data_in_a[2]) );
  DFFPOSX1 data_in_a_reg_1_ ( .D(n158), .CLK(clk), .Q(data_in_a[1]) );
  DFFPOSX1 data_in_a_reg_0_ ( .D(n157), .CLK(clk), .Q(data_in_a[0]) );
  DFFPOSX1 data_in_b_reg_7_ ( .D(n156), .CLK(clk), .Q(data_in_b[7]) );
  DFFPOSX1 data_in_b_reg_6_ ( .D(n155), .CLK(clk), .Q(data_in_b[6]) );
  DFFPOSX1 data_in_b_reg_5_ ( .D(n154), .CLK(clk), .Q(data_in_b[5]) );
  DFFPOSX1 data_in_b_reg_4_ ( .D(n153), .CLK(clk), .Q(data_in_b[4]) );
  DFFPOSX1 data_in_b_reg_3_ ( .D(n152), .CLK(clk), .Q(data_in_b[3]) );
  DFFPOSX1 data_in_b_reg_2_ ( .D(n151), .CLK(clk), .Q(data_in_b[2]) );
  DFFPOSX1 data_in_b_reg_1_ ( .D(n150), .CLK(clk), .Q(data_in_b[1]) );
  DFFPOSX1 rd_ptr_reg_3_ ( .D(n149), .CLK(clk), .Q(rd_ptr[3]) );
  DFFPOSX1 rd_ptr_reg_2_ ( .D(n148), .CLK(clk), .Q(rd_ptr[2]) );
  AND2X1 U3 ( .A(full_b), .B(n52), .Y(full_b) );
  AND2X1 U4 ( .A(full_a), .B(n52), .Y(full_a) );
  OAI21X1 U6 ( .A(n53), .B(n54), .C(n55), .Y(n148) );
  NAND2X1 U7 ( .A(n84), .B(n56), .Y(n55) );
  OAI21X1 U10 ( .A(n53), .B(n57), .C(n58), .Y(n149) );
  NAND2X1 U11 ( .A(n85), .B(n56), .Y(n58) );
  OAI21X1 U12 ( .A(n59), .B(n60), .C(n61), .Y(n150) );
  NAND2X1 U13 ( .A(data_in_b[1]), .B(n59), .Y(n61) );
  OAI21X1 U14 ( .A(n59), .B(n62), .C(n63), .Y(n151) );
  NAND2X1 U15 ( .A(data_in_b[2]), .B(n59), .Y(n63) );
  OAI21X1 U16 ( .A(n59), .B(n64), .C(n65), .Y(n152) );
  NAND2X1 U17 ( .A(data_in_b[3]), .B(n59), .Y(n65) );
  OAI21X1 U18 ( .A(n59), .B(n66), .C(n67), .Y(n153) );
  NAND2X1 U19 ( .A(data_in_b[4]), .B(n59), .Y(n67) );
  OAI21X1 U20 ( .A(n59), .B(n68), .C(n69), .Y(n154) );
  NAND2X1 U21 ( .A(data_in_b[5]), .B(n59), .Y(n69) );
  OAI21X1 U22 ( .A(n59), .B(n70), .C(n71), .Y(n155) );
  NAND2X1 U23 ( .A(data_in_b[6]), .B(n59), .Y(n71) );
  OAI21X1 U24 ( .A(n59), .B(n72), .C(n73), .Y(n156) );
  NAND2X1 U25 ( .A(data_in_b[7]), .B(n59), .Y(n73) );
  OAI21X1 U26 ( .A(n74), .B(n75), .C(n76), .Y(n157) );
  NAND2X1 U27 ( .A(data_in_a[0]), .B(n74), .Y(n76) );
  OAI21X1 U28 ( .A(n60), .B(n74), .C(n77), .Y(n158) );
  NAND2X1 U29 ( .A(data_in_a[1]), .B(n74), .Y(n77) );
  OAI21X1 U31 ( .A(n62), .B(n74), .C(n78), .Y(n159) );
  NAND2X1 U32 ( .A(data_in_a[2]), .B(n74), .Y(n78) );
  OAI21X1 U34 ( .A(n64), .B(n74), .C(n79), .Y(n160) );
  NAND2X1 U35 ( .A(data_in_a[3]), .B(n74), .Y(n79) );
  OAI21X1 U37 ( .A(n66), .B(n74), .C(n80), .Y(n161) );
  NAND2X1 U38 ( .A(data_in_a[4]), .B(n74), .Y(n80) );
  OAI21X1 U40 ( .A(n68), .B(n74), .C(n81), .Y(n162) );
  NAND2X1 U41 ( .A(data_in_a[5]), .B(n74), .Y(n81) );
  OAI21X1 U43 ( .A(n70), .B(n74), .C(n87), .Y(n163) );
  NAND2X1 U44 ( .A(data_in_a[6]), .B(n74), .Y(n87) );
  OAI21X1 U46 ( .A(n72), .B(n74), .C(n88), .Y(n164) );
  NAND2X1 U47 ( .A(data_in_a[7]), .B(n74), .Y(n88) );
  NAND3X1 U48 ( .A(n89), .B(n52), .C(n90), .Y(n74) );
  OAI21X1 U50 ( .A(n91), .B(n92), .C(n93), .Y(n165) );
  NAND2X1 U51 ( .A(put_a), .B(n94), .Y(n93) );
  NAND2X1 U52 ( .A(n95), .B(n96), .Y(n92) );
  OAI21X1 U53 ( .A(n97), .B(n98), .C(n99), .Y(n166) );
  NAND2X1 U54 ( .A(get_b), .B(n94), .Y(n99) );
  NAND2X1 U55 ( .A(n100), .B(n52), .Y(n98) );
  OAI21X1 U56 ( .A(n101), .B(n102), .C(n103), .Y(n167) );
  NAND2X1 U57 ( .A(reset), .B(empty), .Y(n103) );
  NAND2X1 U58 ( .A(n104), .B(n52), .Y(n102) );
  OAI21X1 U59 ( .A(n53), .B(n105), .C(n106), .Y(n168) );
  NAND2X1 U60 ( .A(put_b), .B(n94), .Y(n106) );
  NAND2X1 U61 ( .A(n91), .B(n96), .Y(n105) );
  NOR2X1 U62 ( .A(n107), .B(n108), .Y(n169) );
  AOI22X1 U63 ( .A(n41), .B(n96), .C(wr_ptr[4]), .D(n109), .Y(n108) );
  NOR2X1 U64 ( .A(n107), .B(n110), .Y(n170) );
  AOI22X1 U65 ( .A(n40), .B(n96), .C(wr_ptr[3]), .D(n109), .Y(n110) );
  NOR2X1 U66 ( .A(n107), .B(n111), .Y(n171) );
  AOI22X1 U67 ( .A(n39), .B(n96), .C(wr_ptr[2]), .D(n109), .Y(n111) );
  AOI21X1 U68 ( .A(n112), .B(n52), .C(n109), .Y(n107) );
  NOR2X1 U69 ( .A(n113), .B(n114), .Y(n172) );
  AOI22X1 U70 ( .A(n38), .B(n96), .C(wr_ptr[1]), .D(n109), .Y(n113) );
  NOR2X1 U71 ( .A(n115), .B(n114), .Y(n173) );
  NAND2X1 U72 ( .A(n112), .B(n52), .Y(n114) );
  NAND3X1 U73 ( .A(n116), .B(n117), .C(n118), .Y(n112) );
  NOR2X1 U74 ( .A(wr_ptr[0]), .B(n119), .Y(n118) );
  NOR2X1 U77 ( .A(wr_ptr[3]), .B(wr_ptr[2]), .Y(n116) );
  AOI22X1 U78 ( .A(n37), .B(n96), .C(wr_ptr[0]), .D(n109), .Y(n115) );
  OAI21X1 U79 ( .A(n104), .B(n120), .C(n121), .Y(n174) );
  NAND2X1 U80 ( .A(full), .B(reset), .Y(n121) );
  OAI21X1 U82 ( .A(n59), .B(n75), .C(n122), .Y(n175) );
  NAND2X1 U83 ( .A(data_in_b[0]), .B(n59), .Y(n122) );
  NAND3X1 U85 ( .A(n91), .B(n52), .C(n89), .Y(n59) );
  NOR2X1 U87 ( .A(wr_ptr[4]), .B(wr_ptr[3]), .Y(n90) );
  OAI21X1 U88 ( .A(n100), .B(n123), .C(n124), .Y(n176) );
  NAND2X1 U89 ( .A(get_a), .B(n94), .Y(n124) );
  NOR2X1 U90 ( .A(n96), .B(n125), .Y(n94) );
  NOR2X1 U92 ( .A(n89), .B(reset), .Y(n109) );
  OAI21X1 U94 ( .A(n101), .B(n104), .C(put), .Y(n126) );
  NAND2X1 U96 ( .A(n125), .B(n52), .Y(n123) );
  NAND2X1 U98 ( .A(n127), .B(n57), .Y(n100) );
  OAI21X1 U99 ( .A(n127), .B(n53), .C(n128), .Y(n177) );
  NAND2X1 U100 ( .A(n86), .B(n56), .Y(n128) );
  OAI21X1 U102 ( .A(n53), .B(n129), .C(n130), .Y(n178) );
  NAND2X1 U103 ( .A(n83), .B(n56), .Y(n130) );
  OAI21X1 U104 ( .A(n53), .B(n131), .C(n132), .Y(n179) );
  NAND2X1 U105 ( .A(n82), .B(n56), .Y(n132) );
  OAI21X1 U107 ( .A(n134), .B(n135), .C(n136), .Y(n133) );
  NOR2X1 U108 ( .A(reset), .B(n95), .Y(n136) );
  NAND2X1 U109 ( .A(rd_ptr[4]), .B(n131), .Y(n135) );
  NAND3X1 U110 ( .A(n54), .B(n57), .C(n129), .Y(n134) );
  NOR2X1 U116 ( .A(reset), .B(n125), .Y(n95) );
  OAI21X1 U118 ( .A(fillcount[4]), .B(n101), .C(get), .Y(n97) );
  NAND2X1 U119 ( .A(n137), .B(n138), .Y(n101) );
  NOR2X1 U120 ( .A(fillcount[3]), .B(fillcount[2]), .Y(n138) );
  NOR2X1 U121 ( .A(fillcount[1]), .B(fillcount[0]), .Y(n137) );
  AOI22X1 U123 ( .A(n29), .B(data_out_a[7]), .C(data_out_b[7]), .D(n180), .Y(
        n139) );
  AOI22X1 U125 ( .A(data_out_a[6]), .B(n29), .C(data_out_b[6]), .D(n180), .Y(
        n141) );
  AOI22X1 U127 ( .A(data_out_a[5]), .B(n29), .C(data_out_b[5]), .D(n180), .Y(
        n142) );
  AOI22X1 U129 ( .A(data_out_a[4]), .B(n29), .C(data_out_b[4]), .D(n180), .Y(
        n143) );
  AOI22X1 U131 ( .A(data_out_a[3]), .B(n29), .C(data_out_b[3]), .D(n180), .Y(
        n144) );
  AOI22X1 U133 ( .A(data_out_a[2]), .B(n29), .C(data_out_b[2]), .D(n180), .Y(
        n145) );
  AOI22X1 U135 ( .A(data_out_a[1]), .B(n29), .C(data_out_b[1]), .D(n180), .Y(
        n146) );
  AOI22X1 U137 ( .A(data_out_a[0]), .B(n29), .C(data_out_b[0]), .D(n180), .Y(
        n147) );
  OR2X2 U5 ( .A(reset), .B(empty_a), .Y(empty_a) );
  INVX2 U30 ( .A(data_in[1]), .Y(n60) );
  INVX2 U33 ( .A(data_in[2]), .Y(n62) );
  INVX2 U36 ( .A(data_in[3]), .Y(n64) );
  INVX2 U39 ( .A(data_in[4]), .Y(n66) );
  INVX2 U42 ( .A(data_in[5]), .Y(n68) );
  INVX2 U45 ( .A(data_in[6]), .Y(n70) );
  INVX2 U49 ( .A(data_in[7]), .Y(n72) );
  INVX2 U75 ( .A(wr_ptr[4]), .Y(n119) );
  INVX2 U76 ( .A(wr_ptr[1]), .Y(n117) );
  OR2X2 U81 ( .A(n101), .B(reset), .Y(n120) );
  INVX2 U84 ( .A(data_in[0]), .Y(n75) );
  INVX2 U86 ( .A(n90), .Y(n91) );
  INVX2 U91 ( .A(n109), .Y(n96) );
  INVX2 U93 ( .A(n126), .Y(n89) );
  INVX2 U95 ( .A(fillcount[4]), .Y(n104) );
  INVX2 U101 ( .A(rd_ptr[4]), .Y(n127) );
  INVX2 U106 ( .A(n133), .Y(n56) );
  INVX2 U111 ( .A(rd_ptr[1]), .Y(n129) );
  INVX2 U112 ( .A(rd_ptr[3]), .Y(n57) );
  INVX2 U113 ( .A(rd_ptr[2]), .Y(n54) );
  INVX2 U114 ( .A(rd_ptr[0]), .Y(n131) );
  INVX2 U115 ( .A(n95), .Y(n53) );
  INVX2 U117 ( .A(n97), .Y(n125) );
  INVX2 U122 ( .A(n139), .Y(data_out[7]) );
  INVX2 U124 ( .A(n141), .Y(data_out[6]) );
  INVX2 U126 ( .A(n142), .Y(data_out[5]) );
  INVX2 U128 ( .A(n143), .Y(data_out[4]) );
  INVX2 U130 ( .A(n144), .Y(data_out[3]) );
  INVX2 U132 ( .A(n145), .Y(data_out[2]) );
  INVX2 U134 ( .A(n146), .Y(data_out[1]) );
  INVX2 U136 ( .A(n147), .Y(data_out[0]) );
  FIFO_explength_DW01_inc_0 r316 ( .A(rd_ptr), .SUM({n86, n85, n84, n83, n82})
         );
  FIFO_explength_DW01_inc_1 r315 ( .A(wr_ptr), .SUM({n41, n40, n39, n38, n37})
         );
  FAX1 add_50_U1_1 ( .A(fillcount_a[1]), .B(fillcount_b[1]), .C(
        add_50_carry_1_), .YC(add_50_carry_2_), .YS(fillcount[1]) );
  FAX1 add_50_U1_2 ( .A(fillcount_a[2]), .B(fillcount_b[2]), .C(
        add_50_carry_2_), .YC(add_50_carry_3_), .YS(fillcount[2]) );
  FAX1 add_50_U1_3 ( .A(fillcount_a[3]), .B(fillcount_b[3]), .C(
        add_50_carry_3_), .YC(fillcount[4]), .YS(fillcount[3]) );
  INVX2 U139 ( .A(n29), .Y(n180) );
  INVX2 U140 ( .A(reset), .Y(n52) );
  AND2X1 U141 ( .A(fillcount_b[0]), .B(fillcount_a[0]), .Y(add_50_carry_1_) );
  XOR2X1 U142 ( .A(fillcount_b[0]), .B(fillcount_a[0]), .Y(fillcount[0]) );
  OR2X2 U143 ( .A(rd_ptr[4]), .B(rd_ptr[2]), .Y(n181) );
  OAI22X1 U144 ( .A(rd_ptr[4]), .B(rd_ptr[3]), .C(rd_ptr[1]), .D(n181), .Y(n29) );
endmodule

