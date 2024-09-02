
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
- `File` --> `Export` --> `Export Hardware` --> `Include bitstream` and export `casb_wrapper.xsa` to project directory 

### Start the software application in Vitis
- `Tools` --> `Launch Vitis IDE` 
- Make the Vitis workspace the same as Vivado

### Vitis Platform vs. Appllication 
- A `platform` in Vitis is the hardware abstraction layer on which your application runs. It defines the hardware environment and the software drivers necessary to interact with that hardware.
- An `application` in Vitis refers to the software that runs on the platform. It is the end-user code that you develop to achieve a specific function, like image processing, machine learning inference, or signal processing.

### Creating a platform component from HDL wrapper 
- `File` --> `New Component` --> `Platform`
- Name it `casb_platform` and make the location the Vivado working directory
- `Browse` --> `casb_wrapper.xsa`
- Set operating system to `standalone`, processor to `ps7_cortexa9_0`, and enable `Generate Boot artifacts`

### Creating an application project from the platform using a template
- `Examples` --> `Hello World` --> `Create Application Component from Template`
- Name it `hello_world` and make the location the Vivado working directory
- Select `casb_platform` as the platform
- Select `standalone_ps7_cortexa9_0` as the domain
- Use this code for `hello_world.c` instead:
```c
#include <stdio.h>
#include "platform.h"
int main()
{
    init_platform();
    printf("Hello World\n\r");
    printf("Successfully ran Hello World application");
    cleanup_platform();
    return 0;
}
```

### Build and run the application
- `Flow` -->`Build`
- Power the Z-turn by connecting USB cable to `USB_UART (the blue LED should be on)
- Connect JTAG cable to J1 on the ZTURN
- Jump P1 but not P2 to turn on boot via JTAG mode
```txt
pin 2 = VREF
pin 4 = TMS
pin 6 = TCK
pin 8 = TDO
pin 10 = TDI
pin 1/3/5/7/9/11 = GND
```
- Board initialization set to `TCL`
- Disable `Reset APU`
- Disable `Enable Cross Triggering`
- In terminal run
`screen /dev/ttyUSB0 115200`
- `Flow` --> `Run`
- Should see output via screen

### Hello World Tutorial
- https://www.myirtech.com/download/Zynq7000/A_Hello_World_tutorial_for_Z-turn_Board.pdf


# Bonus

### Creating an application project from the platform
- `File` --> `New Component` --> `Application`
- Name it `casb_component` and make the location the Vivado working directory
- Choose the `casb_platform` just created as the platform
- Choose the `standalone_ps7_cortexa9_0` domain

### Create the main C source code that controls the AXI GPIO peripherals
- `casb_component` --> `Sources` --> right click on `src` --> `New File` and name it `main.c`

### Change in Vitis 2023.2 GPIO functionality
In Vitis 2023/2, device IDs for GPIO IP cores are no longer included in `xparameters.h`. Instead, the initialization of GPIOs is now done using their base addresses directly. For example this old code
```c
#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"
 
// Get device IDs from xparameters.h
#define BTN_ID XPAR_AXI_GPIO_BUTTONS_DEVICE_ID
#define LED_ID XPAR_AXI_GPIO_LED_DEVICE_ID
#define BTN_CHANNEL 1
#define LED_CHANNEL 1
#define BTN_MASK 0b1111
#define LED_MASK 0b1111
 
int main() {
	XGpio_Config *cfg_ptr;
	XGpio led_device, btn_device;
	u32 data;
 
	xil_printf("Entered function main\r\n");
 
	// Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);
 
	// Initialize Button Device
	cfg_ptr = XGpio_LookupConfig(BTN_ID);
	XGpio_CfgInitialize(&btn_device, cfg_ptr, cfg_ptr->BaseAddress);
 
	// Set Button Tristate
	XGpio_SetDataDirection(&btn_device, BTN_CHANNEL, BTN_MASK);
 
	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);
 
	while (1) {
		data = XGpio_DiscreteRead(&btn_device, BTN_CHANNEL);
		data &= BTN_MASK;
		if (data != 0) {
			data = LED_MASK;
		} else {
			data = 0;
		}
		XGpio_DiscreteWrite(&led_device, LED_CHANNEL, data);
	}
}
```
now turns into this
```c
#include "xparameters.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_types.h"
 
// Get base addresses from xparameters.h
#define BTN_BASEADDR XPAR_AXI_GPIO_BUTTONS_BASEADDR
#define LED_BASEADDR XPAR_AXI_GPIO_LED_BASEADDR
#define BTN_CHANNEL 1
#define LED_CHANNEL 1
#define BTN_MASK 0b1111
#define LED_MASK 0b1111
 
int main() {
    XGpio_Config *cfg_ptr;
    XGpio led_device, btn_device;
    u32 data;
 
    xil_printf("Entered function main\r\n");
 
    // Initialize LED Device using base address
    cfg_ptr = XGpio_LookupConfig(LED_BASEADDR);
    if (cfg_ptr == NULL) {
        xil_printf("LED Device LookupConfig failed\r\n");
        return XST_FAILURE;
    }
    XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);
 
    // Initialize Button Device using base address
    cfg_ptr = XGpio_LookupConfig(BTN_BASEADDR);
    if (cfg_ptr == NULL) {
        xil_printf("Button Device LookupConfig failed\r\n");
        return XST_FAILURE;
    }
    XGpio_CfgInitialize(&btn_device, cfg_ptr, cfg_ptr->BaseAddress);
 
    // Set Button Tristate
    XGpio_SetDataDirection(&btn_device, BTN_CHANNEL, BTN_MASK);
 
    // Set LED Tristate
    XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);
 
    while (1) {
        data = XGpio_DiscreteRead(&btn_device, BTN_CHANNEL);
        data &= BTN_MASK;
        if (data != 0) {
            data = LED_MASK;
        } else {
            data = 0;
        }
        XGpio_DiscreteWrite(&led_device, LED_CHANNEL, data);
    }
}
```
The `xparameters.h` file now only defines base addresses rather than device IDs. This removes the uncessary itermediate step of translating a device ID to a base address. Instead of looking up GPIO configurations with a device ID, you use the GPIO's base address in functions like `XGpio_LookupConfig`

