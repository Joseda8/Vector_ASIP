module vector_cpu_tb();

logic clk, rst;

logic wr_pos_pxl, we_pxl, we_mul, wr_mul_pos_in;
logic [31:0] wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;

logic [31:0] instr_out;

logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom, wr_mul_pos_out;
logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
						cte_out1, cte_out2, cte_out3, cte_out4,
						mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
						i, j, n, wom_addr;

logic [31:0] r1, r2, r3, r4;

logic [31:0] load1, load2, load3, load4, sumr1, sumr2, sumr3, sumr4;

vector_cpu uut(clk, rst, instr_out, 
								wr_pos_pxl, we_pxl, we_mul,  
								wdp1, wdp2, wdp3, wdp4, 
								wdm1, wdm2, wdm3, wdm4, wr_mul_pos_in, 
								
								wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix_out1, pix_out2, pix_out3, pix_out4,
			  cte_out1, cte_out2, cte_out3, cte_out4,
			  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
			  i, j, n, wom_addr, wr_mul_pos_out,
			  
			  r1, r2, r3, r4,
			  
			  load1, load2, load3, load4, sumr1, sumr2, sumr3, sumr4);

initial begin

	clk <= 1; rst <= 1;
	#10 rst <= 0;
	/*
	#10 we_pxl = 1; wr_pos_pxl = 0; wdp1 = 32'h416D5267; wdp2 = 32'h416D5263; wdp3 = 32'h415D5267; wdp4 = 32'h426D5267;
	#10 we_pxl = 1; wr_pos_pxl = 1; wdp1 = 32'h416D5367; wdp2 = 32'h416C5263; wdp3 = 32'h415D5267; wdp4 = 32'h426D506B;
	#10 we_pxl = 0; wr_mul_pos_in = 0; we_mul = 1; wdm1 = 32'h416D5267; wdm2 = 32'h416D5263; wdm3 = 32'h415D5267; wdm4 = 32'h426D5267; 
	#10 wr_mul_pos_in = 1; we_mul = 1; wdm1 = 32'h416D5267; wdm2 = 32'h416D5263; wdm3 = 32'h415D5267; wdm4 = 32'h426D5267; 
	//#10 we_mul = 0;
	*/
	#10;
	
end
	
always #5 clk = ~clk;

endmodule
