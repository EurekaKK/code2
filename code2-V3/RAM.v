module RAM(
input                readMem,
input       [15:0]   address,
input        	      clk,
input       [15:0]	data,
input       	      wren,
output       [15:0]   out,
output reg           memDataReady
);

wire [15:0] q;
assign out=q;

blk_mem_component blk_mem_component_0 (
        .clka(clk),    // input wire clka
        .wea(wren),      // input wire [0 : 0] wea
        .addra(address),  // input wire [15 : 0] addra
        .dina(data),    // input wire [15 : 0] dina
        .douta(q)  // output wire [15 : 0] douta
 );  
    
always@(posedge clk)
begin
 if(readMem)
   memDataReady=1;
 else
   memDataReady=0;
end

endmodule
