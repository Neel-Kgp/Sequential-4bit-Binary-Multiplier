# Sequential 4×4-Bit Binary Multiplier using Verilog HDL

## Overview

This project implements a **4×4-bit sequential binary multiplier** based on the principle of **repeated addition**, one of the simplest hardware techniques for performing binary multiplication. Instead of generating the product in a single combinational step, the multiplicand is repeatedly added to an accumulator for a number of clock cycles equal to the value of the multiplier. This sequential approach reduces hardware complexity at the cost of increased computation time and forms the basis of many elementary arithmetic units used in digital systems.

The design multiplies two **4-bit unsigned binary numbers** to produce an **8-bit product**. The hardware implementation consists of **two IC 7483 4-bit binary adders** cascaded to form an 8-bit adder, an **IC 74193 synchronous up/down counter** to count the remaining addition cycles, an **IC 74374 8-bit register** to store the accumulated product, and **IC 7432 OR gates** for the required control logic. A clock signal synchronizes the sequential operation. During each clock cycle, the multiplicand is added to the current contents of the product register while the counter is decremented. The multiplication process terminates when the counter reaches zero, leaving the final product stored in the accumulator.

To complement the hardware implementation, the same architecture is modeled in **Verilog HDL**, allowing functional verification through simulation using **Icarus Verilog** and **GTKWave**. Implementing both the hardware circuit and its RTL equivalent demonstrates the correspondence between digital logic built with discrete ICs and modern hardware description languages used in FPGA and ASIC design.

---

## Features

- 4×4-bit unsigned binary multiplication
- Sequential multiplication using repeated addition
- 8-bit product register (Accumulator)
- Counter-controlled iterative operation
- RTL implementation in Verilog HDL
- Functional simulation using Icarus Verilog
- Waveform verification using GTKWave
- Hardware implementation using TTL ICs

---

## Hardware Components

| Component | Purpose |
|-----------|---------|
| IC 7483 (×2) | 8-bit Binary Adder |
| IC 74193 | 4-bit Up/Down Counter |
| IC 74374 | 8-bit Register (Accumulator) |
| IC 7432 | OR Gates for Control Logic |
| Function Generator | Clock Source |

---

## Algorithm

1. Initialize the product register (accumulator) to zero.
2. Load the multiplier into the counter.
3. On every clock pulse:
   - Add the multiplicand to the accumulator.
   - Decrement the counter.
4. Repeat until the counter reaches zero.
5. The accumulator now contains the final 8-bit product.

---

## Project Structure

```text
Sequential-4bit-Binary-Multiplier
│
├── rtl
│   └── 4bit_multiplier.v
│
├── testbench
│   └── 4bit_multiplier_tb.v
│
├── hardware
│   ├── breadboard.jpg
│   ├── circuit_diagram.png
│   └── lab_report.pdf
│
├── waveforms
│   └── multiplier_waveform.png
│
├── docs
│   └── architecture.png
│
└── README.md
```

---

## Simulation

### Compile

```bash
iverilog -o sim rtl/4bit_multiplier.v testbench/4bit_multiplier_tb.v
```

### Run

```bash
vvp sim
```

### View Waveforms

```bash
gtkwave multiplier.vcd
```

---

## Example

For:

```
Multiplicand = 3
Multiplier   = 4
```

Operation:

```
0 + 3 = 3
3 + 3 = 6
6 + 3 = 9
9 + 3 = 12
```

Final Product:

```
00001100₂ = 12₁₀
```

---

## Results

### RTL Simulation

*Insert GTKWave screenshot here.*

### Hardware Implementation

*Insert breadboard image here.*

### Circuit Diagram

*Insert circuit diagram here.*

---

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Digital Logic Design

---

## Applications

- Arithmetic Logic Units (ALUs)
- Processor Datapaths
- Sequential Arithmetic Circuits
- FPGA/ASIC RTL Design
- Digital System Design

---

## Future Improvements

- Shift-and-Add Multiplier
- Booth Multiplier
- Wallace Tree Multiplier
- Parameterized N-bit Multiplier
- Finite State Machine (FSM) Controller

---

## Author

**Neelesh**  
Department of Electrical Engineering  
Indian Institute of Technology Kharagpur
