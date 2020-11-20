module control_unit_tb();

	logic [31:0] instr;
	logic rd_pos_cte, rd_pos_pxl, wr_pxl, wr_mul_reg, alu_func, wr_wom;

	control_unit uut(instr, rd_pos_cte, rd_pos_pxl, wr_pxl, wr_mul_reg, alu_func, wr_wom);
	
	initial begin
		#50 instr = 32'b00100000000000000000000110010000; // SETN 400
		#50 instr = 32'b00000000000000000000000000000000; // INCRI
		#50 instr = 32'b00010000000000000000000000000000; // INCRJ
		#50 instr = 32'b01001100000000000000000000000000; // MULFV 1 0
		#50 instr = 32'b01010000000000000000000000000000; // NOP
		#50 instr = 32'b00110000000000000000000000000000; // SUMFV
		#50 instr = 32'b01101000000000000000000000000000; // LDV 1
		#50 instr = 32'b01010000000000000000000000000000; // NOP
		#50;
	end


endmodule
