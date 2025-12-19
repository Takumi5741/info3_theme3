`timescale 1ps/1ps
`include "fetch2.v"
`include "decode2.v"
`include "execution2.v"
`include "adder8.v"
`include "ALU.v"
`include "control.v"
`include "extend_8_16.v"
`include "i_rom.v"
`include "regfile.v"
`include "register_16.v"
`include "register_4.v"
`include "register_1.v"
`include "selector_16.v"

module cpu_iverilog(rst,clk, inst,s2);
    input rst,clk;

    output [15:0] inst, s2;
    
     wire s2ctr,we,we_r;
     wire [1:0] aluctr;
     wire [3:0] rdest_r,rdest_rr;
     wire [15:0] rd_data,s0,im16;

    fetch i0 ( .rst(rst), .clk(clk), .inst(inst) );

    decode i1 ( .rst(rst), .clk(clk), .inst(inst), .s2(s2), .we_r(we_r), .rdest_rr(rdest_rr),
                      .rd_data(rd_data), .s0(s0), .im16(im16), .aluctr(aluctr), .s2ctr(s2ctr), .we(we), .rdest_r(rdest_r)   );

    execution i2 ( .rst(rst), .clk(clk), .rd_data(rd_data), .s0(s0), .aluctr(aluctr), .im16(im16), .s2ctr(s2ctr), .we(we), .rdest_r(rdest_r),
                   .s2(s2), .we_r(we_r), .rdest_rr(rdest_rr) );

endmodule
