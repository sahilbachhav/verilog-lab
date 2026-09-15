module half_sub_tb;

reg a;
reg b;
wire diff;
wire borrow;

half_sub dut(
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

initial begin
    $dumpfile("half_sub.vcd");
    $dumpvars(0, half_sub_tb);

    $monitor("Time=%0t a=%b b=%b diff=%b borrow=%b", $time, a, b, diff, borrow);

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

