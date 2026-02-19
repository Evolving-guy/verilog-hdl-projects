`timescale 1ns/1ps
module Accumulator_tb;

reg [7:0] d;
reg clk; 
reg reset;
wire [15:0] sum;

Accumulator dut (
    .d(d), 
    .clk(clk), 
    .reset(reset), 
    .sum(sum)
    );

initial begin
    $dumpfile("Acc.vcd");
    $dumpvars(0, Accumulator_tb);
 end

initial begin
    $display("testing accumulator");
    $monitor("time=%0t, d= %d, sum=%d", $time, d, sum);
    //initialize
    clk = 0;
    reset = 1;
    d = 0;

    #10; 
    reset = 0;

    #10 d= 8'd10; //
    #10 d= 8'd20;
    #10 d= 8'd30;
    #10 d= 8'd255;
    #10 d= 8'd255;

    #900 $finish;
end

//clock
always 
  #5 clk = ~clk;
    
endmodule