module notGate(a, inversedA);

input a;
output inversedA;

assign #1 inversedA = ~a;

endmodule