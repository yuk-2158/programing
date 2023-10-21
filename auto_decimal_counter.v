`timescale 1ns/1ps
//Module Name: auto_decimal_counter

module auto_decimal_counter(
  input wire clk,
  input wire a,
  output reg[3:0] q
);

  reg x;
  reg[26:0] cc=0;
  wire [26:0] chk=(a)?(27'd9999999):(27'd99999999);
  always@(posedge clk)begin
    cc <= (cc>=chk) ? 1'b0 : cc+1'b1;
    x <= (cc>=chk) ? 1'b1 : 1'b0;
  end

  wire [3:0] max =4'd9;
  always@(posedge clk )begin 
    if(x)begin
      if(q==max)
        q<= 0;
      else
        q= q + 1'b1;
    end
  end
endmodule
