module Register_File #(parameter ADDRESS_WIDTH = 5,
                       parameter DATA_WIDTH = 32)(
    input clock, reset,
    input RegWrite,
    input [ADDRESS_WIDTH - 1:0] READ_ADDRESS_1, READ_ADDRESS_2, WRITE_ADDRESS,
    input [DATA_WIDTH - 1:0] WRITE_DATA,
    output [DATA_WIDTH - 1:0] READ_DATA_1, READ_DATA_2
    );
    
    reg [DATA_WIDTH - 1:0] register [0:2**ADDRESS_WIDTH - 1];
    
    assign READ_DATA_1 = register[READ_ADDRESS_1];
    assign READ_DATA_2 = register[READ_ADDRESS_2];
    
    always @(posedge clock or posedge reset)
        begin
            if (reset)
                for (i = 1; i < 2**ADDRESS_WIDTH; i = i + 1)
                    begin
                        register[i] <= {DATA_WIDTH{1'b0}};
                    end
            else if (RegWrite && WRITE_ADDRESS != {ADDRESS_WIDTH{1'b0}})
                register[WRITE_ADDRESS] <= WRITE_DATA;
        end
    
endmodule
