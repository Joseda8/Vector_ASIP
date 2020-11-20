module dmem(clk, addr1, addr2, addr3, addr4, out1, out2, out3, out4);
		
		input logic clk;
		input logic [31:0] addr1, addr2, addr3, addr4;
		
		output logic [31:0] out1, out2, out3, out4;
		
		logic [31:0] RAM[1023:0];
		
		initial begin
			$readmemh("C://Users//DELL//Desktop//P2-Final//Vector_ASIP//hex2.txt", RAM);
		end

		assign out1 = RAM[addr1[31:0]]; 
		assign out2 = RAM[addr2[31:0]]; 
		assign out3 = RAM[addr3[31:0]]; 
		assign out4 = RAM[addr4[31:0]]; 
		
				
endmodule
