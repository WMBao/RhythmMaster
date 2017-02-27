`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:33:48 04/04/2016 
// Design Name: 
// Module Name:    seg_diaplay 
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
module seg_diaplay(
	input CLK_50M,
	input pau_flag,
	input on_off,
	output reg [3:0] lit,
	output reg [6:0] dig
    );


freDiv A1(.CLK_50M(CLK_50M),
				.CLK_5M(CLK_5M),
				.CLK_500(CLK_500),
				.CLK_50(CLK_50),
				.CLK_5(CLK_5),
				.CLK_1(CLK_1),
				.CLK_05(CLK_05)
				);

endmodule
