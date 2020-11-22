module pipeExeMem (clk, rst, 
					wr_pxl_in, wr_pos_in, wr_mul_reg_in, wr_wom_in,
					i_in, j_in, n_in, wom_addr_in, wr_mul_pos_in,
					r1_in, r2_in, r3_in, r4_in,
					
					wr_pxl_out, wr_pos_out, wr_mul_reg_out, wr_wom_out,
					i_out, j_out, n_out, wom_addr_out, wr_mul_pos_out,
					r1_out, r2_out, r3_out, r4_out);

input clk, rst;	

input logic wr_pxl_in, wr_pos_in, wr_mul_reg_in, wr_wom_in, wr_mul_pos_in;		  
input logic [31:0] i_in, j_in, n_in, wom_addr_in, r1_in, r2_in, r3_in, r4_in;

output logic wr_pxl_out, wr_pos_out, wr_mul_reg_out, wr_wom_out, wr_mul_pos_out;		  
output logic [31:0] i_out, j_out, n_out, wom_addr_out, r1_out, r2_out, r3_out, r4_out;
												

flopr #(1) wr_pxl_pipe (clk, rst, wr_pxl_in, wr_pxl_out);
flopr #(1) wr_pos_pipe (clk, rst, wr_pos_in, wr_pos_out);
flopr #(1) wr_mul_reg_pipe (clk, rst, wr_mul_reg_in, wr_mul_reg_out);
flopr #(1) wr_wom_pipe (clk, rst, wr_wom_in, wr_wom_out);
flopr #(1) wr_mul_pos_pipe (clk, rst, wr_mul_pos_in, wr_mul_pos_out);

flopr #(32) i_pipe (clk, rst, i_in, i_out);
flopr #(32) j_pipe (clk, rst, j_in, j_out);
flopr #(32) n_pipe (clk, rst, n_in, n_out);
flopr #(32) wom_addr_pipe (clk, rst, wom_addr_in, wom_addr_out);
flopr #(32) r1_pipe (clk, rst, r1_in, r1_out);
flopr #(32) r2_pipe (clk, rst, r2_in, r2_out);
flopr #(32) r3_pipe (clk, rst, r3_in, r3_out);
flopr #(32) r4_pipe (clk, rst, r4_in, r4_out);

endmodule 
