module half_adder_tb;

reg a;
reg b;
wire s;
wire c;

half_adder dut(
    .a(a),
    .b(b),
    .s(s),
    .c(c)
);

initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    $monitor("Time=%0t a=%b b=%b s=%b c=%b", $time, a, b, s, c);

    //test vector 1
    a = 0; b = 0; #10;

    //test vector 2
    a = 0; b = 1; #10;

    //test vector 3
    a = 1; b = 0; #10;

    //test vector 4
    a = 1; b = 1; #10;

    $finish;
end
endmodule
