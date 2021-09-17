// Code - 16 32-bit values storage
//16 locations - each of 32 bit data

module syncfifo(din,dout,rst,rd,wr,clk,full,empty);
input [31:0]din;
input rst,clk,rd,wr;
output reg empty,full;
output reg [31:0]dout;
reg [3:0]rcount,wcount;
reg [31:0]fifo[0:15];

  assign full = ( (rcount == 4'b0000 & wcount == 4'b1111)?1:0);
assign empty = ((wcount == rcount)?1:0);

always@(posedge clk)
  begin
    if(rst)
      begin
        
        rcount <= 0; wcount <= 0;
        fifo[0] <= 0;fifo[1] <= 0;fifo[2] <= 0;fifo[3] <= 0;
        fifo[4] <= 0;fifo[5] <= 0;fifo[6] <= 0;fifo[7] <= 0;
        fifo[8] <= 0;fifo[9] <= 0;fifo[10] <= 0;fifo[11] <= 0;
        fifo[12] <= 0;fifo[13] <= 0;fifo[14] <= 0;fifo[15] <= 0;
        //fifo[15:0] = 0;
      end
    else if ((wr == 1'b1 & rd == 1'b0)?1:0)
             begin
               fifo[wcount] <= din;
               wcount <= wcount +1;
             end
    else if ((rd == 1'b1 & wr == 1'b0)?1:0)
              begin
                dout <= fifo[rcount];
                rcount <= rcount +1;
               end
    else ;
  
  end
endmodule

//testbench

module syncfifo_tb;
  reg [31:0]din;
  reg rst,rd,wr,clk; 
  wire [31:0]dout;
  
  syncfifo syncfifotb( .din(din),.dout(dout),.rst(rst),.rd(rd),.wr(wr),.clk(clk),.full(full),.empty(empty));
  initial
  begin
    clk = 0; din = 8'd0;
    rst = 1; clk = 1; #5 ; clk = 0; #5;
    rst = 0;
    
    $display("Start testing");

    // First write some data into the queue
    wr = 1; rd = 0;
    
    din = 32'd100;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd150;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd10;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd15;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd1;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd10;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd16;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd14;
    clk = 1; #5 ; clk = 0; #5;
     din = 32'd12;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd5;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd50;
    clk = 1; #5 ; clk = 0; #5;
   
    din = 32'd140;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd110;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd120;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd180;
    clk = 1; #5 ; clk = 0; #5;
     din = 32'd190;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd250;
    clk = 1; #5 ; clk = 0; #5;
     #10 rd=1;wr=0;
    din = 32'd300;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd153;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd160;
    clk = 1; #5 ;clk = 0; #5;
    din = 32'd154;
    clk = 1; #5 ; clk = 0; #5;
    din = 32'd120;
    clk = 1; #5 ;clk = 0; #5;
    
    din = 32'd152;
    clk = 1; #5 ; clk = 0; #5; 
    
    #150 $finish;

  end
    
    // Now start reading and checking the values
  always@(din)
    $display("time= %0t,clk=%b,din=%0d,dout=%0d,full=%b,empty=%b",$time,clk,din,dout,full,empty);
 

endmodule
        
      
        
        


