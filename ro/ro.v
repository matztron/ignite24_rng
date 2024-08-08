module ro #(
    parameter NUM_INV = 3 // should be odd
)(
    input en,
    input clk,
    input res_n,
    //output [NUM_INV-1:0] interm_wires
    output q
);

(* keep *) wire [NUM_INV-1:0] interm_wires /* synthesis keep */;
//wire w0, w1, w2;

genvar i;
generate
    for (i = 0; i < NUM_INV-1; i = i+1) begin
        assign #5 interm_wires[i] = ~res_n ? ( ($signed(i%2) == 0) ? 1'b0 : 1'b1) : ~interm_wires[i+1];
        /*(* keep *) inv inv_I(
            .i(interm_wires[i+1]),
            .q(interm_wires[i])
        );*/
    end
endgenerate


//assign interm_wires[0] = ~interm_wires[1];
//assign interm_wires[1] = ~interm_wires[2];

//assign w0 = ~w1;
//assign w1 = ~w2;

// feedback NAND

assign #5 interm_wires[NUM_INV-1] = ~(en & interm_wires[0]);
assign q = interm_wires[0];

//assign w2 = ~(en & w0);
//assign q = w0;

endmodule

//[0]
//- Wire0
//[1]
//- Wire1
//[2]
//- Wire2