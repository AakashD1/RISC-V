module Branch_Unit #(parameter BIT_WIDTH = 32)(
    input [BIT_WIDTH - 1:0] A, B,
    input [3:0] ALUCtrl,
    output reg br_flag
    );
    
    always @(*)
        begin
            case (ALUCtrl)
                4'b0000: assign br_flag = $signed(A) == $signed(B) ? 1 : 0; 
                4'b0001: assign br_flag = $signed(A) != $signed(B) ? 1 : 0;
                4'b0010: assign br_flag = $signed(A) < $signed(B) ? 1 : 0;
                4'b0011: assign br_flag = $unsigned(A) < $unsigned(B) ? 1 : 0;
                4'b0100: assign br_flag = $signed(A) >= $signed(B) ? 1 : 0;
                4'b0101: assign br_flag = $unsigned(A) >= $unsigned(B) ? 1 : 0;
            endcase
        end
    
endmodule
