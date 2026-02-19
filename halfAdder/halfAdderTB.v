`timescale 1ns/1ps

module tb_half_adder;

 reg a, b;
 wire sum, carry_out;

 half_adder dut (a, b, sum, carry_out);

 initial begin 
    $dumpfile("halfAdderTB.vcd");
    $dumpvars(0, tb_half_adder);
 end

 initial begin
    $display("TESTING HALF ADDER");
    $monitor("a=%b, b=%b, sum=%b, carry_out=%b", a, b, sum, carry_out);

    a=0; b=0; #10; //answers s=0 c=0
    a=0; b=1; #10; //answers s=1 c=0
    a=1; b=0; #10; //answers s=1 c=0
    a=1; b=1; #10; //answers s=0 c=1
    $finish;
 end
endmodule