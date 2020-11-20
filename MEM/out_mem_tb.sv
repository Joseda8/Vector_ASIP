module out_mem_tb();

	logic clk, we;
	logic [31:0] addr, wd1, wd2, wd3, wd4, last_addr;

	out_mem uut(clk, addr, we, wd1, wd2, wd3, wd4, last_addr);
	
	initial begin
		clk = 1;
		
		#10 we = 1; addr = 32'b0; wd1 = 32'd15; wd2 = 32'd45; wd3 = 32'd74; wd4 = 32'd82;
		#100 we = 0;
		#10 we = 1; addr = 32'd4;wd1 = 32'd16; wd2 = 32'd46; wd3 = 32'd76; wd4 = 32'd86;
		#10 we = 0;
		#50 addr = 32'b0;
		#50 addr = 32'b100;
	end
	
	always #5 clk = ~clk;

endmodule
