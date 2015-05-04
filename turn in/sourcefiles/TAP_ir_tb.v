// Make sure we didn't screw up normal operation
`timescale 1ns / 1ps
module TAPirTB;
	reg CK, TMS, TRST;
	wire clockdr, shiftdr, updatedr, clockir, shiftir, updateir, select, bs_en;
	wire TDO;
	wire [1:0] instruction;
	reg TDI;
	
	wire BIST_en, IS_en;
	wire [246:0] value;
	reg [18:0] i;
	tapcontroller tap(CK, TRST, TMS, clockdr, shiftdr, updatedr, clockir, shiftir, updateir, select, bs_en); 
	instructionRegister ir(TDO, instruction, TDI, shift, updateir, TRST);
	instructionDecode id(BIST_en, IS_en, instruction);
	lfsr247 cut (CK, BIST_en, TRST, value);
	and a0(update, clockir, updateir);
	and a1(shift, clockir, shiftir);
				
	initial begin
		$monitor($time,,"instruction = %b, capt=%b, tap state=%b, TDI=%b, shift=%b, update=%b",
					instruction, {ir.shift1_shift0, TDO}, {tap.ps3, tap.ps2, tap.ps1, tap.ps0}, ir.TDI, ir.shift, updateir);
		TRST = 0; TMS = 1; TDI = 0;
		@(posedge CK) TRST = 1;
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK); 
		@(posedge CK);  // make sure we get into correct initial state
		@(posedge CK) TMS = 0;
		@(posedge CK) TMS = 1;
		@(posedge CK); 
		@(posedge CK) TMS = 0;
		@(posedge CK);
		@(posedge CK) TDI = 1; // bit 0 of instruction
		@(posedge CK) TMS = 1; // bit 1 of instruction
		@(posedge CK) TDI = 0;
		@(posedge CK) TMS = 0;
		for (i = 0; i < 19'h1FFFF; i = i + 1'b1) begin
			@(posedge CK);
			$strobe($time,,"Value=%h", value);
		end
		@(posedge CK) TMS = 1;
		@(posedge CK) ;
		@(posedge CK) TMS = 0;
		@(posedge CK);
		@(posedge CK) TDI = 0;
		@(posedge CK) TMS = 1; 
		@(posedge CK) TDI = 0;
		@(posedge CK) TMS = 0;
		@(posedge CK);
		@(posedge CK)$display("bist_en =%b", BIST_en);
		
		$finish;
	end
	
	initial begin
		CK = 0;
		forever #5 CK = ~CK;
	end
	
endmodule // normalOpTB