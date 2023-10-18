timescale 1ns/1ps
//Module Name: stopwatch
module stopwatch(
  input wire clk0, start_sw, reset_sw, //タクトスイッチ
  output wire[1:0] led, //LED出力
  output wire[6:0] seg, //7セグ制御
  output wire[3:0] line, //4ライン制御
  output wire dp
  );

  wire enable_deci, enable_sec1, enable_sec10, enable_sec100, enable_sec1000;
  reg state = 1'b0;
  reg[19:0] cc0 = 20'b0;
  reg[20:0] cc1 = 21'b0;
  reg[3:0] decisec,sec1,sec10,sec100; //時刻変数
  assign led = { reset_sw | enable_sec1000, start_sw };

  parameter MAX =24'd1_000_000;

  always@ (posedge clk0 or posedge reset_sw) begin //0.1秒信号作成
    if(reset_sw==1'b1)
      cc0<=20'b0;
    else if(cc0==MAX-1'b1)
      cc0<=20'b0;
    else
      cc0<=cc0+state;
  end
  assign enable_deci=(cc0==MAX-1'b1)?1'b1:1'b0; //0.1秒イネーブル信号作成
  //10進カウントモジュール
  counter10 cntr0( .clk(clk0), rsw(reset_sw), e_in(enable_deci), .det(decisec), e_in(enable_sec1) );
  counter10 cntr1( .clk(clk0), rsw(reset_sw), e_in(enable_deci), .det(sec1), e_in(enable_sec10) );
  counter10 cntr2( .clk(clk0), rsw(reset_sw), e_in(enable_deci), .det(sec10), e_in(enable_sec100) );
  counter10 cntr3( .clk(clk0), rsw(reset_sw), e_in(enable_deci), .det(sec100), e_in(enable_sec1000) );

  reg[4:0] shift_ff=4'b0;
  reg sw_old=1'b0;
  wire enable_chattering;
  reg no_chattering_sw =1'b0;

  always@(posedge clk0) begin //チャタリング除去
    if(enable_chattering==1'b1)
      shift_ff<={shift_ff[3:0], start_sw};
    no_chatterring_sw = no_chattering_sw?(|shift_ff):(&shift_ff);
  end

  always@(posedge clk0 or posedge reset_sw) begin
    if(reset_sw==1'b1)
      state<=1'b0;
    else begin
      if({sw_old, no_chattering_sw}==2'b01)
        state<=state+1'b1;
      sw_old <= no_chattering_sw;
    end
  end

  wire[6:0] seg_0, seg_1,seg_2, seg_3;
  decoder7seg decoder0( .date(decisec), .code(seg_0));//デコーダ接続
  decoder7seg decoder1( .date(sec1), .code(seg_1));
  decoder7seg decoder2( .date(sec10), .code(seg_2));
  decoder7seg decoder3( .date(sec100), .code(seg_3));

  
