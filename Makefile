# Design created during FPGAIgnite 2024 Conference Hackathon
# Unfortunatly the Tapeout there was lost due to the eFabless shutdown
# Name of the design
# -> THE RING <-

SRC_DIR=rtl
SIM_DIR=sim
OUT_DIR=out

SIM_FLAGS="-DSIMULATION"

simulate:
	iverilog -o $(OUT_DIR)/trng_top $(SIM_DIR)/ro_top_tb.v $(SRC_DIR)/trng_top.v $(SRC_DIR)/generic_ro.v $(SRC_DIR)/not_gate.v $(SIM_FLAGS)
	vvp $(OUT_DIR)/trng_top
	gtkwave $(OUT_DIR)/trng_top.vcd &

# Generate PDF of Yosys Design
run_yosys:
	yosys -s yosys.ys
