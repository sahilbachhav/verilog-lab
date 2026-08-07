module and_gate_tb;

reg a;
reg b;
wire y;

and_gate dut(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("and_gate.vcd");
    $dumpvars(0, and_gate_tb);
    
    $monitor("Time=%0t a=%b b=%b y=%b", $time, a, b, y);
     //test vector 1 : 00
    a = 0;
    b = 0;

    //test vector 2 : 01
    #10;
    a = 0;
    b = 1;

    //test vector 3 : 10
    #10;
    a = 1;
    b = 0;

    //test vector 4 : 11
    #10;
    a = 1;
    b = 1;

    #10;

    $finish;

    


end
endmodule



