# Half Subtractor

A **Half Subtractor** is a combinational logic circuit used to subtract two single-bit binary numbers. It produces two outputs: **Difference** and **Borrow**.

## Logic

* **Difference:** `A ⊕ B`
* **Borrow:** `A̅ · B`

## Truth Table

|  A  |  B  | Difference | Borrow |
| :-: | :-: | :--------: | :----: |
|  0  |  0  |      0     |    0   |
|  0  |  1  |      1     |    1   |
|  1  |  0  |      1     |    0   |
|  1  |  1  |      0     |    0   |

## Implementation

The Half Subtractor is implemented in **Verilog HDL** using continuous assignments and basic Boolean operators.

## Verification

A dedicated **Verilog testbench** is used to verify all possible input combinations and confirm the expected Difference and Borrow outputs.

## Project Structure

```text
06_half_subtractor/
├── rtl/
│   └── half_sub.v
├── tb/
│   └── half_sub_tb.v
├── waveform/
│   └── half_sub_waveform.png
├── docs/
│   └── project_output.png
└── README.md
```

## Tools

* **HDL:** Verilog
* **Simulation:** Icarus Verilog
* **Waveform:** GTKWave

## Result

The Half Subtractor successfully produces the correct **Difference** and **Borrow** outputs for all possible input combinations.


