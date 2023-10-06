`timescale 1ns/1ps

module RCA_tb;
reg [3:0] in1; reg[3:0] in2; reg cin;
wire [3:0] out; wire carry;
RCA RCA4(.out(out),.in1(in1),.in2(in2),.cin(cin),.carry(carry));
initial begin
    $dumpfile("RCA_tb.vcd");
    $dumpvars(0,RCA_tb);
    in1=4'b1111;in2=4'b0000;cin=1; #20;
    in1=4'b0000;in2=4'b0001;cin=0;#20
    #10 $finish;
end
endmodule