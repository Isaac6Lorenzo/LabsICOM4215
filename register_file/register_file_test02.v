`include"register_file.v"

module register_file_test02;
    
    reg clock, enable;
    reg  [4:0] select_decoder, select_readerA, select_readerB, select_readerD;
    reg [31:0] data_writer;
    wire [31:0] outputA, outputB, outputD;
    integer i;

    //register_file(clock, enable, RW, PW, RA, PA, RB, PB, RD, PD);


    register_file RF01(clock, enable, select_decoder, data_writer, select_readerA, outputA, 
                        select_readerB, outputB, select_readerD, outputD);
    // RW ==> select
    //PW ==> 32'b0000
    
    initial
        begin
            $dumpfile("register_file_test02.vcd");
            $dumpvars(0, register_file_test02);
        end

    initial
        begin
            $display("");
            $display("clock      enable      select_decoder       data_writer         RA         PA       RB        PB        RD        PD ");
            $monitor("%b          %b             %b             %d          %b  %d         %b   %d   %b   %d", clock, enable, select_decoder, data_writer, select_readerA, outputA, select_readerB, outputB, select_readerD, outputD);
        end

    initial begin

        // #0 enable = 0;
        enable = 1;

        #1 data_writer = 32'b0000_0000_0000_0000_0000_0000_0001_0100;               
        #1 select_decoder = 5'b00000;          
        #1 select_readerA = 5'b00000;
        #1 select_readerB = 5'b11111;
        #1 select_readerD = 5'b11110;

        for(i=0; i<31; i = i +1) begin
            #4 data_writer = data_writer + 32'b0000_0000_0000_0000_0000_0000_0000_0001;               
            select_decoder = select_decoder + 5'b00001;     
            select_readerA = select_readerA + 5'b00001;
            select_readerB = select_readerB + 5'b00001;
            select_readerD = select_readerD + 5'b00001;
        end 
    end

    initial begin
        clock = 1'b0;
        forever #2 clock = ~clock;
    end

    initial #200 $finish;

endmodule