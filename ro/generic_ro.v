module generic_ro #(parameter SIZE = 1) (
    input en,
    output ro_out
);

    wire[2*SIZE:0] interm_wires;
    assign interm_wires[0] = ~(interm_wires[2*SIZE] & en);
    assign ro_out = interm_wires[2*SIZE];

    genvar i;

    generate
        for (i = SIZE*2; i > 0; i--) begin
            notGate n(interm_wires[i-1], interm_wires[i]);
        end
    endgenerate

endmodule