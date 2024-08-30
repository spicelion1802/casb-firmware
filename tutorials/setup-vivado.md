# How to setup Vivado

### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04 LTS`
- Vivado: `2023.2`

### Instructions
- Add this alias command to your `.bashrc` and call it every time before opening vivado.
```bash
alias vivado_2023="source /opt/Xilinx/Vivado/2023.2/settings64.sh"
```
- Enable full functionality by exporting Penn's Vivado license file
```bash
export XILINXD_LICENSE_FILE=1700@localhost
export LM_LICENSE_FILE=2700@localhost
```

### Creating a new project
- Open Vivado
```bash
vivado_2023
vivado
```
- Create Project
- RTL Project
- Change Target Lanugage to `VHDL`
- Skip Add Sources
- Skip Add Constraints
- Choose part `xc7z020clg400-1`


### Hello World Tutorial
- https://www.myirtech.com/download/Zynq7000/A_Hello_World_tutorial_for_Z-turn_Board.pdf
