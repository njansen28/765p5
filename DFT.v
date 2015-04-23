// file for all new DFT stuff for P5

// Cell from slide 22-10 (Boundary Scan Cell Architecture)
`timescale 1ns / 1ps
module boundaryCell(normIn, clk, rst_l, shiftLoad, update, testNorm, TDI, TDO, normOut);
	input 	normIn,		// Input to cell for normal operation (from input or PO)
			clk,		// Test clock for first FF
			rst_l,		// Reset FFs, active low
			shiftLoad,	// Mux1 select (shift = 1; load = 0)
			update,		// Clock of update FF
			testNorm, 	// Mux2 select (Test = 1, Normal = 0)
			TDI;		// Test Data in (for serial shift of boundary scan)
	output	TDO,		// Test Data out (for serial shift of bounadary scan)
			normOut;	// Output for normal operation (to PI or output)
	
	wire mux1_FF1, FF2_mux2;
	
	// Muxes to control mode of operation
	u_mux2 mux1(mux1_FF1, normIn, TDI, shiftLoad);
	u_mux2 mux2(normOut, normIn, FF2_mux2, testNorm);
	
	dff_r FF1(TDO, clk, rst_l, mux1_FF1); 		// Capture FF
	dff_r FF2(FF2_mux2, update, rst_l, TDO); 	// Update FF
			
endmodule // boundaryCell


// 1 to 4 demux (1 bit) used to route clock to appropriate data register
// Maybe not used
`timescale 1ns / 1ps
module demux4to1(A, B, C, D, sel, in);
	input			in;
	input 	[1:0] 	sel;
	output 			A, B, C, D;
	
	wire nsel0, nsel1;
	
	not n0(nsel0, sel[0]);
	not n1(nsel1, sel[1]);
	
	and a(A, in, nsel0, nsel1);
	and b(B, in, sel[0], nsel1);
	and c(C, in, nsel0, sel[1]);
	and d(D, in, sel[0], sel[1]);
	
endmodule // demux4to1

// 4 to 1 mux (1 bit)
`timescale 1ns / 1ps
module mux4to1(out, sel, A, B, C, D);
	input 	[1:0]	sel;
	input			A, B, C, D;
	output			out;
	
	wire nsel0, nsel1, and_a, and_b, and_c, and_d;
	
	not n0(nsel0, sel[0]);
	not n1(nsel1, sel[1]);
	
	and a(and_a, A, nsel0, nsel1);
	and b(and_b, B, sel[0], nsel1);
	and c(and_c, C, nsel0, sel[1]);
	and d(and_d, D, sel[0], sel[1]);
	
	or  o(out, and_a, and_b, and_c, and_d);
	
endmodule // mux4to1


// Instruction register has 4 states (boundary, BIST, bypass, Internal scan)
`timescale 1ns / 1ps
module instructionRegister(TDO, instruction, TDI, shift, update);
	input 			TDI, shift, update;
	output 			TDO;
	output [1:0] 	instruction;
	
	dff shift1(shift1_shift0, shift, TDI);
	dff shift0(TDO, shift, shift1_shift0);
	
	dff update1(instruction[1], update, shift1_shift0);
	dff update0(instruction[0], update, TDO);

endmodule // instructionRegister

// Instruction decode module. Doesn't do much right now
`timescale 1ns / 1ps
module instructionDecode(BIST_en, instruction);
	input [1:0]	instruction;
	output BIST_en;
	
	and a0(BIST_en, instruction[1], instruction[0]);
	
endmodule // instructionDecode