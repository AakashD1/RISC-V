module Immediate_Generator #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] INSTRUCTION,
    input [6:0] opcode,
    output reg [BIT_WIDTH - 1:0] IMMEDIATE
    );
    
    always @(*)
        begin
            case(opcode)
                7'b0010011: assign IMMEDIATE = $signed({{20{INSTRUCTION[31]}}, INSTRUCTION[31:20]});
                7'b0000011: assign IMMEDIATE = $signed({{20{INSTRUCTION[31]}}, INSTRUCTION[31:20]});
                7'b0100011: assign IMMEDIATE = $signed({{20{INSTRUCTION[31]}}, INSTRUCTION[31:25], INSTRUCTION[11:7]});
                7'b1100011: assign IMMEDIATE = $signed({{19{INSTRUCTION[31]}}, INSTRUCTION[7], INSTRUCTION[30:25], INSTRUCTION[11:8], 1'b0});
                7'b0110111: assign IMMEDIATE = $signed({INSTRUCTION[31:12], 12'b0});
                7'b0010111: assign IMMEDIATE = $signed({INSTRUCTION[31:12], 12'b0});
                7'b1101111: assign IMMEDIATE = $signed({{11{INSTRUCTION[31]}}, INSTRUCTION[19:12], INSTRUCTION[20], INSTRUCTION[30:21], 1'b0});
                default: assign IMMEDIATE = 32'b0;
            endcase
        end
        
endmodule
