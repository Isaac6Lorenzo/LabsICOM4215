`include "register.v"

module register_test;
    reg clock, enable;
    reg [31:0] indata;
    wire [31:0] outdata;

    register R(clock, enable, indata, outdata);

    initial
        begin
            $dumpfile("register_test.vcd");
            $dumpvars(0, register_test);
        end
        
    initial
        begin
            $display("");
            $display("clock    enableW        data_in                                    data_out                                    time");
            $monitor("  %b        %b        %b       %b  %d", clock, enable, indata, outdata, $time);
        end

    initial fork
        enable = 0;
        indata = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        #20 enable = 1;
        #30 indata = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
        #40 indata = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
        #60 indata = 32'b0000_0000_0000_0000_0000_0000_0001_000;
        #70 indata = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
        
        #90 indata = 32'b0000_0000_0000_0000_0000_0000_1111_0000;
       
        #120 enable = 0;
        #120 indata = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        #130 enable = 1;
        #130 indata = 32'b0000_0000_0000_0000_0000_0000_0000_0011;
        #140 indata = 32'b1111_0000_0000_0000_0000_0000_0000_1111;
        #150 indata = 32'b0000_0000_0000_0000_1111_0000_0000_0000;
    join

    initial begin
        clock = 1'b0;
        forever #10 clock = ~clock;
    end

    initial #150 $finish;
    // initial #300 $finish;

endmodule