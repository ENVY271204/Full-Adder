`timescale 1ns/1ns

module HA_tb;
reg a,b;
wire sum,carry;
HalfAdder HA(.sum(sum),.carry(carry),.A(a),.B(b));
initial begin
    $dumpfile("HA_tb.vcd");
    $dumpvars(0,HA_tb);
    a=1;b=1; #10;
    a=0;b=1; #10;
    a=1;b=0; #10;
    a=0;b=1; #10;
    #10 $finish;
end
endmodule