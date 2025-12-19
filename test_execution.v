`timescale 1ps/1ps
`include "execution.v"

module test_execution; 
  //�K�؂ɐ錾����ǉ����Ȃ���
  reg          rst, clk;
  reg  [15:0]  rd_data, s0, im16;
  reg  [1:0]   aluctr;
  reg          s2ctr, we;
  reg  [3:0]   rdest_r;
  wire [15:0]  s2;
  wire         we_r;
  wire [3:0]   rdest_rr;




  execution i0 (.rst(rst),.clk(clk),.rd_data(rd_data),.s0(s0),.aluctr(aluctr),.im16(im16), .s2ctr(s2ctr),.we(we),.rdest_r(rdest_r),
                  .s2(s2),.we_r(we_r),.rdest_rr(rdest_rr)); 

 initial begin
      clk=0; rst=0; 
 #10 rst=1; rd_data=16'h7777; s0=16'h5555; im16=16'h1111; aluctr=2'b00;
     s2ctr=0; we=1; rdest_r=4'b1010 ;
 #10 clk=1; 
 #10 clk=0; aluctr=2'b01; #10 clk=1; 
 #10 clk=0; aluctr=2'b10; #10 clk=1; 
 #10 clk=0; aluctr=2'b11; #10 clk=1;
 #10 clk=0; s2ctr=1;   #10 clk=1; 
 #10
 $finish(0); 

 end

 initial begin
   $monitor($time, ,"rst=%b clk=%b s2=%h rdest_rr=%b we_r=%b",rst,clk,s2,rdest_rr,we_r);
   $dumpfile("execution.vcd");
   $dumpvars(0,test_execution);
 end
endmodule
