/* Generated by Yosys 0.43+22 (git sha1 118b2829d, g++ 12.2.0-14 -fPIC -Os) */

(* dynports =  1  *)
(* top =  1  *)
(* src = "ro.v:1.1-40.10" *)
module ro(en, clk, res_n, q);
  (* src = "ro.v:5.11-5.14" *)
  input clk;
  wire clk;
  (* src = "ro.v:4.11-4.13" *)
  input en;
  wire en;
  (* keep = 32'd1 *)
  (* src = "ro.v:11.31-11.43" *)
  wire [2:0] interm_wires;
  (* src = "ro.v:8.12-8.13" *)
  output q;
  wire q;
  (* src = "ro.v:6.11-6.16" *)
  input res_n;
  wire res_n;
  assign q = res_n & ~(interm_wires[1]);
  assign interm_wires[2] = ~(q & en);
  assign interm_wires[1] = ~(interm_wires[2] & res_n);
  assign interm_wires[0] = q;
endmodule
