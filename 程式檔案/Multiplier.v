`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;

reg [63:0] temp;

parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;
parameter FIRST = 6'b111110;

always@( posedge clk or reset )
begin
    if ( reset )
        begin
			temp = 32'b0 ;

    end

    else
        begin
		case ( Signal )
		
  		MULTU:
		begin
			if ( temp[0] == 1'b1 ) begin
				temp[63:32] = temp[63:32] + dataA;
			end
			temp = temp >> 1;
		end
		
		FIRST: 
		begin
			temp = dataB;
			if ( temp[0] == 1'b1 ) begin
				temp[63:32] = temp[63:32] + dataA;
			end
			temp = temp >> 1;
		end
		
  		OUT:
		begin

		end
		
		endcase
    end

end
assign dataOut = temp ;

endmodule