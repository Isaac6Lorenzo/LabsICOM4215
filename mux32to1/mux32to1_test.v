`include "mux32to1.v"
`include "register.v"

module mux32to1_test;
    
    reg clock, enable;
    reg  [4:0]  select;
     
    reg [31:0]  out_reg;
    reg [31:0] A = 32'b1111; //15
    reg [31:0] B = 32'b1010; //10
    reg [31:0] C = 32'b0000; //00
    reg [31:0] D = 32'b0001; //01
    reg [31:0] E = 32'b0010; //02
    reg [31:0] F = 32'hF000; //2^32
    reg [31:0] G = 32'b0100; //04
    reg [31:0] H = 32'b1011; //11

    wire [31:0] Rout0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7;
    wire [31:0] Rout8, Rout9, Rout10, Rout11, Rout12, Rout13, Rout14, Rout15;
    wire [31:0] Rout16, Rout17, Rout18, Rout19, Rout20, Rout21, Rout22, Rout23; 
    wire [31:0] Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30, Rout31;
    wire  [31:0] data_out;


    mux32to1 M(select, Rout0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6, Rout7,
                Rout8, Rout9, Rout10, Rout11, Rout12, Rout13, Rout14, Rout15,
                Rout16, Rout17, Rout18, Rout19, Rout20, Rout21, Rout22, Rout23,
                Rout24, Rout25, Rout26, Rout27, Rout28, Rout29, Rout30, Rout31,
                data_out);

    register R0(clock, 1, A, Rout0);
    register R1(clock, 1, B, Rout1);
    register R2(clock, 1, C, Rout2);
    register R3(clock, 1, D, Rout3);
    register R4(clock, 1, E, Rout4);
    register R5(clock, 1, F, Rout5);
    register R6(clock, 1, G, Rout6);
    // register R7(clock, 1, H, Rout7);

    // register R8(clock, 1, out_reg, Rout8);
    // register R9(clock, 1, out_reg, Rout9);
    // register R10(clock, 1, out_reg, Rout10);
    // register R11(clock, 1, out_reg, Rout11);
    // register R12(clock, 1, out_reg, Rout12);
    // register R13(clock, 1, out_reg, Rout13);
    // register R14(clock, 1, out_reg, Rout14);
    // register R15(clock, 1, out_reg, Rout15);

    // register R16(clock, 1, out_reg, Rout16);
    // register R17(clock, 1, out_reg, Rout17);
    // register R18(clock, 1, out_reg, Rout18);
    // register R19(clock, 1, out_reg, Rout19);
    // register R20(clock, 1, out_reg, Rout20);
    // register R21(clock, 1, out_reg, Rout21);
    // register R22(clock, 1, out_reg, Rout22);
    // register R23(clock, 1, out_reg, Rout23);

    // register R24(clock, 1, out_reg, Rout24);
    // register R25(clock, 1, out_reg, Rout25);
    // register R26(clock, 1, out_reg, Rout26);
    // register R27(clock, 1, out_reg, Rout27);
    // register R28(clock, 1, out_reg, Rout28);
    // register R29(clock, 1, out_reg, Rout29);
    // register R30(clock, 1, out_reg, Rout30);
    // register R31(clock, 1, out_reg, Rout31);


    initial
        begin
            $dumpfile("mux32to1_test.vcd");
            $dumpvars(0, mux32to1_test);

        end
        

    // initial
    //     begin
    //         $display("");
    //         $display("select       data_out_M          R0                  R1                  R2                  R3              time");
    //         $monitor("  %b        %h            %h            %h            %h              %h    %d", select, data_out, Rout0, Rout1, Rout2, Rout3, $time);
    //     end

    initial
        begin
            $display("");
            $display("select       data_out_M            R0               R1               R2               R3               R4               R5               R6");
            $monitor("  %b        %h         %h         %h         %h          %h          %h          %h          %h", select, data_out, Rout0, Rout1, Rout2, Rout3, Rout4, Rout5, Rout6);
        end

    initial begin

