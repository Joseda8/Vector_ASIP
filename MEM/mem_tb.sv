module mem_tb();

	logic clk, wr_wom, algorithm;
	logic [31:0] i, j, n, result1, result2, result3, result4;
	
	logic [31:0] load1, load2, load3, load4, sumr1, sumr2, sumr3, sumr4, wr_addr;

	Memory uut(clk, wr_wom, i, j, n, algorithm,
				  result1, result2, result3, result4,
				  load1, load2, load3, load4,
				  sumr1, sumr2, sumr3, sumr4, wr_addr);
				  
	initial begin
	
		clk = 1;
		
		// load 
		#10 wr_wom = 0; i = 32'd0; j = 32'd0; n = 32'd8;
		// check mem wr
		#10 wr_wom = 1; result1 = 32'd55; result2 = 32'd8; result3 = 32'd10; result4 = 32'd11; 
	end
	
	always #5 clk = ~clk;

endmodule
