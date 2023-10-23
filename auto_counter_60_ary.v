`timescale 1ns/1ps
//Module Name: auto_counter_60_ary

module auto_counter_60_ary(
	input wire clk,
	input wire a,
	output reg[3:0] q0,
	output reg[2:0] q1
);
	reg x0=0, x1=0;

	wire [26:0] chk=(a)?(27'd999999)