module full_adder_tb;

reg a;
reg b;
reg cin;
wire sum1;
wire carry1;
wire carry2;
wire sum;
wire cout;

full_adder dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum1(sum1),
    .carry1(carry1),
    .carry2(carry2),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    $monitor("Time=%0t a=%b b=%b cin=%b sum1=%b carry1=%b carry2=%b sum=%b cout=%b", $time, a, b, cin, sum1, carry1, carry2, sum, cout);

    //test vector1
    a = 0; b = 0; cin = 0; #10;

    //test vector2
    a = 0; b = 0; cin = 1; #10;

    //test vector3
    a = 0; b = 1; cin = 0; #10;

    //test vector4
    a = 0; b = 1; cin  = 1; #10;

    //test vector5
    a = 1; b = 0; cin = 0; #10;

    //test vector6
    a = 1; b = 0; cin = 1; #10;

    //test vector7
     a = 1; b = 1; cin = 0; #10;

    //test vector8
    a = 1; b = 1; cin = 1; #10;

    $finish;

end
endmodule