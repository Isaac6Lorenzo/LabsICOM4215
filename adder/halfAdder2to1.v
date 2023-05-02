module halfAdder2to1(A, B, Sum, C);
input A, B;
output Sum, C;

assign Sum = A^B;
assign C = A && B;

endmodule