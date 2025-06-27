module Multiplexer_1 #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] I0, I1, I2, I3, I4, I5, I6, I7,
    input [2:0] sel,
    output reg [BIT_WIDTH - 1:0] Y
    );
    
    always @(*)
        begin
            case (sel)
                3'b000: assign Y = I0;
                3'b001: assign Y = I1;
                3'b010: assign Y = I2;
                3'b011: assign Y = I3;
                3'b100: assign Y = I4;
                3'b101: assign Y = I5;
                3'b110: assign Y = I6;
                3'b111: assign Y = I7;
            endcase
        end
    
endmodule
