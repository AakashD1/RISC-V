module Adder #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] A, B,
    output [BIT_WIDTH - 1:0] Sum
    );
    
    assign Sum = A + B;
    
endmodule
