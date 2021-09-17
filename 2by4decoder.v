//code

module dec(en,a0,a1,d0,d1,d2,d3);
  input en,a0,a1;
  output d0,d1,d2,d3;
  
   
  assign d0 = (en & ~a0 & ~a1);
  assign d1 = (en & a0 & ~a1);
  assign d2 = (en & ~a0 & a1);
  assign d3 = (en & a0 & a1);
   
endmodule
//testbench
module dec_tb;
  reg en,a0,a1;
  wire d0,d1,d2,d3;
  dec dectb(.en(en),.a0(a0),.a1(a1),.d0(d0),.d1(d1),.d2(d2),.d3(d3));
  initial
    begin
      #5 en = 1'b0; a0 = 1'b1;a1 = 1'b1;
      #5 en = 1'b1; a0 = 1'b0;a1 = 1'b0;
      #5 en = 1'b1; a0 = 1'b1;a1 = 1'b0;
      #5 en = 1'b1; a0 = 1'b0;a1 = 1'b1;
      #5 en = 1'b1; a0 = 1'b1;a1 = 1'b1;
      #5 en = 1'b0; a0 = 1'b1;a1 = 1'b1;
      #100 $finish;
    end
  always@(d0,d1,d2,d3)
    $monitor("time = %0t ,d0 = %b ,d1 = %b,d2 = %b, d3 = %b",$time,d0,d1,d2,d3);
endmodule
