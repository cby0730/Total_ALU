`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMUL, SignaltoMUX );
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoMUL ;
output [5:0] SignaltoMUX ;

reg [5:0] temp ;
reg [6:0] counter ;

parameter AND = 6'b100100; // 36
parameter OR  = 6'b100101; // 37
parameter ADD = 6'b100000; // 32
parameter SUB = 6'b100010; // 34
parameter SLT = 6'b101010; // 42

parameter MULTU= 6'b011001; // 25, 乘法
parameter FIRST = 6'b111110;

parameter SLL = 6'b000000; // 0, 左移

parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

always@( Signal ) // 每一次signal發生改變
begin
  if ( Signal == MULTU )
  begin
    counter = 0 ;
  end
end

always@( posedge clk )
begin
  temp = Signal ;
  if ( Signal == MULTU || Signal == FIRST )
  begin
    counter = counter + 1 ;
    if ( counter == 33 )
    begin
      temp = 6'b111111 ; // Open HiLo reg for MULTU
      counter = 0 ;
    end
	if ( counter == 1 )
		temp = 6'b111110; // 第一次進來把dataB放到Lo暫存器
	if ( counter == 2 )
		temp = 6'b011001; // 把Signal換回來
  end
/*
數32個clk然後開啟HiLo暫存器給除法器放值進去
*/
end

assign SignaltoALU = temp ;
assign SignaltoSHT = temp ;
assign SignaltoMUL = temp ;
assign SignaltoMUX = temp ;


endmodule