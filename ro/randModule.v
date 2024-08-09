module randModule(en, randOut);
    input en;
    output randOut;

    wire w0;
    wire w1;
    wire w2;

    assign #1 w0 = ~( w2 & en ); 
    notGate notGate_1(w0, w1);
    notGate notGate_2(w1, w2);
    assign randOut = w2;
endmodule