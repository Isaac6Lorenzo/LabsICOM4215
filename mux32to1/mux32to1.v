
module mux32to1(select, R00, R01, R02, R03, R04, 
            R05, R06, R07, R08, R09, R10,
            R11, R12, R13, R14, R15, R16,
            R17, R18, R19, R20, R21, R22,
            R23, R24, R25, R26, R27, R28,
            R29, R30, R31, out_reg);
    
input  [4:0]  select;
input  [31:0] R01, R02, R03, R04, R05, R06, R07, R08;
input  [31:0] R09, R10, R11, R12, R13, R14, R15, R16;
input  [31:0] R17, R18, R19, R20, R21, R22, R23, R24;
input  [31:0] R25, R26, R27, R28, R29, R30, R31, R00; 
     
output reg [31:0]  out_reg;

always @(*) 
    begin
        case(select)
            5'b00000: out_reg = R00;
            5'b00001: out_reg = R01;
            5'b00010: out_reg = R02;
            5'b00011: out_reg = R03;
            5'b00100: out_reg = R04;
            5'b00101: out_reg = R05;
            5'b00110: out_reg = R06;
            5'b00111: out_reg = R07;
            5'b01000: out_reg = R08;
            5'b01001: out_reg = R09;
            5'b01010: out_reg = R10;
            5'b01011: out_reg = R11;
            5'b01100: out_reg = R12;
            5'b01101: out_reg = R13;
            5'b01110: out_reg = R14;
            5'b01111: out_reg = R15;

            5'b10000: out_reg = R16;
            5'b10001: out_reg = R17;
            5'b10010: out_reg = R18;
            5'b10011: out_reg = R19;
            5'b10100: out_reg = R20;
            5'b10101: out_reg = R21;
            5'b10110: out_reg = R22;
            5'b10111: out_reg = R23;
            5'b11000: out_reg = R24;
            5'b11001: out_reg = R25;
            5'b11010: out_reg = R26;
            5'b11011: out_reg = R27;
            5'b11100: out_reg = R28;
            5'b11101: out_reg = R29;
            5'b11110: out_reg = R30;
            5'b11111: out_reg = R31;            
                
            endcase
    end

endmodule