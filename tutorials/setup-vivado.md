# How to setup Vivado

### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04 LTS`
- Vivado: `2023.2`

### Instructions
- Add this alias command to your `.bashrc` and call it every time before opening Vivado.
```bash
alias vivado_2023="source /opt/Xilinx/Vivado/2023.2/settings64.sh"
```
- Enable full functionality by exporting Penn's Vivado license file
```bash
export XILINXD_LICENSE_FILE=1700@localhost
export LM_LICENSE_FILE=2700@localhost
```
### Board Files
- Need to move the board files to where Vivado can see them. I stored them in the `board-files` folder
```
mv /path/to/casb-firmware/board_stuff/board_files/* /opt/Xilinx/Vivado/<version>/data/boards/board_files/
```
