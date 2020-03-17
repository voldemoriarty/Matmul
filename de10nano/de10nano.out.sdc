create_clock -name {clk} -period 20.000 [get_ports {clk}]
derive_pll_clocks
derive_clock_uncertainty

# reset port constraint
set_false_path -from [get_ports rst]

# jtag constraints
# for enhancing USB BlasterII to be reliable, 25MHz
create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]
set_clock_groups -asynchronous -group [get_clocks altera_reserved_tck]
