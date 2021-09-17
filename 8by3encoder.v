//code

module eight3enc(a,d,en);
  input [7:0]a,en;
  output reg [2:0]d;
  always@(*)
    begin
  case (a)
    
    8'b00000001: d = 3'b000 ; 
    8'b00000010: d = 3'b001 ; 
    8'b00000100: d = 3'b010 ; 
    8'b00001000: d = 3'b011 ; 
    8'b00010000: d = 3'b100 ; 
    8'b00100000: d = 3'b101 ; 
    8'b01000000: d = 3'b110 ;
    8'b10000000: d = 3'b111 ; 
    
    default : d = 3'bxxx;
    
    endcase
    end
  endmodule

//testbench

module eight3enc_tb;
  wire [2:0]d;
  reg [7:0]a,en;
  eight3enc eight3tb(.a(a),.d(d),.en(en));
  initial
    begin
      #5 a = 8'b00000000;
      #5 a = 8'b00000001;
      #5 a = 8'b00000010;
      #5 a = 8'b00000100;
      #5 a = 8'b00001000;
      #5 a = 8'b00010000;
      #5 a = 8'b00100000;
      #5 a = 8'b01000000;
      #5 a = 8'b10000000;
     #10 a = 8'b11111110;
      #100 $finish;
    end
  always@(a,en)
    $monitor("time=%0t, a = %b , d =%b",$time,a,d);
endmodule
