
# Creating a new project in Vivado

### My Setup
- Board: `MYS-7Z020-V2`
- Vivado: `2023.2`

### Instructions
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

### Create and configure the processor system
- When Vivado opens, in the flow navigator pane (left) click on `create block design`
- An empty diagram opens, click `+` to add an IP called `ZYNQ7 Processing System` and then double click on the block to configure it
- `PS-PL` --> `General` --> `UART1 Baud Rate` should be 115200
- `PS-PL` --> `General` --> `Enable Clock Resets` --> `FCLK_RESET0_N` should be disabled
- `PS-PL` --> `General` --> `AXI Non Secure Enablement` --> `GP Master AXI Interface` --> `M AXI GP0 interface` should be disabled
- Under `Peripheral I/O Pins` only `UART 1` should be enabled. Do this by clicking on the `UART 1` button **under column 48-49**
- Under `Peripheral I/O Pins` set `Bank 0` to 3.3V and `Bank 1` to 1.8V
- Under `MIO Configuration` --> `I/O Peripherals` make sure everything is diabled expcept `UART 1` and the Bank voltages are correct.
- `Clock Configuration` --> `Input Frequency` should be 33.333 MHz
- `Clock Configuration` --> `Processor/Memory Clocks` --> `CPU` should have `ARM PLL` clock source
- `Clock Configuration` --> `PL Fabric Clocks` --> `FCLK_CLK0` should be disabled
- `DDR Configuration` --> `Enable DDR` should be disabled
- Under `Interrupts` ensure everything is diabled
- The `processing_system7_0` block should have shrunk to one output
- Click the `+` to expand
- Right click the three lines next to `FIXED_IO` and select `Make External`
- Hit `F6` to check for errors 
- `Sources` --> `Design Sources` --> right click on `.bd` and select `Generate Output Products`
- Choose the `Global` synthesis option and then generate. This will updat the heirarchy in the sources pannel

### Wrap up the design with HDL
- `Sources` --> `Design Sources` --> right clock on `.bd` and select `Create HDL Wrapper`
- In the pop-up window select `Let Vivado`
- There is now a VHDL top file that instantiates our design
- `Run Synthesis` (convert VHDL into netlist of logic gates)
- `Implement` (prepare netlist of logic gates for loading onto FPGA)
- `Generate Bitstream` (create binary file that configures FPGA)
- `File` --> `Export` --> `Export Hardware` --> `Include bitstream` and export to project directory 
- `Tools` --> `Launch Vitis IDE` 


### Hello World Tutorial
- https://www.myirtech.com/download/Zynq7000/A_Hello_World_tutorial_for_Z-turn_Board.pdf
