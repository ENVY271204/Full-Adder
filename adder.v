`timescale 1ns/1ns
module HalfAdder (
    sum,carry,A,B
);
    input A,B;
    output sum,carry;
    not #1 (Abar,A);
    not #1 (Bbar,B);
    and #1 (ABbar,A,Bbar);
    and #1 (AbarB,Abar,B);
    or #1 (sum,ABbar,AbarB);
    and #1 (carry,A,B);
endmodule
module FullAdder (
    A,B,carryin,carryout,sum
);
    input A,B,carryin;
    output carryout,sum;
    wire carrymid1,carrymid2,summid;
    HalfAdder HA1(.sum(summid),.carry(carrymid1),.A(A),.B(B));
    HalfAdder HA2(.sum(sum),.carry(carrymid2),.A(summid),.B(carryin));
    or #1 (carryout,carrymid1,carrymid2);
endmodule
module RCA (
    input wire[3:0] in1, input wire[3:0] in2, output wire[3:0] out, input wire cin, output wire carry
);
    wire c1,c2,c3;
    FullAdder F1(.A(in1[0]),.B(in2[0]),.sum(out[0]),.carryin(cin),.carryout(c1));
    FullAdder F2(.A(in1[1]),.B(in2[1]),.sum(out[1]),.carryin(c1),.carryout(c2));
    FullAdder F3(.A(in1[2]),.B(in2[2]),.sum(out[2]),.carryin(c2),.carryout(c3));
    FullAdder F4(.A(in1[3]),.B(in2[3]),.sum(out[3]),.carryin(c3),.carryout(carry));
endmodule
// For the first case the delay in obtaining sum is 9ns
// For the first case the delay in obtaining carry is 7ns
// After changing the input the sum stabilizes after 5ns. The imput changes at 20ns and the sum finally stabilizes at 25ns