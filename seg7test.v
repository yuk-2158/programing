timescale 1ns/1ps
// Module Name: seg7test
module seg7test(
  input wire[3:0] sw, //タクトスイッチ
  input wire[3:0] ssw, //スライドスイッチ
  output wire[6:0] seg, //7セグメント制御
  output wire dp,
  output wire[3:0] line //4ライン制御
  );
  wire[6:0] code;
  assign seg = code;//atlys
  //assign seg = ~code;//basy2
  decoder7seg decoder0(.data(ssw),.code(code));//数→7セグデコード
  assign line[3:0] = sw[3:0]^4'b1111;
  //assgin line[3:0] = sw[3:0];
  assign dp = 1'b1;
endmodule

module decoder7seg( input wire [3:0] data, output wire [6:0] code );
  assign code =
    data==4'd0 ? 7'b1111110; //0
    data==4'd0 ? 7'b0110000; //1
    data==4'd0 ? 7'b1101101; //2
    data==4'd0 ? 7'b1111110; //3
    data==4'd0 ? 7'b1111110; //4
    data==4'd0 ? 7'b1111110; //5
    data==4'd0 ? 7'b1111110; //6
    data==4'd0 ? 7'b1111110; //7
    data==4'd0 ? 7'b1111110; //8
    data==4'd0 ? 7'b1111110; //9
    data==4'd0 ? 7'b1111110; //A
    data==4'd0 ? 7'b1111110; //B
    data==4'd0 ? 7'b1111110; //C
    data==4'd0 ? 7'b1111110; //D
    data==4'd0 ? 7'b1111110; //E
    data==4'd0 ? 7'b1000111; //F

endmodule
