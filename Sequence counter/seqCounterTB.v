`timescale 1ns/1ps

module seqCounterTB;

reg clk;
reg reset;
wire [1:0] count;

seqCounter dut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    $dumpfile("Seq.vcd");
    $dumpvars(0, seqCounterTB);
end

initial begin
    $display("Counting");
    $monitor("Time: %0t, reset= %b, count = %d", $time, reset, count);

    clk= 0;
    reset= 1;

    #10 reset= 0;

    #40 reset= 1;

    #40 $finish;
end

always
#5 clk <= ~clk;
    
endmodule