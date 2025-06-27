module Program_Counter #(parameter BIT_WIDTH = 32)(
    input clock, reset,
    input [BIT_WIDTH - 1:0] ADDRESS_IN,
    output reg [BIT_WIDTH - 1:0] ADDRESS_OUT
    );
    
    initial ADDRESS_OUT = {BIT_WIDTH{1'b0}};
    
    always @(posedge clock)
        begin
            if(reset)
                ADDRESS_OUT <= {BIT_WIDTH{1'b0}};
            else
                ADDRESS_OUT <= ADDRESS_IN;
        end
        
endmodule
