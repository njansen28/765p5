// I just wanna observe this thing in operation
`timescale 1ns / 1ps
module lfsrtb;
	reg clk, bist_en, rst_l;
	wire[246:0] value;
	reg [18:0] i;
	
  initial clk = 0;
  always #5 clk = ~clk;

  integer n_clk;
  initial n_clk = 0;

  always@(posedge clk)
    n_clk = n_clk + 1;

  reg tdata;

	lfsr247 cut (clk, bist_en, rst_l, value);

  dff0 d0 (q0, clk, tdata, rst_l);
  dff1 d1 (q1, clk, tdata, rst_l);
	
	initial begin
		$monitor(",,bist_en=%b, init_bist=%b, value=%h, value0=%b", bist_en, cut.init_bist, value, value[183]);
		rst_l = 0; tdata = 1; bist_en = 0;
		@(posedge clk) rst_l = 1;
		@(posedge clk) $strobe("q0=%b, q1=%b", q0, q1);
		@(posedge clk) $strobe("q0=%b, q1=%b", q0, q1); tdata = 0;
		@(posedge clk) $strobe("q0=%b, q1=%b", q0, q1); 
		@(posedge clk) $strobe("q0=%b, q1=%b", q0, q1);
		@(posedge clk); bist_en = 1;
		for (i = 0; i < 19'h1FFFF; i = i + 1'b1) begin
			@(posedge clk);
		end
		$finish;
	end // lfsrtb
endmodule