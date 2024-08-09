module ro_top(clk, en, d_out);
    input clk, en;
    output[7:0] d_out;

    reg[7:0] d_out_internal;
    wire[15:0] ro_out;
    wire[7:0] xor_out;

    // do not generate random number for too long pls
    randModule rm0(.en(en), .randOut(ro_out[0]));
    randModule rm1(.en(en), .randOut(ro_out[1]));
    randModule rm2(.en(en), .randOut(ro_out[2]));
    randModule rm3(.en(en), .randOut(ro_out[3]));
    randModule rm4(.en(en), .randOut(ro_out[4]));
    randModule rm5(.en(en), .randOut(ro_out[5]));
    randModule rm6(.en(en), .randOut(ro_out[6]));
    randModule rm7(.en(en), .randOut(ro_out[7]));

    randModule rm8(.en(en), .randOut(ro_out[8]));
    randModule rm9(.en(en), .randOut(ro_out[9]));
    randModule rm10(.en(en), .randOut(ro_out[10]));
    randModule rm11(.en(en), .randOut(ro_out[11]));
    randModule rm12(.en(en), .randOut(ro_out[12]));
    randModule rm13(.en(en), .randOut(ro_out[13]));
    randModule rm14(.en(en), .randOut(ro_out[14]));
    randModule rm15(.en(en), .randOut(ro_out[15]));

    assign xor_out[0] = ro_out[0] ^ ro_out[1];
    assign xor_out[1] = ro_out[2] ^ ro_out[3];
    assign xor_out[2] = ro_out[4] ^ ro_out[5];
    assign xor_out[3] = ro_out[6] ^ ro_out[7];
    assign xor_out[4] = ro_out[8] ^ ro_out[9];
    assign xor_out[5] = ro_out[10] ^ ro_out[11];
    assign xor_out[6] = ro_out[12] ^ ro_out[13];
    assign xor_out[7] = ro_out[14] ^ ro_out[15];


    always @(posedge clk) begin
        d_out_internal <= xor_out;
    end

    assign d_out = d_out_internal;

endmodule