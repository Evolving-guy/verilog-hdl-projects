`timescale 1ns/1ps

module MAC_unit (
    input wire [7:0]a,
    input wire [7:0]b,
    input wire clk,
    input wire reset,
    output reg [15:0]acc
);
    parameter max = 16'hFFFF;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc <= 0;
        end
        else begin
            if (acc + (a * b) > max) begin
                acc <= max;
            end
            else begin
                acc <= acc + (a * b); 
            end 
        end
    end
endmodule