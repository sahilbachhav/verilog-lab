//this full subtractor is made by using two half subtractor circuits...

//half subtractor
module half_sub(
    input a,
    input b,
    output diff,
    output borrow
);

assign diff = a ^ b;
assign borrow = (~a) & b;

endmodule

//full subtractor
module full_sub(
    input a,
    input b,
    input bin,
    output d,
    output bout
);

wire d1, b1, b2;

//first half subtractor
half_sub HS1(
    .a(a),
    .b(b),
    .diff(d1),
    .borrow(b1)
);

//second half subtractor
half_sub HS2(
    .a(d1),
    .b(bin),
    .diff(d),
    .borrow(b2)
);

//final borrow
assign bout = b1 | b2;
endmodule