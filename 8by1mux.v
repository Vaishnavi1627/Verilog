//code

module eight1mux(a0,a1,a2,a3,a4,a5,a6,a7,s2,s1,s0,y);
  input a0,a1,a2,a3,a4,a5,a6,a7,s2,s1,s0;
  output y;
  
  assign y = (~s2&~s1&~s0)? a0 : (~s2&~s1&s0)? a1 :(~s2&s1&~s0)? a2 :(~s2&s1&s0)? a3 :(s2&~s1&~s0)? a4 :(s2&~s1&s0)? a5 :(s2&s1&~s0)? a6 :a7 ;
  
  endmodule
//testbench

module eight1mux_tb;
  reg a0,a1,a2,a3,a4,a5,a6,a7,s2,s1,s0;
  wire y;
  eight1mux eight1tb(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.s2(s2),.s1(s1),.s0(s0),.y(y));
 
  initial 
    begin
      {a7,a6,a5,a4,a3,a2,a1,a0} = 8'b10101010;
      #5 s2=1'b0; s1=1'b0; s0=1'b0;
      #5 s2=1'b0; s1=1'b0; s0=1'b1;
      #5 s2=1'b0; s1=1'b1; s0=1'b0;
      #5 s2=1'b0; s1=1'b1; s0=1'b1;
      #5 s2=1'b1; s1=1'b0; s0=1'b0;
      #5 s2=1'b1; s1=1'b0; s0=1'b1;
      #5 s2=1'b1; s1=1'b1; s0=1'b0;
      #5 s2=1'b1; s1=1'b1; s0=1'b1;
    end
  always@(s2,s1,s0)
    $monitor("time=%0t,s2=%b,s1 = %b,s0 = %b,y = %b",$time,s2,s1,s0,y);
endmodule
