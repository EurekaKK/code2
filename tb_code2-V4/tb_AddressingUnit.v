`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/21 14:48:03
// Design Name: 
// Module Name: tb_AddressingUnit
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


module tb_AddressingUnit();
  reg [15:0] Rside;
  reg [7:0] Iside;
  reg ResetPC, PCplusI, PCplus1, Iplus0, Rplus0, PCenable;
  reg clk=0;
  wire [15:0] Address;
  
  AddressingUnit test_AddressingUnit(Rside, Iside, Address, clk, ResetPC, PCplusI, PCplus1, Iplus0, Rplus0, PCenable);
  
  always #1 clk=~clk;
  
  initial begin
    #10 Rside=4'b1110;
        Iside=4'b1101;
    #10 PCenable=1;
    #10 {ResetPC, PCplusI, PCplus1, Iplus0, Rplus0}=5'b00010;
    #10 $stop;
  end
endmodule
