````md
# Full Subtractor

A **Full Subtractor** is a combinational digital circuit that performs the subtraction of two binary bits along with an input borrow.

This implementation uses **two Half Subtractors and an OR gate**, demonstrating a structural RTL design approach in Verilog.

---

## Overview

The Full Subtractor performs:

```text
A - B - Bin
````

### Inputs

| Signal | Description  |
| :----: | ------------ |
|   `A`  | Minuend      |
|   `B`  | Subtrahend   |
|  `Bin` | Borrow Input |

### Outputs

| Signal | Description   |
| :----: | ------------- |
|   `D`  | Difference    |
| `Bout` | Borrow Output |

---

## Logic Equations

### Difference

```text
D = A ⊕ B ⊕ Bin
```

### Borrow

```text
Bout = (~A & B) | (~A & Bin) | (B & Bin)
```

---

## Structural Design

The Full Subtractor is constructed using:

* **2 × Half Subtractors**
* **1 × OR gate**

```text
                         ┌─────────────────┐
                    A ──►│                 │
                    B ──►│ Half Subtractor │
                         │      HS1        │
                         └───────┬─────────┘
                                 │
                         ┌───────┴───────┐
                         │               │
                        D1              B1
                         │               │
                         ▼               │
                    ┌─────────────────┐  │
               Bin ─►│                 │  │
                    │ Half Subtractor │  │
                    │      HS2        │  │
                    └───────┬─────────┘  │
                            │             │
                           D             B2
                            │             │
                            │             ▼
                            │        ┌─────────┐
                            │        │   OR    │◄── B1
                            │        └────┬────┘
                            │             │
                            ▼             ▼
                            D            Bout
```

### Signal Flow

```text
A, B
 │
 ▼
HS1
 │
 ├── D1 ──────────┐
 │                │
 └── B1           ▼
              ┌───────┐
Bin ─────────►│  HS2  │
              └───┬───┘
                  │
                  ├── D
                  │
                  └── B2
                       │
              B1 ──────┤
                       ▼
                      OR
                       │
                       ▼
                      Bout
```

---

## Truth Table

|  A  |  B  | Bin |  D  | Bout |
| :-: | :-: | :-: | :-: | :--: |
|  0  |  0  |  0  |  0  |   0  |
|  0  |  0  |  1  |  1  |   1  |
|  0  |  1  |  0  |  1  |   1  |
|  0  |  1  |  1  |  0  |   1  |
|  1  |  0  |  0  |  1  |   0  |
|  1  |  0  |  1  |  0  |   0  |
|  1  |  1  |  0  |  0  |   0  |
|  1  |  1  |  1  |  1  |   1  |

---

## Implementation Approach

The design follows a **hierarchical structural RTL approach**:

1. **HS1** subtracts `B` from `A` and produces the intermediate difference `D1` and borrow `B1`.
2. **HS2** subtracts `Bin` from `D1` and produces the final difference `D` and borrow `B2`.
3. An **OR operation** combines `B1` and `B2` to generate the final borrow `Bout`.

This approach demonstrates how smaller, reusable RTL modules can be interconnected to construct larger digital systems.

---

## Verification

The Full Subtractor is verified using a dedicated Verilog testbench.

The testbench:

* Generates all **8 possible input combinations** automatically.
* Uses a `for` loop for exhaustive test-vector generation.
* Monitors input and output signals during simulation.
* Generates a **VCD waveform file** for signal analysis.
* Supports waveform visualization using **GTKWave**.

---

## Simulation Flow

```text
RTL + Testbench
       │
       ▼
 Icarus Verilog
       │
       ▼
 Simulation
       │
       ├── Console Output
       │
       └── VCD Waveform
                │
                ▼
             GTKWave
```

---

## Directory Structure

```text
06_full_subtractor/
│
├── rtl/
│   └── full_sub.v
│
├── tb/
│   └── full_sub_tb.v
│
├── waveform/
│   └── full_sub.vcd
│
└── README.md
```

---

## Tools Used

* **Verilog HDL**
* **Icarus Verilog**
* **GTKWave**
* **VS Code**

---

## Key Concepts

* Combinational Logic
* Full Subtractor
* Half Subtractor
* Structural RTL
* Module Instantiation
* Hierarchical Design
* Internal Wire Connections
* Boolean Logic
* Exhaustive Testbench Verification
* VCD Waveform Analysis

---

## Learning Outcome

This project demonstrates the ability to:

* Design a Full Subtractor using reusable hardware modules.
* Translate a circuit diagram into structural Verilog RTL.
* Connect module ports using internal wires.
* Build hierarchical digital designs.
* Automate test-vector generation using Verilog loops.
* Simulate and inspect RTL behavior using VCD waveforms.

---

## Status

**Completed**

Part of the `verilog-lab` collection — a hands-on series of digital design and RTL projects focused on building, simulating, and verifying fundamental hardware modules.

```
```
