module not_gate_tb;

reg a;
wire y;

not_gate dut(
    .a(a),
    .y(y)
);

initial begin
     $dumpfile("not_gate.vcd");
    $dumpvars(0, not_gate_tb);

     $monitor("Time=%0t a=%b y=%b", $time, a, y);
     //test vector 1 : 0
    a = 0;

     //test vector 2 : 1
    #10;
    a = 1;

    #10;
    $finish;
end
endmodule