module pipeDecodeExe (clk, rst, 
			  wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
			  pix1, pix2, pix3, pix4,
			  cte1, cte2, cte3, cte4,
			  mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8,
			  i, j, n, wom_addr, wr_mul_pos,
			  
			  wr_pxl_out, wr_pos_out, wr_mul_reg_out, alu_func_out, wr_wom_out,
			  pix1_out, pix2_out, pix3_out, pix4_out,
			  cte1_out, cte2_out, cte3_out, cte4_out,
			  mul1_out, mul2_out, mul3_out, mul4_out, mul5_out, mul6_out, mul7_out, mul8_out,
			  i_out, j_out, n_out, wom_addr_out, wr_mul_pos_out);

input clk, rst;			  
input logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom, wr_mul_pos;
input logic [31:0] pix1, pix2, pix3, pix4,
						cte1, cte2, cte3, cte4,
						mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8,
						i, j, n, wom_addr;
						
output wr_pxl_out, wr_pos_out, wr_mul_reg_out, alu_func_out, wr_wom_out, wr_mul_pos_out;

output logic [31:0] pix1_out, pix2_out, pix3_out, pix4_out, cte1_out, cte2_out, cte3_out, cte4_out,
							mul1_out, mul2_out, mul3_out, mul4_out, mul5_out, mul6_out, mul7_out, mul8_out,
							i_out, j_out, n_out, wom_addr_out;
						

flopr #(1) wr_pxl_pipe (clk, rst, wr_pxl, wr_pxl_out);
flopr #(1) wr_pos_pipe (clk, rst, wr_pos, wr_pos_out);
flopr #(1) wr_mul_reg_pipe (clk, rst, wr_mul_reg, wr_mul_reg_out);
flopr #(1) alu_func_pipe (clk, rst, alu_func, alu_func_out);
flopr #(1) wr_wom_pipe (clk, rst, wr_wom, wr_wom_out);
flopr #(1) wr_mul_pos_pipe (clk, rst, wr_mul_pos, wr_mul_pos_out);

flopr #(32) pix1_pipe (clk, rst, pix1, pix1_out);
flopr #(32) pix2_pipe (clk, rst, pix2, pix2_out);
flopr #(32) pix3_pipe (clk, rst, pix3, pix3_out);
flopr #(32) pix4_pipe (clk, rst, pix4, pix4_out);
flopr #(32) cte1_pipe (clk, rst, cte1, cte1_out);
flopr #(32) cte2_pipe (clk, rst, cte2, cte2_out);
flopr #(32) cte3_pipe (clk, rst, cte3, cte3_out);
flopr #(32) cte4_pipe (clk, rst, cte4, cte4_out);
flopr #(32) mul1_pipe (clk, rst, mul1, mul1_out);
flopr #(32) mul2_pipe (clk, rst, mul2, mul2_out);
flopr #(32) mul3_pipe (clk, rst, mul3, mul3_out);
flopr #(32) mul4_pipe (clk, rst, mul4, mul4_out);
flopr #(32) mul5_pipe (clk, rst, mul5, mul5_out);
flopr #(32) mul6_pipe (clk, rst, mul6, mul6_out);
flopr #(32) mul7_pipe (clk, rst, mul7, mul7_out);
flopr #(32) mul8_pipe (clk, rst, mul8, mul8_out);
flopr #(32) i_pipe (clk, rst, i, i_out);
flopr #(32) j_pipe (clk, rst, j, j_out);
flopr #(32) n_pipe (clk, rst, n, n_out);
flopr #(32) wom_addr_pipe (clk, rst, wom_addr, wom_addr_out);

endmodule 
