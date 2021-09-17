//code

module counter10    (out     , enable  ,   clk     ,  reset);  
  output [3:0] out;     
  input enable, clk, reset;  
  reg [3:0] out;
  
  always@(posedge clk) 
   
     if (reset)       
        out <= 4'b0 ;  
     else if (enable)
       if(out == 4'b1001)
         out <= 4'b0 ; 
      else
         out <= (out + 1);  
      
  
endmodule 

//testbench

module counter10_tb;   
  reg clk, reset, enable;
  wire [3:0] out;    
  counter10 U0 (.clk(clk), .reset(reset), .enable(enable),  .out(out) );    initial
    begin   
      clk = 0;     
      #5 enable = 1;reset = 1;  
      #15 enable = 1;reset = 0;  
      #25 enable = 1;reset = 0;  
      #150 $finish;
    end
  always #5 clk=!clk;
  always@(reset,enable)
    begin
    $monitor("time=%0t;out=%b;",$time,out);
    end
endmodule
