//A 2-bit sequential counter that counts in 3-0-1-2 pattern using 2 D-FlipFlops with one synchronized clock

`timescale 1ns/1ps

module seqCounter (
    input wire clk,
    input wire reset,
    output reg [1:0] count
);

 always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 2'b11;
    end

    else begin
        count[0] <= ~(count[0]);
        count[1] <= (count[1] ^ count[0]);
    end
    
 end
    
endmodule