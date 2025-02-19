# RAT Assignment 7

## Black Box
![alt text](https://i.imgur.com/M40Hybi.png)

## Behavior Description

For this assignment, we expanded our RAT MCU from RAT 6 by adding the stack pointer and scratch RAM entities, including most of the RAT MCU’s capabilities, except for ones that deal with interrupts. Since we already have created the scratch RAM in a previous experiment, the other task for this assignment was to build the stack pointer component. The stack pointer has an asynchronous reset designed to reset the stack pointer to zero, a synchronous load signal that allows loading data into the stack pointer, an 8-bit data signal, an increment signal, and a decrement signal. When the load signal is set high, the stack pointer loads the input data value.  Similar to what we did in RAT 6, we were able to run the test cases from PolyLearn. We first assembled the ASM files and then routed them in our MCU’s prog_rom. From there, we could see the results of the tests through the LEDs on the Basys 3 board. The verification section will explain in more detail our use of the seven segment display for the TestAll case.

## Context

A stack pointer is essentially a small register whose sole purpose is to keep track of memory addresses. It specifically allows us to implement a stack data structure, where new items are added to the top of a stack (push), and items on the stack can be taken off one at a time starting from the top of the stack (pull). Having this component allows us to perform a wider range of operations that require the stack data structure such as call, return, push, and pop. The stack pointer works in conjuction with the scratch ram, providing a memory address that corresponds to the stored data.

## Demo
<iframe width="560" height="315" src="https://www.youtube.com/embed/CLZi6hkLzfg?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
