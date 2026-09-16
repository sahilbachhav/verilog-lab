module full_sub_tb;

reg a, b, bin;
wire d, bout;
integer i;

full_sub dut(
    .a(a),
    .b(b),
    .bin(bin),
    .d(d),
    .bout(bout)
);

initial begin
    $dumpfile("full_sub.vcd");
    $dumpvars(0, full_sub_tb);

    $monitor("Time=%0t a=%b b=%b bin=%b d=%b bout=%b", $time, a, b, bin, d, bout);

    for(i=0; i<8; i++) begin
        {a, b, bin} = i;
        #10;
    end

    $finish;

end
endmodule