#0 select = 5'b00000;         
        #10 select = 5'b00001;          
        #20 select = 5'b00010;          
        #30 select = 5'b00011;          
        #40 select = 5'b00100;                   
        #50 select = 5'b00101;          
        #60 select = 5'b00110;         
        #70 select = 5'b00111;  
        #80 select = 5'b01000;          
        #90 select = 5'b01001;          
        #100 select = 5'b01010;         

        #110 select = 5'b01011;          
        #120 select = 5'b01100;          
        #130 select = 5'b01101;          
        #140 select = 5'b01110;          
        #150 select = 5'b01111;         
        #160 select = 5'b10000;        
        #170 select = 5'b10001;       
        #180 select = 5'b10010;      
        #190 select = 5'b10011;     
        #200 select = 5'b10100;    

        #210 select = 5'b10101;   
        #220 select = 5'b10110;  
        #230 select = 5'b10111; 
        #240 select = 5'b11000;
        #250 select = 5'b11001;
        #260 select = 5'b11010;
        #270 select = 5'b11011;
        #280 select = 5'b11100;
        #290 select = 5'b11101;
        #300 select = 5'b11110;
        #310 select = 5'b11111;
       





        // // #0 enable =0;
        // #0 select = 5'b00000;         
        // // #0 out_reg = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

        // // #10 enable =1;
        // // #20 enable =0;
        // #30 select = 5'b00001;          
        // // #30 out_reg = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
        
        // // #40 enable =1;
        // // #50 enable =0;
        // #60 select = 5'b00010;          
        // // #60 out_reg = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
        
        // // #70 enable =1;
        // // #80 enable =0;
        // #90 select = 5'b00011;          
        // // #90 out_reg = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
        
        // // #100 enable =1;
        // // #110 enable =0;
        // #120 select = 5'b00100;          
        // // #120 out_reg = 32'b0000_0000_0000_0000_0000_0000_0001_0000;

        // // #130 enable =1;
        // // #140 enable =0;
        // #150 select = 5'b00101;          
        // // #150 out_reg = 32'b0000_0000_0000_0000_0000_0000_0010_0000;

        // // #160 enable =1;
        // // #170 enable =0;
        // #180 select = 5'b00110;         
        // // #180 out_reg = 32'b0000_0000_0000_0000_0000_0000_0100_0000;

        // // #190 enable =1;
        // // #200 enable =0;
        // #210 select = 5'b00111;  
        // // #210 out_reg = 32'b0000_0000_0000_0000_0000_0000_1000_0000;

        // // #220 enable =1;
        // // #230 enable =0;
        // #240 select = 5'b01000;          
        // // #240 out_reg = 32'b0000_0000_0000_0000_0000_0001_0000_0000;

        // #90 select = 5'b01001;          
        // #90 out_reg = 32'b0000_0000_0000_0000_0000_0010_0000_0000;

        // #100 select = 5'b01010;         
        // #100 out_reg = 32'b0000_0000_0000_0000_0000_0100_0000_0000;

        // #110 select = 5'b01011;          
        // #110 out_reg = 32'b0000_0000_0000_0000_0000_1000_0000_0000;

        // #120 select = 5'b01100;          
        // #120 out_reg = 32'b0000_0000_0000_0000_0001_0000_0000_0000;

        // #130 select = 5'b01101;          
        // #130 out_reg = 32'b0000_0000_0000_0000_0010_0000_0000_0000;

        // #140 select = 5'b01110;          
        // #140 out_reg = 32'b0000_0000_0000_0000_0100_0000_0000_0000;

        // #150 select = 5'b01111;         
        // #150 out_reg = 32'b0000_0000_0000_0000_1000_0000_0000_0000;

        // #160 select = 5'b10000;        
        // #160 out_reg = 32'b0000_0000_0000_0001_0000_0000_0000_0000;

        // #170 select = 5'b10001;       
        // #170 out_reg = 32'b0000_0000_0000_0010_0000_0000_0000_0000;

        // #180 select = 5'b10010;      
        // #180 out_reg = 32'b0000_0000_0000_0100_0000_0000_0000_0000;

        // #190 select = 5'b10011;     
        // #190 out_reg = 32'b0000_0000_0000_1000_0000_0000_0000_0000;

        // #200 select = 5'b10100;    
        // #200 out_reg = 32'b0000_0000_0001_0000_0000_0000_0000_0000;

        // #210 select = 5'b10101;   
        // #210 out_reg = 32'b0000_0000_0010_0000_0000_0000_0000_0000;

        // #220 select = 5'b10110;  
        // #220 out_reg = 32'b0000_0000_0100_0000_0000_0000_0000_0000;

        // #230 select = 5'b10111; 
        // #230 out_reg = 32'b0000_0000_1000_0000_0000_0000_0000_0000;

        // #240 select = 5'b11000;
        // #240 out_reg = 32'b0000_0001_0000_0000_0000_0000_0000_0000;

        // #250 select = 5'b11001;
        // #250 out_reg = 32'b0000_0010_0000_0000_0000_0000_0000_0000;

        // #260 select = 5'b11010;
        // #260 out_reg = 32'b0000_0100_0000_0000_0000_0000_0000_0000;

        // #270 select = 5'b11011;
        // #270 out_reg = 32'b0000_1000_0000_0000_0000_0000_0000_0000;

        // #280 select = 5'b11100;
        // #280 out_reg = 32'b0001_0000_0000_0000_0000_0000_0000_0000;

        // #290 select = 5'b11101;
        // #290 out_reg = 32'b0010_0000_0000_0000_0000_0000_0000_0000;

        // #300 select = 5'b11110;
        // #300 out_reg = 32'b0100_0000_0000_0000_0000_0000_0000_0000;

        // #310 select = 5'b11111;
        // #310 out_reg = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

    end

    initial begin
        clock = 1'b0;
        forever #10 clock = ~clock;
    end

    initial #5000 $finish;

endmodule