output wire[7:0] seg,
output wire[3:0] line,

//7セグ表示　
reg[20:0] dd=0;
always@(posedge clk) dd<= dd+1'b1;

wire[1:0] nn=dd[20:19];
wire [6:0] code[0:9];
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
assign code[0] =7'1111110;
