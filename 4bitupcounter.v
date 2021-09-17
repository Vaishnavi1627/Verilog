//code

module f4bituc(out,en,rst,clk);
  input en,rst,clk;

  output reg [3:0]out;
  
  always@(posedge clk)
    
      if (rst)
        out <= 4'b0;      
     else if (en)
       out <= out + 1;
   
      endmodule

//testbench

module f4bituc_tb;
  
  reg en,rst,clk;
  wire [3:0]out;
  f4bituc fbituctb(.en(en),.clk(clk),.rst(rst),.out(out));
  initial
    begin
      clk=0;
      #5 rst=1;en=1;
      #10 rst=0;en=1;
      #10 rst=0;en=1;
       #150 $finish;
      
    end
  always #5 clk=~clk;
  always@(clk)
    begin
    $monitor("time=%0t,clk=%b,out=%b",$time,clk,out);
 
    end
endmodule
