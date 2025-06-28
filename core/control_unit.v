module Control_Unit(
    input [6:0] opcode,
    output reg Branch,
    output reg Jump,
    output reg RegWrite,
    output reg ALUSrc,
    output reg [1:0] ALUOp,
    output reg MemRead,
    output reg MemWrite,
    output reg [2:0] MemToReg
    );
    
    always @(*) begin
        case (opcode)
            7'b0110011: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b0, 2'b10, 1'b0, 1'b0, 3'b000};
            end
            7'b0010011:begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b1, 2'b10, 1'b0, 1'b0, 3'b000};
            end
            7'b0000011:begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b1, 2'b00, 1'b1, 1'b0, 3'b001};
            end
            7'b0100011: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b0, 1'b1, 2'b00, 1'b0, 1'b1, 3'bXXX};
            end
            7'b1100011: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b1, 1'b0, 1'b0, 1'b0, 2'b01, 1'b0, 1'b0, 3'bXXX};
            end
            7'b0110111: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b1, 2'b00, 1'b0, 1'b0, 3'b010};
            end
            7'b0010111: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b1, 2'b00, 1'b0, 1'b0, 3'b011};
            end
            7'b1101111: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b1, 1'b1, 1'bX, 2'bXX, 1'b0, 1'b0, 3'b100};
            end
            default: begin
                {Branch, Jump, RegWrite, ALUSrc, ALUOp, MemRead, MemWrite, MemToReg} <= {1'b0, 1'b0, 1'b1, 1'b0, 2'b10, 1'b0, 1'b0, 3'b000};
            end  
        endcase
    end

endmodule
