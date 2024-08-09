module top2 #(parameter SIZE = 8) (
    input clk,
    input en,
    output d_out
);

    input clk, en;
    output[SIZE-1:0] d_out;

    reg[SIZE-1:0] d_out_internal;
    wire[2*SIZE-1:0] ro_out;
    wire[SIZE-1:0] xor_out;

    // do not generate random number for too long pls

    genvar i;

    generate
        for (i = 0; i < SIZE; i++) begin
            generic_ro #(1) ro_1 (.en(en), .ro_out(ro_out[2*i]));
            generic_ro #(2) ro_2 (.en(en), .ro_out(ro_out[2*i+1]));
            assign xor_out[i] = ro_out[2*i] ^ ro_out[2*i+1];
        end
    endgenerate

    always @(posedge clk) begin
        d_out_internal <= xor_out;
    end

    assign d_out = d_out_internal;

endmodule