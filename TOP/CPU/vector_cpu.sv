module vector_cpu(clk, rst, instr_out, 
								wr_pos_pxl, we_pxl, we_mul,  
								wdp1, wdp2, wdp3, wdp4, 
								wdm1, wdm2, wdm3, wdm4, wr_mul_pos_in, 
								
								wr_pxl_wb, wr_pos_wb, wr_mul_reg_wb, alu_func_pipe, wr_wom_pipe_out,
								pix1_pipe, pix2_pipe, pix3_pipe, pix4_pipe,
								cte1_pipe, cte2_pipe, cte3_pipe, cte4_pipe,
								mul1_pipe, mul2_pipe, mul3_pipe, mul4_pipe, mul5_pipe, mul6_pipe, mul7_pipe, mul8_pipe,
								i_pipe_out, j_pipe_out, n_pipe_out, wom_addr_pipe_out, wr_mul_pos_wb, 
								
								r1_wb, r2_wb, r3_wb, r4_wb, 
								load1_wb, load2_wb,  load3_wb,  load4_wb,
								sumr1, sumr2, sumr3, sumr4);

input logic clk, rst;

input logic wr_pos_pxl, we_pxl, we_mul, wr_mul_pos_in;
input logic [31:0] wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;

output logic [31:0] instr_out;

logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom, wr_mul_pos_out;
logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
						cte_out1, cte_out2, cte_out3, cte_out4,
						mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
						i, j, n, wom_addr;

logic [31:0] instr;

IF fetch(clk, rst, instr);

pipeFetchDecode pipeIFID(clk, rst, instr, instr_out);

Decode decode(clk, rst, instr_out, 
			  wr_pos_wb, wr_pxl_wb, wr_mul_reg_wb,  
			  load1_wb, load2_wb,  load3_wb,  load4_wb,
			  r1_wb, r2_wb, r3_wb, r4_wb, wr_mul_pos_wb,
			  			  
			  wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix_out1, pix_out2, pix_out3, pix_out4,
			  cte_out1, cte_out2, cte_out3, cte_out4,
			  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
			  i, j, n, wom_addr, wr_mul_pos_out);

logic wr_pxl_pipe, wr_pos_pipe, wr_mul_reg_pipe, wr_wom_pipe, wr_mul_pos_pipe;
logic [31:0] i_pipe, j_pipe, n_pipe, wom_addr_pipe;

output logic alu_func_pipe;
output logic [31:0] pix1_pipe, pix2_pipe, pix3_pipe, pix4_pipe,
						cte1_pipe, cte2_pipe, cte3_pipe, cte4_pipe,
						mul1_pipe, mul2_pipe, mul3_pipe, mul4_pipe, mul5_pipe, mul6_pipe, mul7_pipe, mul8_pipe;
						

pipeDecodeExe pipeIDEXE(clk, rst, 
					wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
					pix_out1, pix_out2, pix_out3, pix_out4,
					cte_out1, cte_out2, cte_out3, cte_out4,
					mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
					i, j, n, wom_addr, wr_mul_pos_out,

					wr_pxl_pipe, wr_pos_pipe, wr_mul_reg_pipe, alu_func_pipe, wr_wom_pipe,
					pix1_pipe, pix2_pipe, pix3_pipe, pix4_pipe,
					cte1_pipe, cte2_pipe, cte3_pipe, cte4_pipe,
					mul1_pipe, mul2_pipe, mul3_pipe, mul4_pipe, mul5_pipe, mul6_pipe, mul7_pipe, mul8_pipe,
					i_pipe, j_pipe, n_pipe, wom_addr_pipe, wr_mul_pos_pipe);
					
logic [31:0] r1, r2, r3, r4;

Execution exec(clk, alu_func_pipe, 
				  cte1_pipe, cte2_pipe, cte3_pipe, cte4_pipe,
				  pix1_pipe, pix2_pipe, pix3_pipe, pix4_pipe,
				  mul1_pipe, mul2_pipe, mul3_pipe, mul4_pipe, mul5_pipe, mul6_pipe, mul7_pipe, mul8_pipe,
				
				  r1, r2, r3, r4);

output logic wr_wom_pipe_out;
logic wr_pxl_pipe_out, wr_pos_pipe_out, wr_mul_reg_pipe_out, wr_mul_pos_pipe_out;
output logic [31:0] i_pipe_out, j_pipe_out, n_pipe_out, wom_addr_pipe_out;
logic [31:0] r1_pipe_out, r2_pipe_out, r3_pipe_out, r4_pipe_out; 

pipeExeMem pipeEXEMEM(clk, rst, 
					wr_pxl_pipe, wr_pos_pipe, wr_mul_reg_pipe, wr_wom_pipe,
					i_pipe, j_pipe, n_pipe, wom_addr_pipe, wr_mul_pos_pipe,
					r1, r2, r3, r4,
					
					wr_pxl_pipe_out, wr_pos_pipe_out, wr_mul_reg_pipe_out, wr_wom_pipe_out,
					i_pipe_out, j_pipe_out, n_pipe_out, wom_addr_pipe_out, wr_mul_pos_pipe_out,
					r1_pipe_out, r2_pipe_out, r3_pipe_out, r4_pipe_out
					);


logic algorithm = 0;

output logic [31:0] sumr1, sumr2, sumr3, sumr4;
logic [31:0] load1, load2, load3, load4;


Memory mem(clk, wr_wom_pipe_out, i_pipe_out, j_pipe_out, n_pipe_out, wom_addr_pipe_out, algorithm,
				  r1_pipe_out, r2_pipe_out, r3_pipe_out, r4_pipe_out,
				  
				  load1, load2, load3, load4,
				  sumr1, sumr2, sumr3, sumr4);

output logic wr_pxl_wb, wr_pos_wb, wr_mul_reg_wb, wr_mul_pos_wb;
output logic [31:0] r1_wb, r2_wb, r3_wb, r4_wb, load1_wb, load2_wb,  load3_wb,  load4_wb;

pipeMemWb pipeMEMWB(clk, rst, 
					wr_pxl_pipe_out, wr_pos_pipe_out, wr_mul_reg_pipe, wr_mul_pos_pipe,
					r1_pipe_out, r2_pipe_out, r3_pipe_out, r4_pipe_out,
					load1, load2, load3, load4,
					
					wr_pxl_wb, wr_pos_wb, wr_mul_reg_wb, wr_mul_pos_wb,
					r1_wb, r2_wb, r3_wb, r4_wb,
					load1_wb, load2_wb,  load3_wb,  load4_wb);

endmodule 
