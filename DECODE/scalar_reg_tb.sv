module scalar_reg_tb();

	logic clk, rst, wr_mul_pos_out;
	logic [2:0] sca_reg_op;
	logic [31:0] imm;
	
	logic [31:0] i_out, j_out, n_out, wom_addr_out;

	scalar_reg uut(clk, rst, sca_reg_op, imm, i_out, j_out, n_out, wom_addr_out, wr_mul_pos_out);

	initial begin
		clk = 1; rst = 0;
		#100;
		
		#100 sca_reg_op = 3'b010; imm = 32'b0000000000000000000000000000111;
		#100 sca_reg_op = 3'b000; 
		#100 sca_reg_op = 3'b001;
		#100 sca_reg_op = 3'b011;
		#100 sca_reg_op = 3'b011;
		#100 sca_reg_op = 3'b100;
		#100 sca_reg_op = 3'b101;
		#100 sca_reg_op = 3'b011;
		#100 sca_reg_op = 3'b111;
		#100;
		
	end
	
	always begin
		#50
		clk = ~clk;
	end
      
endmodule
