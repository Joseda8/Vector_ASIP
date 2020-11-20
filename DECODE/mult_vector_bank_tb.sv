module mult_vector_bank_tb();

	logic clk, we;
	logic [31:0] wd1, wd2, wd3, wd4, out1, out2, out3, out4, out5, out6, out7, out8;
	int flag;

	mult_vector_bank uut(clk, we, wd1, wd2, wd3, wd4, 
								out1, out2, out3, out4, out5, out6, out7, out8,
								flag);
								
	initial begin
		
		clk = 1;
		
		#10 we = 1; wd1 = 32'd15; wd2 = 32'd45; wd3 = 32'd74; wd4 = 32'd82;
		#10 we = 0;
		#20;
		#10 we = 1; wd1 = 32'd16; wd2 = 32'd46; wd3 = 32'd75; wd4 = 32'd83;
		#10 we = 0;
	
	end
	
	always #5 clk = ~clk;


endmodule
