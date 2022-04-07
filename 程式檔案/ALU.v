`timescale 1ns/1ns
module ALU( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

wire [31:0] temp ;
wire [7:0] c ;
wire isinvert ;

assign isinvert = ( Signal == SLT ) ? 1 : ( Signal == SUB ) ? 1 : 0 ;

ALU4 alu0( .dataA(dataA[3:0]), .dataB(dataB[3:0]), . Signal(Signal[5:0]), . dataOut(temp[3:0]), . cout(c[0]), .cin(isinvert) ) ;

ALU4 alu1( .dataA(dataA[7:4]), .dataB(dataB[7:4]), . Signal(Signal[5:0]), . dataOut(temp[7:4]), . cout(c[1]), .cin(c[0]) ) ;

ALU4 alu2( .dataA(dataA[11:8]), .dataB(dataB[11:8]), . Signal(Signal[5:0]), . dataOut(temp[11:8]), . cout(c[2]), .cin(c[1]) ) ;

ALU4 alu3( .dataA(dataA[15:12]), .dataB(dataB[15:12]), . Signal(Signal[5:0]), . dataOut(temp[15:12]), . cout(c[3]), .cin(c[2]) ) ;

ALU4 alu4( .dataA(dataA[19:16]), .dataB(dataB[19:16]), . Signal(Signal[5:0]), . dataOut(temp[19:16]), . cout(c[4]), .cin(c[3]) ) ;

ALU4 alu5( .dataA(dataA[23:20]), .dataB(dataB[23:20]), . Signal(Signal[5:0]), . dataOut(temp[23:20]), . cout(c[5]), .cin(c[4]) ) ;

ALU4 alu6( .dataA(dataA[27:24]), .dataB(dataB[27:24]), . Signal(Signal[5:0]), . dataOut(temp[27:24]), . cout(c[6]), .cin(c[5]) ) ;

ALU4 alu7( .dataA(dataA[31:28]), .dataB(dataB[31:28]), . Signal(Signal[5:0]), . dataOut(temp[31:28]), . cout(c[7]), .cin(c[6]) ) ;

assign dataOut = reset ? 32'b0 : ( Signal == SLT ) ? temp[31] : temp ;

endmodule