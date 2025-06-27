module Instruction_Memory #(parameter BIT_WIDTH = 32,
                            parameter MEMORY_SIZE = 100)(
    input [BIT_WIDTH - 1:0] ADDRESS,
    output [BIT_WIDTH - 1:0] INSTRUCTION
    );
    
    reg [BIT_WIDTH/4 - 1:0] memory [0:MEMORY_SIZE - 1];
    
    assign INSTRUCTION = {memory[ADDRESS + 3], memory[ADDRESS + 2], memory[ADDRESS + 1], memory[ADDRESS]};
    
endmodule
