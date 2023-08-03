`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2023 02:10:32
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(input [7:0]A,B,input [2:0] opcode ,output reg[7:0]C,
output reg borrow ,carry, equal,less,more);

always@(*)
begin
    case(opcode)
    3'b000:{carry,C}=A+B;  //Addition
    3'b001:{borrow,C}=A-B; //Subtraction
    3'b010:C=A^B;          //XOR
    3'b011:C=A&B;          //AND
    3'b100:C=~(A|B);       //NOR
    3'b101:C=~(A&B);       //NAND
    3'b110:begin
           equal=(A==B)?1'b1:1'b0;
           more=(A>B)?1'b1:1'b0;
           less=(A<B)?1'b1:1'b0;
           end
    default:begin 
            C=8'b0;
            borrow=1'b0;
            carry=1'b0;
            end
    endcase
end            
endmodule
