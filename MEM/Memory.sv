module Memory(clk, wr_wom, i, j, n, algorithm,
				  result1, result2, result3, result4,
				  load1, load2, load3, load4,
				  
				  sumr1, sumr2, sumr3, sumr4, saddr);
				  
	input logic clk, wr_wom, algorithm;
	input logic [31:0] i, j, n, result1, result2, result3, result4;
	
	output logic [31:0] load1, load2, load3, load4, sumr1, sumr2, sumr3, sumr4, saddr;
	
	logic [31:0] addr1, addr2, addr3, addr4;
	logic [31:0] wr_addr = 32'b0;
	
	address_calculator addr_calc(i, j, n, addr1, addr2, addr3, addr4);
	
	dmem rom_img(clk, addr1, addr2, addr3, addr4, load1, load2, load3, load4);
	
	out_mem wom(clk, wr_addr, wr_wom, result1, result2, result3, result4, sumr1, sumr2, sumr3, sumr4, saddr);

endmodule
