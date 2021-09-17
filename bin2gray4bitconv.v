//code
module btg(a0,a1,a2,a3,g3,g2,g1,g0);
  input a0,a1,a2,a3;
  output g3,g2,g1,g0;
  
  assign g3 = a3;
  assign g2 = (a3&~a2)+(~a3&a2);
  assign g1 = (a1&~a2)+(~a1&a2);
  assign g0 = (a1&~a0)+(~a1&a0);
    
  endmodule

//testbench

module btg_tb;
  reg a0,a1,a2,a3;
  wire g0,g1,g2,g3 ;
  btg btgtb(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.g0(g0),.g1(g1),.g2(g2),.g3(g3));
 
  initial 
    begin
       #5 a3=1'b0; a2=1'b0; a1=1'b0;a0=1'b0;
       #5 a3=1'b0; a2=1'b0; a1=1'b0;a0=1'b1;
       #5 a3=1'b0; a2=1'b0; a1=1'b1;a0=1'b0;
       #5 a3=1'b0; a2=1'b0; a1=1'b1;a0=1'b1;
       #5 a3=1'b1; a2=1'b0; a1=1'b0;a0=1'b0;
       #5 a3=1'b1; a2=1'b0; a1=1'b0;a0=1'b1;
       #5 a3=1'b1; a2=1'b0; a1=1'b1;a0=1'b0;
       #5 a3=1'b1; a2=1'b0; a1=1'b1;a0=1'b1;
      
    end
  always@(a0,a1,a2,a3)
    $monitor("time=%0t,{a3,a2,a1,a0}=%b, {g3,g2,g1,g0} = %b",$time,{a3,a2,a1,a0},{g3,g2,g1,g0});
endmodule
