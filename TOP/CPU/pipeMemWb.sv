module pipeMemWb (clk, rst, 
					wr_pxl_in, wr_pos_in, wr_mul_reg_in, wr_mul_pos_in,
					r1_in, r2_in, r3_in, r4_in,
					load1_in, load2_in, load3_in, load4_in,
					
					wr_pxl_out, wr_pos_out, wr_mul_reg_out, wr_mul_pos_out,
					r1_out, r2_out, r3_out, r4_out,
					load1_out, load2_out, load3_out, load4_out);

					
input clk, rst;	

input logic wr_pxl_in, wr_pos_in, wr_mul_reg_in, wr_mul_pos_in;  
input logic [31:0] r1_in, r2_in, r3_in, r4_in, load1_in, load2_in, load3_in, load4_in;

output logic wr_pxl_out, wr_pos_out, wr_mul_reg_out, wr_mul_pos_out;		  
output logic [31:0] r1_out, r2_out, r3_out, r4_out, load1_out, load2_out, load3_out, load4_out;
												

flopr #(1) wr_pxl_pipe (clk, rst, wr_pxl_in, wr_pxl_out);
flopr #(1) wr_pos_pipe (clk, rst, wr_pos_in, wr_pos_out);
flopr #(1) wr_mul_pipe (clk, rst, wr_mul_reg_in, wr_mul_reg_out);
flopr #(1) wr_mul_pos_pipe (clk, rst, wr_mul_pos_in, wr_mul_pos_out);

flopr #(32) r1_pipe (clk, rst, r1_in, r1_out);
flopr #(32) r2_pipe (clk, rst, r2_in, r2_out);
flopr #(32) r3_pipe (clk, rst, r3_in, r3_out);
flopr #(32) r4_pipe (clk, rst, r4_in, r4_out);

flopr #(32) load1_pipe (clk, rst, load1_in, load1_out);
flopr #(32) load2_pipe (clk, rst, load2_in, load2_out);
flopr #(32) load3_pipe (clk, rst, load3_in, load3_out);
flopr #(32) load4_pipe (clk, rst, load4_in, load4_out);

endmodule 
