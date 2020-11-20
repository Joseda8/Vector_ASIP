module pixels_vector_bank(clk, rst, rd_pos, wr_pos, we, wd1, wd2, wd3, wd4, out1, out2, out3, out4);

	input logic clk, rst, rd_pos, we, wr_pos;
	input logic [31:0] wd1, wd2, wd3, wd4;
	output logic [31:0] out1, out2, out3, out4;
	
	logic [31:0] pixels[1:0][127:0];
	
	assign out1 = rd_pos ? pixels[1][0] : pixels[0][0];
	assign out2 = rd_pos ? pixels[1][32] : pixels[0][32];
	assign out3 = rd_pos ? pixels[1][64] : pixels[0][64];
	assign out4 = rd_pos ? pixels[1][96] : pixels[0][96];
	
		
	always_ff @(posedge clk) begin
		/*if(rd_pos) begin
			out1 <= pixels[1][0];
			out2 <= pixels[1][32];
			out3 <= pixels[1][64];
			out4 <= pixels[1][96];
		end
		else begin
			out1 <= pixels[0][0];
			out2 <= pixels[0][32];
			out3 <= pixels[0][64];
			out4 <= pixels[0][96];
		end*/
		
		if(we) begin
			if(wr_pos) begin
				pixels[1][0] <= wd1;
				pixels[1][32] <= wd2;
				pixels[1][64] <= wd3;
				pixels[1][96] <= wd4;
			end
		
			else begin
				pixels[0][0] <= wd1;
				pixels[0][32] <= wd2;
				pixels[0][64] <= wd3;
				pixels[0][96] <= wd4;
			end
		end
	end
	
	/*always_ff @(posedge we) begin
		if(wr_pos) begin
			pixels[1][0] <= wd1;
			pixels[1][32] <= wd2;
			pixels[1][64] <= wd3;
			pixels[1][96] <= wd4;
		end
		
		else begin
			pixels[0][0] <= wd1;
			pixels[0][32] <= wd2;
			pixels[0][64] <= wd3;
			pixels[0][96] <= wd4;
		end
	end*/
	
endmodule