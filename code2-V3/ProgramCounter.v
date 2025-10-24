//----------------------------------------------------------------------
//--SAYEH (Simple Architecture Yet Enough Hardware) CPU
//----------------------------------------------------------------------
//Program Counter

`timescale 1 ns /1 ns

module ProgramCounter (in, enable, clk, out);
input [15:0] in;
input enable, clk;
output [15:0] out;
reg [15:0] out;		//同理于AddressLogic中的方式

	always @(posedge clk)
	begin
		if (enable) out <= in;
		else out <= out;
	end

endmodule
