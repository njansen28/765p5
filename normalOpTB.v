// Make sure we didn't screw up normal operation
`timescale 1ns / 1ps
module normalOpTB;
	reg CK, TMS, TCK, TRST, TDI;
	reg [35:0] PI;
	wire [38:0] PO_gold, PO;
	wire TDO;
	reg [18:0] i;
	
	s9234 ours(CK, PI[35], PI[34], PO[38], PO[37], PI[33], PI[32], PO[36], PI[31], PI[30], PI[29], PI[28], PI[27],
				PI[26], PO[35], PI[25], PO[34], PI[24], PI[23], PI[22], PI[21], PO[33], PO[32], PI[20], PO[31], 
				PO[30], PO[29], PO[28], PO[27], PO[26], PO[25], PO[24], PO[23], PO[22], PO[21], PO[20], PO[19],
				PI[19], PO[18], PO[17], PI[18], PO[16], PI[17], PI[16], PI[15], PO[15], PO[14], PO[13], PO[12], 
				PI[14], PI[13], PI[12], PI[11], PI[10], PI[9], PI[8], PI[7], PI[6], PO[11], PO[10], PO[9], PO[8],
				PO[7], PO[6], PO[5], PO[4], PO[3], PO[2], PO[1], PI[5], PO[0], PI[4], PI[3], PI[2], PI[1], PI[0],
				TMS, TCK, TRST, TDI, TDO);
				
	s9234_orig gold(CK, PI[35], PI[34], PO_gold[38], PO_gold[37], PI[33], PI[32], PO_gold[36], PI[31], PI[30], 
				PI[29], PI[28], PI[27], PI[26], PO_gold[35], PI[25], PO_gold[34], PI[24], PI[23], PI[22], PI[21],
				PO_gold[33], PO_gold[32], PI[20], PO_gold[31], PO_gold[30], PO_gold[29], PO_gold[28], PO_gold[27],
				PO_gold[26], PO_gold[25], PO_gold[24], PO_gold[23], PO_gold[22], PO_gold[21], PO_gold[20], PO_gold[19],
				PI[19], PO_gold[18], PO_gold[17], PI[18], PO_gold[16], PI[17], PI[16], PI[15], PO_gold[15],
				PO_gold[14], PO_gold[13], PO_gold[12], PI[14], PI[13], PI[12], PI[11], PI[10], PI[9], PI[8], PI[7],
				PI[6], PO_gold[11], PO_gold[10], PO_gold[9], PO_gold[8], PO_gold[7], PO_gold[6], PO_gold[5], PO_gold[4],
				PO_gold[3], PO_gold[2], PO_gold[1], PI[5], PO_gold[0], PI[4], PI[3], PI[2], PI[1], PI[0]);
				
	initial begin
		TRST = 0; TMS = 0; TCK = 0; TDI = 0;
		@(posedge CK) TRST = 1;
		@(posedge CK);
		for (i = 0; i < 19'h1FFFF; i = i + 1'b1) begin
			PI = $urandom_range(36'hFFFFFFFFF, 36'd0);
			@(posedge CK);
			$display("%d: PI=%b, PO=%b, PO_gold=%b", i, PI, PO, PO_gold);
			if (PO != PO_gold) begin
				$display("!!!!!!!!!Something is different!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				$finish;
			end
		end
		$display("PI=%h, PO=%h, PO_gold=%h", PI, PO, PO_gold);
		$finish;
	end
	
	initial begin
		CK = 0;
		forever #5 CK = ~CK;
	end
	
endmodule // normalOpTB