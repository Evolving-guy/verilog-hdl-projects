`timescale 1ns/1ps

module sys2x2TB;

parameter DATA_WIDTH = 16 ;
parameter ACC_WIDTH = 32 ;

reg clk;
reg reset;

reg signed [DATA_WIDTH-1: 0] a0_in;
reg signed [DATA_WIDTH-1: 0] a1_in;
reg signed [DATA_WIDTH-1: 0] b0_in;
reg signed [DATA_WIDTH-1: 0] b1_in;

wire signed [ACC_WIDTH-1: 0] c00;
wire signed [ACC_WIDTH-1: 0] c01;
wire signed [ACC_WIDTH-1: 0] c10;
wire signed [ACC_WIDTH-1: 0] c11;

sys2x2 dut (
    .clk(clk),
    .reset(reset),
    .a0_in(a0_in),
    .a1_in(a1_in),
    .b0_in(b0_in),
    .b1_in(b1_in),
    .c00(c00),
    .c10(c10),
    .c01(c01),
    .c11(c11)
);

always
#5 clk = ~clk;

initial begin
    $dumpfile("sys.vcd");
    $dumpvars(0,sys2x2TB);
end

initial begin
    $display("Testing 2x2 Systolic Array ");
    $monitor("time: %0t, c00 = %d, c01 = %d, c10 = %d, c11 = %d", $time, c00, c01, c10, c11);

    clk = 0;
    reset = 1;
    a0_in = 0;
    a1_in = 0;
    b0_in = 0;
    b1_in = 0;

    #10 reset = 0;

    // Cycle 1
    @(posedge clk);
    a0_in = 1;   
    a1_in = 0;
    b0_in = 5;   
    b1_in = 0;

    // Cycle 2
    @(posedge clk);
    a0_in = 2;   
    a1_in = 3;   
    b0_in = 7;   
    b1_in = 6;   

    // Cycle 3
    @(posedge clk);
    a0_in = 0;
    a1_in = 4;   
    b0_in = 0;
    b1_in = 8;   


    @(posedge clk);
    a0_in = 0;
    a1_in = 0;
    b0_in = 0;
    b1_in = 0;

    repeat(4) @(posedge clk);
    $finish;
end

endmodule