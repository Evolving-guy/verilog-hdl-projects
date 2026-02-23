# Verilog HDL Projects Portfolio

This repository contains a collection of digital design projects implemented in Verilog HDL.

The projects are structured to demonstrate progression from fundamental combinational logic to sequential arithmetic blocks and finally to a small parallel compute architecture using a systolic array.

All designs are written at RTL level and verified using simulation.

---

## Project Overview

### Half Adder

A basic combinational circuit that computes the sum and carry of two 1 bit inputs.

A fundamental for explaining combnination circuits and use of K-Maps

This project reinforces boolean logic design and basic gate level implementation.

---

### Full Adder

A 1 bit full adder built using combinational logic.

Implements sum and carry out for three inputs and forms the foundation for multi bit arithmetic circuits.

A progression on the Half Adder and fundamental for understanding digital design.

---

### 2 Bit Sequence Counter

A classical sequential logic design implemented using D flip flops.

The counter follows a custom sequence:

3 - 0 - 1 - 2 - 3  and so on

This project demonstrates

State encoding  
Flip flop based state machines  
Next state logic design  
Clock driven sequential behavior  

---

### 16 Bit Accumulator

A sequential accumulator that continuously adds 8 bit inputs into a 16 bit register.

Includes saturation logic to prevent overflow beyond 16'hFFFF.

Demonstrates

Clocked arithmetic  
Non blocking assignments  
Overflow handling  
Register width planning  

---

### 16 Bit Multiply Accumulate Unit

A sequential MAC unit that multiplies two 8 bit operands and accumulates the result into a 16 bit register.

Includes saturation logic and asynchronous reset.


---

### 2x2 Systolic Array Matrix Multiplier

A parallel matrix multiplication architecture built using four Processing Elements arranged in a 2x2 grid.

Each Processing Element performs a multiply accumulate operation while forwarding operands to neighboring elements.

This project demonstrates

Spatial parallelism  
Pipeline behavior  
Wavefront data propagation  
Hardware scalability concepts  

---

All projects were simulated using Icarus Verilog.

Waveforms were analyzed to verify correct sequential behavior and timing.

---

Each project builds intuition required for larger scale digital systems and accelerator architectures.

This repository serves as a structured digital design portfolio demonstrating understanding of arithmetic datapaths and hardware dataflow architectures.
