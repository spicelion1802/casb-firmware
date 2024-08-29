# Central Analog Summing Board (CASB)

- Z-turn: `MYS-7Z020-V2`
  - https://www.myirtech.com/download/Zynq7000/Z-turnBoardV2.pdf 
  - A high-performance SingleBoard Computer (SBC) built around the Xilinx Zynq-7020 (XC7Z020) system-on-a-chip (SoC), featuring an integrated dual-core ARM Cortex-A9 processor (ARMv7-A architecture) with Xilinx 7-series Field Programmable Gate Array (FPGA) logic.
    
- OS: `PetaLinux 2023.2`
  - https://docs.amd.com/r/2023.2-English/ug1144-petalinux-tools-reference-guide/Overview
  - PetaLinux is an embedded Linux Software Development Kit (SDK) targeting FPGA-based SoC designs or FPGA designs. It is specifically designed and optimized for Xilinx FPGA-based systems like the Z-turn, and provides a well-integrated environment to develop, configure, and deploy embedded Linux on Xilinx hardware.

- Firmware: `Vivado 2023.2`
  - https://docs.amd.com/r/en-US/ug973-vivado-release-notes-install-license/Vivado-Naming-Conventions 
  - Written in VHDL. Uses the comparator outputs, delayed global trigger, lockout, and spare inputs to determine whether there should be a trigger. Reads configurables like reshape length from memroy registers. When possible use the latest version of last year's Vivado. Never use the most recent Vivado release.

- Software:
  - Written in Python3 and C++. Listens for a configuration file from the Data Aquisition System (DAQ), parses it, and sets thresholds and masks on the board accordingly. Digital to Analog Converter (DAC) output threshold voltages and Analog to Digical Converter (ADC) input voltages are communicated using I2C. Masks are switched on and off using GPIO. Writes firmware level configurables like reshape length to memory registers.

