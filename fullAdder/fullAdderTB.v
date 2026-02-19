`timescale 1ns / 1ps
module tb_full_adder;

 reg a, b ,c_in;
 wire sum, carry_out;

 full_adder dut (a, b, c_in, sum, carry_out);

 //waveform
 initial begin
    $dumpfile("fullAdderTB.vcd");
    $dumpvars(0, tb_full_adder);
 end

 initial begin
    $display("Testing Full Adder");
    $monitor ("a=%b, b=%b, c_in=%b, sum=%b, carry_out=%b", a, b, c_in, sum, carry_out);

    //Applying test cases
    a=0; b=0; c_in=0; #10; //answers s=0 , c=0
    a=0; b=0; c_in=1; #10; //answers s=1 , c=0
    a=0; b=1; c_in=0; #10; //answers s=1 , c=0
    a=0; b=1; c_in=1; #10; //answers s=0 , c=1
    a=1; b=0; c_in=0; #10; //answers s=1 , c=0
    a=1; b=0; c_in=1; #10; //answers s=0 , c=1
    a=1; b=1; c_in=0; #10; //answers s=0 , c=1
    a=1; b=1; c_in=1; #10; //answers s=1 , c=1
    
    $finish;
 end
endmodule