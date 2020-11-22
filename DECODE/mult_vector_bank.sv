module mult_vector_bank(clk, wr_mul_pos, we, wd1, wd2, wd3, wd4, 
					 out1, out2, out3, out4, out5, out6, out7, out8,
					 flag);

	input logic clk, wr_mul_pos, we;
	input logic [31:0] wd1, wd2, wd3, wd4;
	
	output logic [31:0] out1, out2, out3, out4, out5, out6, out7, out8;
	output int flag;
	
	logic [31:0] MULT[1:0][127:0];
	
	
	initial begin
		flag = 0;
	end
	
	
	assign out1 = MULT[0][0]; 
	assign out2 = MULT[0][32]; 
	assign out3 = MULT[0][64]; 
	assign out4 = MULT[0][96]; 
	assign out5 = MULT[1][0]; 
	assign out6 = MULT[1][32]; 
	assign out7 = MULT[1][64]; 
	assign out8 = MULT[1][96];

	/*
	always @(negedge we) begin
		if(flag == 0) 
			flag <= 1;
		else
			flag <= 0; 
	end
	*/
	
	always @(posedge clk) begin
		if(we) begin
		
			if(wr_mul_pos) begin
				MULT[1][0] <= wd1;
				MULT[1][32] <= wd2;
				MULT[1][64] <= wd3;
				MULT[1][96] <= wd4;
			end
			
			else begin
				MULT[0][0] <= wd1;
				MULT[0][32] <= wd2;
				MULT[0][64] <= wd3;
				MULT[0][96] <= wd4;			
			end

		end 
	end
	
	
endmodule
