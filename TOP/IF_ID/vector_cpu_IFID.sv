module vector_cpu_IFID(clk, rst, instr_out, 
								wr_pos_pxl, we_pxl, we_mul,  
								wdp1, wdp2, wdp3, wdp4, 
								wdm1, wdm2, wdm3, wdm4, wr_mul_pos_in, 
								
								wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix_out1, pix_out2, pix_out3, pix_out4,
			  cte_out1, cte_out2, cte_out3, cte_out4,
			  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
			  i, j, n, wom_addr, wr_mul_pos_out);

input logic clk, rst;

input logic wr_pos_pxl, we_pxl, we_mul, wr_mul_pos_in;
input logic [31:0] wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;

output logic [31:0] instr_out;

output logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom, wr_mul_pos_out;
output logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
						cte_out1, cte_out2, cte_out3, cte_out4,
						mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
						i, j, n, wom_addr;

logic [31:0] instr;

IF fetch(clk, rst, instr);

pipeFetchDecode pipeIFID(clk, rst, instr, instr_out);

Decode uut(clk, rst, instr_out, 
			  wr_pos_pxl, we_pxl, we_mul,  
			  wdp1, wdp2, wdp3, wdp4, 
			  wdm1, wdm2, wdm3, wdm4, wr_mul_pos_in,
			  
			  wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix_out1, pix_out2, pix_out3, pix_out4,
			  cte_out1, cte_out2, cte_out3, cte_out4,
			  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
			  i, j, n, wom_addr, wr_mul_pos_out);


endmodule 
