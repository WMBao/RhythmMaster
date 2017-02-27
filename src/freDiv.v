`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:39 04/03/2016 
// Design Name: 
// Module Name:    freDiv 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module freDiv(
	input CLK_50M,
	output reg CLK_5M,
	output reg CLK_500,
	output reg CLK_50,
	output reg CLK_5,
	output reg CLK_1,
	output reg CLK_05
);

reg[3:0] cnt1; //频率5MHz
reg[16:0] cnt2; //频率500Hz
reg[19:0] cnt3;//频率50Hz
reg[23:0] cnt4;//频率5Hz
reg[25:0] cnt5;//频率1Hz
reg[27:0] cnt6;//频率0.5Hz

always @(posedge CLK_50M)
	begin
      cnt1<=cnt1+1'b1;
		cnt2<=cnt2+1'b1;
		cnt3<=cnt3+1'b1;
      cnt4<=cnt4+1'b1;
		cnt5<=cnt5+1'b1;
		cnt6<=cnt6+1'b1;
      if(cnt1==4'd9)
			begin
				cnt1<=4'd0;
				CLK_5M <= ~CLK_5M;
			end
		if(cnt2==17'h1869F)
			begin
				cnt2<=17'h0;
				CLK_500 <= ~CLK_500;
			end
		if(cnt3==20'hF423F)
			begin
				cnt3<=20'h0;
				CLK_50 <= ~CLK_50;
			end
      if(cnt4==24'h98967F)
			begin
				cnt4<=24'h0;
				CLK_5 <= ~CLK_5;
			end
		if(cnt5==26'h2FAF07F)
			begin
				cnt5<=26'h0;
				CLK_1 <= ~CLK_1;
			end
		if(cnt6==28'h5F5E0FF)
			begin
				cnt6<=28'h0;
				CLK_05 <= ~CLK_05;
			end
	end

endmodule
