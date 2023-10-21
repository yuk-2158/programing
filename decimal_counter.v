`timescale 1ns/1ps
// Module Name: decimal_counter

module decimal_counter(
  input wire clk,
  input wire a,
  output reg[3:0] q
);
  wire x;
  anti_chatter anti_chatter1( .clk(clk), .sw_in(a), .sw_out(x) );

  always@(negedge x)begin
    if(q==4'd9)
      q<=0;
    else
      q<= q+1'b1;
  end

endmodule
// module anti_chatter()は実験8と同じ


  
