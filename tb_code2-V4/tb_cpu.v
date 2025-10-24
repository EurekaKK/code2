`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/21 14:50:27
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu();
// test vector input registers
reg [15:0] Databus;
reg ExternalReset;
reg [15:0] IO_datain;
reg MemDataready;
reg clk;
// wires                                               
wire [15:0]  Addressbus;
wire ReadIO;
wire ReadMem;
wire WriteIO;
wire WriteMem;
wire [15:0]  aluout;

// assign statements (if any)                          
cpu test_cpu (
// port map - connection between master ports and signals/registers   
	.Addressbus(Addressbus),
	.Databus(Databus),
	.ExternalReset(ExternalReset),
	.IO_datain(IO_datain),
	.MemDataready(MemDataready),
	.ReadIO(ReadIO),
	.ReadMem(ReadMem),
	.WriteIO(WriteIO),
	.WriteMem(WriteMem),
	.aluout(aluout),
	.clk(clk)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
	clk = 0;
	forever #50 clk = ~clk;
// --> end                                             
$display("Running testbench");                       
end

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
	Databus = 16'b0000_0000_0000_0000;
	ExternalReset =0;
	IO_datain = 16'b0000_0000_0000_0000;
	MemDataready = 0;
	
	#200
	ExternalReset = 1;
    MemDataready = 1;
	
	#200
	Databus = 16'b1111000010101111;
     
   	#200
    Databus = 16'b1111000110000001 ;
  
    #200
    Databus = 16'b0001010000000000;
    
	#500	$stop;
end                            
endmodule
