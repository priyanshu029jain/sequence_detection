# 🛡️ Finite State Machine (FSM) Sequence Detectors

A rigorous, synthesizable hardware repository showcasing Finite State Machine (FSM) architectural paradigms in Verilog. This project implements and verifies both **Mealy** and **Moore** synchronous state machines designed to track specific bit-stream patterns (`1010` and `11011`) across overlapping and non-overlapping domain constraints.

---

## 📂 Repository Architecture

The workspace is organized into modular subdirectories, segregating FSM types and isolating testbench execution targets with pre-configured Vivado wave layouts:

```text
SEQUENCE_DETECTOR/
├── melay_nonOverlapping/       # Mealy Non-Overlapping Engine (1010 & 11011)
│   ├── melay_nonOverlapping_1010.v
│   ├── melay_nonOverlapping_1010.wcfg
│   ├── state_diagram_1010.png
│   └── wavwform_1010.png
├── melay_overlapping/          # Mealy Overlapping Engine (1010 & 11011)
│   ├── melay_overlapping_1010.v
│   ├── melay_overlapping_1010.wcfg
│   ├── state_diagram_1010.png
│   └── wavwform_1010.png
├── moore_nonOverlapping/       # Moore Non-Overlapping Engine (1010 & 11011)
│   ├── moore_nonOverlapping_1010.v
│   ├── moore_nonOverlapping_1010.wcfg
│   ├── state_daigram_1010.png
│   └── wavefrom_1010.png
├── moore_overlapping/          # Moore Overlapping Engine (1010 & 11011)
│   ├── moore_overlapping_1010.v
│   ├── moore_overlapping_1010.wcfg
│   ├── state_diagram_1010.png
│   └── waveform_1010.png
├── tb_sequence_detection.v     # Universal Testbench Suite
└── README.md                   # Repository Documentation Matrix
```

##🧠 Architectural Overview Matrix
This project explores the critical trade-offs between hardware area and output timing response paths:

###Mealy Machines
Behavior: The output is a function of both the current state and the current input.
Hardware Advantage: Typically requires fewer states ($N$ states for an $N$-bit sequence) than Moore implementations, reducing register-cell allocation overhead.
Timing Constraint: Outputs change asynchronously within the clock cycle if inputs glitch, requiring careful downstream registering.

###Moore Machines
Behavior: The output is strictly determined by the current state alone.Hardware 
Advantage: Outputs are perfectly synchronous, stable, and glitch-free, locked cleanly to the clock edge.
Design Trade-off: Requires an additional delay state ($N+1$ states for an $N$-bit sequence) to decode output activation.

##🔁 Sequence Handling Logic

###Overlapping Mode
The detector does not clear its tracking registers upon a valid pattern match. It treats the trailing bits of a valid sequence as the prefix of the next incoming stream.
Example Stream (1010): ...101010... evaluates to two separate match detections.

###Non-Overlapping Mode
Upon a valid pattern match, the machine forces an internal state reset back to IDLE, completely flushing the tracking sequence pipeline.
Example Stream (1010): ...101010... evaluates to one single match detection.

##💻 Simulation & Verification Flow
The design modules are verified via behavioral simulation targeting the Xilinx Vivado xsim runtime engine using the universal testbench tb_sequence_detection.v.

To view wave configurations inside Vivado:
1. Open your Vivado Design Suite project.
2. Add the target .v file and the unified tb_sequence_detection.v testbench to the simulation sources.
3. Run behavioral simulation.
4. Go to File -> Open Waveform Configuration and select the matching .wcfg file within the directory to load optimized signal groupings, radix properties, and state enum aliases instantly.