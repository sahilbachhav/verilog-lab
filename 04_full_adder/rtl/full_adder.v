module full_adder(
    input a,
    input b,
    input cin,
    output sum1,
    output carry1,
    output sum,
    output carry2,
    output cout
);

assign sum1 = a^b;
assign carry1 = a&b;
assign sum = sum1 ^ cin;
assign carry2 = sum1 & cin;
assign cout = carry1 | carry2;

endmodule;