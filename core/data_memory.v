module Data_Memory #(parameter BIT_WIDTH = 32,
                     parameter MEMORY_SIZE = 100)(
    input clock, reset, MemRead, MemWrite,
    input [2:0] funct3,
    input [BIT_WIDTH - 1:0] ADDRESS, WRITE_DATA,
    output reg [BIT_WIDTH - 1:0] READ_DATA
    );
    
    reg [BIT_WIDTH/4 - 1:0] memory [0:MEMORY_SIZE - 1];
    
    always @(*)
        begin
            if (MemRead)
                case ({funct3, ADDRESS[1:0]})
                    5'b000_XX: assign READ_DATA = {{{BIT_WIDTH - BIT_WIDTH/4}{memory[ADDRESS][BIT_WIDTH/4 - 1]}}, memory[ADDRESS]};
                    5'b001_X0: assign READ_DATA = {{{BIT_WIDTH - BIT_WIDTH/2}{memory[ADDRESS + 1][BIT_WIDTH/2 - 1]}}, memory[ADDRESS + 1], memory[ADDRESS]};
                    5'b010_00: assign READ_DATA = {memory[ADDRESS + 3], memory[ADDRESS + 2], memory[ADDRESS + 1], memory[ADDRESS]};
                    5'b011_XX: assign READ_DATA = {{{BIT_WIDTH - BIT_WIDTH/4}{1'b0}}, memory[ADDRESS]};
                    5'b100_X0: assign READ_DATA = {{{BIT_WIDTH - BIT_WIDTH/2}{1'b0}}, memory[ADDRESS + 1], memory[ADDRESS]};
                endcase
        end
    
    integer i;
    always @(posedge clock or posedge reset)
        begin
            if (reset) begin
                for (i = 0; i < MEMORY_SIZE; i = i + 1)
                    begin
                        memory[i] = {BIT_WIDTH/4{1'b0}};
                    end
            end else if (MemWrite)
                case ({funct3, ADDRESS[1:0]})
                    5'b000_XX: begin
                        if (ADDRESS < MEMORY_SIZE)
                            memory[ADDRESS] <= WRITE_DATA[BIT_WIDTH/4 - 1:0];
                    end
                    5'b001_X0: begin
                        if (ADDRESS + 1 < MEMORY_SIZE)
                            {memory[ADDRESS + 1], memory[ADDRESS]} <= WRITE_DATA[BIT_WIDTH/2 - 1:0];
                    end
                    5'b010_00: begin
                        if (ADDRESS + 3 < MEMORY_SIZE)
                            {memory[ADDRESS + 3], memory[ADDRESS + 2], memory[ADDRESS + 1], memory[ADDRESS]} <= WRITE_DATA;
                    end
                endcase
        end

endmodule
