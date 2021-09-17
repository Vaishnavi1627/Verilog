//code

module one8demux(a0,a1,a2,a3,a4,a5,a6,a7,s2,s1,s0,d);
  output a0,a1,a2,a3,a4,a5,a6,a7;
  input d,s1,s2,s0;
  
  assign a0 = d&~s0&~s1&~s2;
  assign a1 = d& s0&~s1&~s2;
  assign a2 = d&~s0& s1&~s2;
  assign a3 = d& s0& s1&~s2;
  assign a4 = d&~s0&~s1& s2;
  assign a5 = d& s0&~s1& s2;
  assign a6 = d&~s0& s1& s2;
  assign a7 = d& s0& s1& s2;
  
  endmodule

//testbench

module one8demux_tb;
  wire a0,a1,a2,a3,a4,a5,a6,a7;
  reg d,s2,s1,s0;
  one8demux eight1tb(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.s2(s2),.s1(s1),.s0(s0),.d(d));
 
  initial 
    begin
      d = 1;
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
    $monitor("time=%0t,s2=%b,s1 = %b,s0 = %b, {a7,a6,a5,a4,a3,a2,a1,a0} = %b",$time,s2,s1,s0,{a7,a6,a5,a4,a3,a2,a1,a0});
endmodule
