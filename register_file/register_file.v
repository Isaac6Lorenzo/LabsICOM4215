`include "mux32to1.v"
`include "register.v"
`include "decoder5to32.v"

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

