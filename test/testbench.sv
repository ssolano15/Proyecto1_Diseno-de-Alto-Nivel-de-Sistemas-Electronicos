`timescale 1ns/1ps

module tb_alu;
	reg[15:0] A,B;
	reg[3:0] ALU_Sel;

	wire[15:0] ALU_Out;
	wire Carryout;
	integer i;
	alu unidad_testeo(
		A,B,
		ALU_Sel,
		ALU_Out,
		Carryout
		);
	initial begin
		A=16'h0A;
		B=16'h02;
		ALU_Sel=4'h0;

		for (i=0;i<=15;i=i+1)
		begin
			ALU_Sel = ALU_Sel+16'h01;
			#10;
		end;

		A=16'hF6
		B=16'h0A

	end // initial
	endmodule // tb_alu
