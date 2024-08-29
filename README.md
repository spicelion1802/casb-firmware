# Central Analog Summing Board (CASB)
How to set up the OS, firmware, and software on the Z-turn used by the CASB

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
  - Written in Python3.?. Listens for a configuration file from the Data Aquisition System (DAQ), parses it, and sets thresholds and masks on the board accordingly. Digital to Analog Converter (DAC) output threshold voltages and Analog to Digical Converter (ADC) input voltages are communicated using I2C. Masks are switched on and off using GPIO. Writes firmware level configurables like reshape length to memory registers.

# My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04`

# Installing Vivado
- Download the binary executable `.bin` 2023.2 Linux Self Extraxting Web Installer file from https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html and make it an executable
```bash
chmod +x filename.bin
```
- Verify it is now an exectuable by checking for `-rwxr-xr-x` in the permissions
```bash
ls -l filename.bin
```
- Run the executable
```bash
./filename.bin
```
- Istall the Vivado ML Enterprise edition in `/opt/Xilinx`. To grant read and write permissions of `/opt` to everyone run
```bash
sudo chmod 777 /opt
```

# If the Installer Fails
- Try installing the following libraries and run the executable again
```bash
sudo apt install libtinfo6 libtinfo5 libtinfo-dev
```
- If the installer still fails, verify that the display is exporting correctly by running xclock
```bash
xclock
```
- If xclock works, maybe the OS is not compatable because it was upgraded with
```bash
sudo apt update
```
- If the OS has not been accidentaly upgraded, try downloading the `tar.gz` 2023.2 all OS single-file download
- AMD recommends the use of 7-zip to decompress the downloaded tar.gz file
```bash
sudo apt install p7zip-full
```
- Use 7-zip to extract the .tar file from the .tar.gz file
```bash
7z x filename.tar.gz
```
- Use tar to extract the contents of the .tar file
```bash
tar -xvf filename.tar
```
- Install any missing dependent libraries required by Vivado
```bash
 sudo /FPGAs_AdaptiveSoCs_Unified_2023.2_*/installLibs.sh
```
- Run xsetup to launch the installation
```bash
sudo ./FPGAs_AdaptiveSoCs_Unified_2023.2*/xsetup
```

# Setting up Vivado

# Creating Vivado Project

# Installing PetaLinux




- ~/.bashrc
    - vivado_2023()
- board file
- petalinux dependencies







Instructions for creating simple zturn firmware that takes in an LVDS signal, buffers it, and then outputs the LVDS signal. This was done using Vivado 2016.4 :)

1) Create new project -> Add sources (left hand side under project manager)
