

module register_file(clock, enable, RW, PW, RA, PA, RB, PB, RD, PD);

    input clock, enable;

    //mux
    input [31:0] PW;
    input [4:0] RW, RA, RB, RD;
    output wire [31:0] PA, PB, PD; 

    //register
    wire [31:0] Rout0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7;
    wire [31:0] Rout8, Rout9, Rout10, Rout11, Rout12, Rout13, Rout14, Rout15;
    wire [31:0] Rout16, Rout17, Rout18, Rout19, Rout20, Rout21, Rout22, Rout23; 
    wire [31:0] Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30, Rout31;
    wire [31:0] out_decoder;

    //to write
    decoder5to32 D01(enable, RW, out_decoder);
    
    //registers
    register R0(clock, out_decoder[0], PW, Rout0);
    register R1(clock, out_decoder[1], PW, Rout1);
    register R2(clock, out_decoder[2], PW, Rout2);
    register R3(clock, out_decoder[3], PW, Rout3);
    register R4(clock, out_decoder[4], PW, Rout4);
    register R5(clock, out_decoder[5], PW, Rout5);
    register R6(clock, out_decoder[6], PW, Rout6);
    register R7(clock, out_decoder[7], PW, Rout7);

    register R8(clock, out_decoder[8], PW, Rout8);
    register R9(clock, out_decoder[9], PW, Rout9);
    register R10(clock, out_decoder[10], PW, Rout10);
    register R11(clock, out_decoder[11], PW, Rout11);
    register R12(clock, out_decoder[12], PW, Rout12);
    register R13(clock, out_decoder[13], PW, Rout13);
    register R14(clock, out_decoder[14], PW, Rout14);
    register R15(clock, out_decoder[15], PW, Rout15);

    register R16(clock, out_decoder[16], PW, Rout16);
    register R17(clock, out_decoder[17], PW, Rout17);
    register R18(clock, out_decoder[18], PW, Rout18);
    register R19(clock, out_decoder[19], PW, Rout19);
    register R20(clock, out_decoder[20], PW, Rout20);
    register R21(clock, out_decoder[21], PW, Rout21);
    register R22(clock, out_decoder[22], PW, Rout22);
    register R23(clock, out_decoder[23], PW, Rout23);

    register R24(clock, out_decoder[24], PW, Rout24);
    register R25(clock, out_decoder[25], PW, Rout25);
    register R26(clock, out_decoder[26], PW, Rout26);
    register R27(clock, out_decoder[27], PW, Rout27);
    register R28(clock, out_decoder[28], PW, Rout28);
    register R29(clock, out_decoder[29], PW, Rout29);
    register R30(clock, out_decoder[30], PW, Rout30);
    register R31(clock, out_decoder[31], PW, Rout31);

    //multiplexers
    mux32to1 M01(RA, 32'b0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7, Rout8, Rout9, Rout10,
             Rout11, Rout12, Rout13, Rout14, Rout15, Rout16, Rout17, Rout18, Rout19, Rout20, 
             Rout21, Rout22, Rout23, Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30,
             Rout31, PA);
    
    mux32to1 M02(RB, 32'b0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7, Rout8, Rout9, Rout10,
             Rout11, Rout12, Rout13, Rout14, Rout15, Rout16, Rout17, Rout18, Rout19, Rout20, 
             Rout21, Rout22, Rout23, Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30,
             Rout31, PB);

    mux32to1 M03(RD, 32'b0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7, Rout8, Rout9, Rout10,
             Rout11, Rout12, Rout13, Rout14, Rout15, Rout16, Rout17, Rout18, Rout19, Rout20, 
             Rout21, Rout22, Rout23, Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30,
             Rout31, PD);

endmodule




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



module decoder5to32(enable, select, out_add);
    input           enable;
    input   [4:0]   select;
    output reg [31:0]  out_add;
 
always @(*) 
    begin
    if (enable) 
        begin
            case(select)
                5'b00000: out_add = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
                5'b00001: out_add = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
                5'b00010: out_add = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
                5'b00011: out_add = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
                5'b00100: out_add = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
                5'b00101: out_add = 32'b0000_0000_0000_0000_0000_0000_0010_0000;
                5'b00110: out_add = 32'b0000_0000_0000_0000_0000_0000_0100_0000;
                5'b00111: out_add = 32'b0000_0000_0000_0000_0000_0000_1000_0000;
                5'b01000: out_add = 32'b0000_0000_0000_0000_0000_0001_0000_0000;
                5'b01001: out_add = 32'b0000_0000_0000_0000_0000_0010_0000_0000;
                5'b01010: out_add = 32'b0000_0000_0000_0000_0000_0100_0000_0000;
                5'b01011: out_add = 32'b0000_0000_0000_0000_0000_1000_0000_0000;
                5'b01100: out_add = 32'b0000_0000_0000_0000_0001_0000_0000_0000;
                5'b01101: out_add = 32'b0000_0000_0000_0000_0010_0000_0000_0000;
                5'b01110: out_add = 32'b0000_0000_0000_0000_0100_0000_0000_0000;
                5'b01111: out_add = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
                
                5'b10000: out_add = 32'b0000_0000_0000_0001_0000_0000_0000_0000;
                5'b10001: out_add = 32'b0000_0000_0000_0010_0000_0000_0000_0000;
                5'b10010: out_add = 32'b0000_0000_0000_0100_0000_0000_0000_0000;
                5'b10011: out_add = 32'b0000_0000_0000_1000_0000_0000_0000_0000;
                5'b10100: out_add = 32'b0000_0000_0001_0000_0000_0000_0000_0000;
                5'b10101: out_add = 32'b0000_0000_0010_0000_0000_0000_0000_0000;
                5'b10110: out_add = 32'b0000_0000_0100_0000_0000_0000_0000_0000;
                5'b10111: out_add = 32'b0000_0000_1000_0000_0000_0000_0000_0000;
                5'b11000: out_add = 32'b0000_0001_0000_0000_0000_0000_0000_0000;
                5'b11001: out_add = 32'b0000_0010_0000_0000_0000_0000_0000_0000;
                5'b11010: out_add = 32'b0000_0100_0000_0000_0000_0000_0000_0000;
                5'b11011: out_add = 32'b0000_1000_0000_0000_0000_0000_0000_0000;
                5'b11100: out_add = 32'b0001_0000_0000_0000_0000_0000_0000_0000;
                5'b11101: out_add = 32'b0010_0000_0000_0000_0000_0000_0000_0000;
                5'b11110: out_add = 32'b0100_0000_0000_0000_0000_0000_0000_0000;
                5'b11111: out_add = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
            endcase
        end
    else
        out_add = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    end

endmodule



module register(clock, enable, in_reg, out_reg);
    input clock, enable;
    input   [31:0] in_reg;
    output reg [31:0] out_reg;

    always@(posedge clock)
            if(enable)
                out_reg <= in_reg;
endmodule