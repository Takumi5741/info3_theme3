`timescale 1ps/1ps


module execution (rst, clk, rd_data, s0, aluctr, im16, s2ctr, we, rdest_r, s2, we_r, rdest_rr);

    input         rst, clk, s2ctr, we;
    input [1:0]   aluctr;
    input [3:0]   rdest_r;
    input [15:0]  rd_data, s0, im16;
    output        we_r;
    output [3:0]  rdest_rr;
    output [15:0] s2;
    wire   [15:0] alu_o, im16_r;
    wire          s2ctr_r, we_r;
    wire   [3:0]  rdest_rr;
    wire   [15:0] s2;

    ALU          i0     ( .ina(rd_data), .inb(s0), .ctr(aluctr), .rst(rst), .clk(clk), .out(alu_o) );
    register_1   i1    ( .rst(rst), .clk(clk), .in1(we), .out1(we_r) );
    register_1   i2    ( .rst(rst), .clk(clk), .in1(s2ctr), .out1(s2ctr_r) );
    register_4   i3    ( .rst(rst), .clk(clk), .in1(rdest_r), .out1(rdest_rr) );
    register_16  i4   ( .rst(rst), .clk(clk), .in1(im16), .out1(im16_r) );
    selector_16  i5  ( .ina(alu_o), .inb(im16_r), .sel(s2ctr_r), .out(s2) );

endmodule
