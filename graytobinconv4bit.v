//code

module gtb(a0,a1,a2,a3,g3,g2,g1,g0);
  output a0,a1,a2,a3;
  input g3,g2,g1,g0;
  
  assign a3 = g3;
  assign a2 = (a3&~g2)+(~a3&g2);
  assign a1 = (g1&~a2)+(~g1&a2);
  assign a0 = (a1&~g0)+(~a1&g0);
  
  
  endmodule
//testbench

module gtb_tb;
  wire a0,a1,a2,a3;
  reg g0,g1,g2,g3 ;
  gtb gtbtb(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.g0(g0),.g1(g1),.g2(g2),.g3(g3));
 
  initial 
    begin
      #5 g3=1'b0; g2=1'b0; g1=1'b0; g0=1'b0;
      #5 g3=1'b0; g2=1'b0; g1=1'b0; g0=1'b1;
      #5 g3=1'b0; g2=1'b0; g1=1'b1; g0=1'b0;
      #5 g3=1'b0; g2=1'b0; g1=1'b1; g0=1'b1;
      #5 g3=1'b1; g2=1'b0; g1=1'b0; g0=1'b0;
      #5 g3=1'b1; g2=1'b0; g1=1'b0; g0=1'b1;
      #5 g3=1'b1; g2=1'b0; g1=1'b1; g0=1'b0;
      #5 g3=1'b1; g2=1'b0; g1=1'b1; g0=1'b1;
      
       
      
    end
  always@(g3,g2,g1,g0)
    $monitor("time=%0t, {g3,g2,g1,g0} = %b,{a3,a2,a1,a0}=%b,",$time,{g3,g2,g1,g0},{a3,a2,a1,a0});
endmodule
