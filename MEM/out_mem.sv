module out_mem(clk, addr, we, wd1, wd2, wd3, wd4, sumr1, sumr2, sumr3, sumr4);
					
	input logic clk, we;
	input logic [31:0] addr, wd1, wd2, wd3, wd4;
		
	output logic [31:0] sumr1, sumr2, sumr3, sumr4;
	
	logic [31:0] SUM_RAM[127:0];
	
	assign sumr1 = SUM_RAM[addr]; 
	assign sumr2 = SUM_RAM[addr+32'b1]; 
	assign sumr3 = SUM_RAM[addr+32'b10]; 
	assign sumr4 = SUM_RAM[addr+32'b11];
	
	
	always @(posedge clk) begin
		if (we) begin
			SUM_RAM[addr] <= wd1;
			SUM_RAM[addr+32'b1] <= wd2;
			SUM_RAM[addr+32'b10] <= wd3;
			SUM_RAM[addr+32'b11] <= wd4;
			/*if (last_addr == 32'd4) begin
				$writememh("C://Users//DELL//Desktop//P2-Final//Vector_ASIP//outHex.txt", SUM_RAM);
			end*/
		end
	end
					
endmodule