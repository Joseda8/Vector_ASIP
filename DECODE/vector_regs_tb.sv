module vector_regs_tb();

	logic clk, rst, rd_pos, we, wr_pos;
	logic [31:0] wd1, wd2, wd3, wd4, out1, out2, out3, out4;

	pixels_vector_bank uut(clk, rst, rd_pos, wr_pos, we, wd1, wd2, wd3, wd4, out1, out2, out3, out4);
	
	initial begin
		
		clk = 1;
		
		#10 we = 1; rd_pos = 0; wr_pos = 0; wd1 = 32'd15; wd2 = 32'd45; wd3 = 32'd74; wd4 = 32'd82;
		#10 we = 0;
		#10 we = 1; rd_pos = 1; wr_pos = 1;wd1 = 32'd16; wd2 = 32'd46; wd3 = 32'd75; wd4 = 32'd83;
		#10 we = 0;
		#100 rd_pos = 0;
		#100 rd_pos = 1;
	
	end
	
	always #5 clk = ~clk;

endmodule
