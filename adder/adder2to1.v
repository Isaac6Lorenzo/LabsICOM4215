module adder(A, B, C, Sum, Carry);

    input A, B, C;
    output reg Sum, Carry;
    wire w1, w2, w3;

    // halfAdder2to1(output S, C, input A, B);
    // halfAdder2to1(A, B, Sum, C);

    halfAdder2to1 A01(A, B, w1, w2);
    halfAdder2to1 A02(w1, C, Sum, w3);
    OR_Gate O01(w3, C, Carry);
    

endmodule