module alu(
	input [15:0] A,B,
	input [3:0] ALU_Sel,
	output [15:0] ALU_Out,
	output CarryOut
	output Overflow
)
reg 15:0 ALU_Result;
wire [16:0] tmp
assign ALU_Out=ALU_result
assign tmp={1'b0,A} + {1'b0,B};
assign CarryOut=tmp[8]; 
assign Overflow=tmp[8];
always @(*)
begin
	case (ALU_Sel)
	4'b0000: //Suma
		ALU_Result=A+B;
	4'b0001: //Resta
		ALU_Result=A-B;
	4'b0010: //Multiplicacion
		ALU_Result=A*B;
	4'b0011: //Division
		ALU_Result=A/B;
	4'b0100: //shift left logical
		ALU_Result=A<<1;
	4'b0101: //shift right logical
		ALU_Result=A>>1;
	4'b0110: //Rotate left
		ALU_Result={A[14:0],A[15]};
	4'b0111: //Rotate right
		ALU_Result={A[0],A[15:1]};//rotate right
	4'b1000: //And logico
		ALU_Result=A&B;//and
	4'b1001: //Or logico
		ALU_Result=A|B;
	4'b1010: //Xor logico
		ALU_Result=A^B;
	4'b1011: //Nor logico
		ALU_Result= ~(A|B);
	4'b1100: //Nand logico
		ALU_Result= ~(A&B);
	4'b1101: //Xnor logico
		ALU_Result=~(A^B);
	4'b1110: //Comparacion de mayor
		ALU_Result=(A>B)?16'd1:16'd0;
	4'b1111: //Comparacion de igual
		ALU_Result= (A==B)?16'd1:16'd0;
	default: ALU_Result = A+B;
endcase // ALU_Sel
end

endmodule // alu