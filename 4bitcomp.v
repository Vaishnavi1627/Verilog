//code
module comp4(a3,a2,a1,a0,b3,b2,b1,b0,gt,eq,ls);
  input a3,a2,a1,a0,b3,b2,b1,b0;
  output reg gt,eq,ls;
  always@(*)
    begin
      gt=0;
      ls=0;
      eq=0;
      if ({a3,a2,a1,a0} > {b3,b2,b1,b0}) 
        gt = 1;
      else if ({a3,a2,a1,a0} < {b3,b2,b1,b0} )
        ls = 1;
      else
        eq = 1;
    
      end 
      endmodule
//testbench

module comp4_tb;
  reg a3,a2,a1,a0,b3,b2,b1,b0;
  wire gt,eq,ls;
  comp4 comptb(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.b3(b3),.b2(b2),.b1(b1),.b0(b0),.gt(gt), .ls(ls),.eq(eq));
  initial
    begin
      #5 a3=1'b1;a2=1'b1;a1=1'b0;a0=1'b1;b3=1'b1;b2=1'b0;b1=1'b1;b0=1'b1;
      #5 a3=1'b1;a2=1'b0;a1=1'b0;a0=1'b1;b3=1'b1;b2=1'b0;b1=1'b0;b0=1'b0;
      #5 a3=1'b1;a2=1'b1;a1=1'b0;a0=1'b0;b3=1'b1;b2=1'b1;b1=1'b1;b0=1'b0;
      #5 a3=1'b1;a2=1'b1;a1=1'b0;a0=1'b0;b3=1'b1;b2=1'b1;b1=1'b0;b0=1'b0;
      $finish;
    end
  always@(a0,a1,a2,a3,b3,b2,b1,b0)
    $monitor("time=%0t,{a3,a2,a1,a0}=%b, {b3,b2,b1,b0} = %b,gt=%d,eq=%d,ls=%d", $time,{a3,a2,a1,a0},{b3,b2,b1,b0},gt,eq,ls);
endmodule
        
  
