module SLL32( sel, src, dout ) ;

 input sel ;
 input[31:0] src ;
 output[31:0] dout ;
 
 wire[31:0] out ;

 assign dout = (sel == 1'b1) ? 32'b0 : src ;
 
endmodule