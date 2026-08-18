# 2:1 Multiplexer — Verilog RTL Design & Verification

## Overview

This project implements and verifies a **2:1 Multiplexer (MUX)** using Verilog HDL.

A multiplexer is a combinational circuit that selects one of multiple input signals and routes the selected signal to a single output. In a 2:1 MUX, the select signal determines whether input `A` or input `B` is propagated to the output.

The design was developed at the RTL level and verified through simulation using a dedicated Verilog testbench. The resulting waveforms were analyzed using GTKWave.

---

## Design Specification

### Inputs

| Signal | Width | Description   |
| ------ | ----: | ------------- |
| `a`    | 1 bit | Data input 0  |
| `b`    | 1 bit | Data input 1  |
| `s`    | 1 bit | Select signal |

### Output

| Signal | Width | Description     |
| ------ | ----: | --------------- |
| `y`    | 1 bit | Selected output |

### Functional Behavior

| `s` | `y` |
| :-: | :-: |
|  0  | `a` |
|  1  | `b` |

The corresponding Boolean expression is:

[
Y = \overline{S}A + SB
]

---

## RTL Implementation

The design is implemented using a continuous assignment:

```verilog
assign y = ((~s & a) | (s & b));
```

This implementation directly represents the Boolean equation of the multiplexer.

When `s = 0`:

```text
Y = A
```

When `s = 1`:

```text
Y = B
```

---

## Verification Strategy

A dedicated self-contained testbench was developed to verify the functional behavior of the RTL.

The design contains three binary inputs, resulting in:

[
2^3 = 8
]

possible input combinations.

The testbench applies all eight combinations and observes the resulting output.

### Expected Results

|  A  |  B  |  S  | Expected Y |
| :-: | :-: | :-: | :--------: |
|  0  |  0  |  0  |      0     |
|  0  |  0  |  1  |      0     |
|  0  |  1  |  0  |      0     |
|  0  |  1  |  1  |      1     |
|  1  |  0  |  0  |      1     |
|  1  |  0  |  1  |      0     |
|  1  |  1  |  0  |      1     |
|  1  |  1  |  1  |      1     |

The simulation output was inspected using GTKWave to confirm that the RTL behavior matched the expected functional specification.

---

## Simulation Flow

The project was simulated using **Icarus Verilog** and analyzed using **GTKWave**.

### Compile

```bash
iverilog -o mux_2to1_sim mux_2to1.v mux_2to1_tb.v
```

### Run Simulation

```bash
vvp mux_2to1_sim
```

### View Waveform

```bash
gtkwave mux_2to1.vcd
```

---

## Repository Structure

02_mux_2.1/
├── docs/
│   └── 2.1_multiplexer_output.png
│
├── rtl/
│   └── mux_2to1.v
│
├── tb/
│   └── mux_2to1_tb.v
│
├── waveform/
│   ├── 2.1_multiplexer_waveform.png
│   ├── mux_2to1.out
│   └── mux_2to1.vcd
│
└── README.md

### File Description

| File            | Description                                            |
| --------------- | ------------------------------------------------------ |
| `mux_2to1.v`    | RTL implementation of the 2:1 multiplexer              |
| `mux_2to1_tb.v` | Verilog testbench containing the verification stimulus |
| `waveform.png`  | GTKWave simulation result                              |
| `README.md`     | Project documentation                                  |

---

## Verification Result

All **8 possible input combinations** were simulated and the observed output matched the expected truth table for every case.

The waveform demonstrates correct selection behavior for both values of the select signal:

```text
S = 0  →  Y follows A
S = 1  →  Y follows B
```

---

## Key Engineering Concepts

* Combinational RTL design
* Boolean-to-RTL translation
* Continuous assignments
* Module instantiation
* Testbench development
* Exhaustive input-space verification
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

This project is part of a structured progression in **RTL Design and Digital Hardware Verification**, progressing from fundamental combinational circuits toward larger digital systems and eventually SystemVerilog-based verification.

**Current design progression:**

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

The objective is to develop each design from its functional specification through RTL implementation, simulation, and verification rather than treating the RTL code as a standalone exercise.
