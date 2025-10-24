///----------------------------------------------------------------------
//--SAYEH(Simple Architecture Yet Enough Hardware) CPU
//----------------------------------------------------------------------
// SayehTest

`timescale 1 ns /1 ns

module cpu_top(clk,ExternalReset,in,out);
input clk, ExternalReset;
input  [7:0] in;
output [7:0] out;
wire  MemDataready;
wire [15:0]	 MemoryData;
wire [15:0]  Addressbus,aluout;
wire [15:0]  Databus;
wire ReadMem, WriteMem, ReadIO, WriteIO;
reg [7:0] out;

wire [7:0] portadress;
wire clk_5;

reg [15:0] IO_datain;

assign portadress=Databus[7:0];
 

always@(posedge clk_5)
begin
  if(WriteIO==1'b1)
    begin
    case(portadress)        //������
      8'd2:    out<=aluout[7:0];
    default: out<=0;
    endcase
    end
  else
    out<=out;			//����
end


always@(posedge clk_5)	//��ReadIOΪ1��portadressΪ3ʱ�����ⲿ�������ݣ�����Ϊ0������ʵ����ʱ�����õ�����������˿ڵ�Ŀ����Ϊ�˷�����չ
begin 
  if(ReadIO)
      begin
	    case(portadress)
	      8'd3: IO_datain<={8'd0,in};
	    endcase
      end 
	else IO_datain<=0;
end

PLL_0002 U0(                        //ͨ��PLL��ʱ��Ƶ�ʸı�
    .clk_out1(clk_5),     // output clk_out1  5MHz
    .resetn(ExternalReset),
    .locked(),       
    .clk_in1(clk)        // input clk_in1 100MHZ
);       


RAM U1(
.readMem        (ReadMem),
.address        (Addressbus),
.clk            (clk_5),
.data           (aluout),
.wren           (WriteMem),
.out            (Databus),
.memDataReady   (MemDataready)
);


cpu U2 (
.clk            (~clk_5),
.ReadMem        (ReadMem),
.WriteMem       (WriteMem),
.ReadIO         (ReadIO),
.WriteIO        (WriteIO),
.Databus        (Databus),
.IO_datain      (IO_datain),
.Addressbus     (Addressbus),
.aluout         (aluout),
.ExternalReset  (ExternalReset),
.MemDataready   (MemDataready)
);

		

//assign Reset=ExternalReset; //��ExternalResetΪ0��ResetΪ1ʱ��λ

endmodule

