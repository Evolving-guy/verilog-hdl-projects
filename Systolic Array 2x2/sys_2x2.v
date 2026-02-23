    `timescale 1ns/1ps

    module sys2x2 #(
        parameter DATA_WIDTH = 16,
        parameter ACC_WIDTH =32
    ) (
        input clk,
        input reset,

        //A matrix rows (left inputs)
        input signed [DATA_WIDTH-1 : 0] a0_in,
        input signed [DATA_WIDTH-1 : 0] a1_in,

        //B matrix columns (top inputs)
        input signed [DATA_WIDTH-1 : 0] b0_in,
        input signed [DATA_WIDTH-1 : 0] b1_in,

        output signed [ACC_WIDTH-1 : 0] c00,
        output signed [ACC_WIDTH-1 : 0] c01,
        output signed [ACC_WIDTH-1 : 0] c10,
        output signed [ACC_WIDTH-1 : 0] c11
    );

    wire signed [DATA_WIDTH-1 : 0] a00_a01;
    wire signed [DATA_WIDTH-1 : 0] a10_a11;

    wire signed [DATA_WIDTH-1 : 0] b00_b10;
    wire signed [DATA_WIDTH-1 : 0] b01_b11;

    //start pe
    pe #(DATA_WIDTH, ACC_WIDTH) pe00 (
        .clk(clk),
        .reset(reset),
        .a_in(a0_in),
        .b_in(b0_in),
        .a_out(a00_a01),
        .b_out(b00_b10),
        .c_out(c00)
    );

    pe #(DATA_WIDTH, ACC_WIDTH) pe01 (
        .clk(clk),
        .reset(reset),
        .a_in(a00_a01),
        .b_in(b1_in),
        .a_out(),
        .b_out(b01_b11),
        .c_out(c01)
    );

    pe #(DATA_WIDTH, ACC_WIDTH) pe10 (
        .clk(clk),
        .reset(reset),
        .a_in(a1_in),
        .b_in(b00_b10),
        .a_out(a10_a11),
        .b_out(),
        .c_out(c10)
    );

    pe #(DATA_WIDTH, ACC_WIDTH) pe11 (
        .clk(clk),
        .reset(reset),
        .a_in(a10_a11),
        .b_in(b01_b11),
        .a_out(),
        .b_out(),
        .c_out(c11)
    );


        
    endmodule