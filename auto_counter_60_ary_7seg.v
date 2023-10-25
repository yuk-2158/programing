output wire[7:0] seg,
output wire[3:0] line,

//7セグ表示　
reg[20:0] dd=0;
always@(posedge clk) dd<= dd+1'b1;

wire[1:0] nn=dd[20:19];
wire [6:0] code[0:9];
assign code[0] =7'1111110;
assign code[1] =7'0110000;
assign code[2] =7'1101101;
assign code[3] =7'1111001;
assign code[4] =7'0110011;
assign code[5] =7'1011011;
assign code[6] =7'1011111;
assign code[7] =7'1110000;
assign code[8] =7'1111111;
assign code[9] =7'1111011;

assign seg =
  nn== 2'b00 ?{code[{1'b0,cc[23:21]}],1'b0}://00
  nn== 2'b01 ?{code[{1'b0,cc[26:24]}],1'b0}://01
  nn== 2'b10 ?{code[q0],q0[0]}://10
            {code[{2'b0,q1}],1'b0}) ;//11

assign line =(4'b0001 <<nn);
