module ro_top_tb();

    reg en_tb;
    reg clk_tb;
    wire [7:0] d_out_tb;

    /*ro_top ro_top_I (
        .clk(clk_tb),
        .en(en_tb),
        .d_out(d_out_tb)
    );*/
    trng_top ro_top_I (
        .clk(clk_tb),
        .en(en_tb),
        .d_out(d_out_tb)
    );

    initial begin
        clk_tb = 1'b0;
        forever #10 clk_tb=~clk_tb;
    end

    initial begin
        $dumpfile("out/trng_top.vcd");
        $dumpvars(0, ro_top_tb);

        $display("Start of simulation");

`ifdef SIMULATION
        $display("Simulation variable present");
`endif

        en_tb = 1'b0;
        #30;
        en_tb = 1'b1;

        #200;

        $finish();

    end

endmodule