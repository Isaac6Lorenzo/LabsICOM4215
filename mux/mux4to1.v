
module mux32to1(select, R00, R01, R02, R03, out_reg);
    
input  [4:0]  select;
input  [31:0] R00, R01, R02, R03;
output reg [31:0]  out_reg;

always @(*) 
    begin
        case(select)
            5'b00000: out_reg = R00;
            5'b00001: out_reg = R01;
            5'b00010: out_reg = R02;
            5'b00011: out_reg = R03;
           
            endcase
    end

endmodule