module Multiplexer_0 #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] I0, I1,
    input sel,
    output [BIT_WIDTH - 1:0] Y
    );
    
    assign Y = sel ? I1 : I0;
    
endmodule
