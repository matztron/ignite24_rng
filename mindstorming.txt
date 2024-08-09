// _Loosely coupled accelerator_
// memory mapped? how interface has to look?
module rng(
    input en, // turns on the RO
    input clk,
    input [31:0] mem_addr,
    output [31:0] out
)

// Registers:
// Control reg (enable)
// Result reg
// ---

//FSM
//...
// States: Idle, Sample 

// Ring oscillator No1
// what physical contraints do we need here?
// can we simulate this? Look at timing report for feedback loop...
//...
// Sample RO
always@(posedge clk) begin
    out[0] <= ro_0;
end

// Ring oscillator No2
//...
// Sample RO
always@(posedge clk) begin
    out[0] <= ro_0;
end

// XOR together the ring oscillator values
// ...


endmodule

// Constraints:
// - space RO circuits as far apart as possible?
// - how can we get a worse clock? (we want a lot of skew)

// Q:
// Having multiple RO circuits - should the number of inverter elements be prime to each other? -> So they do not get in sync?
// How fast is the RISC-V core running f?

// Specs:
// 4 RO per bit