
module DFIFO ( rclk, wclk, reset, data_in, put, get, data_out, empty, full );
  input [7:0] data_in;
  output [7:0] data_out;
  input rclk, wclk, reset, put, get;
  output empty, full;
  wire   n15, n16, n17, rd_ptr_3_, full_int, empty_int, n19, n20, n21, n22,
         n23, n24, n25, n26, n28, n29, n30, n47, n48, n49, n50, n51, n52, n53,
         n54, n80, n81, n82, n163, n164, n165, n166, n167, n168, n169, n170,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n160, n161, n162, n171, n172, n173, n174, n175, n176,
         n177, n178, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441;
  wire   [2:0] wr_ptr_gray_ss;
  wire   [3:0] wr_ptr_ss;
  wire   [2:0] rd_ptr_gray_ss;
  wire   [3:0] rd_ptr_ss;
  wire   [3:0] depth_rd;
  wire   [3:0] wr_ptr;
  wire   [3:0] depth_wr;
  wire   [63:0] double_clock_fifo;
  wire   [3:0] next_rd_ptr;
  wire   [3:0] rd_ptr_gray;
  wire   [3:0] wr_ptr_gray;
  wire   [3:0] wr_ptr_gray_s;
  wire   [3:0] next_wr_ptr;
  wire   [3:0] rd_ptr_gray_s;

  DFFPOSX1 wr_ptr_gray_reg_0_ ( .D(n351), .CLK(wclk), .Q(wr_ptr_gray[0]) );
  DFFPOSX1 wr_ptr_gray_s_reg_0_ ( .D(n47), .CLK(rclk), .Q(wr_ptr_gray_s[0]) );
  DFFPOSX1 wr_ptr_gray_ss_reg_0_ ( .D(n51), .CLK(rclk), .Q(wr_ptr_gray_ss[0])
         );
  DFFPOSX1 rd_ptr_reg_0_ ( .D(n350), .CLK(rclk), .Q(n15) );
  DFFPOSX1 rd_ptr_reg_1_ ( .D(n349), .CLK(rclk), .Q(n16) );
  DFFPOSX1 rd_ptr_reg_2_ ( .D(n348), .CLK(rclk), .Q(n17) );
  DFFPOSX1 rd_ptr_reg_3_ ( .D(n347), .CLK(rclk), .Q(rd_ptr_3_) );
  DFFPOSX1 data_out_reg_7_ ( .D(n346), .CLK(rclk), .Q(data_out[7]) );
  DFFPOSX1 data_out_reg_5_ ( .D(n345), .CLK(rclk), .Q(data_out[5]) );
  DFFPOSX1 data_out_reg_3_ ( .D(n344), .CLK(rclk), .Q(data_out[3]) );
  DFFPOSX1 data_out_reg_1_ ( .D(n343), .CLK(rclk), .Q(data_out[1]) );
  DFFPOSX1 next_rd_ptr_reg_3_ ( .D(n342), .CLK(rclk), .Q(next_rd_ptr[3]) );
  DFFPOSX1 next_rd_ptr_reg_1_ ( .D(n341), .CLK(rclk), .Q(next_rd_ptr[1]) );
  DFFPOSX1 next_rd_ptr_reg_0_ ( .D(n340), .CLK(rclk), .Q(next_rd_ptr[0]) );
  DFFPOSX1 next_rd_ptr_reg_2_ ( .D(n339), .CLK(rclk), .Q(next_rd_ptr[2]) );
  DFFPOSX1 data_out_reg_0_ ( .D(n338), .CLK(rclk), .Q(data_out[0]) );
  DFFPOSX1 data_out_reg_2_ ( .D(n337), .CLK(rclk), .Q(data_out[2]) );
  DFFPOSX1 data_out_reg_4_ ( .D(n336), .CLK(rclk), .Q(data_out[4]) );
  DFFPOSX1 data_out_reg_6_ ( .D(n335), .CLK(rclk), .Q(data_out[6]) );
  DFFPOSX1 rd_ptr_gray_reg_1_ ( .D(n334), .CLK(rclk), .Q(rd_ptr_gray[1]) );
  DFFPOSX1 rd_ptr_gray_s_reg_1_ ( .D(n164), .CLK(wclk), .Q(rd_ptr_gray_s[1])
         );
  DFFPOSX1 rd_ptr_gray_ss_reg_1_ ( .D(n168), .CLK(wclk), .Q(rd_ptr_gray_ss[1])
         );
  DFFPOSX1 rd_ptr_gray_reg_3_ ( .D(n333), .CLK(rclk), .Q(rd_ptr_gray[3]) );
  DFFPOSX1 rd_ptr_gray_s_reg_3_ ( .D(n166), .CLK(wclk), .Q(rd_ptr_gray_s[3])
         );
  DFFPOSX1 rd_ptr_gray_ss_reg_3_ ( .D(n170), .CLK(wclk), .Q(rd_ptr_ss[3]) );
  DFFPOSX1 rd_ptr_gray_reg_2_ ( .D(n332), .CLK(rclk), .Q(rd_ptr_gray[2]) );
  DFFPOSX1 rd_ptr_gray_s_reg_2_ ( .D(n165), .CLK(wclk), .Q(rd_ptr_gray_s[2])
         );
  DFFPOSX1 rd_ptr_gray_ss_reg_2_ ( .D(n169), .CLK(wclk), .Q(rd_ptr_gray_ss[2])
         );
  DFFPOSX1 rd_ptr_gray_reg_0_ ( .D(n331), .CLK(rclk), .Q(rd_ptr_gray[0]) );
  DFFPOSX1 rd_ptr_gray_s_reg_0_ ( .D(n163), .CLK(wclk), .Q(rd_ptr_gray_s[0])
         );
  DFFPOSX1 rd_ptr_gray_ss_reg_0_ ( .D(n167), .CLK(wclk), .Q(rd_ptr_gray_ss[0])
         );
  DFFPOSX1 wr_ptr_reg_0_ ( .D(n330), .CLK(wclk), .Q(wr_ptr[0]) );
  DFFPOSX1 wr_ptr_reg_1_ ( .D(n329), .CLK(wclk), .Q(wr_ptr[1]) );
  DFFPOSX1 wr_ptr_reg_2_ ( .D(n328), .CLK(wclk), .Q(wr_ptr[2]) );
  DFFPOSX1 wr_ptr_reg_3_ ( .D(n327), .CLK(wclk), .Q(wr_ptr[3]) );
  DFFPOSX1 next_wr_ptr_reg_3_ ( .D(n326), .CLK(wclk), .Q(next_wr_ptr[3]) );
  DFFPOSX1 next_wr_ptr_reg_1_ ( .D(n325), .CLK(wclk), .Q(next_wr_ptr[1]) );
  DFFPOSX1 double_clock_fifo_reg_7__7_ ( .D(n324), .CLK(wclk), .Q(
        double_clock_fifo[63]) );
  DFFPOSX1 double_clock_fifo_reg_7__5_ ( .D(n323), .CLK(wclk), .Q(
        double_clock_fifo[61]) );
  DFFPOSX1 double_clock_fifo_reg_7__3_ ( .D(n322), .CLK(wclk), .Q(
        double_clock_fifo[59]) );
  DFFPOSX1 double_clock_fifo_reg_7__1_ ( .D(n321), .CLK(wclk), .Q(
        double_clock_fifo[57]) );
  DFFPOSX1 double_clock_fifo_reg_7__0_ ( .D(n320), .CLK(wclk), .Q(
        double_clock_fifo[56]) );
  DFFPOSX1 double_clock_fifo_reg_7__2_ ( .D(n319), .CLK(wclk), .Q(
        double_clock_fifo[58]) );
  DFFPOSX1 double_clock_fifo_reg_7__4_ ( .D(n318), .CLK(wclk), .Q(
        double_clock_fifo[60]) );
  DFFPOSX1 double_clock_fifo_reg_7__6_ ( .D(n317), .CLK(wclk), .Q(
        double_clock_fifo[62]) );
  DFFPOSX1 double_clock_fifo_reg_6__7_ ( .D(n316), .CLK(wclk), .Q(
        double_clock_fifo[55]) );
  DFFPOSX1 double_clock_fifo_reg_6__5_ ( .D(n315), .CLK(wclk), .Q(
        double_clock_fifo[53]) );
  DFFPOSX1 double_clock_fifo_reg_6__3_ ( .D(n314), .CLK(wclk), .Q(
        double_clock_fifo[51]) );
  DFFPOSX1 double_clock_fifo_reg_6__1_ ( .D(n313), .CLK(wclk), .Q(
        double_clock_fifo[49]) );
  DFFPOSX1 double_clock_fifo_reg_6__0_ ( .D(n312), .CLK(wclk), .Q(
        double_clock_fifo[48]) );
  DFFPOSX1 double_clock_fifo_reg_6__2_ ( .D(n311), .CLK(wclk), .Q(
        double_clock_fifo[50]) );
  DFFPOSX1 double_clock_fifo_reg_6__4_ ( .D(n310), .CLK(wclk), .Q(
        double_clock_fifo[52]) );
  DFFPOSX1 double_clock_fifo_reg_6__6_ ( .D(n309), .CLK(wclk), .Q(
        double_clock_fifo[54]) );
  DFFPOSX1 double_clock_fifo_reg_5__7_ ( .D(n308), .CLK(wclk), .Q(
        double_clock_fifo[47]) );
  DFFPOSX1 double_clock_fifo_reg_5__5_ ( .D(n307), .CLK(wclk), .Q(
        double_clock_fifo[45]) );
  DFFPOSX1 double_clock_fifo_reg_5__3_ ( .D(n306), .CLK(wclk), .Q(
        double_clock_fifo[43]) );
  DFFPOSX1 double_clock_fifo_reg_5__1_ ( .D(n305), .CLK(wclk), .Q(
        double_clock_fifo[41]) );
  DFFPOSX1 double_clock_fifo_reg_5__0_ ( .D(n304), .CLK(wclk), .Q(
        double_clock_fifo[40]) );
  DFFPOSX1 double_clock_fifo_reg_5__2_ ( .D(n303), .CLK(wclk), .Q(
        double_clock_fifo[42]) );
  DFFPOSX1 double_clock_fifo_reg_5__4_ ( .D(n302), .CLK(wclk), .Q(
        double_clock_fifo[44]) );
  DFFPOSX1 double_clock_fifo_reg_5__6_ ( .D(n301), .CLK(wclk), .Q(
        double_clock_fifo[46]) );
  DFFPOSX1 double_clock_fifo_reg_4__7_ ( .D(n300), .CLK(wclk), .Q(
        double_clock_fifo[39]) );
  DFFPOSX1 double_clock_fifo_reg_4__5_ ( .D(n299), .CLK(wclk), .Q(
        double_clock_fifo[37]) );
  DFFPOSX1 double_clock_fifo_reg_4__3_ ( .D(n298), .CLK(wclk), .Q(
        double_clock_fifo[35]) );
  DFFPOSX1 double_clock_fifo_reg_4__1_ ( .D(n297), .CLK(wclk), .Q(
        double_clock_fifo[33]) );
  DFFPOSX1 double_clock_fifo_reg_4__0_ ( .D(n296), .CLK(wclk), .Q(
        double_clock_fifo[32]) );
  DFFPOSX1 double_clock_fifo_reg_4__2_ ( .D(n295), .CLK(wclk), .Q(
        double_clock_fifo[34]) );
  DFFPOSX1 double_clock_fifo_reg_4__4_ ( .D(n294), .CLK(wclk), .Q(
        double_clock_fifo[36]) );
  DFFPOSX1 double_clock_fifo_reg_4__6_ ( .D(n293), .CLK(wclk), .Q(
        double_clock_fifo[38]) );
  DFFPOSX1 double_clock_fifo_reg_3__7_ ( .D(n292), .CLK(wclk), .Q(
        double_clock_fifo[31]) );
  DFFPOSX1 double_clock_fifo_reg_3__5_ ( .D(n291), .CLK(wclk), .Q(
        double_clock_fifo[29]) );
  DFFPOSX1 double_clock_fifo_reg_3__3_ ( .D(n290), .CLK(wclk), .Q(
        double_clock_fifo[27]) );
  DFFPOSX1 double_clock_fifo_reg_3__1_ ( .D(n289), .CLK(wclk), .Q(
        double_clock_fifo[25]) );
  DFFPOSX1 double_clock_fifo_reg_3__0_ ( .D(n288), .CLK(wclk), .Q(
        double_clock_fifo[24]) );
  DFFPOSX1 double_clock_fifo_reg_3__2_ ( .D(n287), .CLK(wclk), .Q(
        double_clock_fifo[26]) );
  DFFPOSX1 double_clock_fifo_reg_3__4_ ( .D(n286), .CLK(wclk), .Q(
        double_clock_fifo[28]) );
  DFFPOSX1 double_clock_fifo_reg_3__6_ ( .D(n285), .CLK(wclk), .Q(
        double_clock_fifo[30]) );
  DFFPOSX1 double_clock_fifo_reg_2__7_ ( .D(n284), .CLK(wclk), .Q(
        double_clock_fifo[23]) );
  DFFPOSX1 double_clock_fifo_reg_2__5_ ( .D(n283), .CLK(wclk), .Q(
        double_clock_fifo[21]) );
  DFFPOSX1 double_clock_fifo_reg_2__3_ ( .D(n282), .CLK(wclk), .Q(
        double_clock_fifo[19]) );
  DFFPOSX1 double_clock_fifo_reg_2__1_ ( .D(n281), .CLK(wclk), .Q(
        double_clock_fifo[17]) );
  DFFPOSX1 double_clock_fifo_reg_2__0_ ( .D(n280), .CLK(wclk), .Q(
        double_clock_fifo[16]) );
  DFFPOSX1 double_clock_fifo_reg_2__2_ ( .D(n279), .CLK(wclk), .Q(
        double_clock_fifo[18]) );
  DFFPOSX1 double_clock_fifo_reg_2__4_ ( .D(n278), .CLK(wclk), .Q(
        double_clock_fifo[20]) );
  DFFPOSX1 double_clock_fifo_reg_2__6_ ( .D(n277), .CLK(wclk), .Q(
        double_clock_fifo[22]) );
  DFFPOSX1 double_clock_fifo_reg_1__7_ ( .D(n276), .CLK(wclk), .Q(
        double_clock_fifo[15]) );
  DFFPOSX1 double_clock_fifo_reg_1__5_ ( .D(n275), .CLK(wclk), .Q(
        double_clock_fifo[13]) );
  DFFPOSX1 double_clock_fifo_reg_1__3_ ( .D(n274), .CLK(wclk), .Q(
        double_clock_fifo[11]) );
  DFFPOSX1 double_clock_fifo_reg_1__1_ ( .D(n273), .CLK(wclk), .Q(
        double_clock_fifo[9]) );
  DFFPOSX1 double_clock_fifo_reg_1__0_ ( .D(n272), .CLK(wclk), .Q(
        double_clock_fifo[8]) );
  DFFPOSX1 double_clock_fifo_reg_1__2_ ( .D(n271), .CLK(wclk), .Q(
        double_clock_fifo[10]) );
  DFFPOSX1 double_clock_fifo_reg_1__4_ ( .D(n270), .CLK(wclk), .Q(
        double_clock_fifo[12]) );
  DFFPOSX1 double_clock_fifo_reg_1__6_ ( .D(n269), .CLK(wclk), .Q(
        double_clock_fifo[14]) );
  DFFPOSX1 double_clock_fifo_reg_0__7_ ( .D(n268), .CLK(wclk), .Q(
        double_clock_fifo[7]) );
  DFFPOSX1 double_clock_fifo_reg_0__5_ ( .D(n267), .CLK(wclk), .Q(
        double_clock_fifo[5]) );
  DFFPOSX1 double_clock_fifo_reg_0__3_ ( .D(n266), .CLK(wclk), .Q(
        double_clock_fifo[3]) );
  DFFPOSX1 double_clock_fifo_reg_0__1_ ( .D(n265), .CLK(wclk), .Q(
        double_clock_fifo[1]) );
  DFFPOSX1 double_clock_fifo_reg_0__0_ ( .D(n264), .CLK(wclk), .Q(
        double_clock_fifo[0]) );
  DFFPOSX1 double_clock_fifo_reg_0__2_ ( .D(n263), .CLK(wclk), .Q(
        double_clock_fifo[2]) );
  DFFPOSX1 double_clock_fifo_reg_0__4_ ( .D(n262), .CLK(wclk), .Q(
        double_clock_fifo[4]) );
  DFFPOSX1 double_clock_fifo_reg_0__6_ ( .D(n261), .CLK(wclk), .Q(
        double_clock_fifo[6]) );
  DFFPOSX1 next_wr_ptr_reg_0_ ( .D(n260), .CLK(wclk), .Q(next_wr_ptr[0]) );
  DFFPOSX1 next_wr_ptr_reg_2_ ( .D(n259), .CLK(wclk), .Q(next_wr_ptr[2]) );
  DFFPOSX1 wr_ptr_gray_reg_1_ ( .D(n258), .CLK(wclk), .Q(wr_ptr_gray[1]) );
  DFFPOSX1 wr_ptr_gray_s_reg_1_ ( .D(n48), .CLK(rclk), .Q(wr_ptr_gray_s[1]) );
  DFFPOSX1 wr_ptr_gray_ss_reg_1_ ( .D(n52), .CLK(rclk), .Q(wr_ptr_gray_ss[1])
         );
  DFFPOSX1 wr_ptr_gray_reg_3_ ( .D(n257), .CLK(wclk), .Q(wr_ptr_gray[3]) );
  DFFPOSX1 wr_ptr_gray_s_reg_3_ ( .D(n50), .CLK(rclk), .Q(wr_ptr_gray_s[3]) );
  DFFPOSX1 wr_ptr_gray_ss_reg_3_ ( .D(n54), .CLK(rclk), .Q(wr_ptr_ss[3]) );
  DFFPOSX1 wr_ptr_gray_reg_2_ ( .D(n256), .CLK(wclk), .Q(wr_ptr_gray[2]) );
  DFFPOSX1 wr_ptr_gray_s_reg_2_ ( .D(n49), .CLK(rclk), .Q(wr_ptr_gray_s[2]) );
  DFFPOSX1 wr_ptr_gray_ss_reg_2_ ( .D(n53), .CLK(rclk), .Q(wr_ptr_gray_ss[2])
         );
  DFFPOSX1 full_reg ( .D(full_int), .CLK(wclk), .Q(full) );
  DFFPOSX1 empty_reg ( .D(empty_int), .CLK(rclk), .Q(empty) );
  XOR2X1 U3 ( .A(wr_ptr_gray_ss[1]), .B(wr_ptr_ss[2]), .Y(wr_ptr_ss[1]) );
  XOR2X1 U5 ( .A(wr_ptr_gray_ss[1]), .B(wr_ptr_gray_ss[0]), .Y(n84) );
  XOR2X1 U8 ( .A(wr_ptr_ss[3]), .B(wr_ptr_gray_ss[2]), .Y(wr_ptr_ss[2]) );
  XOR2X1 U10 ( .A(rd_ptr_ss[2]), .B(n85), .Y(rd_ptr_ss[0]) );
  XOR2X1 U11 ( .A(rd_ptr_gray_ss[1]), .B(rd_ptr_gray_ss[0]), .Y(n85) );
  XOR2X1 U12 ( .A(rd_ptr_ss[3]), .B(rd_ptr_gray_ss[2]), .Y(rd_ptr_ss[2]) );
  OAI21X1 U13 ( .A(n86), .B(n87), .C(n88), .Y(n302) );
  NAND2X1 U14 ( .A(double_clock_fifo[44]), .B(n86), .Y(n88) );
  OAI21X1 U15 ( .A(n86), .B(n89), .C(n90), .Y(n303) );
  NAND2X1 U16 ( .A(double_clock_fifo[42]), .B(n86), .Y(n90) );
  OAI21X1 U17 ( .A(n86), .B(n91), .C(n92), .Y(n304) );
  NAND2X1 U18 ( .A(double_clock_fifo[40]), .B(n86), .Y(n92) );
  OAI21X1 U19 ( .A(n86), .B(n93), .C(n94), .Y(n305) );
  NAND2X1 U20 ( .A(double_clock_fifo[41]), .B(n86), .Y(n94) );
  OAI21X1 U21 ( .A(n86), .B(n95), .C(n96), .Y(n306) );
  NAND2X1 U22 ( .A(double_clock_fifo[43]), .B(n86), .Y(n96) );
  OAI21X1 U23 ( .A(n86), .B(n97), .C(n98), .Y(n307) );
  NAND2X1 U24 ( .A(double_clock_fifo[45]), .B(n86), .Y(n98) );
  OAI21X1 U25 ( .A(n86), .B(n99), .C(n100), .Y(n308) );
  NAND2X1 U26 ( .A(double_clock_fifo[47]), .B(n86), .Y(n100) );
  OAI21X1 U27 ( .A(n101), .B(n102), .C(n103), .Y(n309) );
  NAND2X1 U28 ( .A(double_clock_fifo[54]), .B(n101), .Y(n103) );
  OAI21X1 U29 ( .A(n87), .B(n101), .C(n104), .Y(n310) );
  NAND2X1 U30 ( .A(double_clock_fifo[52]), .B(n101), .Y(n104) );
  OAI21X1 U31 ( .A(n89), .B(n101), .C(n105), .Y(n311) );
  NAND2X1 U32 ( .A(double_clock_fifo[50]), .B(n101), .Y(n105) );
  OAI21X1 U33 ( .A(n91), .B(n101), .C(n106), .Y(n312) );
  NAND2X1 U34 ( .A(double_clock_fifo[48]), .B(n101), .Y(n106) );
  OAI21X1 U35 ( .A(n93), .B(n101), .C(n107), .Y(n313) );
  NAND2X1 U36 ( .A(double_clock_fifo[49]), .B(n101), .Y(n107) );
  OAI21X1 U37 ( .A(n95), .B(n101), .C(n108), .Y(n314) );
  NAND2X1 U38 ( .A(double_clock_fifo[51]), .B(n101), .Y(n108) );
  OAI21X1 U39 ( .A(n97), .B(n101), .C(n109), .Y(n315) );
  NAND2X1 U40 ( .A(double_clock_fifo[53]), .B(n101), .Y(n109) );
  OAI21X1 U41 ( .A(n99), .B(n101), .C(n110), .Y(n316) );
  NAND2X1 U42 ( .A(double_clock_fifo[55]), .B(n101), .Y(n110) );
  NAND3X1 U43 ( .A(n111), .B(n428), .C(wr_ptr[1]), .Y(n101) );
  OAI21X1 U44 ( .A(n102), .B(n113), .C(n114), .Y(n317) );
  NAND2X1 U45 ( .A(double_clock_fifo[62]), .B(n113), .Y(n114) );
  OAI21X1 U46 ( .A(n87), .B(n113), .C(n115), .Y(n318) );
  NAND2X1 U47 ( .A(double_clock_fifo[60]), .B(n113), .Y(n115) );
  OAI21X1 U48 ( .A(n89), .B(n113), .C(n116), .Y(n319) );
  NAND2X1 U49 ( .A(double_clock_fifo[58]), .B(n113), .Y(n116) );
  OAI21X1 U50 ( .A(n91), .B(n113), .C(n117), .Y(n320) );
  NAND2X1 U51 ( .A(double_clock_fifo[56]), .B(n113), .Y(n117) );
  OAI21X1 U52 ( .A(n93), .B(n113), .C(n118), .Y(n321) );
  NAND2X1 U53 ( .A(double_clock_fifo[57]), .B(n113), .Y(n118) );
  OAI21X1 U54 ( .A(n95), .B(n113), .C(n119), .Y(n322) );
  NAND2X1 U55 ( .A(double_clock_fifo[59]), .B(n113), .Y(n119) );
  OAI21X1 U56 ( .A(n97), .B(n113), .C(n120), .Y(n323) );
  NAND2X1 U57 ( .A(double_clock_fifo[61]), .B(n113), .Y(n120) );
  OAI21X1 U58 ( .A(n99), .B(n113), .C(n121), .Y(n324) );
  NAND2X1 U59 ( .A(double_clock_fifo[63]), .B(n113), .Y(n121) );
  NAND3X1 U60 ( .A(wr_ptr[0]), .B(n111), .C(wr_ptr[1]), .Y(n113) );
  OAI21X1 U61 ( .A(n122), .B(n123), .C(n124), .Y(n325) );
  OAI21X1 U63 ( .A(n122), .B(n125), .C(n126), .Y(n326) );
  OAI21X1 U64 ( .A(n127), .B(n128), .C(n126), .Y(n327) );
  OAI21X1 U66 ( .A(n436), .B(n127), .C(n130), .Y(n328) );
  OAI21X1 U67 ( .A(n131), .B(n127), .C(n124), .Y(n329) );
  OAI21X1 U68 ( .A(n428), .B(n127), .C(n132), .Y(n330) );
  NAND2X1 U69 ( .A(n133), .B(n134), .Y(n331) );
  OAI22X1 U71 ( .A(n136), .B(n28), .C(n137), .D(n412), .Y(n135) );
  AOI22X1 U72 ( .A(n138), .B(n139), .C(reset), .D(rd_ptr_gray[0]), .Y(n133) );
  XOR2X1 U73 ( .A(next_rd_ptr[1]), .B(next_rd_ptr[0]), .Y(n139) );
  NAND2X1 U74 ( .A(n140), .B(n141), .Y(n332) );
  OAI22X1 U76 ( .A(n143), .B(n30), .C(n144), .D(n145), .Y(n142) );
  XOR2X1 U77 ( .A(n146), .B(next_rd_ptr[2]), .Y(n145) );
  AOI22X1 U78 ( .A(n147), .B(n148), .C(rd_ptr_gray[2]), .D(reset), .Y(n140) );
  OAI21X1 U80 ( .A(n149), .B(n150), .C(n151), .Y(n333) );
  AOI21X1 U81 ( .A(next_rd_ptr[3]), .B(n138), .C(n147), .Y(n151) );
  NAND2X1 U83 ( .A(n153), .B(n154), .Y(n334) );
  OAI22X1 U85 ( .A(n137), .B(n29), .C(n143), .D(n28), .Y(n155) );
  AOI22X1 U86 ( .A(n138), .B(n156), .C(rd_ptr_gray[1]), .D(reset), .Y(n153) );
  XOR2X1 U87 ( .A(next_rd_ptr[2]), .B(next_rd_ptr[1]), .Y(n156) );
  AOI22X1 U90 ( .A(n20), .B(n411), .C(data_out[6]), .D(n354), .Y(n157) );
  AOI22X1 U92 ( .A(n22), .B(n411), .C(data_out[4]), .D(n354), .Y(n160) );
  AOI22X1 U94 ( .A(n24), .B(n411), .C(data_out[2]), .D(n354), .Y(n161) );
  AOI22X1 U96 ( .A(n26), .B(n411), .C(data_out[0]), .D(n354), .Y(n162) );
  OAI21X1 U97 ( .A(n411), .B(n171), .C(n143), .Y(n339) );
  OAI21X1 U99 ( .A(n411), .B(n172), .C(n136), .Y(n340) );
  OAI21X1 U101 ( .A(n411), .B(n173), .C(n137), .Y(n341) );
  OAI21X1 U103 ( .A(n411), .B(n146), .C(n152), .Y(n342) );
  AOI22X1 U106 ( .A(n25), .B(n411), .C(data_out[1]), .D(n354), .Y(n174) );
  AOI22X1 U108 ( .A(n23), .B(n411), .C(data_out[3]), .D(n354), .Y(n175) );
  AOI22X1 U110 ( .A(n21), .B(n411), .C(data_out[5]), .D(n354), .Y(n176) );
  AOI22X1 U112 ( .A(n19), .B(n411), .C(data_out[7]), .D(n354), .Y(n177) );
  OAI21X1 U114 ( .A(n144), .B(n178), .C(n152), .Y(n347) );
  NAND2X1 U115 ( .A(n30), .B(n411), .Y(n152) );
  OAI21X1 U117 ( .A(n144), .B(n425), .C(n143), .Y(n348) );
  NAND2X1 U118 ( .A(n29), .B(n411), .Y(n143) );
  OAI21X1 U120 ( .A(n144), .B(n414), .C(n137), .Y(n349) );
  NAND2X1 U121 ( .A(n28), .B(n411), .Y(n137) );
  OAI21X1 U123 ( .A(n144), .B(n412), .C(n136), .Y(n350) );
  NAND2X1 U124 ( .A(n412), .B(n411), .Y(n136) );
  NAND2X1 U127 ( .A(n182), .B(n149), .Y(n144) );
  NAND2X1 U128 ( .A(get), .B(n183), .Y(n182) );
  NAND2X1 U129 ( .A(n184), .B(n185), .Y(n351) );
  OAI22X1 U131 ( .A(n132), .B(n80), .C(n124), .D(n428), .Y(n186) );
  AOI22X1 U132 ( .A(n187), .B(n188), .C(wr_ptr_gray[0]), .D(reset), .Y(n184)
         );
  XOR2X1 U133 ( .A(next_wr_ptr[1]), .B(next_wr_ptr[0]), .Y(n188) );
  NAND2X1 U134 ( .A(n189), .B(n190), .Y(n256) );
  OAI22X1 U136 ( .A(n130), .B(n82), .C(n127), .D(n192), .Y(n191) );
  XOR2X1 U137 ( .A(n125), .B(next_wr_ptr[2]), .Y(n192) );
  AOI22X1 U139 ( .A(n193), .B(n194), .C(wr_ptr_gray[2]), .D(reset), .Y(n189)
         );
  OAI21X1 U141 ( .A(n149), .B(n195), .C(n196), .Y(n257) );
  AOI21X1 U142 ( .A(n187), .B(next_wr_ptr[3]), .C(n193), .Y(n196) );
  NAND2X1 U144 ( .A(n82), .B(n122), .Y(n126) );
  NAND2X1 U145 ( .A(n197), .B(n198), .Y(n258) );
  OAI22X1 U147 ( .A(n124), .B(n81), .C(n130), .D(n80), .Y(n199) );
  NAND2X1 U148 ( .A(n80), .B(n122), .Y(n124) );
  AOI22X1 U149 ( .A(n187), .B(n200), .C(wr_ptr_gray[1]), .D(reset), .Y(n197)
         );
  XOR2X1 U150 ( .A(next_wr_ptr[2]), .B(next_wr_ptr[1]), .Y(n200) );
  NAND2X1 U152 ( .A(n201), .B(n149), .Y(n127) );
  OAI21X1 U153 ( .A(n122), .B(n202), .C(n130), .Y(n259) );
  NAND2X1 U154 ( .A(n81), .B(n122), .Y(n130) );
  OAI21X1 U156 ( .A(n122), .B(n203), .C(n132), .Y(n260) );
  NAND2X1 U157 ( .A(n428), .B(n122), .Y(n132) );
  OAI21X1 U159 ( .A(n102), .B(n204), .C(n205), .Y(n261) );
  NAND2X1 U160 ( .A(double_clock_fifo[6]), .B(n204), .Y(n205) );
  OAI21X1 U161 ( .A(n87), .B(n204), .C(n206), .Y(n262) );
  NAND2X1 U162 ( .A(double_clock_fifo[4]), .B(n204), .Y(n206) );
  OAI21X1 U163 ( .A(n89), .B(n204), .C(n207), .Y(n263) );
  NAND2X1 U164 ( .A(double_clock_fifo[2]), .B(n204), .Y(n207) );
  OAI21X1 U165 ( .A(n91), .B(n204), .C(n208), .Y(n264) );
  NAND2X1 U166 ( .A(double_clock_fifo[0]), .B(n204), .Y(n208) );
  OAI21X1 U167 ( .A(n93), .B(n204), .C(n209), .Y(n265) );
  NAND2X1 U168 ( .A(double_clock_fifo[1]), .B(n204), .Y(n209) );
  OAI21X1 U169 ( .A(n95), .B(n204), .C(n210), .Y(n266) );
  NAND2X1 U170 ( .A(double_clock_fifo[3]), .B(n204), .Y(n210) );
  OAI21X1 U171 ( .A(n97), .B(n204), .C(n211), .Y(n267) );
  NAND2X1 U172 ( .A(double_clock_fifo[5]), .B(n204), .Y(n211) );
  OAI21X1 U173 ( .A(n99), .B(n204), .C(n212), .Y(n268) );
  NAND2X1 U174 ( .A(double_clock_fifo[7]), .B(n204), .Y(n212) );
  NAND3X1 U175 ( .A(n428), .B(n131), .C(n213), .Y(n204) );
  OAI21X1 U176 ( .A(n102), .B(n214), .C(n215), .Y(n269) );
  NAND2X1 U177 ( .A(double_clock_fifo[14]), .B(n214), .Y(n215) );
  OAI21X1 U178 ( .A(n87), .B(n214), .C(n216), .Y(n270) );
  NAND2X1 U179 ( .A(double_clock_fifo[12]), .B(n214), .Y(n216) );
  OAI21X1 U180 ( .A(n89), .B(n214), .C(n217), .Y(n271) );
  NAND2X1 U181 ( .A(double_clock_fifo[10]), .B(n214), .Y(n217) );
  OAI21X1 U182 ( .A(n91), .B(n214), .C(n218), .Y(n272) );
  NAND2X1 U183 ( .A(double_clock_fifo[8]), .B(n214), .Y(n218) );
  OAI21X1 U184 ( .A(n93), .B(n214), .C(n219), .Y(n273) );
  NAND2X1 U185 ( .A(double_clock_fifo[9]), .B(n214), .Y(n219) );
  OAI21X1 U186 ( .A(n95), .B(n214), .C(n220), .Y(n274) );
  NAND2X1 U187 ( .A(double_clock_fifo[11]), .B(n214), .Y(n220) );
  OAI21X1 U188 ( .A(n97), .B(n214), .C(n221), .Y(n275) );
  NAND2X1 U189 ( .A(double_clock_fifo[13]), .B(n214), .Y(n221) );
  OAI21X1 U190 ( .A(n99), .B(n214), .C(n222), .Y(n276) );
  NAND2X1 U191 ( .A(double_clock_fifo[15]), .B(n214), .Y(n222) );
  NAND3X1 U192 ( .A(wr_ptr[0]), .B(n131), .C(n213), .Y(n214) );
  OAI21X1 U193 ( .A(n102), .B(n223), .C(n224), .Y(n277) );
  NAND2X1 U194 ( .A(double_clock_fifo[22]), .B(n223), .Y(n224) );
  OAI21X1 U195 ( .A(n87), .B(n223), .C(n225), .Y(n278) );
  NAND2X1 U196 ( .A(double_clock_fifo[20]), .B(n223), .Y(n225) );
  OAI21X1 U197 ( .A(n89), .B(n223), .C(n226), .Y(n279) );
  NAND2X1 U198 ( .A(double_clock_fifo[18]), .B(n223), .Y(n226) );
  OAI21X1 U199 ( .A(n91), .B(n223), .C(n227), .Y(n280) );
  NAND2X1 U200 ( .A(double_clock_fifo[16]), .B(n223), .Y(n227) );
  OAI21X1 U201 ( .A(n93), .B(n223), .C(n228), .Y(n281) );
  NAND2X1 U202 ( .A(double_clock_fifo[17]), .B(n223), .Y(n228) );
  OAI21X1 U203 ( .A(n95), .B(n223), .C(n229), .Y(n282) );
  NAND2X1 U204 ( .A(double_clock_fifo[19]), .B(n223), .Y(n229) );
  OAI21X1 U205 ( .A(n97), .B(n223), .C(n230), .Y(n283) );
  NAND2X1 U206 ( .A(double_clock_fifo[21]), .B(n223), .Y(n230) );
  OAI21X1 U207 ( .A(n99), .B(n223), .C(n231), .Y(n284) );
  NAND2X1 U208 ( .A(double_clock_fifo[23]), .B(n223), .Y(n231) );
  NAND3X1 U209 ( .A(wr_ptr[1]), .B(n428), .C(n213), .Y(n223) );
  OAI21X1 U210 ( .A(n102), .B(n232), .C(n233), .Y(n285) );
  NAND2X1 U211 ( .A(double_clock_fifo[30]), .B(n232), .Y(n233) );
  OAI21X1 U212 ( .A(n87), .B(n232), .C(n234), .Y(n286) );
  NAND2X1 U213 ( .A(double_clock_fifo[28]), .B(n232), .Y(n234) );
  OAI21X1 U214 ( .A(n89), .B(n232), .C(n235), .Y(n287) );
  NAND2X1 U215 ( .A(double_clock_fifo[26]), .B(n232), .Y(n235) );
  OAI21X1 U216 ( .A(n91), .B(n232), .C(n236), .Y(n288) );
  NAND2X1 U217 ( .A(double_clock_fifo[24]), .B(n232), .Y(n236) );
  OAI21X1 U218 ( .A(n93), .B(n232), .C(n237), .Y(n289) );
  NAND2X1 U219 ( .A(double_clock_fifo[25]), .B(n232), .Y(n237) );
  OAI21X1 U220 ( .A(n95), .B(n232), .C(n238), .Y(n290) );
  NAND2X1 U221 ( .A(double_clock_fifo[27]), .B(n232), .Y(n238) );
  OAI21X1 U222 ( .A(n97), .B(n232), .C(n239), .Y(n291) );
  NAND2X1 U223 ( .A(double_clock_fifo[29]), .B(n232), .Y(n239) );
  OAI21X1 U224 ( .A(n99), .B(n232), .C(n240), .Y(n292) );
  NAND2X1 U225 ( .A(double_clock_fifo[31]), .B(n232), .Y(n240) );
  NAND3X1 U226 ( .A(wr_ptr[1]), .B(wr_ptr[0]), .C(n213), .Y(n232) );
  AND2X1 U227 ( .A(n122), .B(n436), .Y(n213) );
  OAI21X1 U229 ( .A(n102), .B(n241), .C(n242), .Y(n293) );
  NAND2X1 U230 ( .A(double_clock_fifo[38]), .B(n241), .Y(n242) );
  OAI21X1 U231 ( .A(n87), .B(n241), .C(n243), .Y(n294) );
  NAND2X1 U232 ( .A(double_clock_fifo[36]), .B(n241), .Y(n243) );
  OAI21X1 U234 ( .A(n89), .B(n241), .C(n244), .Y(n295) );
  NAND2X1 U235 ( .A(double_clock_fifo[34]), .B(n241), .Y(n244) );
  OAI21X1 U237 ( .A(n91), .B(n241), .C(n245), .Y(n296) );
  NAND2X1 U238 ( .A(double_clock_fifo[32]), .B(n241), .Y(n245) );
  OAI21X1 U240 ( .A(n93), .B(n241), .C(n246), .Y(n297) );
  NAND2X1 U241 ( .A(double_clock_fifo[33]), .B(n241), .Y(n246) );
  OAI21X1 U243 ( .A(n95), .B(n241), .C(n247), .Y(n298) );
  NAND2X1 U244 ( .A(double_clock_fifo[35]), .B(n241), .Y(n247) );
  OAI21X1 U246 ( .A(n97), .B(n241), .C(n248), .Y(n299) );
  NAND2X1 U247 ( .A(double_clock_fifo[37]), .B(n241), .Y(n248) );
  OAI21X1 U249 ( .A(n99), .B(n241), .C(n249), .Y(n300) );
  NAND2X1 U250 ( .A(double_clock_fifo[39]), .B(n241), .Y(n249) );
  NAND3X1 U251 ( .A(n428), .B(n131), .C(n111), .Y(n241) );
  OAI21X1 U254 ( .A(n86), .B(n102), .C(n250), .Y(n301) );
  NAND2X1 U255 ( .A(double_clock_fifo[46]), .B(n86), .Y(n250) );
  NAND3X1 U257 ( .A(n111), .B(n131), .C(wr_ptr[0]), .Y(n86) );
  AND2X1 U259 ( .A(wr_ptr[2]), .B(n122), .Y(n111) );
  NOR2X1 U260 ( .A(n201), .B(reset), .Y(n122) );
  NAND2X1 U261 ( .A(put), .B(n251), .Y(n201) );
  AND2X1 U262 ( .A(wr_ptr_gray_s[3]), .B(n149), .Y(n54) );
  AND2X1 U263 ( .A(wr_ptr_gray_s[2]), .B(n149), .Y(n53) );
  AND2X1 U264 ( .A(wr_ptr_gray_s[1]), .B(n149), .Y(n52) );
  AND2X1 U265 ( .A(wr_ptr_gray_s[0]), .B(n149), .Y(n51) );
  NOR2X1 U266 ( .A(reset), .B(n195), .Y(n50) );
  AND2X1 U268 ( .A(n149), .B(wr_ptr_gray[2]), .Y(n49) );
  AND2X1 U269 ( .A(n149), .B(wr_ptr_gray[1]), .Y(n48) );
  AND2X1 U270 ( .A(n149), .B(wr_ptr_gray[0]), .Y(n47) );
  AND2X1 U271 ( .A(rd_ptr_gray_s[3]), .B(n149), .Y(n170) );
  AND2X1 U272 ( .A(rd_ptr_gray_s[2]), .B(n149), .Y(n169) );
  AND2X1 U273 ( .A(rd_ptr_gray_s[1]), .B(n149), .Y(n168) );
  AND2X1 U274 ( .A(rd_ptr_gray_s[0]), .B(n149), .Y(n167) );
  NOR2X1 U275 ( .A(reset), .B(n150), .Y(n166) );
  AND2X1 U277 ( .A(n149), .B(rd_ptr_gray[2]), .Y(n165) );
  AND2X1 U278 ( .A(n149), .B(rd_ptr_gray[1]), .Y(n164) );
  AND2X1 U279 ( .A(n149), .B(rd_ptr_gray[0]), .Y(n163) );
  NAND3X1 U282 ( .A(depth_wr[3]), .B(n252), .C(n253), .Y(n251) );
  NOR2X1 U283 ( .A(depth_wr[2]), .B(depth_wr[1]), .Y(n253) );
  NAND2X1 U286 ( .A(n254), .B(n255), .Y(n183) );
  NOR2X1 U287 ( .A(depth_rd[3]), .B(depth_rd[2]), .Y(n255) );
  NOR2X1 U288 ( .A(depth_rd[1]), .B(depth_rd[0]), .Y(n254) );
  INVX2 U62 ( .A(next_wr_ptr[1]), .Y(n123) );
  INVX2 U65 ( .A(wr_ptr[3]), .Y(n128) );
  INVX2 U70 ( .A(n135), .Y(n134) );
  INVX2 U75 ( .A(n142), .Y(n141) );
  INVX2 U79 ( .A(n29), .Y(n148) );
  INVX2 U82 ( .A(n152), .Y(n147) );
  INVX2 U84 ( .A(n155), .Y(n154) );
  INVX2 U88 ( .A(n144), .Y(n138) );
  INVX2 U89 ( .A(n157), .Y(n335) );
  INVX2 U91 ( .A(n160), .Y(n336) );
  INVX2 U93 ( .A(n161), .Y(n337) );
  INVX2 U95 ( .A(n162), .Y(n338) );
  INVX2 U98 ( .A(next_rd_ptr[2]), .Y(n171) );
  INVX2 U100 ( .A(next_rd_ptr[0]), .Y(n172) );
  INVX2 U102 ( .A(next_rd_ptr[1]), .Y(n173) );
  INVX2 U104 ( .A(next_rd_ptr[3]), .Y(n146) );
  INVX2 U105 ( .A(n174), .Y(n343) );
  INVX2 U107 ( .A(n175), .Y(n344) );
  INVX2 U109 ( .A(n176), .Y(n345) );
  INVX2 U111 ( .A(n177), .Y(n346) );
  INVX2 U116 ( .A(rd_ptr_3_), .Y(n178) );
  INVX2 U130 ( .A(n186), .Y(n185) );
  INVX2 U135 ( .A(n191), .Y(n190) );
  INVX2 U138 ( .A(next_wr_ptr[3]), .Y(n125) );
  INVX2 U140 ( .A(n81), .Y(n194) );
  INVX2 U143 ( .A(n126), .Y(n193) );
  INVX2 U146 ( .A(n199), .Y(n198) );
  INVX2 U151 ( .A(n127), .Y(n187) );
  INVX2 U155 ( .A(next_wr_ptr[2]), .Y(n202) );
  INVX2 U158 ( .A(next_wr_ptr[0]), .Y(n203) );
  INVX2 U233 ( .A(data_in[4]), .Y(n87) );
  INVX2 U236 ( .A(data_in[2]), .Y(n89) );
  INVX2 U239 ( .A(data_in[0]), .Y(n91) );
  INVX2 U242 ( .A(data_in[1]), .Y(n93) );
  INVX2 U245 ( .A(data_in[3]), .Y(n95) );
  INVX2 U248 ( .A(data_in[5]), .Y(n97) );
  INVX2 U253 ( .A(data_in[7]), .Y(n99) );
  INVX2 U256 ( .A(data_in[6]), .Y(n102) );
  INVX2 U258 ( .A(wr_ptr[1]), .Y(n131) );
  INVX2 U267 ( .A(wr_ptr_gray[3]), .Y(n195) );
  INVX2 U276 ( .A(rd_ptr_gray[3]), .Y(n150) );
  INVX2 U281 ( .A(n251), .Y(full_int) );
  INVX2 U284 ( .A(depth_wr[0]), .Y(n252) );
  INVX2 U285 ( .A(n183), .Y(empty_int) );
  XNOR2X1 U289 ( .A(rd_ptr_gray_ss[1]), .B(rd_ptr_ss[2]), .Y(n352) );
  XNOR2X1 U290 ( .A(wr_ptr_ss[2]), .B(n84), .Y(n353) );
  INVX2 U291 ( .A(n354), .Y(n411) );
  INVX2 U292 ( .A(reset), .Y(n149) );
  OR2X2 U293 ( .A(n182), .B(reset), .Y(n354) );
  INVX2 U294 ( .A(n15), .Y(n412) );
  MUX2X1 U295 ( .B(n356), .A(n357), .S(n16), .Y(n355) );
  MUX2X1 U296 ( .B(n359), .A(n360), .S(n16), .Y(n358) );
  MUX2X1 U297 ( .B(n362), .A(n363), .S(n16), .Y(n361) );
  MUX2X1 U298 ( .B(n365), .A(n366), .S(n16), .Y(n364) );
  MUX2X1 U299 ( .B(n368), .A(n369), .S(n16), .Y(n367) );
  MUX2X1 U300 ( .B(n371), .A(n372), .S(n16), .Y(n370) );
  MUX2X1 U301 ( .B(n374), .A(n375), .S(n16), .Y(n373) );
  MUX2X1 U302 ( .B(n377), .A(n378), .S(n16), .Y(n376) );
  MUX2X1 U303 ( .B(n380), .A(n381), .S(n16), .Y(n379) );
  MUX2X1 U304 ( .B(n383), .A(n384), .S(n16), .Y(n382) );
  MUX2X1 U305 ( .B(n386), .A(n387), .S(n16), .Y(n385) );
  MUX2X1 U306 ( .B(n389), .A(n390), .S(n16), .Y(n388) );
  MUX2X1 U307 ( .B(n392), .A(n393), .S(n16), .Y(n391) );
  MUX2X1 U308 ( .B(n395), .A(n396), .S(n16), .Y(n394) );
  MUX2X1 U309 ( .B(n398), .A(n399), .S(n16), .Y(n397) );
  MUX2X1 U310 ( .B(n401), .A(n402), .S(n16), .Y(n400) );
  MUX2X1 U311 ( .B(double_clock_fifo[48]), .A(double_clock_fifo[56]), .S(n15), 
        .Y(n357) );
  MUX2X1 U312 ( .B(double_clock_fifo[32]), .A(double_clock_fifo[40]), .S(n15), 
        .Y(n356) );
  MUX2X1 U313 ( .B(double_clock_fifo[16]), .A(double_clock_fifo[24]), .S(n15), 
        .Y(n360) );
  MUX2X1 U314 ( .B(double_clock_fifo[0]), .A(double_clock_fifo[8]), .S(n15), 
        .Y(n359) );
  MUX2X1 U315 ( .B(n358), .A(n355), .S(n17), .Y(n403) );
  INVX2 U316 ( .A(n403), .Y(n26) );
  MUX2X1 U317 ( .B(double_clock_fifo[49]), .A(double_clock_fifo[57]), .S(n15), 
        .Y(n363) );
  MUX2X1 U318 ( .B(double_clock_fifo[33]), .A(double_clock_fifo[41]), .S(n15), 
        .Y(n362) );
  MUX2X1 U319 ( .B(double_clock_fifo[17]), .A(double_clock_fifo[25]), .S(n15), 
        .Y(n366) );
  MUX2X1 U320 ( .B(double_clock_fifo[1]), .A(double_clock_fifo[9]), .S(n15), 
        .Y(n365) );
  MUX2X1 U321 ( .B(n364), .A(n361), .S(n17), .Y(n404) );
  INVX2 U322 ( .A(n404), .Y(n25) );
  MUX2X1 U323 ( .B(double_clock_fifo[50]), .A(double_clock_fifo[58]), .S(n15), 
        .Y(n369) );
  MUX2X1 U324 ( .B(double_clock_fifo[34]), .A(double_clock_fifo[42]), .S(n15), 
        .Y(n368) );
  MUX2X1 U325 ( .B(double_clock_fifo[18]), .A(double_clock_fifo[26]), .S(n15), 
        .Y(n372) );
  MUX2X1 U326 ( .B(double_clock_fifo[2]), .A(double_clock_fifo[10]), .S(n15), 
        .Y(n371) );
  MUX2X1 U327 ( .B(n370), .A(n367), .S(n17), .Y(n405) );
  INVX2 U328 ( .A(n405), .Y(n24) );
  MUX2X1 U329 ( .B(double_clock_fifo[51]), .A(double_clock_fifo[59]), .S(n15), 
        .Y(n375) );
  MUX2X1 U330 ( .B(double_clock_fifo[35]), .A(double_clock_fifo[43]), .S(n15), 
        .Y(n374) );
  MUX2X1 U331 ( .B(double_clock_fifo[19]), .A(double_clock_fifo[27]), .S(n15), 
        .Y(n378) );
  MUX2X1 U332 ( .B(double_clock_fifo[3]), .A(double_clock_fifo[11]), .S(n15), 
        .Y(n377) );
  MUX2X1 U333 ( .B(n376), .A(n373), .S(n17), .Y(n406) );
  INVX2 U334 ( .A(n406), .Y(n23) );
  MUX2X1 U335 ( .B(double_clock_fifo[52]), .A(double_clock_fifo[60]), .S(n15), 
        .Y(n381) );
  MUX2X1 U336 ( .B(double_clock_fifo[36]), .A(double_clock_fifo[44]), .S(n15), 
        .Y(n380) );
  MUX2X1 U337 ( .B(double_clock_fifo[20]), .A(double_clock_fifo[28]), .S(n15), 
        .Y(n384) );
  MUX2X1 U338 ( .B(double_clock_fifo[4]), .A(double_clock_fifo[12]), .S(n15), 
        .Y(n383) );
  MUX2X1 U339 ( .B(n382), .A(n379), .S(n17), .Y(n407) );
  INVX2 U340 ( .A(n407), .Y(n22) );
  MUX2X1 U341 ( .B(double_clock_fifo[53]), .A(double_clock_fifo[61]), .S(n15), 
        .Y(n387) );
  MUX2X1 U342 ( .B(double_clock_fifo[37]), .A(double_clock_fifo[45]), .S(n15), 
        .Y(n386) );
  MUX2X1 U343 ( .B(double_clock_fifo[21]), .A(double_clock_fifo[29]), .S(n15), 
        .Y(n390) );
  MUX2X1 U344 ( .B(double_clock_fifo[5]), .A(double_clock_fifo[13]), .S(n15), 
        .Y(n389) );
  MUX2X1 U345 ( .B(n388), .A(n385), .S(n17), .Y(n408) );
  INVX2 U346 ( .A(n408), .Y(n21) );
  MUX2X1 U347 ( .B(double_clock_fifo[54]), .A(double_clock_fifo[62]), .S(n15), 
        .Y(n393) );
  MUX2X1 U348 ( .B(double_clock_fifo[38]), .A(double_clock_fifo[46]), .S(n15), 
        .Y(n392) );
  MUX2X1 U349 ( .B(double_clock_fifo[22]), .A(double_clock_fifo[30]), .S(n15), 
        .Y(n396) );
  MUX2X1 U350 ( .B(double_clock_fifo[6]), .A(double_clock_fifo[14]), .S(n15), 
        .Y(n395) );
  MUX2X1 U351 ( .B(n394), .A(n391), .S(n17), .Y(n409) );
  INVX2 U352 ( .A(n409), .Y(n20) );
  MUX2X1 U353 ( .B(double_clock_fifo[55]), .A(double_clock_fifo[63]), .S(n15), 
        .Y(n399) );
  MUX2X1 U354 ( .B(double_clock_fifo[39]), .A(double_clock_fifo[47]), .S(n15), 
        .Y(n398) );
  MUX2X1 U355 ( .B(double_clock_fifo[23]), .A(double_clock_fifo[31]), .S(n15), 
        .Y(n402) );
  MUX2X1 U356 ( .B(double_clock_fifo[7]), .A(double_clock_fifo[15]), .S(n15), 
        .Y(n401) );
  MUX2X1 U357 ( .B(n400), .A(n397), .S(n17), .Y(n410) );
  INVX2 U358 ( .A(n410), .Y(n19) );
  INVX2 U359 ( .A(n16), .Y(n414) );
  INVX2 U360 ( .A(n415), .Y(n416) );
  INVX2 U361 ( .A(wr_ptr_ss[2]), .Y(n421) );
  INVX2 U362 ( .A(n419), .Y(n420) );
  INVX2 U363 ( .A(n17), .Y(n425) );
  INVX2 U364 ( .A(wr_ptr[0]), .Y(n428) );
  INVX2 U365 ( .A(n430), .Y(n431) );
  INVX2 U366 ( .A(wr_ptr[2]), .Y(n436) );
  INVX2 U367 ( .A(n434), .Y(n435) );
  NAND2X1 U368 ( .A(n15), .B(n353), .Y(n417) );
  OAI21X1 U369 ( .A(n15), .B(n353), .C(n417), .Y(depth_rd[0]) );
  XNOR2X1 U370 ( .A(n414), .B(wr_ptr_ss[1]), .Y(n413) );
  XNOR2X1 U371 ( .A(n417), .B(n413), .Y(depth_rd[1]) );
  OAI21X1 U372 ( .A(wr_ptr_ss[1]), .B(n417), .C(n414), .Y(n415) );
  AOI21X1 U373 ( .A(n417), .B(wr_ptr_ss[1]), .C(n416), .Y(n422) );
  XNOR2X1 U374 ( .A(wr_ptr_ss[2]), .B(n17), .Y(n418) );
  XNOR2X1 U375 ( .A(n422), .B(n418), .Y(depth_rd[2]) );
  AOI21X1 U376 ( .A(n421), .B(n422), .C(n17), .Y(n419) );
  OAI21X1 U377 ( .A(n422), .B(n421), .C(n420), .Y(n424) );
  XNOR2X1 U378 ( .A(rd_ptr_3_), .B(wr_ptr_ss[3]), .Y(n423) );
  XOR2X1 U379 ( .A(n424), .B(n423), .Y(depth_rd[3]) );
  XOR2X1 U380 ( .A(n16), .B(n15), .Y(n28) );
  NAND2X1 U381 ( .A(n16), .B(n15), .Y(n426) );
  XOR2X1 U382 ( .A(n425), .B(n426), .Y(n29) );
  NOR2X1 U383 ( .A(n426), .B(n425), .Y(n427) );
  XOR2X1 U384 ( .A(rd_ptr_3_), .B(n427), .Y(n30) );
  NAND2X1 U385 ( .A(rd_ptr_ss[0]), .B(n428), .Y(n432) );
  OAI21X1 U386 ( .A(rd_ptr_ss[0]), .B(n428), .C(n432), .Y(depth_wr[0]) );
  XNOR2X1 U387 ( .A(n352), .B(wr_ptr[1]), .Y(n429) );
  XNOR2X1 U388 ( .A(n432), .B(n429), .Y(depth_wr[1]) );
  OAI21X1 U389 ( .A(wr_ptr[1]), .B(n432), .C(n352), .Y(n430) );
  AOI21X1 U390 ( .A(n432), .B(wr_ptr[1]), .C(n431), .Y(n437) );
  XNOR2X1 U391 ( .A(wr_ptr[2]), .B(rd_ptr_ss[2]), .Y(n433) );
  XNOR2X1 U392 ( .A(n437), .B(n433), .Y(depth_wr[2]) );
  AOI21X1 U393 ( .A(n436), .B(n437), .C(rd_ptr_ss[2]), .Y(n434) );
  OAI21X1 U394 ( .A(n437), .B(n436), .C(n435), .Y(n439) );
  XNOR2X1 U395 ( .A(rd_ptr_ss[3]), .B(wr_ptr[3]), .Y(n438) );
  XOR2X1 U396 ( .A(n439), .B(n438), .Y(depth_wr[3]) );
  XOR2X1 U397 ( .A(wr_ptr[1]), .B(wr_ptr[0]), .Y(n80) );
  NAND2X1 U398 ( .A(wr_ptr[1]), .B(wr_ptr[0]), .Y(n440) );
  XOR2X1 U399 ( .A(n436), .B(n440), .Y(n81) );
  NOR2X1 U400 ( .A(n440), .B(n436), .Y(n441) );
  XOR2X1 U401 ( .A(wr_ptr[3]), .B(n441), .Y(n82) );
endmodule

