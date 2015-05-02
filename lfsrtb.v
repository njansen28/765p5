// I just wanna observe this thing in operation
`timescale 1ns / 1ps
module lfsrtb;
	reg clk, init, next;
	wire[246:0] value;
	
  initial clk = 0;
  always #5 clk = ~clk;

  integer n_clk;
  initial n_clk = 0;

  always@(posedge clk)
    n_clk = n_clk + 1;

  reg tdata;

	lfsr247 cut (clk, next, init, value);

  dff0 d0 (q0, clk, tdata, ~init);
  dff1 d1 (q1, clk, tdata, init);
	
	initial begin
	//	$monitor(" %d: \n\tinit=%d\n\ttdata=%d\t\nq0=%d  q1= %d", $time, init, tdata, q0, q1);
    $monitor("  %d: \n\tinit=%d\n\tnext=%d\n\tvalue=%b",
					$time, init, next, value);

    tdata = 0;

    next = 0;
    #4;
    init = 1;

    #13;
    init = 0;

    #20;

    next = 1;

#13;

tdata = 1;


#15;

//init = 1;

    #3000;
    $display("CLOCKED %d TIMES!", n_clk);
    $finish;

		end

endmodule // boundaryTB
