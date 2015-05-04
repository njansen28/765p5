// Make sure we didn't screw up normal operation
`timescale 1ns / 1ps
module s9234_bistTB;
	reg CK, TMS, TRST, TDI;
	reg [35:0] PI;
	wire [38:0] PO;
	wire TDO;
	reg [18:0] i;
	
	// wire BIST_en, IS_en;
	// wire [246:0] value;
	// reg [18:0] i;
	// tapcontroller tap(CK, TRST, TMS, clockdr, shiftdr, updatedr, clockir, shiftir, updateir, select, bs_en); 
	// instructionRegister ir(TDO, instruction, TDI, shift, updateir, TRST);
	// instructionDecode id(BIST_en, IS_en, instruction);
	// lfsr247 cut (CK, BIST_en, TRST, value);
	// and a0(update, clockir, updateir);
	// and a1(shift, clockir, shiftir);
	
	s9234 ours(CK, PI[35], PI[34], PO[38], PO[37], PI[33], PI[32], PO[36], PI[31], PI[30], PI[29], PI[28], PI[27],
				PI[26], PO[35], PI[25], PO[34], PI[24], PI[23], PI[22], PI[21], PO[33], PO[32], PI[20], PO[31], 
				PO[30], PO[29], PO[28], PO[27], PO[26], PO[25], PO[24], PO[23], PO[22], PO[21], PO[20], PO[19],
				PI[19], PO[18], PO[17], PI[18], PO[16], PI[17], PI[16], PI[15], PO[15], PO[14], PO[13], PO[12], 
				PI[14], PI[13], PI[12], PI[11], PI[10], PI[9], PI[8], PI[7], PI[6], PO[11], PO[10], PO[9], PO[8],
				PO[7], PO[6], PO[5], PO[4], PO[3], PO[2], PO[1], PI[5], PO[0], PI[4], PI[3], PI[2], PI[1], PI[0],
				TMS, TRST, TDI, TDO);
				
	initial begin
		$monitor($time,,"TDO=%b, PO[32]=%b, PO=%h, instruction=%b, bist_en=%b, ir_in=%b, shift10=%b, tap state=%b",
						ours.bist_TDO, PO[32], PO, ours.dr_sel, ours.BIST_en, ours.ir.TDI, {ours.ir.shift1_shift0, ours.ir.TDO}, {ours.tap.ps3, ours.tap.ps2, ours.tap.ps1, ours.tap.ps0});
		//$monitor($time,,"normIn=%b, shiftLoad=%b, update=%b, testNorm=%b, TDI=%b, TDO=%b, normOut=%b", ours.g2584b, ours.clockdr, ours.shiftdr, ours.update, ours.updatedr, ours.bI35_O00, ours.bO00_O01, ours.g2584);
		//$monitor($time,,"in=%b, out=%b", ours.m000_out, ours.g89b);
		//$monitor($time,,"g6728b=%b, g6619=%b, g675=%b, m183_out=%b, IS_en=%b, val183=%b", ours.g6728b, ours.g6619, ours.g675, ours.m183_out, ours.IS_en, ours.value[183]); 
		//$monitor($time,,"BIST_en=%b, TRST=%b, value183=%b, %h", ours.BIST_en, ours.TRST, ours.value[183], ours.value);
		//$monitor($time,,"dr_sel=%b, select=%b, irdrout=%b, dr_out=%b", ours.dr_sel, ours.select, ours.ir_dr_out, ours.dr_out);
		//$monitor($time,,"BIST_en=%b, m000_out=%b, g89=%b, value[0]=%b, g89b=%b", ours.BIST_en, ours.m000_out, ours.g89, ours.value[0], ours.g89b);
		//$monitor($time,,"g678=%b, m036_out=%b", ours.g678, ours.m036_out);
		//$monitor($time,,"g3222b=%b, g1064=%b", ours.g3222b, ours.g1064);
		TRST = 0; TMS = 1; TDI = 0; PI = 36'hXXXXXXXXX;
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
		@(posedge CK);
		@(posedge CK);
		@(posedge CK);
		@(posedge CK);
		for (i = 0; i < 19'h1FFFF; i = i + 1'b1) begin
			@(posedge CK);
		end
		@(posedge CK) TMS = 1; $strobe($time,,"FINAL TDO=%b, PO[32]=%b", TDO, PO[32]);
		@(posedge CK) ;
		@(posedge CK) TMS = 0;
		@(posedge CK);
		@(posedge CK) TDI = 0;
		@(posedge CK) TMS = 1; 
		@(posedge CK) TDI = 0;
		@(posedge CK) TMS = 0;
		@(posedge CK);
		@(posedge CK) ;//$display("bist_en =%b", BIST_en);
		
		$finish;
	end
	
	initial begin
		CK = 0;
		forever #5 CK = ~CK;
	end
	
endmodule // normalOpTB