// Meaning SIZE parameter:
// SIZE=1 : 2inv + NAND -> 3 inv elements
// SIZE=2 : 4inv + NAND -> 5 inv elements
// SIZE=3 : 6inv + NAND -> 7 inv elements
module generic_ro #(parameter SIZE = 2) (
    input en,
    output ro_out
);

    wire[2*SIZE:0] interm_wires;
    //assign #1 interm_wires[0] = ~(interm_wires[2*SIZE] & en);
    assign interm_wires[0] = ~(interm_wires[2*SIZE] & en); // for synthesis
    assign ro_out = interm_wires[2*SIZE];

    genvar i;

    generate
        for (i = SIZE*2; i > 0; i=i-1) begin
            notGate n(interm_wires[i-1], interm_wires[i]);
        end
    endgenerate

endmodule