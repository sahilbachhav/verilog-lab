# Half Adder — Verilog RTL Design & Verification

## Overview

This project implements and verifies a **1-bit Half Adder** using Verilog HDL.

A Half Adder is a combinational digital circuit that performs the addition of two 1-bit binary inputs. It produces two outputs: a **Sum** bit and a **Carry** bit.

The design was developed at the RTL level and verified through simulation using a dedicated Verilog testbench. The resulting waveforms were analyzed using GTKWave.

---

## Design Specification

### Inputs

| Signal | Width | Description         |
| ------ | ----: | ------------------- |
| `a`    | 1 bit | First binary input  |
| `b`    | 1 bit | Second binary input |

### Outputs

| Signal | Width | Description  |
| ------ | ----: | ------------ |
| `s`    | 1 bit | Sum output   |
| `c`    | 1 bit | Carry output |

---

## Functional Behavior

The Half Adder performs:

[
A + B = C \cdot 2 + S
]

The truth table is:

|  A  |  B  | Sum (`S`) | Carry (`C`) |
| :-: | :-: | :-------: | :---------: |
|  0  |  0  |     0     |      0      |
|  0  |  1  |     1     |      0      |
|  1  |  0  |     1     |      0      |
|  1  |  1  |     0     |      1      |

The corresponding Boolean expressions are:

[
S = A \oplus B
]

[
C = A \cdot B
]

Therefore, the Half Adder can be implemented using one XOR gate for the Sum and one AND gate for the Carry.

---

## RTL Implementation

The design is implemented using continuous assignments:

```verilog
assign s = a ^ b;
assign c = a & b;
```

The XOR operation generates the Sum, while the AND operation generates the Carry.

---

## Verification Strategy

A dedicated Verilog testbench was developed to verify the functional behavior of the RTL.

Since the design has two binary inputs, the complete input space contains:

[
2^2 = 4
]

possible input combinations.

The testbench applies all four combinations and observes both outputs.

### Expected Results

|  A  |  B  | Expected Sum | Expected Carry |
| :-: | :-: | :----------: | :------------: |
|  0  |  0  |       0      |        0       |
|  0  |  1  |       1      |        0       |
|  1  |  0  |       1      |        0       |
|  1  |  1  |       0      |        1       |

The simulation waveform was inspected using GTKWave to verify that the observed outputs match the expected truth table for every input combination.

---

## Simulation Flow

The design was simulated using **Icarus Verilog** and analyzed using **GTKWave**.

### Compile

```bash
iverilog -o half_adder_sim half_adder.v half_adder_tb.v
```

### Run Simulation

```bash
vvp half_adder_sim
```

### View Waveform

```bash
gtkwave half_adder.vcd
```

---

## Repository Structure

03_half_adder/
├── docs/
│   └── half_adder_output.png
│
├── rtl/
│   └── half_adder.v
│
├── tb/
│   └── half_adder_tb.v
│
├── waveform/
│   ├── half_adder_waveform.png
│   ├── half_adder.out
│   └── half_adder.vcd
│
└── README.md

### File Description

| File              | Description                                            |
| ----------------- | ------------------------------------------------------ |
| `half_adder.v`    | RTL implementation of the Half Adder                   |
| `half_adder_tb.v` | Verilog testbench containing the verification stimulus |
| `waveform.png`    | GTKWave simulation result                              |
| `README.md`       | Project documentation                                  |

---

## Verification Result

All **4 possible input combinations** were simulated.

The observed Sum and Carry outputs matched the expected truth table for every test case.

The waveform confirms the fundamental binary addition behavior:

```text
0 + 0 = 00
0 + 1 = 01
1 + 0 = 01
1 + 1 = 10
```

---

## Key Engineering Concepts

* Combinational RTL design
* Binary arithmetic
* Boolean-to-RTL translation
* Continuous assignments
* Exhaustive input-space verification
* Verilog testbench development
* VCD waveform generation
* RTL simulation and waveform analysis

---

## Tools

* **Verilog HDL**
* **Icarus Verilog**
* **GTKWave**
* **Visual Studio Code**

---

## Project Context

This project is part of a structured progression in **RTL Design and Digital Hardware Verification**.

The Half Adder serves as a fundamental arithmetic building block and provides the basis for constructing more complex arithmetic circuits.

**Design progression:**

```text
Logic Gates
     ↓
2:1 Multiplexer
     ↓
Half Adder
     ↓
Full Adder
     ↓
4-bit Ripple Carry Adder
     ↓
ALU
```

The objective is to develop each design from its functional specification through RTL implementation, simulation, and verification.
