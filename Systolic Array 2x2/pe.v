`timescale 1ns/1ps

module pe #(
    parameter DATA_WIDTH = 16,
    parameter ACC_WIDTH = 32
) (
    input wire clk,
    input wire reset,

    input signed [DATA_WIDTH-1 : 0] a_in,
    input signed [DATA_WIDTH-1 : 0] b_in,

    output reg signed [DATA_WIDTH-1 : 0] a_out,
    output reg signed [DATA_WIDTH-1 : 0] b_out,

    output reg signed [ACC_WIDTH-1:0] c_out
);


always @(posedge clk or posedge reset) begin
    if (reset) begin
        a_out <= 0;
        b_out <= 0;
        c_out <= 0;
        
    end else begin
        a_out <= a_in;
        b_out <= b_in;

        c_out <= c_out + a_in * b_in;
    end
    
end
endmodule