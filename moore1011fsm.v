//code - 1011
module fsm2(ip,op,clk,rst);
  input ip,clk,rst;
  output reg op;
  reg [2:0]ps,ns;
  parameter  s0=3'b000,	
 			 s1=3'b001,
  			 s2=3'b010,
  			 s3=3'b011,
  			 s4=3'b100;
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
        ns=ip?s2:s4;
    end
    s4: begin
        op=0;
        ns=ip?s1:s2;
    end
  endcase
      
    end
endmodule
  
    
//testbench
module fsm2_tb;
  reg ip,clk,rst,k;
  wire op;
  fsm2 fsmtb(.ip(ip),.op(op),.clk(clk),.rst(rst));
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
      #10 ip = 1;
      #10 ip = 0;
      #10 ip = 1;
      #10 ip = 1;
      #10 ip = 0;
      #10 ip = 1;
      
       $finish;
    end
  always #5 clk=!clk;
  always@(ip,rst,clk)
    $monitor("time=%0t,clk=%b,ip=%b,op=%b",$time,clk,ip,op);
endmodule
