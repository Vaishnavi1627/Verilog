//code:
module ffs(s,r,clk,q,qb);  
  input s,r,clk;  
  output q,qb;  
  wire s,r,clk,qb;  
  reg q; 
  always @ (posedge clk)  
    begin
      
      q<=1'b0;
      case({s,r})
      2'b00: q<=q;   
      2'b01: q<=1'b0;
      2'b10: q<=1'b1;
      2'b11: q<= 1'bx;
      endcase
      
    end   
  assign qb=~q; 
endmodule  

//testbench

module ffs_tb;  
  reg s,r,clk;  
  wire q,qb;  
  ffs srflipflop(.s(s),.r(r),.clk(clk),.q(q),.qb(qb));
  initial  
    begin   
      clk=0;
      #5 s=0;r=0;
      #5 s=0;r=0;
      #5 s=0;r=0;
      
      #5 s=0;r=1;
      #5 s=0;r=1;
      #5 s=0;r=1;
      
      #5 s=1;r=0;
      #5 s=1;r=0;
      #5 s=1;r=0;
      
      #5 s=1;r=1;
      #5 s=1;r=1;
      #5 s=1;r=1;
      
      $finish; 
    end
  always@(s,r)
    $monitor("time=%0t,clk=%b, s=%b,r=%b,q=%b, qb=%b",$time,clk,s,r,q,qb);  
      
     
  always #5  clk = ~clk;   
   
endmodule 
