module vector_cpu_IFID_tb();

logic clk, rst;

logic wr_pos_pxl, we_pxl, we_mul, wr_mul_pos_in;
logic [31:0] wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;

logic [31:0] instr_out;

logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom, wr_mul_pos_out;
logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
						cte_out1, cte_out2, cte_out3, cte_out4,
						mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
						i, j, n, wom_addr;


vector_cpu_IFID uut(clk, rst, instr_out, 
								wr_pos_pxl, we_pxl, we_mul,  
								wdp1, wdp2, wdp3, wdp4, 
								wdm1, wdm2, wdm3, wdm4, wr_mul_pos_in, 
								
								wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix_out1, pix_out2, pix_out3, pix_out4,
			  cte_out1, cte_out2, cte_out3, cte_out4,
			  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
			  i, j, n, wom_addr, wr_mul_pos_out);

initial begin

	clk <= 1; rst <= 1;
	#10 rst <= 0;
	
	#10 wr_pos_pxl = 0; wr_mul_pos_in = 0; we_mul = 1; wdm1 = 32'd15; wdm2 = 32'd16; wdm3 = 32'd17; wdm4 = 32'd18; 
	#10 wr_pos_pxl = 1; wr_mul_pos_in = 1; we_mul = 1; wdm1 = 32'd150; wdm2 = 32'd160; wdm3 = 32'd170; wdm4 = 32'd180;
	#10;
	
end
	
always #5 clk = ~clk;

endmodule
