module ro_tb();

    reg en_tb;
    reg clk;
    reg res_n_tb;

    wire q_tb;

    ro #(
    .NUM_INV(3)
    ) ro_I (
    .en(en_tb),
    .res_n(res_n_tb),
    .clk(clk),
    .q(q_tb)
);

    initial begin
        $dumpfile("out/ro.vcd");
        $dumpvars(0, ro_tb);

        // Turn on enable
        en_tb = 1'b1;

        // Reset
        res_n_tb = 1'b1;
        #5;
        res_n_tb= 1'b0;

        #50;


    end

endmodule