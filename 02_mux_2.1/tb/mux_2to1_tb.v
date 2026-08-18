module mux_2to1_tb;

reg a;
reg b;
reg s;
wire y;

mux_2to1 dut(
    .a(a),
    .b(b),
    .s(s),
    .y(y)
);

initial begin
    $dumpfile("mux_2to1.vcd");
    $dumpvars(0, mux_2to1_tb );

    $monitor("Time=%0t a=%b b=%b s=%b y=%b", $time, a, b, s, y);

    //test vector 1: 000
    a = 0; b = 0; s = 0;

    //test vector 2: 010
    #10; a = 0; b = 1; s = 0;

    //test vector 3: 100
    #10; a = 1; b = 0; s = 0;

    //test vector 4: 110
    #10; a = 1; b = 1; s = 0;

    //test vector 5: 001
    #10; a = 0; b = 0; s = 1;

    //test vector 6: 011
    #10; a = 0; b = 1; s = 1;

    //test vector 7: 101
    #10; a = 1; b = 0; s = 1;

    //test vector 8: 111
    #10; a = 1; b = 1; s = 1; 

    #10; $finish;

end
endmodule    

    
