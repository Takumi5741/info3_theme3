`timescale 1ps/1ps

`include "cpu_iverilog.v"
`include "displayik_7seg_8.v"
`include "ctrg_rmv.v"

module cpu_board (rst,clk,CLK,
		  SEG_A,SEG_B,SEG_C,SEG_D,SEG_E,SEG_F,SEG_G,SEG_H,
		  SEG_SEL_IK);

    input         rst,clk,CLK;
    output [7:0]  SEG_A,SEG_B,SEG_C,SEG_D,SEG_E,SEG_F,SEG_G,SEG_H;
    output [8:0]  SEG_SEL_IK;

    wire [15:0] data0,data1;
    wire c_clk;
    wire [3:0] PSWO;


	ctrg_rmv i0 (.RSTN(rst),.CLK(CLK), .PSW({clk,3'b000}), .PSW_SIG(PSWO));
	assign c_clk = PSWO[3];

    cpu_iverilog i1 (.rst(rst),.clk(c_clk),.inst(data0),.s2(data1));

    displayIK_7seg_8 i2 (.RSTN(rst),.CLK(CLK),
			 .SEG_SEL(SEG_SEL_IK),
		     .SEG_A(SEG_A),.SEG_B(SEG_B),.SEG_C(SEG_C),.SEG_D(SEG_D),
		     .SEG_E(SEG_E),.SEG_F(SEG_F),.SEG_G(SEG_G),.SEG_H(SEG_H),
		     .data0(data0),.data1(data1));

endmodule
