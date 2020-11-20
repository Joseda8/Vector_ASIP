module Decode(clk, rst, instruction, 
				  wr_pos_pxl, we_pxl, we_mul,  
				  wdp1, wdp2, wdp3, wdp4, 
				  wdm1, wdm2, wdm3, wdm4,
				  
				  wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
				  pix_out1, pix_out2, pix_out3, pix_out4,
				  cte_out1, cte_out2, cte_out3, cte_out4,
				  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
				  i, j, n);
	
	input logic clk, rst, wr_pos_pxl, we_pxl, we_mul;
	input logic [31:0] instruction, wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;
	
	output logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom;
	output logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
							  cte_out1, cte_out2, cte_out3, cte_out4,
							  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
							  i, j, n;
	
	logic [1:0] scalar_op;
	logic [31:0] imm;
	logic rd_pos_cte, rd_pos_pxl;
	int flag;
	
	control_unit controller(instruction, rd_pos_cte, rd_pos_pxl, wr_pxl, wr_mul_reg, alu_func, wr_wom);
	
	instr_decoder decoder(instruction, scalar_op, imm);
	
	scalar_reg scalar_regs(clk, rst, scalar_op, imm, i, j, n);
	
	const_vector_bank cte_bank(clk, rst, rd_pos_cte, cte_out1, cte_out2, cte_out3, cte_out4);
	
	pixels_vector_bank pixels_bank(clk, rst, rd_pos_pxl, wr_pos_pxl, we_pxl, wdp1, wdp2, wdp3, wdp4, pix_out1, pix_out2, pix_out3, pix_out4);
	
	mult_vector_bank mult_bank(clk, we_mul, wdm1, wdm2, wdm3, wdm4, mul_out1, mul_out2, 
									mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8, flag);
									
	assign wr_pos = rd_pos_pxl;
	
endmodule
