module vector_cpu_tb();

logic clk, rst, algrt;


vector_cpu uut(clk, rst, algrt);

initial begin

	clk <= 1; rst <= 1;
	#10 rst <= 0;
	#10;
	
end
	
always #5 clk = ~clk;

endmodule
