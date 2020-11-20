module scalar_reg(clk, rst, sca_reg_op, imm, i_out, j_out, n_out, wom_addr_out, wr_mul_pos_out);

	input logic clk, rst;
	input logic [2:0] sca_reg_op;
	input logic [31:0] imm;
	
	output logic [31:0] i_out, j_out, n_out, wom_addr_out;
	output logic wr_mul_pos_out;

	logic [31:0] i = 32'b0;
	logic [31:0] j = 32'b0;
	logic [31:0] n = 32'b0;
	logic [31:0] wom_addr = 32'b11111111111111111111111111111100;
	logic wr_mul_pos = 1'b1;
	
	always_ff @(posedge clk && ~rst) begin
		case (sca_reg_op)
			3'b000: //INCRI 
				begin
					i = i + 1;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
			3'b001: //INCRJ
				begin
					if(n == j)
						j = 0;
					else
						j = j + 1;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
			3'b010: //SETN
				begin
					n = imm;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
			3'b011: //SUMF
				begin
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr = wom_addr + 4;
					wom_addr_out = wom_addr;
				end
			3'b100: //MULF 
				begin
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos = ~wr_mul_pos;
					wr_mul_pos_out = wr_mul_pos;
				end
			3'b101: //NOP
				begin
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
			3'b111: //LDV
				begin
					i_out = i;
					j_out = j;
					n_out = n;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
			
			default:
				begin
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
					wom_addr_out = 32'bx;
					wr_mul_pos_out = 1'bx;
				end
		endcase
	end

endmodule
