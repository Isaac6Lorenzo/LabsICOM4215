module register(clock, enable, in_reg, out_reg);
    input clock, enable;
    input   [31:0] in_reg;
    output reg [31:0] out_reg;

    always@(posedge clock)
            if(enable)
                out_reg <= in_reg;
endmodule

