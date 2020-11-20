module IF_tb();

logic clk, rst;
logic [31:0] instr_out;

IF uut(clk, rst, instr_out);

initial begin

	clk <= 1; rst <= 1;
	#10 rst <= 0;
	
end
	
always #5 clk = ~clk;

endmodule
