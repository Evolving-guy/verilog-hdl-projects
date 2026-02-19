//8-bit Accumulator keeps adding 8-bit inputs with a saturation at 16-bit value FFFF 

`timescale 1ns/1ps
module Accumulator (
    input wire [7:0]d,
    input wire clk,
    input wire reset,
    output reg [15:0]sum
);
    parameter max = 16'hFFFF;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sum <= 0;
        end

        else begin 
        if (sum + d > max) begin
         sum <= max;    
        end

        else begin
            sum <= sum + d;
        end

        end

    end
endmodule