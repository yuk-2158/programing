timescale 1ns/1ps
//Module Name: d_ff_s
module d_ff_s(
  input clk,
  input wire a,
  output reg q
);
  reg x;

  always @(negedge clk ) x<= a;
  always @(negedge x )q <= !q;
endmodule



  
