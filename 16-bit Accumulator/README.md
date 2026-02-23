# 16 Bit Accumulator with 16 Bit Saturation

This project implements a sequential accumulator in Verilog HDL.

The module adds an 8 bit input value to a 16 bit register on every clock cycle. The design includes saturation logic to prevent overflow beyond the maximum representable value.

## Design Overview

Inputs  
8 bit unsigned input D  
Clock  
Asynchronous reset  

Output  
16 bit accumulated sum  

On every rising clock edge

Sum = Sum + D

If the computed result exceeds 16'hFFFF, the accumulator saturates at the maximum value instead of wrapping around.

Reset clears the accumulator to zero.

## Architectural Characteristics

The design is fully sequential and clock driven.

Non blocking assignments are used to correctly model synchronous register behavior.

An asynchronous reset allows the accumulator to be cleared immediately without waiting for a clock edge.

Saturation logic ensures predictable overflow behavior, which is important in fixed width digital systems.

The accumulator width is intentionally larger than the input width to accommodate growth over multiple cycles.

##  Importance

Accumulators are fundamental building blocks in digital systems. Many signal processing, control, and arithmetic pipelines rely on repeated accumulation of values over time.

This project helped reinforce understanding of

Clocked sequential logic  
Non blocking assignment semantics  
Overflow and saturation handling  
Bit width planning in arithmetic datapaths  

## How To Run

Compile

iverilog -o acc.out Accumulator.v accumulator_tb.v

Run

vvp acc.out

Waveform

gtkwave acc.vcd
