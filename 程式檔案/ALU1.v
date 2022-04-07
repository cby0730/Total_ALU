`timescale 1ns/1ns
module ALU1( dataA, dataB, Signal, dataOut, cout, cin );
input dataA ;
input dataB ;
input [5:0] Signal ;
input cin ;
output dataOut ;
output cout ;

wire invert, addend, And, Or, Add ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

assign invert = ( Signal == ADD ) ? 0 : 1 ;
assign addend = dataB ^ invert ;

assign And = dataA & dataB ;
assign Or = dataA | dataB ;
FA fa0 ( .augend(dataA), .addend(addend), .carryout(cin), .cout(cout), .sum(Add) ) ;


assign dataOut = ( Signal == AND ) ? And : ( Signal == OR ) ? Or : Add  ;

endmodule