`timescale 1ns/1ps

module mux_4to1_tb;

reg a,b,c,d;
wire y;
reg s0,s1;

reg expected;
integer i;

//dut
mux_4to1 dut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s0(s0),
    .s1(s1),
    .y(y)
);

initial begin
 $dumpfile("waveform/mux_4to1.vcd");
    $dumpvars(0, mux_4to1_tb);

    for (i = 0; i < 64; i++) begin
        {a, b, c, d, s0,s1} = i;
        #10;

//calculating expected output
        case ({s1,s0})
    2'b00: expected = a;
    2'b01: expected = b;
    2'b10: expected = c;
    2'b11: expected = d;
    endcase

//comparing actual output with expected output
    if(y == expected)
    $display("PASS | a=%b b=%b c=%b d=%b | s0=%b s1=%b | y=%b", a, b, c, d, s0, s1, y);
    else
    $display("FAIL | a=%b b=%b c=%b d=%b | s0=%b s1=%b | y=%b expected=%b", a, b, c, d, s0, s1, y,expected);
    
end
$finish;
end
endmodule