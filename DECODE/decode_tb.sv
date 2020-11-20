module decode_tb();

	logic clk, rst, wr_pos_pxl, we_pxl, we_mul;
	logic [31:0] instruction, wdp1, wdp2, wdp3, wdp4, wdm1, wdm2, wdm3, wdm4;
	
	logic wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom;
	logic [31:0] pix_out1, pix_out2, pix_out3, pix_out4,
							  cte_out1, cte_out2, cte_out3, cte_out4,
							  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
							  i, j, n;
	
	Decode uut(clk, rst, instruction, 
				  wr_pos_pxl, we_pxl, we_mul,  
				  wdp1, wdp2, wdp3, wdp4, 
				  wdm1, wdm2, wdm3, wdm4,
				  
				  wr_pxl, wr_pos, wr_mul_reg, alu_func, wr_wom,
				  pix_out1, pix_out2, pix_out3, pix_out4,
				  cte_out1, cte_out2, cte_out3, cte_out4,
				  mul_out1, mul_out2, mul_out3, mul_out4, mul_out5, mul_out6, mul_out7, mul_out8,
				  i, j, n);
				  
	initial begin
	
		clk = 1;
		// escribir valores en pixeles
		/*#10 wr_pos_pxl = 0; we_pxl = 1; wdp1 = 32'd15; wdp2 = 32'd16; wdp3 = 32'd17; wdp4 = 32'd18; 
		#10 wr_pos_pxl = 1; we_pxl = 1; wdp1 = 32'd150; wdp2 = 32'd160; wdp3 = 32'd170; wdp4 = 32'd180; 
		#10 we_pxl = 0;*/
		//#10 instruction = 32'b01001100000000000000000000000000;
		
		// escribir valores en multiplicacion
		#10 wr_pos_pxl = 0; we_mul = 1; wdm1 = 32'd15; wdm2 = 32'd16; wdm3 = 32'd17; wdm4 = 32'd18; 
		#10 we_mul = 0;
		#10 wr_pos_pxl = 1; we_mul = 1; wdm1 = 32'd150; wdm2 = 32'd160; wdm3 = 32'd170; wdm4 = 32'd180;
		//#10 instruction = 32'b00110000000000000000000000000000;
		
		// multiplicación de pix x cte
		//#10 instruction = 32'b01001100000000000000000000000000; // MULFV 1 0
		
		// suma
		#10 instruction = 32'b00110000000000000000000000000000; // SUMFV
	end
	
	always #5 clk = ~clk;

endmodule
