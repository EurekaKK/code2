`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 21:42:41
// Design Name: 
// Module Name: tb_cpu_top
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


module tb_cpu_top();
// test vector input registers
reg ExternalReset;
reg clk;
reg [7:0] in;
// wires                                               
wire [7:0] out;
// assign statements (if any)                          
cpu_top test_cpu_top (
// port map - connection between master ports and signals/registers   
	.in(in),
	.out(out),
	.ExternalReset(ExternalReset),
	.clk(clk)
);
initial                                                
begin                                                                    
	clk = 0;
	forever #50 clk = ~clk;                      
end

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
	ExternalReset =0;   
	#200
	in=0000_0000;
	ExternalReset = 1;


	#45000	$stop;
end                            
endmodule
