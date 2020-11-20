module Execution(clk, alu_func, 
					  cte1, cte2, cte3, cte4,
					  pix1, pix2, pix3, pix4,
					  mul1, mul2, mul3, mul4,
					  mul5, mul6, mul7, mul8,
					
					  r1, r2, r3, r4);
					  
	input logic clk, alu_func;
	input logic [31:0] cte1, cte2, cte3, cte4, pix1, pix2, pix3, pix4, mul1, mul2, mul3, mul4,
							 mul5, mul6, mul7, mul8;

	output logic [31:0] r1, r2, r3, r4;
	
	logic [31:0] alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8;
	
	vector_data_mux alu_mux(mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8,
									pix1, cte1, pix2, cte2, pix3, cte3, pix4, cte4,
									alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8,
									alu_func);
									
									
	lanes alus(alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8,
				  alu_func, clk, r1, r2, r3, r4);


endmodule
