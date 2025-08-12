##Basys3
## Switches
set_property PACKAGE_PIN V17 [get_ports sw_i]					
	set_property IOSTANDARD LVCMOS33 [get_ports sw_i]
## LEDs
set_property PACKAGE_PIN U16 [get_ports led_red]					
	set_property IOSTANDARD LVCMOS33 [get_ports led_red]
set_property PACKAGE_PIN E19 [get_ports led_green]					
	set_property IOSTANDARD LVCMOS33 [get_ports led_green]
##Buttons
set_property PACKAGE_PIN U18 [get_ports rst_n]						
	set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]