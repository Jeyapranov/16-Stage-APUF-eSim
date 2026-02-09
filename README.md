# 16-Stage Arbiter PUF (APUF) - eSim Design

A 16-stage Arbiter Physically Unclonable Function (APUF) circuit designed and simulated using **eSim 2.3** with CMOS 180nm technology.

[![eSim](https://img.shields.io/badge/Tool-eSim%202.3-blue)](https://esim.fossee.in/)
[![Technology](https://img.shields.io/badge/Technology-CMOS%20180nm-green)](https://esim.fossee.in/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Table of Contents

- [Introduction](#introduction)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Subcircuits](#subcircuits)
- [Simulation Setup](#simulation-setup)
- [Installation & Usage](#installation--usage)
- [Results](#results)
- [Tools Used](#tools-used)
- [References](#references)
- [Author](#author)

## Introduction

**Arbiter Physically Unclonable Function (APUF)** is a hardware security primitive that exploits manufacturing process variations to generate unique, device-specific cryptographic keys. The uniqueness comes from inherent delay differences in nominally identical circuit paths.

This project implements a **16-stage APUF** using:
- 2:1 Multiplexer (MUX) switching stages
- Buffer chains for signal propagation
- SR Latch (using cross-coupled NAND gates) for output arbitration

The APUF generates a unique response bit based on the race condition between two parallel signal paths, where the winner is determined by accumulated delay variations across all 16 stages.

## Architecture

```
                    Challenge Bits (C0-C15)
                           │
    ┌──────────────────────┼──────────────────────┐
    │                      ▼                       │
    │   ┌─────┐   ┌─────┐   ┌─────┐        ┌─────┐│
────┼──►│MUX 0│──►│MUX 1│──►│MUX 2│──......│MUX15││
    │   │     │   │     │   │     │        │     ││
────┼──►│Stage│──►│Stage│──►│Stage│        │Stage││
    │   └─────┘   └─────┘   └─────┘        └─────┘│
    │      │         │         │              │   │
    │      ▼         ▼         ▼              ▼   │
    │   Buffer    Buffer    Buffer         Buffer │
    │      │         │         │              │   │
    │      └─────────┴─────────┴──────────────┘   │
    │                      │                       │
    │               ┌──────┴──────┐               │
    │               │  SR Latch   │               │
    │               │(NAND-based) │               │
    │               └──────┬──────┘               │
    │                      │                       │
    └──────────────────────┼──────────────────────┘
                           ▼
                    Response Bit (R)
```

### Working Principle

1. **Input Signals**: Two identical rising edges are fed simultaneously to both paths
2. **Challenge Application**: 16-bit challenge vector controls the cross/straight switching at each MUX stage
3. **Delay Accumulation**: Signals race through 16 stages, accumulating unique delays
4. **Arbitration**: SR latch determines which signal arrives first
5. **Output Generation**: Response bit (0 or 1) based on the winning path

## Project Structure

```
16-Stage-APUF---eSim/
│
├── README.md                    # Project documentation
├── .gitignore                   # Git ignore file
├── LICENSE                      # License file
│
├── schematics/                  # Schematic design files
│   ├── 16_stage_apuf.sch        # Main APUF schematic
│   ├── MUX2-1.sch               # 2:1 MUX schematic
│   ├── buffer.sch               # Buffer schematic
│   └── nand.sch                 # NAND gate schematic
│
├── netlists/                    # SPICE netlists
│   ├── 16_stage_apuf.cir        # Main circuit netlist
│   ├── MUX2-1.cir               # MUX netlist
│   ├── buffer.cir               # Buffer netlist
│   └── nand.cir                 # NAND netlist
│
├── subcircuits/                 # Subcircuit definitions
│   ├── MUX2-1.sub               # 2:1 MUX subcircuit
│   ├── buffer.sub               # Buffer subcircuit
│   └── nand.sub                 # NAND subcircuit
│
├── libraries/                   # Technology libraries
│   ├── NMOS-180nm.lib           # NMOS 180nm model
│   └── PMOS-180nm.lib           # PMOS 180nm model
│
├── simulation/                  # Simulation data
│   ├── plot_data_v.txt          # Voltage plot data
│   └── plot_data_i.txt          # Current plot data
│
├── projects/                    # eSim project files
│   ├── 16_stage_apuf.proj       # Main project file
│   ├── MUX2-1.pro               # MUX project
│   ├── buffer.pro               # Buffer project
│   └── nand.pro                 # NAND project
│
└── docs/                        # Documentation
    └── ABSTRACT_esim.pdf        # Project abstract
```

## Subcircuits

### 1. 2:1 Multiplexer (MUX2-1)

**Purpose**: Selects between crossed or straight path based on challenge bit.

| Pin | Description |
|-----|-------------|
| /a  | Input A |
| /b  | Input B |
| /sel | Select line |
| /sel_b | Complementary select |
| /out | Output |

**Technology**: CMOS 180nm (W=100μm, L=100μm)
**Supply Voltage**: 1.8V

### 2. Buffer

**Purpose**: Signal propagation and introduces controlled delay between stages.

| Pin | Description |
|-----|-------------|
| /in | Input signal |
| /out | Buffered output |

**Technology**: CMOS 180nm (PMOS: W=1.6μm, NMOS: W=0.8μm, L=0.18μm)
**Supply Voltage**: 1.8V

### 3. NAND Gate

**Purpose**: Used to construct SR Latch for race arbitration.

| Pin | Description |
|-----|-------------|
| Input 1 | First input |
| Input 2 | Second input |
| Output | NAND output |

**Technology**: CMOS 180nm (W=100μm, L=100μm)
**Supply Voltage**: 1.8V

## Simulation Setup

### Transient Analysis Parameters

- **Analysis Type**: Transient
- **Time Step**: Variable (auto)
- **Simulation Duration**: Based on propagation delay requirements

### Input Signals

- Pulse voltage sources for challenge bits (clg_0 to clg_15)
- Complementary challenge signals (clgb_0 to clgb_15)
- Input trigger signals (a, b)

## Installation & Usage

### Prerequisites

1. **eSim 2.3** - Download from [FOSSEE eSim](https://esim.fossee.in/downloads)
2. Windows/Linux operating system

### Steps to Run

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Jeyapranov/16-Stage-APUF---eSim.git
   cd 16-Stage-APUF---eSim
   ```

2. **Open in eSim**
   - Launch eSim 2.3
   - Navigate to `File → Open Project`
   - Select `projects/16_stage_apuf.proj`

3. **Run Simulation**
   - Open the schematic from KiCad
   - Convert to Netlist
   - Run NgSpice simulation
   - View waveforms using plot utilities

4. **Analyze Results**
   - Observe output response at `out1`, `out2`, `out3`, `out4`
   - Compare propagation delays between paths
   - Verify SR latch operation

## Results

The simulation demonstrates:
- Proper signal propagation through all 16 MUX stages
- Buffer delay insertion between stages
- SR latch correctly arbitrating between racing signals
- Unique response generation based on challenge vector

## Tools Used

| Tool | Version | Purpose |
|------|---------|---------|
| eSim | 2.3 | Circuit design & simulation |
| KiCad | (bundled) | Schematic capture |
| NgSpice | (bundled) | SPICE simulation |
| Python | (bundled) | Plotting & analysis |

## References

1. B. Gassend et al., "Silicon physical random functions," ACM CCS, 2002
2. D. Lim et al., "Extracting secret keys from integrated circuits," IEEE TVLSI, 2005
3. [FOSSEE eSim Documentation](https://esim.fossee.in/documentation)
4. [Arbiter PUF - Wikipedia](https://en.wikipedia.org/wiki/Physical_unclonable_function#Arbiter_PUF)

## Author

**Jeyapranov**
- GitHub: [@Jeyapranov](https://github.com/Jeyapranov)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <b>Designed with eSim | FOSSEE | IIT Bombay</b>
</p>
