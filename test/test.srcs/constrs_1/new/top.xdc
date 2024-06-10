## Ensure that the bank's voltage level is correctly set to 1.8V for LVDS
set_property IOSTANDARD LVDS_25 [get_ports {lvds_in_p}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_in_n}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_out_p}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_out_n}]

## Map the input LVDS pair
set_property PACKAGE_PIN T11 [get_ports {lvds_in_p}]
set_property PACKAGE_PIN T10 [get_ports {lvds_in_n}]

## Map the output LVDS pair
set_property PACKAGE_PIN T12 [get_ports {lvds_out_p}]
set_property PACKAGE_PIN U12 [get_ports {lvds_out_n}]

## Diff terms
set_property DIFF_TERM TRUE [get_ports {lvds_in_p}]
set_property DIFF_TERM TRUE [get_ports {lvds_in_n}]

## Clock signal
set_property PACKAGE_PIN D19 [get_ports clk_out]
set_property IOSTANDARD LVCMOS25 [get_ports clk_out]

create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk_out]