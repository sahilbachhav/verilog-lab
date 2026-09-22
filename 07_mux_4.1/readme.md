# 4:1 Multiplexer

A **4:1 Multiplexer (MUX)** is a combinational digital circuit that selects one of four input signals and routes the selected signal to a single output based on two select lines.

## Design Overview

The multiplexer implements the following selection function:

| `s1` | `s0` | Output |
| :--: | :--: | :----: |
|   0  |   0  |   `a`  |
|   0  |   1  |   `b`  |
|   1  |   0  |   `c`  |
|   1  |   1  |   `d`  |

The RTL implementation uses a synthesizable `case` construct to describe the combinational selection logic.

## Interface

| Signal | Direction | Description                  |
| ------ | :-------: | ---------------------------- |
| `a`    |   Input   | Data input 0                 |
| `b`    |   Input   | Data input 1                 |
| `c`    |   Input   | Data input 2                 |
| `d`    |   Input   | Data input 3                 |
| `s1`   |   Input   | Most-significant select bit  |
| `s0`   |   Input   | Least-significant select bit |
| `y`    |   Output  | Selected data output         |

## Verification

The design is verified using a self-checking Verilog testbench.

* **64 input combinations** are generated automatically using a `for` loop.
* All possible combinations of the six 1-bit inputs are exercised.
* An independent expected-output model determines the correct MUX response.
* The DUT output is compared against the expected value.
* Each test case is reported as `PASS` or `FAIL`.

### Verification Coverage

```text
Total possible input combinations : 64
Test vectors executed             : 64
Select combinations               : 4
Data combinations                 : Exhaustive
Verification method               : Self-checking
```

## Project Structure

```text
07_mux_4_1/
├── rtl/
│   └── mux_4to1.v
├── tb/
│   └── mux_4to1_tb.v
├── waveform/
│   └── mux_4to1_waveform.vcd
└── docs/
    └── mux_4to1_waveform.png
```

## Expected Result

The simulation should report `PASS` for all 64 test vectors, confirming that the RTL correctly implements the specified 4:1 multiplexing function.

## Key Concepts

* Combinational RTL design
* Multiplexer architecture
* `case`-based selection logic
* Exhaustive simulation
* Self-checking testbench
* Automated test-vector generation

**Language:** Verilog HDL
**Design Type:** Combinational Logic
**Verification:** Exhaustive Simulation
