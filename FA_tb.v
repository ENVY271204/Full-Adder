`timescale 1ns/1ns

module FA_tb;
reg a,b,carryin;
wire sum,carryout;
FullAdder HA(.sum(sum),.carryin(carryin),.carryout(carryout),.A(a),.B(b));
initial begin
    $dumpfile("FA_tb.vcd");
    $dumpvars(0,FA_tb);
    a=1;b=1;carryin=1; #10;
    a=0;b=1;carryin=1; #10;
    a=1;b=0;carryin=0; #10;
    a=0;b=0;carryin=0; #10;
    #10 $finish;
end
endmodule