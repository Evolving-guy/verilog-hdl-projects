`timescale 1ns/1ps
module MAC_tb;

reg [7:0] a;
reg [7:0] b;
reg clk;
reg reset;
wire [15:0] acc;

MAC_unit dut (
    .a(a),
    .b(b),
    .clk(clk),
    .reset(reset),
    .acc(acc)
    );

initial begin
    $dumpfile("MAC.vcd");
    $dumpvars(0, MAC_tb);
end

initial begin
    $display("testing MAC");
    $monitor("Time: %0t, a= %d, b= %d, acc= %d", $time, a, b, acc);

    //initialize
    clk = 0;
    reset = 1;
    a = 8'd0;
    b = 8'd0;

    #10 reset = 0;

    #10 a= 8'd10; b= 8'd10;
    #10 a= 8'd10; b= 8'd20;

    #50 $finish;
end

always 
#5 clk = ~clk;
    
endmodule