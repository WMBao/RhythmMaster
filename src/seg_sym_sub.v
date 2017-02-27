`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:11 04/03/2016 
// Design Name: 
// Module Name:    seg_sym_sub 
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
module seg_sym_sub(
	input [2:0] state,
	output reg[6:0] s_to_d
    );

always @(*)

case(state)
3'b000: s_to_d = 7'b1111111;
3'b001: s_to_d = 7'b0111111;
3'b010: s_to_d = 7'b0011111;
3'b011: s_to_d = 7'b0001111;
3'b100: s_to_d = 7'b0000111;
3'b101: s_to_d = 7'b0000011;
3'b110: s_to_d = 7'b0000001;
3'b111: s_to_d = 7'b0000000;
default: s_to_d = 7'b1111111;
endcase

endmodule
