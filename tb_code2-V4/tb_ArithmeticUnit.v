`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/21 14:00:23
// Design Name: 
// Module Name: tb_ArithmeticUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define B15to0H 10'b1000000000
`define AandBH  10'b0100000000
`define AorBH   10'b0010000000
`define notBH   10'b0001000000
`define shlBH   10'b0000100000
`define shrBH   10'b0000010000
`define AaddBH  10'b0000001000
`define AsubBH  10'b0000000100
`define AmulBH  10'b0000000010
`define AcmpBH  10'b0000000001


module tb_ArithmeticUnit();
  reg [15:0] A, B;
  reg  B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB;
  reg  cin=0;
  wire [15:0] aluout;
  wire zout, cout;
  
  ArithmeticUnit test_ArithmeticUnit(A, B, B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB, 
     aluout, cin, cout, zout);
  
  initial begin
          #10 A=4'b1101;
          #10 B=4'b1101;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`B15to0H;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AandBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AorBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`notBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`shlBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`shrBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AaddBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AsubBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AmulBH;
          #10 {B15to0, AandB, AorB, notB, shlB, shrB, AaddB, AsubB, AmulB, AcmpB}=`AcmpBH;
          #50 $stop;
        end
 

endmodule
