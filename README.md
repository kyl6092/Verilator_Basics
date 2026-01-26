# Verilator_Basics
This repository records my user experience that I utilize the Verilator to simulate my designed circuits. The motivation is that more and more projects related to RISC-V Processor use the Verilator for verifying. I decide to prepare the some references to involved in the such projects.

## Usage
There are several examples for reference. Each example is basically structured by `sim` and `src` folders. In future, there may be `resources` for more rich verification in the Verilator simulation. Currently, this repo keeps some routines that I used in the Synopsys VCS, so more modifications on the handwritten testbench cooperated with the Verilator's built-in simulation are adopted instead of writting custom C++ files.

## Examples
### Counter
Description:
This module counts the number from 0 to the $2^n-1$, where n is defined by the parameter `width`.

Counter Ports:
* clk:    The clock.
* rst_n:  Asynchronous negative reset.
* en:     Enable signal. When en=1'b0, the module stops counting.
* out:    Output port for counted value.
---

# Reference
[Verilator](https://verilator.org/guide/latest/index.html)

