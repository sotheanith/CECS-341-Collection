`timescale 1ns / 1ps
module IFID_PR(in, out, clock);
	input clock;
	input [95:0] in;
	output [95:0] out;
	reg [95:0] RF[0:31];
	reg [4:0] Counter;
	
	initial begin
		Counter=0;
	end
	always @(in) begin
		if (!($isunknown(in))) begin
			@(posedge clock)begin
				RF[Counter]=in;
				Counter=Counter+1;
				if (Counter>31)
					Counter=0;
			end
		end
	end		
	assign out=RF[Counter];

endmodule
