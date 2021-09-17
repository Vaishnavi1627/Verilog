//code - 1011 sequence detector

module fsm1(ip,op,clk,rst);
  input ip,clk,rst;
  output reg op;
  reg [1:0]ps,ns;
  parameter  s0=2'b00,	
 			 s1=2'b01,
  			 s2=2'b10,
  			 s3=2'b11;
  always@(posedge clk)
    begin
      if(rst)
        begin
        ps = s0;
       
        end
      else
        ps = ns;
     
      case(ps)
    
    s0: begin
        op=0;
        ns=ip?s1:s0;
        end
    s1: begin
        op=0;
        ns=ip?s1:s2;
    end
    s2: begin
        op=0;
        ns=ip?s3:s0;
    end
    s3: begin
        op=ip?1:0;
        ns=ip?s1:s2;
    end
  endcase
      
    end
endmodule

//testbench

module fsm1_tb;
  reg ip,clk,rst,k;
  wire op;
  fsm1 fsmtb(.ip(ip),.op(op),.clk(clk),.rst(rst));
  initial
    begin
      clk=0;
      #10 ip = 1;rst=1;
      #10 ip = 0;rst=0;
      #10 ip = 1;
      #10 ip = 1;
      #10 ip = 0;
      #10 ip = 1;
      #10 ip = 1;
      #10 ip = 0;
      #10 ip = 1;
      #10 ip = 1;
      #10 ip = 0;
      #10 ip = 0;
      #10 ip = 1;
      
       $finish;
    end
  always #5 clk=!clk;
  always@(ip,rst,clk)
    $monitor("time=%0t,clk=%b,ip=%b,op=%b",$time,clk,ip,op);
endmodule
  
    
      
