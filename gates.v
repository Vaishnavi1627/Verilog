//code:

module gates(y,a,b);
  input a,b;
   output [6:0]y;
  
  
  assign y[0] = a | b;
      assign y[1] = a & b;
      assign y[2] = a ^ b;
      assign y[3] = ~(a ^ b);
      assign y[4] = ~(a & b);
      assign y[5] = ~(a | b);
  	  assign y[6] = a + b;
  
  
  endmodule

  //testbench
module gates_tb;
  reg X,Y;
  wire [6:0]Z;
  gates gatestb(.y(Z),.a(X),.b(Y));
  initial 
    begin
      X = 1'b0;Y = 1'b1;
      #5 X = 1'b0;Y = 1'b0;
      #5 X = 1'b1;Y = 1'b1;
      #5 X = 1'b1;Y = 1'b0;
      #50 $finish;
    end
    
      
always@(Z)
  $monitor("time=%0t X=%b Y=%b Z=%b",$time,X,Y,Z);
      endmodule
