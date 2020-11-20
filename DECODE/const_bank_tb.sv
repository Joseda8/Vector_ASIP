module const_bank_tb();
	
	logic clk, rst, rd_pos;
	logic [31:0] out1, out2, out3, out4;
	
	const_vector_bank uut(clk, rst, rd_pos, out1, out2, out3, out4);

	initial begin
		
		clk = 1; rst = 0;
		
		#10 rd_pos = 0;
		#50;
		#10 rd_pos = 1;
	
	end
	
	always #5 clk = ~clk;

endmodule