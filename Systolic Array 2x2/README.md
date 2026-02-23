# 2x2 Systolic Array Matrix Multiplier

This project implements a 2x2 systolic array for matrix multiplication in Verilog HDL.

The design consists of four Processing Elements arranged in a 2x2 grid. Each Processing Element performs a multiply accumulate operation and passes data to its neighboring elements in a pipelined fashion.

The architecture demonstrates spatial parallelism, data reuse, and wavefront style computation.

## What is a Systolic Array

A systolic array is a hardware architecture made up of a regular grid of Processing Elements that perform identical operations on streaming data.

Data flows rhythmically through the array. Each Processing Element performs a simple operation and forwards partial results to adjacent elements.

This enables high throughput with simple local interconnects.
A good video example for a Sytolic Array can be found [here][youtube video] 

Systolic arrays are widely used in

Matrix multiplication accelerators  
Digital signal processing  
Neural network hardware  
AI and ML accelerators  

## Design Overview

This implementation performs 2x2 matrix multiplication.

Matrix A values enter from the left side  
Matrix B values enter from the top  

Each Processing Element computes

C = C + A × B

The partial sums accumulate locally while input operands propagate across the array.

The four Processing Elements are arranged as
```
PE00  PE01  
PE10  PE11
```

Outputs correspond to
```
c00  c01  
c10  c11
```

The PEs are basically 32 bit signed MAC units which give out the inputs as a_out and b_out after being done with accumulating

The design is fully synchronous and clock driven.

## Architectural Characteristics

Each Processing Element is a sequential multiply accumulate unit.

Non blocking assignments are used to model proper register behavior.

Data movement across the array is achieved using registered outputs from each PE.

The design exhibits pipeline behavior

Initial cycles fill the array  
Middle cycles perform steady state computation  
Final cycles flush remaining partial sums  


## Importance

Systolic arrays are foundational to modern AI accelerators such as TPU like architectures.

Understanding this structure builds intuition for

Parallel hardware design  
Pipeline timing  
Dataflow architectures  
Scalable compute fabrics 

## TestBench Example

Here in the sys_2x2TB.v we have considered a very simple example

Matrix A 
```
[ 1  2 ]
[ 3  4 ]
```
Matrix B
```
[ 5  6 ]
[ 7  8 ]
```

We stagger the elements in the second row and second column by giving zero input initially to wait for the c00 to accumulate and pass the values.

and the expected output is 
 Matrix C =
```
[ 19  22 ]
[ 43  50 ]
```

## Simulation

Compile

iverilog -o sys.out pe.v sys_2x2.v sys_2x2TB.v

Run

vvp sys.out

Waveform

gtkwave sys.vcd

The waveform shows operand propagation and accumulation across the four Processing Elements.
 
## Reference

The dataflow explanation in this README is inspired by publicly available educational content on YouTube.  
I have included the video link for conceptual understanding of how operands propagate through a systolic array.

The Verilog implementation in this repository is written independently.

[youtube video]: https://www.youtube.com/watch?v=2VrnkXd9QR8
