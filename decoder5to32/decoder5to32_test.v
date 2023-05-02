`include "decoder5to32.v"

module decoder5to32_test;
    
    reg clock, enable;
    reg  [4:0]  select;   
    wire [31:0]  out_data;
    reg [31:0]  out_reg;


    decoder5to32 D0 (enable, select, out_data);

    initial
        begin
            $dumpfile("decoder5to32_test.vcd");
            $dumpvars(0, decoder5to32_test);
        end
        
    initial
        begin
            $display("");
            $display("clock     enable     select       out_data                                          time");
            $monitor("  %b        %b        %b        %b        %d", clock, enable, select, out_data, $time);
        end

    initial begin
        //when enable = 0, output is default 32'b0000
        // #0 enable = 0;

        //output is expect
        #0 enable = 1;

        #0 select = 5'b00000;         
        #10 select = 5'b00001;          
        #20 select = 5'b00010;          
        #30 select = 5'b00011;          
        #40 select = 5'b00100;                   
        #50 select = 5'b00101;          
        #60 select = 5'b00110;         
        #70 select = 5'b00111; 

        // #70 enable = 1; 
        #80 select = 5'b01000;          
        #90 select = 5'b01001;          
        #100 select = 5'b01010;         

        #110 select = 5'b01011;          
        #120 select = 5'b01100;          
        #130 select = 5'b01101;          
        #140 select = 5'b01110;          
        #150 select = 5'b01111; 
        
        // #160 enable = 0;
        #160 select = 5'b10000;        
        #170 select = 5'b10001;       
        #180 select = 5'b10010;      
        #190 select = 5'b10011;     
        #200 select = 5'b10100;    

        // #210 enable = 1; 
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

        //for debugging
        //case default ==> 32'b0000 output
        // #320 select = 33; //==> carry out most signf, and show less signf bit output = 2

    end

    initial begin
        clock = 1'b0;
        forever #100 clock = ~clock;
    end

    initial #5300 $finish;

endmodule