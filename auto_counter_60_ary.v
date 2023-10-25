`timescale 1ns/1ps
//Module Name: auto_counter_60_ary

module auto_counter_60_ary(
	input wire clk,
	input wire a,
	output reg[3:0] q0,
	output reg[2:0] q1
);
	reg x0=0, x1=0;

	wire [26:0] chk=(a)?(27'd999999);
	reg [26:0] cc=0;

	always@(posedge clk)begin//一秒生成
		cc<= (cc>=chk) ? 1'b0 : cc+1'b1;
		x0<= (cc>=chk) ? 1'b1 : 1'b0;
	end
	always@(posedge clk)begin//10進カウンタ
		if(x0)begin
			q0<= (q0>=4'd9) ? 1'b0 : q0+1'b1;
			x1<= (q0>=4'd9) ? 1'b1 : 1'b0;
		end
		else
		x1<= 0;
	end

	always@(posedge clk)//16進カウンタ
		if(x1) q1<=(q1>=3'd5)? 1'b0 : q1+1'b1;

endmodule
	

	
