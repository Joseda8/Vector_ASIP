module control_unit (instr, rd_pos_cte, rd_pos_pxl, wr_pxl, wr_mul_reg,
							alu_func, wr_wom);
															
					
	input logic [31:0] instr;
	output logic rd_pos_cte, rd_pos_pxl, wr_pxl, wr_mul_reg, alu_func, wr_wom;
	

	always @(*) begin
		case(instr[31:28]) 
			4'b0000, 4'b0001, 4'b0010: //INCRI - INCRJ - SETN
				begin
					alu_func = 1'bx;
					rd_pos_cte = 1'b0;
					rd_pos_pxl = 1'b0;
					wr_pxl = 1'b0;
					wr_mul_reg = 1'b0;
					wr_wom = 1'b0;
				end
			4'b0011: //SUMFV
				begin
					alu_func = 1'b0;
					rd_pos_cte = 1'b0;
					rd_pos_pxl = 1'b0;
					wr_pxl = 1'b0;
					wr_mul_reg = 1'b0;
					wr_wom = 1'b1;
				end
			4'b0100: //MULFV
				begin
					alu_func = 1'b1;
					rd_pos_cte = instr[27];
					rd_pos_pxl = instr[26];
					wr_pxl = 1'b0;
					wr_mul_reg = 1'b1;
					wr_wom = 1'b0;
				end
			4'b0101: //NOP
				begin
					alu_func = alu_func;
					rd_pos_cte = rd_pos_cte;
					rd_pos_pxl = rd_pos_pxl;
					wr_pxl = wr_pxl;
					wr_mul_reg = wr_mul_reg;
					wr_wom = wr_wom;
				end
			4'b0110: //LDV
				begin
					alu_func = 1'bx;
					rd_pos_cte = 1'b0;
					rd_pos_pxl = instr[27];
					wr_pxl = 1'b1;
					wr_mul_reg = 1'b0;
					wr_wom = 1'b0;
				end

			default:
				begin
					alu_func = 1'bx;
					rd_pos_cte = 1'b0;
					rd_pos_pxl = 1'b0;
					wr_pxl = 1'b0;
					wr_mul_reg = 1'b0;
					wr_wom = 1'b0;
				end
			
		endcase
	end


endmodule
