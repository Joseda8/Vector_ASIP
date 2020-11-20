module pipeFetchDecode(	input  logic clk, reset,
								input  logic [31:0] instr_in,
								output logic [31:0] instr_out);

flopr instrReg(clk, reset, instr_in, instr_out);
								
endmodule 