`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [5:0] Signal ;
output [31:0] dataOut ;


wire [31:0] temp ;

parameter AND = 6'b100100; // 36
parameter OR  = 6'b100101; // 37
parameter ADD = 6'b100000; // 32
parameter SUB = 6'b100010; // 34
parameter SLT = 6'b101010; // 42

parameter SRL = 6'b000010; // 2, �k��
parameter SLL = 6'b000000; // 0, ����

parameter FIRST = 6'b111110;
parameter MULTU = 6'b011001; // 25, ���k

parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

assign temp = ( Signal==MFHI ) ? HiOut : ( Signal==MFLO ) ? LoOut : ( Signal==SLL ) ? Shifter : ALUOut ;
	
assign dataOut = temp ;

endmodule