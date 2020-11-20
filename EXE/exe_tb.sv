module exe_tb();

	logic clk, alu_func;
	logic [31:0] cte1, cte2, cte3, cte4, pix1, pix2, pix3, pix4, mul1, mul2, mul3, mul4,
							 mul5, mul6, mul7, mul8;

	logic [31:0] r1, r2, r3, r4;

   Execution uut(clk, alu_func, 
					  cte1, cte2, cte3, cte4,
					  pix1, pix2, pix3, pix4,
					  mul1, mul2, mul3, mul4,
					  mul5, mul6, mul7, mul8,
					
					  r1, r2, r3, r4);
					  
	initial begin
	
		clk = 1;
		
		#10 cte1 = 32'h4044F9D2; cte2 = 32'h4048DC82; cte3 = 32'h408A9CBB; cte4 = 32'h409EA10D;
			 pix1 = 32'h41200000; pix2 = 32'h41a00000; pix3 = 32'h41f00000; pix4 = 32'h42200000;
			 alu_func = 1;
			 
		#150;
		
		#10 mul1 = 32'h4044F9D2; mul2 = 32'h4048DC82; mul3 = 32'h408A9CBB; mul4 = 32'h409EA10D;
			 mul5 = 32'h41200000; mul6 = 32'h41a00000; mul7 = 32'h41f00000; mul8 = 32'h42200000;
			 alu_func = 0;
	end
	
	always #5 clk = ~clk;

endmodule
