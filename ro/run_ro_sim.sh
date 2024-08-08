iverilog -o out/ro ro_tb.v ro.v inv.v
vvp out/ro
#gtkwave out/ro.vcd &