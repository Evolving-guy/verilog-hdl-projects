# 8 Bit Multiply Accumulate Unit with Saturation

This project implements a sequential multiply accumulate unit in Verilog HDL.

The module performs an 8 bit by 8 bit multiplication on every clock cycle and accumulates the result into a 16 bit register. The design includes saturation logic to prevent overflow beyond the maximum representable value.

## Design Overview

Inputs  
8 bit unsigned input A  
8 bit unsigned input B  
Clock  (clk)
Asynchronous reset (reset)  

Output  
16 bit accumulated result  

On every rising clock edge

Accumulator = Accumulator + (A × B)

If the computed result exceeds 16'hFFFF, the accumulator saturates at the maximum value of 16 bits instead of wrapping around.

Reset clears the accumulator to zero.

## Architectural Characteristics

The design is fully sequential and clock driven.

Non blocking assignments are used to correctly model synchronous register behavior.

An asynchronous reset allows the accumulator to be cleared immediately without waiting for a clock edge.

Saturation logic ensures predictable overflow behavior, which is important in DSP and hardware accelerator designs.

## Importance

Multiply accumulate units form the core computational primitive in digital signal processing and neural network accelerators. Almost all convolution and matrix multiplication operations reduce to repeated MAC operations.

This project helped reinforce understanding of

Clocked sequential logic  
Non blocking assignment semantics  
Overflow and saturation handling  
Arithmetic behavior in hardware  

## How To Run

Compile

iverilog -o mac.out MAC_unit.v mac_tb.v

Run

vvp mac.out

Waveform

gtkwave mac.vcd
