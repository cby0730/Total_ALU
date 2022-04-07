`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

wire [31:0] temp, out ;
wire [31:0] temp1,temp2,temp3,temp4;
parameter SLL = 6'b000000; // 0, ¥ª²¾

 SLL1 sll0( .sel(dataB[0]), .src(dataA[31:0]), .dout(temp[31:0]) ) ;
 SLL2 sll1( .sel(dataB[1]), .src(temp[31:0]), .dout(temp1[31:0]) ) ;
 SLL4 sll2( .sel(dataB[2]), .src(temp1[31:0]), .dout(temp2[31:0]) ) ;
 SLL8 sll3( .sel(dataB[3]), .src(temp2[31:0]), .dout(temp3[31:0]) ) ;
 SLL16 sll4( .sel(dataB[4]), .src(temp3[31:0]), .dout(temp4[31:0]) ) ;
 SLL32 all5( .sel(dataB[5]), .src(temp4[31:0]), .dout(out[31:0]) ) ;

assign dataOut = reset ? 32'b0 : out ;

endmodule