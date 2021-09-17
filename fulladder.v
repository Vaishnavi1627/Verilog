//code

module fa(a,b,c,s,cy);
  input a,b,c;
  output s,cy;
 
  
  assign {cy,s} = a + b + c;
endmodule

//testbench

module fa_tb;
  reg a,b,c;
  wire s,cy;
  fa fatb(.a(a),.b(b),.c(c),.s(s),.cy(cy));
  initial 
    begin 
      #5 {a,b,c}= 3'b000 ;
      #5 {a,b,c}= 3'b001;
      #5 {a,b,c}= 3'b010;
      #5 {a,b,c}= 3'b011;
      #5 {a,b,c}= 3'b100;
      #5 {a,b,c}= 3'b101;
      #5 {a,b,c}= 3'b110;
      #5 {a,b,c}= 3'b111;
      $finish;
    end
  always@(a,b,c)
    $monitor("time=%0t,{a,b,c}=%b,s=%b,cy=%b",$time,{a,b,c},s,cy);
             endmodule
