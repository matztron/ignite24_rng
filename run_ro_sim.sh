iverilog -o out/ro_top ro_top_tb.v ro_top.v randModule.v notModule.v
vvp out/ro_top
gtkwave out/ro_top.vcd &