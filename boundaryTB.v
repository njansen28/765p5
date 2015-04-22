// Simple testbench for boundary cell
`timescale 1ns / 1ps
module boundaryTB;
	reg normIn, clk, rst_l, shiftLoad, update, testNorm, TDI;
	wire TDO, normOut;
	
	boundaryCell bc0(normIn, clk, rst_l, shiftLoad, update, testNorm, TDI, TDO, normOut);
	
	initial begin
		$monitor("  %d: TDO=%b; normOut=%b; normIn=%b; clk=%b; rst_l=%b; shiftLoad=%b; update=%b; testNorm=%b; TDI=%b",
					$time, TDO, normOut, normIn, clk, rst_l, shiftLoad, update, testNorm, TDI);
		rst_l = 1; normIn = 0; shiftLoad = 1; clk = 0; update = 0; testNorm = 0; TDI = 0;
		#5;
		rst_l = 0;
		#5;
		rst_l = 1;
		#5;
		clk = 1; TDI = 1; 
		#5;
		clk = 0;
		#5;
		clk <= 1; update <= 1;
		#5;
		testNorm = 1; update = 0; clk = 0;
		#5;
		normIn = 1;
		#5;
		shiftLoad = 0; testNorm = 1;
		#5;
		clk = 1;
		#5;
		testNorm = 0;
		#5
		normIn = 0;
	end

endmodule // boundaryTB