// Code - 8 8-bit data
module syncfifo(din,dout,rst,re,we,clk,full,empty,count);
input [7:0]din;
input rst,clk,re,we;
output reg empty,full;
output reg [7:0]dout;
output reg [2:0]count;

reg [2:0]rcount,wcount;
reg [7:0]fifo[0:7];


always@(posedge clk)
begin
    if(!rst)
      begin      
        rcount <= 3'b000; wcount <= 3'b000;  count <= 3'b000; full <= 0; empty<= 1;
        fifo[0] <= 0;fifo[1] <= 0;fifo[2] <= 0;fifo[3] <= 0;
        fifo[4] <= 0;fifo[5] <= 0;fifo[6] <= 0;fifo[7] <= 0;
        end
      
    else if (we == 1'b1 && !full)
             begin
               fifo[wcount] <= din;
               wcount <= wcount +1;     
               count <= count + 1;         
             end
                                
     else if (re == 1'b1 && !empty)
              begin
                dout <= fifo[rcount];
                rcount <= rcount +1;
                count <= count - 1;
               end   
end

always@(count)
begin
    full = ( count == 3'b111 );
    empty = ( count == 3'b000);
 end
 
endmodule
        
 
    
    
