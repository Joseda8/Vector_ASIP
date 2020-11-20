module instr_decoder(instr, sca_reg_op, imm);
														
   input logic [31:0] instr;
	
	output logic [2:0] sca_reg_op;
	output logic [31:0] imm;
		
	always @* begin 
		case (instr[31:28])
				4'b0000: //INCRI 
					begin
						sca_reg_op = 3'b000;
						imm = 24'd0;
					end
				4'b0001: //INCRJ
					begin
						sca_reg_op = 3'b001;
						imm = 24'd0;
					end
				4'b0010: //SETN
					begin
						sca_reg_op = 3'b010;
						imm = {7'b0, instr[24:0]};
					end
				4'b0011: //SUMFV
					begin
						sca_reg_op = 3'b011;
						imm = 24'd0;
					end
				4'b0100: //MULFV
					begin
						sca_reg_op = 3'b100;
						imm = 24'd0;
					end
				4'b0101: //NOP
					begin
						sca_reg_op = 3'b101;
						imm = 24'd0;
					end
				4'b0110: //LDV
					begin
						sca_reg_op = 3'b111;
						imm = 24'd0;
					end
				default:
					begin
						sca_reg_op = 3'bx;
						imm = 24'd0;
					end
			endcase
	end

endmodule
