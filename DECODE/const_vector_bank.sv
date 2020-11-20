module const_vector_bank(clk, rst, rd_pos, out1, out2, out3, out4);

	input logic clk, rst, rd_pos;
	output logic [31:0] out1, out2, out3, out4;
	
	logic [31:0] constants[7:0];
	
	initial begin
		$readmemh("C://Users//DELL//Desktop//P2-Final//Vector_ASIP//const.txt", constants);
	end
	
	always_ff @(posedge rst) 
		constants <= '{8{32'b0}};
		
	assign out1 = rd_pos ? constants[4] : constants[0];
	assign out2 = rd_pos ? constants[5] : constants[1];
	assign out3 = rd_pos ? constants[6] : constants[2];
	assign out4 = rd_pos ? constants[7] : constants[3];
		
	/*always_ff @(posedge clk) begin
		if(rd_pos) begin
			out1 <= constants[4];
			out2 <= constants[5];
			out3 <= constants[6];
			out4 <= constants[7];
		end
		else begin
			out1 <= constants[0];
			out2 <= constants[1];
			out3 <= constants[2];
			out4 <= constants[3];
		end
	
	end*/
endmodule
