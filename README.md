# 8-bit RNG generator
Hello everyone,

this module seems to work - kind of :)
The quality of randomness will be interesting to observe!

On FPGA the numbers look somewhat random however there seem to be some trends towards some numbers.
You can use the Vivado project along with a Basys3 board to verify that.
The FPGA sends the generated 8-bit numbers via UART and they are dumped into a file on the host side using a python script.
Using a second Python script the histogram file seen in the py filder can be observed.

# What is needed for Tapeout
Just three files:
- ro_top.v
- generic_ro.v
- notGate.v
- Constraint file: config.json


# How design should be connected in Tapeout
We think it would be best to connect the design with its only 10 IOs to the FPGA fabric.
This will allow other teams to leverage this RNG source for example to generate cool patterns on the VGA design block
