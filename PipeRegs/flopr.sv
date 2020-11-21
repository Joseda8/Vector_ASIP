module flopr#(parameter ARQ = 32) (input  logic clk, reset,
												input  logic [ARQ-1:0] d,
												output logic [ARQ-1:0] q);
					
always_ff @(posedge clk, posedge reset)
	if (reset) q <= 32'bx;
	else q <= d;
endmodule 
